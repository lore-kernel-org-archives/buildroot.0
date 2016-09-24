From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Sep 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-23
Message-ID: <20160924063029.E6772103087@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-23
================================

      successes : 181
       failures : 108
       timeouts : 2  
          TOTAL : 291

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 24
               wvstreams-4.6.1 | 12
               libglib2-2.50.0 | 7 
                alsa-lib-1.1.2 | 5 
                     vlc-2.2.4 | 5 
                     xen-4.7.0 | 5 
                acpitool-0.5.1 | 3 
                    mpfr-3.1.4 | 3 
                    qemu-2.7.0 | 3 
                    quota-4.01 | 3 
                   assimp-v3.2 | 2 
               audiofile-0.3.6 | 2 
                  cc-tool-0.26 | 2 
             ctorrent-dnh3.3.2 | 2 
                    cups-2.1.4 | 2 
kvm-unit-tests-682187afcc99... | 2 
                oprofile-1.1.0 | 2 
                apr-util-1.5.4 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
filemq-e59951489045825d6fc5... | 1 
                   glog-v0.3.4 | 1 
                   gperf-3.0.4 | 1 
                gptfdisk-1.0.0 | 1 
       host-erlang-rebar-2.6.4 | 1 
                    lftp-4.7.3 | 1 
                  libcdio-0.93 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                  libffi-3.2.1 | 1 
                libpjsip-2.4.5 | 1 
libsoundtouch-010a91a59071c... | 1 
              lm-sensors-3.4.0 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** wait: No child... | 1 
                     mc-4.8.17 | 1 
              mosquitto-1.4.10 | 1 
                 opencv3-3.1.0 | 1 
                openzwave-V1.5 | 1 
         qt5multimedia-5.6.1-1 | 1 
          sane-backends-1.0.25 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                 xenomai-2.6.4 | 1 
                  xvisor-0.2.8 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/3d94fc04ef8dfe61834683112099ea3f4b826542
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/6cde324c306c1f0e2ebc5952c5ed8996cec239e5
         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/fad289ea105777385f73404e469dbec691e8968f
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/f67df78e6fc53c14dc347936d17e89039b2f9b59
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/f8bc77f4e1646a16f87343d63bb1223d6134bdc8
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/9341d36f132c3332ad1b06b9a86acd9e0804651a
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c1ce65731c48b8e506a817fa210ed5734a7979d9
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/990859b9ec94249f4262f0294206837ebbf7cc72
       nios2 |                 apr-util-1.5.4 | NOK | http://autobuild.buildroot.net/results/55fccb9f5ffd31a3162227b81adb2cd01862c81a
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ef228ed08acacb39dad0202b370dd7765319caca
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/24e880651fe917f18b491f206919c486442741e2
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3e4701090dccbb5317e5e4a89bb8d6a247cd3126
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e16d4b7c279359e0b192d7a6f5d39edc8761567d
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/29e718f531ccd1a92ffe1287eb425b5e329e5291
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/ff092a2645fb4a3477efa0baf37627d08081896c
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/10900af09d270c286c47c4f59fa482c5911859ac
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/cc51971e063687d22d6c80fcd7a962931bba128a
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/62b47b162e17ea8e29ec1edfb2348aca35890553
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4729eb468b524ce26a6ff7ee65f35f4ed3b7ac77
        m68k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/920fab07060e9da67a8bc08c811cae773d04b61f
        sh4a | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/744bdc768cc3f02a09c14d6129e4dfffd2d4a979
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a16782f83f98b2a62235194119162a7bf6d5ed08
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/883d33a3e3ab53c157d6003a847e46e87dd1d2eb
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/c78152104d5870725209bf2bda6f9bc9f46aeeca
     sparc64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6f2fe4b6ca082fe38da89610c2f7a6942eeec6a7
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/398a933d401e6286d1be3ef3aec55a4191e68b00
        i686 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/b93be180f57d58dd0128d3642736fdc781934dbe
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/f9e39123b6661c5d42f1f1a740cfc77fc32ec77b
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/110e00e845c39c52cb331c26a6a49d60381c9cf9
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/b7393399f02ad464ebf0721f99daecf68d3e1364
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/76b7387c081f363527973b4e36d6607e5610893b
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8ae47835e1dbe7af69057b3b91e465af01c28885
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/afff2211204509a0c04ddd7c7eaa26cffd2341a8
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a7e04f91f969758047fc0be2b1e4c83ba70cab3f
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3793a286bdda8521c5b166e25039c56e58d7a7b0
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5e8477d3fd74ab1778b14eb0996a486a40bfb664
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8aa66167026bfeb008b144f6725380cc1099615d
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/641cec5b37ad7420f2946bf484b52b9bd1d6ba1a
      xtensa |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/b15911593a72e4002bd9d1e8fd7a82375f46fe52
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/452ad0f262ee21b047a43bfc1fad557db36b2b49
        bfin |               lm-sensors-3.4.0 | NOK | http://autobuild.buildroot.net/results/1d5796d5b54fa514c8056aaca558af53b00254f7
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/783e71e6abf6ce614e8353f5034c0c3e710c3570
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/e377fbd0c5eda87311b0a457796cfbbfbec4d456
       nios2 |                      mc-4.8.17 | NOK | http://autobuild.buildroot.net/results/87d06d52708b93855dde9d894a36c05d86b938d7
microblazeel |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/0101aaf7c7806656a8ca3538d02e109c0dab6f99
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/542760302b8dfe591a5a0aaceb5b8e5e7e7adbb6
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/08900b45cf40bc5fd6ca4354a18fedb22070c56a
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/c20f8a934af5780b9cf9b929e1740e601b8e991f
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/233f6a91f8bb58ad1aa628f7c1bf1b1ca2e23217
         arm |                 openzwave-V1.5 | NOK | http://autobuild.buildroot.net/results/c1af7f7ccffc8bda263859e9d9abec8c3cc945d4
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/06b98ce6c558ae34db5415b24b3ef4f6c04f4ebe
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/ddcaf6e66428a409a0206e4b4812ad6031c5f93c
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3eef928e18eaaec6394ea3f7d9dd4509bfd35660
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/8c4df41892d74add9276cfb0f99839c032284676
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/8c64ae66ba0196e645c8d194844e6be0e9d9017e
         arc |          qt5multimedia-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/56a6700774af692e7f5a99b452b15e4e8592310f
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/77312e822659a84c80aa66b12fc4fbe86cedb01c
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/b342577030c455e9ec9503d5a8a6ba3986a87279
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0adc5d07209e04d8fa51116abe10a6ebb54f76e3
        i586 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9dd473f28057d20ca0a2a0b7d2fb60cacd388704
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/1b6bf33f1df19802c75067a2c9ba9ee52acf251e
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/38d35d36455c47da56ab669606ab7ec384584523
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/849b9414c24105702d384b863c2659255250a7de
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/03325b386f1190b7fd17f45a6bce2da591d8741f
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2f387dfbff00240e15874fb8db4fbc54c697c2b2
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/079ffa177f07e7d27903fe24a487e246170ccd5f
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/97d3bf775ead314d197b5eb47f710b47fb1064fc
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cd9c8142d2ebc3f21a3dc4ac98da17c8ba79ca40
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6c090968b3eed1d61e6b663931aed3f86e4f1006
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3a60952a047402d8ccbafc707b97f1b51d29dd5e
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1766cadef11a91c878a51ed72398af51f3e69fe0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f324b31a40b0b446f07fd15ca752d8b57adbefb0
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0b8917a949efc96612750cd8c0bcf055303600f4
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8c53ad4f8840437bed2a6eda44834bc807df5f03
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c8dff13d6da99d3afe766ace4dd076c7d82803db
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2758ade3faaa45d1ce4083cea2b7c2e518cb6934
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8dca75d651086fdc7b70a88ffcf69e30453d6672
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/96bd5b48f17260fdaed31c282a8ce93bdebc2e69
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fb1562885cafd7d203df1b74e27a4a3e627e5650
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8cff853527f62487e105bb519647a9d9f3040323
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a7979201d5c430c629e1ff56ef400a8cc70371db
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ff0fe952ab8d2fadae257b5deb518bf8bc0b88a3
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/057f107fec7a538e278eb903b3df157642573986
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c59eb2ef06984cb390556886e71ff05b7f43ecf5
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/18eecfe2a678a57581f1aba14a2be8383e13a6b6
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f4c7ccf851e70300e417f5bce7ff09c89a432579
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/5880ca9c25b762baa4cc6af730a6046345a90638
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/5f5ea90a1de79e5b1d4f96394e13b4d7e886db7b
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/28f3e149f985633992f40c61b07e782b25359d1d
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/08f8f9aa84dd1c0d97f288183ebf0b1a9bc9e9fd
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f3d9b0debf02a1a1e6793f578074bcfda37bf263
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/af07e74d8a625b29289d493342c952791cbba884
microblazeel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bcb2716d555800fd5af081a387152c9d9bd0ad8e
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/1c88e6dbbed571ddf88f159e1c8394ca0f1b7d71
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/731da0e98c270339659ffc3e51d2c330604d6cd1
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ce6c70692cf551960f706fb240a5633dab78324b
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/80cb83f5f2a270a45745b102c8773769911c3f48
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/afa03dbefbab2801effc433f2a225f90a6a2e074
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/7215f630ef5adfb5d5430126901bad245ba58733
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/0f820160dbafc73fcf99dc7c28fa93aeac9a038d
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/7d615296aa769e9443fab7d241f0ecefa053bfcd
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/54812d80aa7cc02951a6f5f3bb0aceb95c71570e
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/0f60506b7a19b127b7e7db7c50b7886c66200981
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6608a5c862fa1882ffd58e8a99f772a2068cd6de
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/90a5a60b48ce1ff4ab1152e9bf1aca21991e2e55
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/abe26fc176776ece1d32c0b805cefefe9314edd2
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/d4bbb3cace1be7913fb71d0d18a9e2daf8622464
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/a7a6107278ff4bbec09c04a3a18715f4bec76109
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/cc585799a5511e3586ba60c491c3bcad5ab1c267
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/56f42a4344eecd03704e793003b13d88ec96e108

-- 
http://autobuild.buildroot.net
