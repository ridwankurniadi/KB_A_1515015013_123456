DOMAINS
benda = buku(judul, pengarang) ;%mendeclarasi data objek jamak dengan isi parameter pertama judul dan kedua pengarang. 
kuda(nama) ; kapal ;
bukubank(saldo)
judul, pengarang, nama = symbol %judul, pengarang, dan nama bertype data symbol.
saldo = real %variabel saldo diset sama dengan variabel real.
PREDICATES
nondeterm milik(nama,benda)%deklarasi predikat di set dengan nondeterm
CLAUSES
milik(erwin, buku("Markesot Bertutur", "Emha Ainun Najib")).%erwin memiliki buku markesot bertutur dengan pengarang Emha ainun najib.
milik(erwin, kuda(buraq)).%erwin memiliki kuda buraq
milik(erwin, kapal).%erwin memiliki kapal
milik(erwin, bukubank(1000)).%erwin memiliki bukubank dengan saldo senilai 1000
GOAL
milik(erwin, Benda).%erwin memiliki benda(benda bisa berupa buku, kuda, kapal dan bukubank).