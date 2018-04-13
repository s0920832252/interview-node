# String 跟 StringBuffer差別。
 ```
String 類型和StringBuffer的主要性能區別：
String是不可變的對象, 因此在每次對 String 類型進行改變的時候，
都會生成一個新的 String 對象，然後將指針指向新的 String 對象，
所以經常改變內容的字符串最好不要用 String ，
因?每次生成對象都會對系統性能產生影響，
特別當內存中無引用對象多了以後， JVM 的 GC 就會開始工作，性能就會降低。

使用 StringBuffer 類時，每次都會對 StringBuffer 對象本身進行操作，
而不是生成新的對象並改變對象引用。
所以多數情況下推薦使用 StringBuffer ，
特別是字符串對象經常改變的情況下。
在某些特別情況下， 
String 對象的字符串拼接其實是被 JVM 解釋成了
StringBuffer 對象的拼接，
所以這些時候 String 對象的速度並不會比 StringBuffer 對象慢，例如：
String S1 = “This is only a” + “ simple” + “ test”;
StringBuffer Sb = 
new StringBuilder(“This is only a”).append(“ simple”)
.append(“ test”);

生成 String S1 對象的速度並不比 StringBuffer慢。
其實在 JVM 裏，自動做了如下轉換：
String S1 = “This is only a” + “ simple” + “test”; 
JVM直接把上述語句當作：
String S1 = “This is only a simple test”;
所以速度很快。但要注意的是，
如果拼接的字符串來自另外的String對象的話，
JVM就不會自動轉換了，速度也就沒那麼快了，例如：

String S2 = “This is only a”;
String S3 = “ simple”;
String S4 = “ test”;
String S1 = S2 +S3 + S4;

這時候，JVM 會規規矩矩的按照原來的方式去做。
在大部分情況下，StringBuffer > String。
 ```
