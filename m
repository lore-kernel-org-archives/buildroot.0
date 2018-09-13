From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 08:00:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-12
Message-ID: <20180913060049.ADBCA207CC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   0 |   0 |  21 |
   2018.05.x |  29 |   1 |   0 |  30 |
      master | 174 |  93 |   0 | 267 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 


Detail of failures
------------------

         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/4b98ffd1d53bb8e3b01e6f128ff8d9766b0c22b5 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 28
              ptpd2-ptpd-2.3.1 | 15
 Makefile:708: target-finalize | 9 
              e2fsprogs-1.44.4 | 4 
              glibc-legal-info | 4 
                   botan-2.7.0 | 3 
                   dante-1.4.1 | 3 
                 lvm2-2.02.180 | 3 
perl-crypt-openssl-random-0.15 | 3 
                  boost-1.68.0 | 2 
               domoticz-4.9700 | 2 
                   libiio-0.14 | 2 
libssh2-8b870ad771cbd9cd29e... | 2 
                rtorrent-0.9.7 | 2 
          synergy-v2.0.12-beta | 2 
                     vlc-3.0.4 | 2 
                blktrace-1.2.0 | 1 
                    brltty-5.5 | 1 
                     gdb-8.0.1 | 1 
                   netsnmp-5.8 | 1 
      perl-crypt-blowfish-2.14 | 1 
          perl-net-ssleay-1.85 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/624338347a9d03b57b91280ab9b8d78763a9ee09 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/18b8338f48dae0d6e6d428910c6bf7b33cd14e2c |     
        i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/ecdc6e0d9ca569722c8b76c7ed434c769996c50c |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/8768305ac3d19ffeebcb9cbf7b2d4c2a3925ed5e |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/534da42b329383c3659c1facaca0620260aae05b |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/c0768d8272371b873170cd1e03082f7af51ada20 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6bb9780a870a80834c67245560efffea5008f100 |     
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b01d426ddf2e15b4c2e7b35f3dc530d444694388 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/6d309b9897b02076cbba939a1917f71d6f320df7 |     
        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/de000ae60192b2bbf81f9995fd382536d208e346 |     
      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/a5a199421b0adb76033302a1bba94494d075699b |     
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/2c63aac495e3d3afbe12540ff3ff99560b49a5eb |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/1296f394cc2847a16c5635077f2d10c237c085bb | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/e8eb149a08766cabfe47d5a787745b75cb95b354 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/edfda3a115b5e2a0940e022e803de01be668a739 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/f4b792efd07b0bfb9e8fce0e265c197f098d8167 | ORPH
      x86_64 |                      gdb-8.0.1 | NOK | http://autobuild.buildroot.net/results/1e68f054aa6f30f851402490777afd3280f431e4 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/b69a0656661b7576952a51cf958aa2a392017485 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/28505399345038e85f9ae67a34fce78eb464bced | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/72f6a6202009f1f56dcd7fc3674a695f40d4f7c2 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/9afe75b94aa6e75c99acdb611b2f629d3724c46a | ORPH
         arc |                    libiio-0.14 | NOK | http://autobuild.buildroot.net/results/d2a5ee3146b4a27c5fa2227aab89086f842a88c8 |     
         arc |                    libiio-0.14 | NOK | http://autobuild.buildroot.net/results/6b10f98c5d684a62241b67e3e240ffefaa30c87b |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/4b728d275f1399e3cb72d40482076ee54b35852a |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/97c43dd2122f55f3166683aa1b29ce1ca54bcb9c |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/7317f302731ae08669d28265268c46432d2652d8 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/924a64aa2fa35c95b7fb5765d020617159619d1d | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/d9364761dca3f20f5cf3be4036e3452c556c15df | ORPH
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/2c4d1723a6f9805c98c732c612af8afe87b9cb94 |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9eeed19f1f8686f770836be7a9a5793a30f3e836 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b25f603fcd0224d53c0840a44dce50d5cd8dbc4d |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e1b44b962508e6634929d1c014b9bc4f199edaf1 |     
        mips |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/03b6571fa4df91cbbbff3ecbbaa949b472288afe |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/a86bac62ceed638f333d216e7d19f3ef7fb0ad78 |     
     aarch64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/6df20369fe8925020c9a266db59563857641b1d5 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/5597b8a7e31472a4a568a151eb9ba703137f3544 |     
         sh4 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0a2267435e458f01b554cbcaaf778b0ac7a55952 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ee34f65f26da20c0f2fdb9e86bcbddd389f59a29 | ORPH
     powerpc |       perl-crypt-blowfish-2.14 | NOK | http://autobuild.buildroot.net/results/23d4be733c8807b4f5b967e9faa4fb75f6e8c35b |     
    mips64el | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/d27d83941de7611681e1d14b1920a60a61f63337 |     
     sparc64 | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/6ac330770de8a4f68668e7cf52d465d8f2827adf |     
        i586 | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/0a34554d05cd242f5a7e8e5f40e22ea5be43c925 |     
    mips64el |           perl-net-ssleay-1.85 | NOK | http://autobuild.buildroot.net/results/8934f2c203f8b61519dba94188985f1a9261de9a |     
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fda171eaca4a22a92e83aca55d1c2867c0c13b0b | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9dbb5fb9c4102fadb82177ba0010321973de9e47 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e418db0286e8af40beede8e8ed836e12559313da | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/75cd736b05aea24d3207fbd1b55f14e64c8688d8 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5fc29e463293351b8dbeaa80b0fa9e176ad68042 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4ea4e2e41c2446f982e981caacd3109c4b7be504 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/94c42aa57619a39bb1aec96a8d7f202ed08f516b | ORPH
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ec6c786b01c410ad0e899f72c1c4f4559e87b464 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6fd41dda9ea663bfe740f6c42bf770dc2377c7fa | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/36e02edd4811d2a29c874865ed89d0f265de6b5c | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fa0e31eecac84e13ac304e33c82811fb1252552b | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c128748169726bf19af233d87ca6f109d9b71764 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/891daff775f2d8937f6fab1411481f2a3d8a2ed8 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cefccad83ee56bed5a99db714af789215c9ce44b | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/de21d80d97eda3734fe135ded8afb60b9f4f271c | ORPH
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/af68873916f0291ec3b19ba85218a9d6b5084f49 | ORPH
      x86_64 |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/aebd010075557ee774702445cc2a74a1a6458498 | ORPH
      x86_64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/bbf3a05e8673b5ccf60aacd9b5f3d136d5b23667 |     
        i686 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/8b60d8292cc76100bb724ebed37230c50a0c1fc4 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/46286468c997beeecd80865f998ffee2261d837d |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/ef3468cdd76069c7269e16b791bd056c9e15d149 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/79052b0f731a0ae1306b39920885a63c2fdfe1b8 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/22becd6d3ed9ad128a272e6afdcde44a7ca63da1 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/9b9f4473c5b9256c4c05ab9ebec932ab01826405 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8d77e0c2c79f45e8908e6a2c025adee144a8a948 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/c2dec22ade6f9c84b6bebcb572f0f11d6e5cfb5a |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/b3d04d51305ed13fcbb569acc3309f81f74268b9 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b4fc52eb8d2a9fa772f9bdf0765da5e091c6437f |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f9aa43ba0263a1de359b03f5728633837242cf8b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/6576162b5eb867c9f47204e25c17c737691436c7 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0cbbd9436374f268dc83277fcc17f935257b80ce |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/afe41f074be744f9571f733f6a5615e199d3d161 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b30f77fdc369e6412cfd0a8d91816751dd987a69 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/708c653a77c01f00db0e0fe63b8308be1771ddb1 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a2d879629586c64e525af8dc6ef1fe52f8cb893c |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/7ec57b610cc1128edb86a38c3ede0dd48d2adbb4 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a783233b76e41863606709045ec99b351fc03912 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6c6100fb29516a83d4a152c5f23ce6b06384e61e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/5b29b17f88ddffd97d70a7a0855b57382a0e3b05 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a721b1ba05a33e0275160bc2a6fcb5e7fc007127 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/7d8ac242c48f367069570aa68b3a97f7dbd394f4 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d71528283bf91e4eff58e7c164adba0deecd75f0 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a6f37932fb4e4b1e9a68aed3b553dab0aeba2b73 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/23d36809927ce74ea7fbd12ac89bf5e5f1fba8d8 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e8a04e070ca35dc0ae259e07d0f00b9e3c8cd2f9 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/f1633b87459b9603078a41203d47038c79c6914a |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ab6f302e171a871f2974fbb22a19f602b24763ea |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/cbd66a8f6025d7664216bee4fb5296b5bc56e7cd |     
     powerpc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/cc2de01febdbfbfe2eabb71675a137bfe4c95732 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c471d6b1061a8516f7772735e471db68a32965aa |     


-- 
http://autobuild.buildroot.net
