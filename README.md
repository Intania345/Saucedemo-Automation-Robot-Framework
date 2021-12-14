# Saucedemo-Automation-Robot-Framework

### Prologue

Halo, Mutiara Intania disini ^^ 

Jika ingin terhubung dengan saya, bisa kunjungi [linkedin](https://www.linkedin.com/in/mutiara-intania-650a59174) saya yaa :)


Pada halaman ini saya akan memberikan ringkasan mengenai hasil belajar tes otomasi menggunakan robot framework. 
Dan web yang akan dites adalah web [saucedemo](https://www.saucedemo.com/).

#### Tools yang dipakai:
- Visual Studio Code
- Java 16
- Plugin "Robot"
- Chromedriver
- Python
- Data driver

### Step by step:

#### Berikut saya lampirkan ringkasan untuk salah satu case yaitu case login dengan negative case sederhana:

1. Pastikan tools telah terpasang di OS yang akan digunakan.
2. Buat folder terlebih dahulu untuk penyimpanan source codenya.
3. Kemudian, buka Visual Studio Code. Pilih File > Open Folder. Pilih folder yang telah dibuat sebelumnya, kemudian pilih Select Folder.

   <img width="234" alt="2021-12-14 (10)" src="https://user-images.githubusercontent.com/36466321/146021354-f7c31f62-1215-405d-9b70-334790c53781.png">
   
   
   <img width="470" alt="2021-12-14 (12)" src="https://user-images.githubusercontent.com/36466321/146022077-f4f765ba-c29a-4fe7-9a23-0835d135ea42.png">

4. Lalu buat folder baru dengan nama Step. Dan didalam folder itu, buat file baru dengan ekstensi file menggunakan *.robot

   <img width="234" alt="2021-12-14 (13)" src="https://user-images.githubusercontent.com/36466321/146024686-1df918cc-3c91-4665-98b3-bba66b3b80d0.png">

5. Kemudian, buat folder di dalam folder utama dengan nama Resource.
6. Pada folder Resource, buat file baru untuk menyimpan locator dengan ekstensi file *.yaml
7. Lalu ketikkan code berikut pada file tersebut.
   ```
   txtUsername : user-name
   txtPassword : password
   btnLogin : login-button
   ```
 8. Lalu buat satu file lagi di folder Resource dengan ekstensi file *.robot
 9. Dan ketikkan code berikut pada file tersebut.
    ```
    *** Settings ***
    Library                    SeleniumLibrary
    Variables                  login_locators.yaml

    *** Variables ***
    ${BROWSER}              Chrome
    ${WebURL}               https://www.saucedemo.com/

    *** Keywords ***
    I want to login with invalid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Username and password do not match any user in this service
    ```
10. Lalu, di folder yang sama yaitu folder Resource, buat lagi satu file untuk menyimpan data inputan menggunakan format csv seperti di gambar berikut:
    
    <img width="675" alt="2021-12-14 (14)" src="https://user-images.githubusercontent.com/36466321/146028148-4933be82-ae84-41ab-9883-cc62a102be21.png">

11. Selanjutnya, di file yang telah dibuat pada folder Step, ketikkan code seperti dibawah ini:
    ```
    *** Settings ***
    Library                   SeleniumLibrary
    Resource                  ../Resources/login_pages.robot
    Library                   DataDriver    ../Resources/login_credentials_invalid.csv    sheet_name=Sheet1
    Test Setup                Open Browser    ${WebURL}   ${BROWSER}
    Test Teardown             Close Browser
    Test Template             I want to login with invalid credentials

    *** Variables ***
    ${BROWSER}                Chrome
    ${WebURL}                 https://www.saucedemo.com/

    *** Keywords ***
    I want to login with invalid credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${txtUsername}          ${username}
    Input Text              ${txtPassword}          ${password}
    Click Element           ${btnLogin}
    Capture Page Screenshot
    Page Should Contain     Epic sadface: Username and password do not match any user in this service 

    *** Test Cases ***
    Login with invalid credentials should failed with CSV file      ${username}     ${password}
    ```
12. Dan yang terakhir adalah dengan menjalankan code yang telah dibuat melalui terminal. Dan pastikan telah berada di direktori tempat menyimpan file pada folder Step.

    <img width="960" alt="2021-12-14 (15)" src="https://user-images.githubusercontent.com/36466321/146028926-7c7f2f2e-4b6a-41ea-be3c-49fb05f486b3.png">
    
13. Lalu ketikkan "robot [namafile.robot]" pada terminal dan tekan enter.
    
    <img width="960" alt="2021-12-14 (16)" src="https://user-images.githubusercontent.com/36466321/146029240-353bce0d-9334-47c9-8e62-f1bdf8c96304.png">
    
14. Setelah running file tersebut, chromedriver akan terbuka dan mulai untuk melakukan otomasi sesuai dengan test case yang telah dibuat.

    <img width="778" alt="2021-12-14 (17)" src="https://user-images.githubusercontent.com/36466321/146029740-fb5e52c6-8bb4-48ff-939e-4551dcb4474f.png">
    
15. Jika berhasil dan tidak ada kendala, di terminal akan menampilkan status hasil running otomasi yang telah dibuat seperti berikut:
    
    <img width="960" alt="2021-12-14 (18)" src="https://user-images.githubusercontent.com/36466321/146030207-4c409423-00f5-41a6-856e-2a6a16b36738.png">
    
 16. Kemudian, selesai.
 17. Koreksi. Tidak pernah ada kata selesai untuk belajar. Jadi, saya akan eksplor terus tentang pembelajaran tes otomasi dan kalian yang membaca juga jangan sampai berhenti disini yaa :D
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

### Lisence
   Free for learning.

------------------------------------------------------------------------------------------------------------------------------------------------------------
    

#### Sekian ringkasan yang bisa saya berikan. Semoga membantu dan selamat mencoba!!!  \(^0^)/




