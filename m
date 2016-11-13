From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-12
Message-ID: <20161113073018.D88AB20B86@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-12
================================

      successes : 199
       failures : 57 
       timeouts : 1  
          TOTAL : 257

Classification of failures by reason
====================================

               jasper-1.900.22 | 5 
tvheadend-50a370707aedf5c12... | 4 
                 libnss-3.27.1 | 3 
                 mesa3d-13.0.0 | 3 
                  guile-2.0.13 | 2 
                 jack2-v1.9.10 | 2 
libasplib-f7219142e790a329b... | 2 
                    mpv-0.20.0 | 2 
python-libconfig-b271c3d9da... | 2 
                    quota-4.01 | 2 
                   taskd-1.1.0 | 2 
               tcpreplay-4.1.1 | 2 
                 xenomai-2.6.4 | 2 
                  apitrace-7.0 | 1 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
               domoticz-3.5837 | 1 
                     exim-4.87 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
               libcap-ng-0.7.8 | 1 
                libcurl-7.51.0 | 1 
               libdvbcsa-1.1.0 | 1 
               libepoxy-v1.3.1 | 1 
net-tools-3f170bff115303e92... | 1 
                 opencv3-3.1.0 | 1 
                  openjpeg-2.1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
qextserialport-ada321a9ee46... | 1 
                  samba4-4.4.7 | 1 
                   strace-4.14 | 1 
                  tremor-19427 | 1 
               trousers-0.3.13 | 1 
                    vde2-2.3.2 | 1 
                 weston-1.12.0 | 1 
            xapp_sessreg-1.1.0 | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/e0ae64847ea828e33cb452bcc32f6805dd39798e
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d506cba1f721f06755da43ce06429bd0f844b8e0
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/e1feed51473980711bc62306a7df45f40fb3ae2b
 powerpc64le |                domoticz-3.5837 | NOK | http://autobuild.buildroot.net/results/8550271914e2b604343cd64d78d9fb4129edb7a1
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/728da15a2ad39023ead94aa3e938f3038c9488be
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/b841890f635fe6ee41cd68c7d667371610e7ece4
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/bdb033a5228c85883de4a25dce8a8b2df2a8d9cb
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/e4ba290ff87ee246971bc47e9a0e9dd2d964721f
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e712d592b690a7c911335f2337eb003d241a504e
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/44f3a1852fe0d5649a55102f2c25bc54889e6664
        bfin |                jasper-1.900.22 | NOK | http://autobuild.buildroot.net/results/1febccc7215814490fa3c776b34bc367363afe39
        bfin |                jasper-1.900.22 | NOK | http://autobuild.buildroot.net/results/132a4e12e2402309cb73a052b6a7f71e8ec97570
        bfin |                jasper-1.900.22 | NOK | http://autobuild.buildroot.net/results/191f80779df1a9e6f832106e6c4bdf601e2a9893
        bfin |                jasper-1.900.22 | NOK | http://autobuild.buildroot.net/results/a6f9bfec3406fc21b130f1669e3534651b9c9596
        bfin |                jasper-1.900.22 | NOK | http://autobuild.buildroot.net/results/a2aa71d0a082639a078fc7bec689161bff5a295d
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/8b63f95cf7ea3f9c009fc79d92af082735f561c0
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/23858e6ff81d14409f64e502b2ab9a7f4a2c9ffa
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/c474bb1f458401c95df32eacbe397e5021e05c6c
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/6a279b14a8bed85f5d8a4dea7abc6616136a7913
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/675476da45d3039818d9af2b549b377559fe36f4
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/cda44e0f74f34050ab9a5fee6b8bbbf3beb20eb3
        bfin |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/6396c102838f9400f45224e862777f6fe330a313
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/ac9540d9c7dfa56c5486d11a70e756ae80022165
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/476fe6dfa999e0af8f6510f40b7610854d072d01
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/008278f79b90fd9aedec43c1527faa99799fd15f
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/a48535beff5e2fa6bb40bab6bfab0487ec1cc4a0
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/934e133d017f17bfd259fefaa8a56ac9e0413f94
    mips64el |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/46c179423cc18d5d17b7635f9f4e126343f9c86f
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/40a8bb7c74730e41573fb15b4922340577a84860
      xtensa |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/44063524edf7f0a29ea914ccd8b852cb5d7ee3e3
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2e9568c8eefd3ae129975bcf130b898a306b56db
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5b088aa55fb67da70729470e761eae33da01ebf3
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/af7b43227f23f62ce6d47e560bf2b682f20dc513
         arm |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/b81b8d9ccd178e14266cf926fa54e7e1b84fc3c7
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/0b74eddf393b1b87426f0f5079797045671dbbe5
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ac97f92e47368e98646209ff8b5bdb008af9dc6e
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/943bd08ca47bb31b0e8026baba7ae8c13eba0464
 powerpc64le | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3d7d67e221321d381e9244dc78f1692a39395fc8
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/d57213ce962ceaa2b0a4626d65ea5be87bd86e14
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f145e57546d0cca7cc00eb72d659937ecf8a1cb2
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a020c1824791cd18f3862eb0add8a1abffd22070
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/529c793f3bf5825c4a8e8ac4c6484338c1eee2a2
      x86_64 |                    strace-4.14 | NOK | http://autobuild.buildroot.net/results/6f63fa2537ff316ba259a20966faadcf5ab9deff
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/51231efe0024cd198b46adabecbc943ae5c97d7e
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/4c8bbab1ded6764f310422bf6d78c6c771827742
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/c67961867fca7db6e51129479f84df2fef260db3
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/d1c3aa775a46e205afe28ddcc41df71f2e5ad8a8
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/ba1760b1428584f70e44dbffb8218ff3ee55e702
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d2cb7b6f6d37fe27ef2006389388640d05012b04
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/3cc9c83d79908057d03330b11e3d1d8c5a176531
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/f35a99f2d8372b3a172a816ca90364cc906febb6
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e6970b4741323dafe7a65781d2c0bcbf0a786fc1
      mipsel | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/5bf4a5d5a0eedd34009e8ed792c43177c80b8650
         arm |                     vde2-2.3.2 | TIM | http://autobuild.buildroot.net/results/855da663bd402729523cb79ee8deb97c515b3e10
        m68k |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/66c68d80b5fd967b7f7a77fb3f0a5a289faa063f
        i586 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/4528d22caa7a943d2415098e191b1736b23496e4
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/74bd5786587e491c92067fb2295b961c425fe67e
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/a7bf719ca3108f9bd7c524d105324e8c8ce9d2f9

-- 
http://autobuild.buildroot.net
