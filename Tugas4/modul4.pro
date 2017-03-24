DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol
umur=integer

PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)
nondeterm selingkuh(nama, nama)
terbunuh_dengan(nama, benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)
/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES

orang(budi,55,m,tukang_kayu).%budi adalah orang yang berumur 55 tahun dengan jender m sebagai tukang kayu.
orang(aldi,25,m,pemain_sepak_bola).%aldi adalah orang yang berumur 25 tahun dengan jender m sebagai pemain sepak bola.
orang(aldi,25,m,tukang_jagal).%aldi adalah orang yang berumur 25 tahun dengan jender m tukang jagal.
orang(joni,25,m,pencopet).%joni adalah orang yang berumur 25 tahun dengan jender m sebagai pencopet.
selingkuh(ina,joni).%ina selingkuh dengan joni.
selingkuh(ina,budi).%ina selingkuh dengan budi.
selingkuh(siti,joni).%siti selingkuh dengan joni.
terbunuh_dengan(siti,pentungan).%siti terbunuh dengan pentungan.
terbunuh(siti).%siti terbunuh.
motif(uang).%motifnya adalah uang.
motif(cemburu).%motifnya adalah cemburu.
motif(dendam).%motifnya adalah dendam.
ternodai(budi, darah).%budi ternodai darah.
ternodai(siti, darah).%siti ternodai darah.
ternodai(aldi, lumpur).%aldi ternodai lumpur.
ternodai(joni, coklat).%joni ternodai coklat.
ternodai(ina, coklat).%ina ternodai cemburu.
milik(budi,kaki_palsu).%budi memiliki kaki palsu.
milik(joni,pistol).%joni memiliki pistol
/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan).%kaki palsu cara kerja mirip dengan pentungan.
cara_kerja_mirip(balok, pentungan).%balok cara kerja mirip dengan pentungan.
cara_kerja_mirip(gunting, pisau).%gunting cara kerja mirip dengan pisau.
cara_kerja_mirip(sepatu_bola, pentungan).%sepatu bola cara kerja mirip dengan pentungan.
kemungkinan_milik(X,sepatu_bola):-%X kemungkinan memiliki sepatu bola.
orang(X,_,_,pemain_sepak_bola).%X adalah orang pemain sepak bola
kemungkinan_milik(X,gunting):-%X kemungkinan memiliki gunting jika
orang(X,_,_,pekerja_salon).%X adalah orang pekerja salon maka
kemungkinan_milik(X,Benda):-%X kemingkinan memiliki benda jika
milik(X,Benda).%X memiliki benda
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-%X dicurigai
terbunuh_dengan(siti,Senjata) ,%siti terbunuh dengan senjata
cara_kerja_mirip(Benda,Senjata) ,%benda cara kerja mirip senjata
kemungkinan_milik(X,Benda).%X kemungkinan memiliki benda
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-%X dicurigai jika
motif(cemburu),%motifnya adalah cemburu maka
orang(X,_,m,_),%X adalah orang yang berjender m
selingkuh(siti,X).%siti selingkuh dengan X
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-%X dicurigai jika
motif(cemburu),%motifnya adalah cemburu maka
orang(X,_,f,_),%X adalah orang yang berjender f
selingkuh(X,Lakilaki),%X selingkuh dengan laki laki
selingkuh(siti,Lakilaki).%siti selingkuh dengan laki laki
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-%X dicurigai jika
motif(uang),%motifnya adalah uang maka
orang(X,_,_,pencopet).%X adalah seorang pencopet
pembunuh(Pembunuh):-%pembunuh membunuh jika
orang(Pembunuh,_,_,_),%pembunuh adalah seseorang maka
terbunuh(Terbunuh),%seseorang Terbunuh
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh),%pembunuh dicurigai
ternodai(Pembunuh,Zat),%pembunuh ternodai zat
ternodai(Terbunuh,Zat).%terbunuh ternodai zat

GOAL
pembunuh(X). %sang pembunuh adalah budi.
%Kesimpulan.
%pembunuh adalah budi karna budi merupakan seorang tukang kayu yang yang memiliki benda yaitu balok yang digunakan sebagai pentungan.
%yang terbunuh adalah siti karna siti selingkuh.
%motifnya adalah budi tidak memiliki uang dan juga cemburu sehingga dendam dan mengakibatkan pembunuhan.