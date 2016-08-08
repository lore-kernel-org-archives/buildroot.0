From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Aug 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-07
Message-ID: <20160808063030.7B3041016DF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-07
===============================

        success : 215
       failures : 81 
       timeouts : 1  
          TOTAL : 297

Classification of failures by reason
====================================

                 libunwind-1.1 | 4 
               libcap-ng-0.7.7 | 4 
                  connman-1.33 | 4 
                   dante-1.4.1 | 4 
              lirc-tools-0.9.4 | 3 
                 clapack-3.2.1 | 3 
      kismet-Kismet-2014-02-R1 | 3 
                  multicat-2.1 | 3 
openblas-f04af36ad0e85b64f1... | 3 
kmsxx-a706f157b86e906968080... | 2 
                    owfs-3.1p1 | 2 
                     php-7.0.9 | 2 
                  snmppp-3.3.5 | 2 
                  samba4-4.4.5 | 1 
                 mono-4.4.2.11 | 1 
                    libiio-0.7 | 1 
 make[1]: *** [all] Terminated | 1 
           argp-standalone-1.3 | 1 
                  fbterm-1.7.0 | 1 
sconeserver-bbb384404575f8a... | 1 
                 liburcu-0.8.7 | 1 
                 xorriso-1.4.2 | 1 
                  ffmpeg-2.8.7 | 1 
               binutils-2.25.1 | 1 
                     gpsd-3.16 | 1 
                  babeld-1.7.1 | 1 
                 mplayer-1.3.0 | 1 
                ipmiutil-2.9.9 | 1 
                  cairo-1.14.6 | 1 
                   assimp-v3.2 | 1 
                   bdwgc-7.4.2 | 1 
          alljoyn-tcl-16.04.00 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                 php-zmq-1.1.3 | 1 
                 weston-1.11.0 | 1 
                acpitool-0.5.1 | 1 
               dvdauthor-0.7.1 | 1 
           libfreeimage-3.17.0 | 1 
                    lftp-4.7.3 | 1 
                    cups-2.1.4 | 1 
               audiofile-0.3.6 | 1 
                alsa-lib-1.1.2 | 1 
           python-psutil-4.3.0 | 1 
                  monkey-1.5.6 | 1 
                    mpv-0.18.1 | 1 
                   attr-2.4.47 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                        iw-4.7 | 1 
              procps-ng-3.3.11 | 1 
                   fwup-v0.8.0 | 1 
                 libebml-1.3.3 | 1 
               openipmi-2.0.21 | 1 
                 opencv3-3.1.0 | 1 
                  lshw-B.02.18 | 1 
               netplug-1.2.9.2 | 1 
               domoticz-3.4834 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/924b9c314d543e16ee43928be54c79d392791b1a/
        bfin |           alljoyn-tcl-16.04.00 | NOK | http://autobuild.buildroot.net/results/4e9ee1a3b2a09d3d1648bbd3876971ea5a20a2c4/
         arm |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/516960b9ea3ad852a255bc171db70c109cace1b0/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/92c6b3ba4c6648f19976eec9bf954d8aa4cd49b4/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/d5d72b49e799011dea43fcb12f346915a7d5ac32/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/478035ef19ab9e1e1df4f2910cdfac75516ec2f4/
        i586 |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/40fa7ff9dde5e96c78079370e5c934ea6b3d2ef5/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/4658f88f5117c40e179311a29ad6d25cb1abdfbe/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/b911d7a2f7f9f8b28ef00bff9522d8c9c000bbfd/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/cd341c96cf8d72dc6af99044bdd656cf98827a3b/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/d82d200a9fd86d4bd5f65442c6e13158a7c0e2e6/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/f40bf5051b1d03a6e90f852e75c29230ce26ca2e/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/0d48072bf0e984ca8f5e3bfc21ec2fa916929c02/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/2d585c1cae41c454e0749f66ce39ed806a38b9fc/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/e33241882f20be08fb638aa2916dd533f7c90743/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/9d075357433a0b1cc87a60743d576dd1fa6a89ad/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/7445d9f344e087bb425fb3a524546397ba1c4422/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/1070da7c70dfd511e3a3699917f30f53d20afcd4/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e58875ca51812def376e569458aa5f9ec8e39671/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/452aeeac838bbaa14dadcea00ae1d1890985ae4a/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/41ff278bf5cd9aeeeedb9af68f7930207289ba0d/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/cfdbc6d25085117ab34fbd0c95943596c386adb8/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fe4c80bdd9009df71632f6fe2be68c73ef980c20/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/c53096ed82889420a3aa7f0194d2105e622610f3/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/ddf96855983d178e2e29e7b1fc0525373ac50a20/
        m68k |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/de9d69480d18a8ea5eaccd1e4bda51d4ed5a8441/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/7b2faeee8bf6b334661fc148baeb6c4fb90c0cde/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/113d6acdaba35257d7fb7f40b97065458f28be88/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/16947c5de8e6d4491a47c2b6c67469d22a74f01c/
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/22aecf2222b519d3a19f64996333095af3a7e176/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/4c4c0b9545f43e91fd76dc881c1b7af2bb9d20a6/
        bfin |                         iw-4.7 | NOK | http://autobuild.buildroot.net/results/17ca6885525bd16148d13b84f80868e0c293fe6a/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ae7ed5a0bf3a98251471878671c250a7830979d1/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3c35c3be315e443f613d8a45745c37f68c73174a/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/009cfed377716746e193ea8cba98794ce643c4d2/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/965da177329eeb1f25acb222d130aaf9fca8ba5a/
      mipsel | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/c4506c1aeac8214d3e38574c2e4bc8475e348a48/
      xtensa |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/108663f7c5c77cc764403638ef6374e5e41c0527/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/428ebe22ec518923b557e2da6e058845745d7908/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/50decb06e6f0498fc83d41c0eae21acae0bbf4e2/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8105677a0f29da0ecc3ca38f5c39eb94619732f8/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/77066800d7185b272b3d0b432db9ff2edea55b54/
        bfin |                  libebml-1.3.3 | NOK | http://autobuild.buildroot.net/results/16e488f9e535fd6a4e4b91ddb1c6fb87905e2d48/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e72df4cd6540ad2140b2bc6dac3d23c5670bdf73/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/6e1192bc650c9d47f4cebe9bf546359faf982c38/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/74fddd1ef695141b2c6b04e0135a36c22243a1fd/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/7e9654427782ff9e611ef714b816e65b8417f677/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/d7deb28cc1b348fcba5fd3d65ae79d72d3e29cd4/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/6c0ea0e5311d449ec76e029d365002dedfd69306/
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/2be6e49fe406a172c62a265f964078749902b5e5/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/dd5ea0e658a2b364474ab538a33112dfb272f524/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/7a10d3cf5f4cc18efc9d66200820eede77ecc2a6/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/8576154459e0f73bc9b72ead2359d48a641347a2/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/1f23d21843ed20d39f1080782aeb8b88162ef592/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/595a42dcd30e343e830ba9666d23b0aa16117817/
         arc |                   monkey-1.5.6 | NOK | http://autobuild.buildroot.net/results/726f82dcd528e3206d299a462b1b9d8d8de21857/
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/61b0196f53228e6def5486f055fabffa5ce16e53/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/af357f4859c6f288f714076cbfa50f4c266b8b2f/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/6924997899218621be32c58a5646bf8ea31942b5/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/d7722b04f4b374af023761a696f1bdaf6f57599d/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9f65952670b7fbf4cebfda69e50a0545763151f5/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/f96a0743d209f9564d82999b0ad1029f49c6ad76/
        i586 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/7fa460e1422eafb2e393bb4d141d6e20af1e1282/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e5e0fa96d01a92b3e6418e37ebb88a07e6ad39df/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/d34eea6212abcc767fb802c9bbcd6573282f1a7f/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4f31ad664313efa5c73e5ea3fe2e8585fd089caf/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/1fc4c1cfb2ea1b6efa0fa2ab86b8cfd296e27bd4/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/58ed2f512fd28b490be85ecc282b7ead09d75fbe/
     sparc64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/83787843cef872a46932cf5ce40d4d597daed171/
        mips |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/dcc6d2adc109df3e104e4da1e7457dfba604a090/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/1ae73f38c496a44be20804feb691319cc121f022/
        m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/22c5d0b6821197359ae463253b5fd7627e705098/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/fe602423161ec708c4855490cb33bc71ef6432b5/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/81b9cd6e1f540a64d0df9a23f82456f90bf60355/
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/2a67d1580787e9fe2781bf2db91bb5e3e23ab2ea/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/c10dda3d071c34dba0a5a304548765111d0bcc1d/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/3696ed89487f2bb68ca9b08ee505b2d4bfc45bf9/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/371bb2f9bd88040b6f391a171636147838bc670a/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a132737028723ab2df0109e1eee4acc5ca24545e/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/e97a745125ca8266a3ecf2828866285cf0ee5549/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/1d3e7f07388ae11d70103e04d8a14c20d50fc212/
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/bee68e0808fdd4bc790cec27b1a823da7aec4ae7/


-- 
http://autobuild.buildroot.net
