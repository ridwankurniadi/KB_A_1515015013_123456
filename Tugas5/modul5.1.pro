DOMAINS
orang = orang(nama,alamat)%declarasi data objek orang nama dan alamat.
nama = nama(pertama,kedua)%nama merupakan data objek jamak yang mememiliki argumen pertama dan kedua.
alamat = alamat(jalan,kota_kab,propinsi)%alamat merupakan data objek jamak yang memiliki argumen jalan, kota_kab, dan provinsi. 
jalan = jalan(nama_jalan,nomor)%jalan merupakan data objek jama yang memiliki argumen pertama yaitu nama_jalan, dan yang kedua nomor.
kota_kab,propinsi,nama_jalan = string %kota_kab, provisinsi dan nama_jalan sama dengan tipe data string.
pertama,kedua = symbol %pertama dan kedua merupakan isi data objek jamak. 
nomor = integer%nomor bertype data integer.
GOAL
P1 = orang(nama(diena,fatihah),alamat(jalan("Wijaya Kusuma", 12), "Berbah", "DIY")),%P1 merupakan goal yang pertama
P1 = orang(nama(_,fatihah),Alamat),%P1 akan mengambil data yang diset pertama dan menampilkan nama diena dan alamat wijaya kusuma.
P2 = orang(nama(nur,fatihah),Alamat),%P2 akan menampilkan alamat yang di set di P1
write("P1=",P1),nl,
write("P2=",P2),nl.
%write akan dieksukusi pertama kali