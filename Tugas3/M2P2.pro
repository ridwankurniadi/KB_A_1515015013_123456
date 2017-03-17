predicates
nondeterm pria(STRING) 
nondeterm wanita(STRING)
nondeterm istri(STRING,STRING)
nondeterm anak(STRING,STRING)
nondeterm usia(STRING,INTEGER)
nondeterm ibu(STRING)
nondeterm adik(STRING)
nondeterm cucu(STRING)
nondeterm kakek(STRING)
/* Model 2 parameter
nondeterm ibu(STRING,STRING)
nondeterm adik(STRING,STRING)
nondeterm cucu(STRING,STRING)
nondeterm kakek(STRING,STRING)
*/

clauses
istri("Mary","Peter")./*mari adalah istri peter */istri("Ann","James").
pria("Jhon")./*jhon seorang pria*/		pria("James")./*james seorang pria*/		pria("Peter")./*peter seorang pria*/
wanita("Mary")./*mary seorang wanita*/		wanita("Sue")./*sue adalah wanita */		wanita("Ann")./*ann seorang wanita*/
anak("Sue","Ann")./*sue adalah anak ann*/	anak("Jhon","James")./*jhon adalah anak james*/	anak("James","Peter")./*james adalah anak peter*/
usia("Jhon",10)./*Jhon berusia 10 tahun*/	usia("Sue",13)./*sue berusia 13 tahun*/

ibu(X):- istri(X,_), anak(_,X).%x adalah seorang ibu maka x adalah seorang istri dan seseorang adalah anak x   
cucu(X):-anak(X,Y), anak(Y,_).%x adalah seorang cucu, maka x adalah anak y dan y adalah anak seseorang 
kakek(X):-anak(_,Y), anak(Y,X).%x adalah kakek maka seseorang adalah anak y dan y adalah anak x
adik(X):- istri(Istri,Suami), anak(X,Suami), anak(Kakak,Istri), usia(Kakak,UsiaKakak), usia(X,UsiaAdik), UsiaAdik<UsiaKakak.%x seorang adik maka istri adalah istri suami dan x adalah anak suami dan kakak adalah anak istri dan kakak berusia usia UsiaKakak dan x berusia usia UsiaAdik dan UsiaAdik kurang dari UsiaKakak
/*ini hanya komentar
ibu(Ibu,Anak)	:-	istri(Ibu,_), anak(Anak,Ibu); 	istri(Ibu,Ayah), anak(Anak,Ayah).

cucu(Cucu,Kakek):-	anak(Cucu,Ayah), anak(Ayah,Kakek);	anak(Cucu,Ibu), istri(Ibu,Ayah), anak(Ayah,Kakek).

kakek(Kakek,Cucu):-	cucu(Cucu,Kakek).

adik(Adik,Kakak):-	istri(Istri,Suami), anak(Adik,Suami), anak(Kakak,Istri), usia(Kakak,UsiaKakak), usia(Adik,UsiaAdik), UsiaAdik<UsiaKakak.
*/
goal
ibu(Ibu); cucu(Cucu); kakek(Kakek); adik(Adik).%ibu adalah ann karena ann memiliki anak bernama sue, cucu adalah jhon karena jhon adalah anaknya james dan james adalah anaknya peter, kakek adalah peter karna peter adalah kakeknya jhon, adik adalah jhon karna umur jhon lebih muka dari umur sue, jhon dan sue adalah anak dari ann dan james. 

%adik(Adik,Kakak);	ibu(Ibu,Anak);	cucu(Cucu,Kakek);	kakek(Kakek,Cucu).