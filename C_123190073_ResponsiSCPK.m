%penyelesaian kasus menggunakan metode WP
clc;clear; %untuk membersihkan jendela command windows

%memasukkan data baris 1-50 kolom house age, distance to the nearest MRTasd, number of convenience stores kedalam variabel data
data = xlsread('Real estate valuation data set.xlsx','C2:E51'); 
%memasukkan data baris 1-50 kolom house price of unit area kedalam variabel harga
harga = xlsread('Real estate valuation data set.xlsx','H2:H51');

%langkah pertama menentukan kriteria dan bobotnya(sesuai dalam soal)
w = [3,5,4,1];

%langkah kedua menentukan rating kecocokan
x = [data harga];%mencari rating kecocokan masing masing alternatif
k = [1,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya

%langkah ketiga normalisasi bobot
%a. perbaikan bobot
[m,n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%b. melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:m
    S(i)=prod(x(i,:).^w);
end

%c. proses perangkingan
V = S/sum(S)