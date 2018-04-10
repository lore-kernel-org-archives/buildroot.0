From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-09
Message-ID: <20180410060022.4CF112071F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   0 |   0 |  23 |
      master | 158 |  81 |   0 | 239 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  zeromq-4.2.5 | 18
    azure-iot-sdk-c-2018-03-16 | 10
                     lxc-3.0.0 | 8 
                  host-go-1.10 | 5 
               libglib2-2.56.0 | 4 
                    liblo-0.29 | 4 
qt-webkit-kiosk-34efddb0bf0... | 3 
                  udftools-2.0 | 3 
             bluez5_utils-5.49 | 2 
             expect-2014-05-02 | 2 
                   flann-1.9.1 | 2 
gst1-interpipe-10dba89eecc2... | 2 
               libglib2-2.56.1 | 2 
                   picocom-3.1 | 2 
   python-yieldfrom-legal-info | 2 
               asterisk-14.7.6 | 1 
     docker-engine-v17.05.0-ce | 1 
                    llvm-5.0.1 | 1 
                 mesa3d-18.0.0 | 1 
                     php-7.2.4 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
                snort-2.9.11.1 | 1 
          usb_modeswitch-2.5.2 | 1 
              wireshark-2.2.12 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

         arc |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/7b4bc90fdacf872a78f81664bba0135723f3a889 |     
      xtensa |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/461eafc0e4ae78131e24384305f41ed318c33a97 |     
     powerpc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/f9c2c0bf2ddb95831d154de3046f159d0dd4d186 |     
      xtensa |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/e3381c9263283f629d1948b41c5791abfff32a9a |     
     aarch64 |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/d8b70efd1110e17a3fba4e870aa8afd283e652d1 |     
 powerpc64le |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/bcb4448f380060c552b12e75d8a26e1dfaad1bd5 |     
    mips64el |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/333ea0e44b7b9f84713de1c240ba164e06dd425d |     
         arm |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/25aae054634368fadb265b97ebe4dda809deff6f |     
         arm |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/14b4fcd442aff364339530ddcf879e2aa7428c36 |     
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/60b60a0b5a7dd02b25a1223aa7c66eb8df122834 |     
     powerpc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/bb64207f3b28ae971810c13d04ec44f4df1ebb3d |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/2b521f1954389dca3b52d3013c35ebfebcbccf75 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/9ea3084be07e86ba60c848cb99587f375d2a5c47 |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/7b1c00518d36d2301608aff3b5010175ecd8256b |     
 powerpc64le |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/effdaafbaf09e9eeb05debd7b7ff116878617d73 | ORPH
      mipsel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/3198daf050ce7de4b9afafb1ea3ecf979a2b1a00 | ORPH
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/132036fbe23310258d195fb2b917b4fbfc34ca0a |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/78502dbd16458358877549082551b6687cbd5d51 |     
    mips64el | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/b552773cb79389abe2e9ce2876bc3b86ddddd0b4 |     
         sh4 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/61b9b5a416de0aa850f54c01e606671472e1f4bc |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/78d307376997f5f7fd2102c44417ba97c178e418 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/a55e708263b4ceb8db143a583a62bd7772a0e28c | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8214e2aa871d4774022e656634419d52ffeef50b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8cf2e6995991dc319cb90fab6bc8f2732c931dbe | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ddc2caa833c4a06988a461f9c15ba5f0a8549a93 | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f |     
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0db2011d4dcca33105cc3e98657dab0c057773cd |     
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/10636fba5c16df8c56de9f27cb24431c17f78e34 |     
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/661e79cdd9ab87853e5f714006ec8fe7bf906a4f |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/13f3e792407dd6757939d63ae3c7a9549e1025a1 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9199c8f84c5d32670eb905cba38f2b33a8bf7de8 |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/029ae3a108a5ab0835355f194e49907be98857b0 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/7ceafdc2c46ff4d7ae8ad696be9aea5b339fb716 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/34edae2ed0a42d295abcf0d4f92af4725de6943b | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6f97f11f8dc1d408bd988daf7b76513557ca070d | ORPH
         arm |                     llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/301c454c6eab802405a268f4713a574d1c366892 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fdf464a6679adf68739c50458f39857a230c287f |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c7f11ccaf795573093b47108d0d2ca9d807a26ea |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c89d544d159feb529ad6e02ce736ea98e87ee792 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/dffeb98c3a52efe2a3cbaf83b2a6fb4d238561d9 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7c50a397db2aff4fe6bcfe6440966fcc624ee166 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9cc4331010b106182a0fdcc3143a1f8650a4d1ac |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/778f378b9a17f4bb2bae5007a73204e23d1b6b53 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2a1a2137f7dd2a12b5f929f384bfdd69a3115602 |     
      x86_64 |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69 |     
    mips64el |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/2a822b7cd07027e964bd04d4cb97fad156d52254 | ORPH
        i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/28ec584484dedfd6ef473dfd9dd24481e27ce2b3 |     
        i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/912493a8f99416524a5897634ae62604436e9b51 |     
    mips64el |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/1672e19233316dffcc591ec467e9e43e07a066ca |     
         arc |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/9b2e078c92f330261691513438128626e3e024b7 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a277dd5b15b78671597357775282ee761593d237 | ORPH
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/a1fa248bff809cf4283d50023d2984aacd868f6a |     
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/faf8e56e01f983dddc252529377ffe9353ffc03e |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/e59e18b12fe4a2a15f1a54e06f199d6eca3e760c |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/3210988f69d68c2146dd813c3cd7b5297bda6336 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/7bc8e2db13fed9b9348c950a98c6cc80893579b0 |     
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/c364a9460ba0c20f5da5558ffadc854f1b595f7a |     
       sparc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/184c59b34376df72d591baac343d49a3103031bd |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/f883d641f0c241cc999634e9ddd02b605ebe96cc |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/88db3684eeb02527708f2c3cc1903d5cee5cae6f |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/d2721890403ebc803aa3a9d0e6fbb80d111b8fde | ORPH
 powerpc64le |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/8bf26fa9e483f48b3071d5a9a6e3998e8efce1e9 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/c8bd6d9177ec1f6175b8ff7a048556b3b2a43ec4 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6c53d8048d5ad6190314c39e6e9c9c6b34792932 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/05b97a07c6a67a750dec52aa9cffa128d2ad0fdc | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4ba07f105246321f560c9c393aaee038c23c26e5 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b8f29fefe27186cf646685dd01fabc5f6c210baf | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ba00d3a23827dacaf2a80dc6c80a81f0aae64c7e | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/23dfa3f277de151501abda807f43a7b9a92d9d90 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a986b77c56b974c730789c008ac2654e5357cd83 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8ea02a07b9591536368304cb3e54975c9d6a7408 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f7dde86af79d90c9785db6065a1ad38169e930ce | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e229979060fcfadd1bd6beddc5d47faaaf579d69 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ab680546222a5059b42cf2120d97bccc24a2c055 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3fbf59d8dea36dad00ed268995a586862748f3a2 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9b968acde36dfb9431e36bd59897ae25426c39ca | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/303cf5c680c71511b105b8b23f3b3156a1d02d7c | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/cb361fdddf65a88c918938909c373f202f50e905 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/45785c96a1bc8cfdb9f29c31eaa41c3e0773a654 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/652f0087cdfe714e81b14a9d63869189e39fad50 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f69df6d23c50f3f65593d298d7bd97462ccaa555 | ORPH


-- 
http://autobuild.buildroot.net
