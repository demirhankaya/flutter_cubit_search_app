# flutter_cubit_search_app

A new Flutter project.

## Getting Started

# Search app demo da Ahmet hocanın yapısı
## Sayfa yapısı
* search page için oluşturduğum view için search_page.dart, search_view.dart olmak üzere iki ayrı dosyaya ayırmış
* Bu ayrımın sebebi BlocProvider’ ı page’ in en dışından sarmalamak. BlocProvider içerisine child olarak pageView i veriyor.

## Bloc fonksiyonu çağırımı
* context.read<searchCubit>() builder altındaki blokda tanımlayıp aşağıda fonksiyonu çağırıp arama fonksiyonu çağırmak için read.searchUser(value) ile context.read<searchCubit>() kod tekrarından kaçınmış oluyor. 
* Aynı zamanda başka fonksiyonda olsa direkt read + nokta yazıp erişecekti.
* context.read ile veri değiştirebilmek için consumer a ihtiyaç yok

## Bloc ile veri değişimini dinleme ve build etme
* BlocBuilder ve blocConsumer arasında listerner farkı vardır. 
* BlocConsumer BlocBuilderdan daha kapsamlıdır.
* BlocListener bir return değeri beklemez. Context üzerinden sayfaya snackBar basmak gibi işlemler yapabiliriz içerisinde. Bunu yaparken de genel olarak gelen değeri kontrol edip snackBar göstermek gibi işler.
* Builder kısımları blocBuilder ve blocConsumer’ ın ikisinde de aynı şekilde çalışıyor.
* Build içerisindeki tüm kısım tekrardan build edilir Bu yüzden değişiklik olacak kısmı sarmalamak doğru kullanımdır.
* BlocBuilder içerisinde bir switch widget’ ı kullanmış. Bu sayede verilerinin durumunu kontrol ediyor. Bunu yaparken status enum’ını kullanıyor.
* Bu kontrolü sağlamak içinde search_state.dart dosyası içerisinde oluşturduğu status enum ını kullanıyor.

## SearchState kullanımı
	Status Enum
    * İçerisine bir enum tanımı yapıyor. Bu tanım ile status ler kontrol edilecek.
    * Enum yapısında empty, loading, success, failure tanımlamalarını yapıyor. 
    * Bu enum class daki yapıları daha sonra cubit içerisinde userListesi ve status ü emit edecek. Daha sonra blocdan gönderdiği status e göre view içerisinde switch yapısı kurup durumunun kontrolünü sağlayacak.

	Equatable state class tanımlaması
    * search_state class ını equatable dan extends alıyor ve ayrıyetten immutable anotasyonu kullanıyor.
    * SearchState sınıfı, Equatable sınıfından türetilmiştir. Equatable, nesnelerin değerlerine göre karşılaştırılmasını sağlayan bir paket olup, özellikle BLoC deseninde durumların değişip değişmediğini kontrol etmek için kullanılır. Böylece, aynı değere sahip iki SearchState nesnesi birbirine eşit kabul edilir.
    * Bu class a bi constructer tanımlaması yapıp içerisine status ve user listesi alacağını belirtiyor. Bu yapı benim kurduğumdan farklı olarak userListesini state class içerisinde alarak hem immutable bir tanımlama yapıyor hem de status u belirterek veri durumunu döndürmeyi sağlıyor.
    * Class içerisindeki getter gibi yapılar equatable yapısı ve immutable tanımlanmasından kaynaklı olan kısımlardır. Araştırılacak.

## SearchCubit Yapısı
* Search cubit class ını SearchState ile cubit extends alıyor.
* Constructer içerisinde SearchState veriyor ve boş bi tanımlama yapıyor. Bu da oluşurken listenin boş oluşmasını ve dummy olarak başlattığımızdan atadığımız status den kaynaklı olarak success olarak değerlendirip ilk uygulama açıldığında boş bir liste dönüyoruz.
* Daha sonra searchUser fonksiyonunu oluşturuyoruz ve içerisine textFielddan beklediğimiz değer olan isim bilgisini veriyoruz.
	searchUser Fonksiyonu
    * emit fonksiyonlarını çağırırken state i copywith ile alıyoruz.
    * Try catch bloğunun içerisine alıp catch durumunda status: SearchStatus.failure’ ı emit ediyoruz.
    * Try bloğu içerisinde ana işlemleri yapıyoruz. 
    * Öncelikle en başta status’ ü loading olarak emit ediyoruz.
    * Daha sonra filtreleme işlemini yapıyoruz ve filtrelenmiş veriyi yeni listemize atıyoruz.
    * Bu listenin boş olup olmama durumuna göre status ve users bilgilerini emit ediyoruz.














