PREDICATES
putra(STRING,STRING)
saudara_perempuan(STRING,STRING)
saudara_laki(STRING,STRING)
menikah(STRING,STRING)
ayah(STRING ayah,STRING putra)
kakek(STRING kakek,STRING cucu)
nondeterm ipar_perempuan(STRING,STRING)
CLAUSES
putra("Ikhsan","Bentang").%ishsan adalah putra dari bentang.
saudara_perempuan("Dini","Dina").%dini adalah saudara perempuan dina.
saudara_laki("Adi","Lintang").%adi adalah saudara laki-laki lintang.
menikah("Ikhsan","Dini").%ikhsan menikah dengan dini.
menikah("Lintang","Surga").%lintang menikah dengan surga.
ayah(A,B):-putra(B,A).%a adalah ayah b maka b adalah putra a
kakek(A,B):-ayah(A,C), ayah(C,B).%a adalah kakek b maka a adalah ayah c dan c adalah ayah b   
ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B).%a adalah ipar perempuan b maka a menikah dengan c dan c adalah saudara perempuan b
ipar_perempuan(A,B):-saudara_laki(A,C), menikah(C,B).%a adalah ipar perempuan b maka a adalah saudara laki-laki c dan c menikah dengan b. 
GOAL
ipar_perempuan("Ikhsan",X).%ikhsan mempunyai ipar perempuan X, X adalah dina, karena dini adalah saudara perempuan dina.