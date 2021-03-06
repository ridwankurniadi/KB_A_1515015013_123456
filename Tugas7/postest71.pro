/*****************************************************************************
		Copyright (c) 1984 - 2000 Prolog Development Center A/S
 Project:  
 FileName: CH07E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains
  list = integer* %mendeklarasikan list yang berisi sekumpulan data bertipe data integer

predicates
  length_of(list,integer,integer) - procedure (i,o,i)
	%menjelaskan isi dari length_of(panjang) adalah (list, Result atau hasil, Result Atau hasil) dengan prosedur input,output,input

clauses
  length_of([], Result, Result). %akan dilakukan pencarian argumen yang sama dengan klausa ini. yakni [] (kurung kotak yang kosong sebagai tail)
  length_of([_|T],Result,Counter):-
	NewCounter = Counter + 1, %menambah nilai penghitung 
	length_of(T, Result, NewCounter). /*ini merupakan rekursi untuk memanggil lagi klausa yang kedua, yang membuatnya berbeda adalah list disini hanya akan diambil dari tail list sebelumnya
					    sehingga saat rekursi jumlah elemen list akan semakin berkurang*/
goal
  length_of([1,2,3],L,0). %goal-nya mencari panjang list dengan perhitungan dimuali dari nol
Contact GitHub API Training Shop Blog About
� 2017 GitHub, Inc. Terms Privacy Security Status Help