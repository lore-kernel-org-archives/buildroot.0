From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Sep 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-25
Message-ID: <20160926063032.F06961029B3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-25
================================

      successes : 185
       failures : 125
       timeouts : 6  
          TOTAL : 316

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 20
               libglib2-2.50.0 | 9 
               wvstreams-4.6.1 | 8 
                alsa-lib-1.1.2 | 6 
                acpitool-0.5.1 | 5 
                     vlc-2.2.4 | 5 
                    hans-0.4.4 | 4 
                     xen-4.7.0 | 4 
                  cc-tool-0.26 | 3 
czmq-5205ec201e97c3a652c17e... | 3 
filemq-e59951489045825d6fc5... | 3 
                   glog-v0.3.4 | 3 
       host-erlang-rebar-2.6.4 | 3 
                    mpv-0.20.0 | 3 
                privoxy-3.0.26 | 3 
                    cups-2.1.4 | 2 
                   efivar-0.23 | 2 
kvm-unit-tests-682187afcc99... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                    lftp-4.7.3 | 2 
                     lzop-1.03 | 2 
                 openssh-7.3p1 | 2 
              ptpd2-ptpd-2.3.1 | 2 
                    qemu-2.7.0 | 2 
                  xvisor-0.2.8 | 2 
                   assimp-v3.2 | 1 
               audiofile-0.3.6 | 1 
             berkeleydb-5.3.28 | 1 
             btrfs-progs-4.7.3 | 1 
                collectd-5.5.2 | 1 
                  cppcms-1.0.5 | 1 
             ctorrent-dnh3.3.2 | 1 
                    efl-1.18.1 | 1 
                   erlang-18.3 | 1 
              libarchive-3.2.1 | 1 
                  libcdio-0.93 | 1 
           libmemcached-1.0.18 | 1 
                  lshw-B.02.18 | 1 
        ltp-testsuite-20160126 | 1 
                 lvm2-2.02.165 | 1 
make[1]: *** wait: No child... | 1 
 make[2]: *** [all] Terminated | 1 
                    mpfr-3.1.4 | 1 
                    ola-0.10.2 | 1 
                 opencv3-3.1.0 | 1 
                openzwave-V1.5 | 1 
                oprofile-1.1.0 | 1 
                 php-zmq-1.1.3 | 1 
      python-itsdangerous-0.24 | 1 
               qt5base-5.6.1-1 | 1 
                    quota-4.01 | 1 
          sane-backends-1.0.25 | 1 
                sysklogd-1.5.1 | 1 
    xproto_resourceproto-1.2.0 | 1 


Detail of failures
===================

        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/fe776a2268ec3a3ebb9a17175447596e1f4043aa
         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/08df66b852b74c8324952ddef7afdb8bb96459ef
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/8d150f530a80e7bd5c23c52877db51d3e5ccdb47
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/864e3e7c8ad822f17b23d437e42303ce877baf48
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/587b94100c09c3ca20ff380ddab9cb5c34c34fc1
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/cf5dd127a63fba12f9172286bee9c92fbbd4059d
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/92df76ad29f4eece73581f37e4f2aefd780a65b8
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/2ec8e06f383b8bd2c871069e97db47f4452c2d6d
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/43da4eed3dcce34d5e2cd32d16aa86b77d1f9952
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/341b05c814d968e53e33d71fc58d5b72a35c957f
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/2dc63303103539e173d32e8583bcc7459c00e6d3
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0efe56b5d93dcbb31d24285ac98ac3a6e1b66329
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3a2b59957ca6705171d290fac52809dd6be7cbcb
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7e2bb8619ca0276a9372e760fad3e43704f879a0
        sh4a |              btrfs-progs-4.7.3 | NOK | http://autobuild.buildroot.net/results/07510a4aca22684df2245f70e4c741d19b7a1f55
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4e2e2dd74abefbc18ad6ae28a441fd71470ba9f6
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3a4c15daaf6b85f31cd59f7f8b5a169d7cf0c47e
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c6d7d91f2c3be4d65aa19afc98e502626972eddf
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/40f74c8741b703599cc6a6d115f2ec09dfb2dd64
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ceb1d9b5cbcc91d8b9ba663ff225cd91426b5bd8
        bfin |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/36716af40e1191de2fea4ad4ad618a40f66690b9
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4646876abf8923fac7a3413a2e165642604041e4
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/7cc6e2349c5b799421cee3df8622c34b48371c53
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5121953f8e6f5f509285c996a3ec1d250b6b692e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/3b8d4f06c9cdf20dda5c5626506b83c3be12a370
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/23ff2a46158374a727c73ca3b8ef5379402c2b80
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/60cc59844f9a0d78bcb31c34e60aafeafcce1872
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/31b1f0465794bbb7c73b60c53097d1f009361ad6
      x86_64 |                     efl-1.18.1 | NOK | http://autobuild.buildroot.net/results/bcf6a5379ae3bcd73be5d09acd7843e48aff0040
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/300e2b45d9acee466cf39603e21fd5c8c6cae0b7
      mipsel | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/e72d0c35bceadc59cee9953133890f475be85924
     sparc64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/2d80d87f0dc19b614101e592f0d4700eb3156de5
      x86_64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/c75caf666776ac0c4de8346723a9207a82b01e67
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ba4d005f8d4b7360da6cb97e99668a09eec5f9ea
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/1f0f8364b669b95b435b21e34cd207d34d235c23
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/315f03c4f192b590a8a517b1c8d3155e4630ac47
        m68k |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/c89da5b9e907a7dad7b3b600ac0b841b91f2a840
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/3df063c9911e9d44688c01b0199313925e1aaf65
        m68k |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/311cadec72e241500d1beab2affcb84eaa76e1ac
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/be7ca58a9df2ef387463d5bbaa4f86fe38f29e48
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/caf8d7b26a63844faf1831ef2a9ea203608563ab
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/691faadcf3642771caf336074827f6f6d2f8d18b
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/5814c074aba2001617746df341cb4b123537669b
         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/510988040cfd7c086b9551812e602912d9cede11
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/a4f55a9c36b176e4a0659985bfb9bc8b1775554d
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/f237b78bda7d940f87860d82f70bea2499051d6e
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/015e30d615956517f26aa43a0f0c7ff4269bf392
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/3b4e9a0564258bce6733159ca96d772a50f8e058
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/2f3d7a883c19dee799877c59faac838a0bd97aa7
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/1b0afca9d8be14fa0e9ba229e0c206b028d154b8
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/37486e2b93fb920aa1467a1b03d53f035bb1da17
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/849d345357e4167770d5b03548785555f99c9240
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a9ba4d583e203b7686865eaa8ee5b46ffff56649
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b3cfac17ac1e088764f2f75650ea5f728d3f8399
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1765c5b237ac9a8a2bb231a1261e31ded96e7351
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/275ace32cf63dd81708e828c2690fcc4ae151c21
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/9ccbdf77dcfd2dbe671021835a9cb2f31a5520a1
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4259ac1964ea5b8d5c513a82ed4b46a1ee573c28
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/507b272104ae139be3ed9b10f30f762127885872
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cef1c3513a70304befdc089604e168c5ae7e8519
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/51a8af6efb98ab071792cb254c02799c46444efd
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/0f34887fa43f2065a151f0ef85062ccfe9cff0db
         arm |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/3a6dd95d706b5d293a2e1738eb6acf22b99bcb1e
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/85c2465c3a27cb63e57add4c6dbaef3e1cdcc6ac
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/90dd8c20c8b0d4b2bff4dd2f39a5d335141918d2
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/72d06d15fbfa071ccd20f525159a09ae28a22e82
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/f2c4973ea12ada5d6353fef574f56b473d4b97d9
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ea15dbeb1bdda152cd60c88da8eff43b27aaff19
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/129ab0ea5a5cac65c39ac4643711af62316c222c
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0ddcc9bb2b8a9097aacdb7ec8c1c3b239bbf24c8
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7d5ca2fe2f824e6995169f6662bb26d3318d49ff
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/95a27eb01e41ced262b2fd381c0cb9e50644bc1d
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/cad71ac7d55f14003bc775bf5719dba338c48337
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/21f6be4a3bfeacfc3acc34a64d4b602c611bbd31
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/671ef1794e237a2a951e850d90cf9a233850ef9d
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/459814bfeb46c4c7e307bba9a939a846c1da932c
         arm |                 openzwave-V1.5 | NOK | http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f547c5ee839802df9e30020a8d8ed7b36f1c706d
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/c54dfba8656b3aa3ca2d1f69c535663282088310
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/48dc31289f737bee2a2716113948f2f47c534622
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/6d9a28eac96d5992208fcacc3a8a2f4bc65889d2
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/418474e2ef41292e7ccd498f2859a418b8d2895f
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/14e79c14ec6c7522ffbcac0d409d386a2923aad9
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5f1af203f7e4441bfb29af9527d0b7bd872ff3dc
      x86_64 |       python-itsdangerous-0.24 | TIM | http://autobuild.buildroot.net/results/57d4988e175c37abfde711e7820aeab68fa9f15b
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/7dcdc9a404189afc22825b69e908b807d9f020cb
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/0ddbb2ece97fc622d34c90c527dc33721ee8fc9b
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/fe82c2878f8840bea9ee05ee7b2347c0d338e77f
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0e73aea59e772e5fbb0303fcffafcfa9f358df31
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/62acfbb2d924c7a12e41a00b4df076b322bcdf87
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/dda5a6d482bce37c8932808d61b9603f9e5bd2e5
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2ddafa46a35fff54586810b23e0b98e6e4d28ca2
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/85daef27ef5efa6747aa2f2abebd503d08813c45
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/94c22655891c3ea668bb1f3f669adf30565cc8ca
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ba69da832714632282afd7ece016660a954870df
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5acea5dfa16ea247c80b63b3f55e1712770f3395
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8b7349bbef1a870640fa5beeb731656065b82518
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7ddb20061ace8379f7750708a350551dd813f231
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c0af48bbaf794bd44766d8780806a74959228f62
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6317cf6fd18a49545fbc0f0b552201db421e74e0
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2dd729a6bc345819e41051bdd44b4dd6edbeb934
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/be518d7a3022f61afbfba716566cd4c936754470
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/044779387a8c3c6d8de02e44ad029bcac4422e0b
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/46a8ac79142e056d4318e166ed38d40c232999a4
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/574e7d6387abd118389efb53cd45dffe5f909f5c
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3c4df470e570a5e02b5e4f6b794a62631a2d02c9
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/74820333712171b3d6c36d867b1972630c2fb0e5
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7065d915ffa4443c1cf6677b6b78f4e57e5342ae
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/234f16b16eb30b2a4f4d6ed6cf9e806da78145cf
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7b2e7e21e4a7e62ff9740fa9617932f1584ad8f9
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a34e530db0ced7e44cd692753455410aae89ee32
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/15920ae02456e7fe6166f8539f859af2950354ab
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e0e9163c0ad6179897eb79a98b10102a81c61d6e
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6a55128257a714bd65c034cc7e6c8c30b5e526b5
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/40e772650bbae9b0c1ae186ca5b247d4da24b8c5
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/542aec72462a5577647a0ed88c3d4ee6498d97e9
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a3489d229a51590a2e43bdeb1d5dc4576c7f0d94
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/79da5a8d6d5d905bff50fce5bd45a1b31075c75b
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ba454241d14592ef5f9070bb147e12f8d90e9dc6
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4339d17d4e9ab9b2d4224f1bac689d7976b6d01b
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2316f79530bb25099f5ea2e417d86f9d871a2192
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/3c39dd02a2e3baf185024c1af9e9db931b4bb2b7
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/05b07742ba332de4bcbe2b3836d6de958f55f413
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/917236c980921660d6ee552f60bd3a0ae6de68a0
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/7c4ded94e4f5a380c37fc0c105f7dc63c26292ef
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/d53c47d2d9557dddc62cdaf31119d993caef54f8
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/eca1c99458b364928bc31ceefef3b50941a09f33
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/e4638a6414250fce38f61c33c0333f6401a2b6cf
      x86_64 |     xproto_resourceproto-1.2.0 | NOK | http://autobuild.buildroot.net/results/9cb1d244f9b619a48251fc1262e6cc7ea3a4b3c0
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/01477a2bbc817bd02010fda7f8841bc8f73fd4bb
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/108456b5af64f76327dd7b6d7fb7b4e6f9c3d74a

-- 
http://autobuild.buildroot.net
