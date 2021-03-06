%Mengambil data dari excel dan disimpan ke variabel data
opts = detectImportOptions('Dataset_Real_Estate.xlsx');
opts.SelectedVariableNames = [3 4 5 8];
data = readmatrix('Dataset_Real_Estate.xlsx',opts);

%Atribut tiap-tiap kriteria, dimana nilai 1 = benefit, dan 0 = cost
krt = [0,0,1,0];

%Nilai bobot tiap kriteria
wght = [3,5,4,1];

%Hitung nilai jumlah row dan column dari data
[m, n]=size (data);

%Membagi bobot per kriteria dengan jumlah total seluruh bobot
wght= round(wght./sum(wght),2);

%Kali weight cost dengan -1 agar berubah jadi minus
for j=1:n
    if krt(j)==0, wght(j)=-1*wght(j);
    end
end

%Melakukan perhitungan vektor(S) per baris (alternatif)
for i=1:m
    S(i)=prod(data(i,:).^wght);
end

%tahapan ketiga, proses perangkingan
V= S/sum(S);

%Mencari nilai terbesar dan indexnya, kemudian di tampilkan
[biggest, index] = max(V);
result = ['Real Estate Terbaik ada di baris ke-',num2str(index)];
disp(result)
result = ['Dengan nilai perhitungan WPnya adalah ',num2str(biggest)];
disp(result)





