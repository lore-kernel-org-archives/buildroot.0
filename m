From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Oct 2016 10:09:36 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-03
Message-ID: <20161004080936.826F1103B5C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-03
================================

      successes : 169
       failures : 111
       timeouts : 3  
          TOTAL : 283

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 25
                 uclibc-1.0.18 | 8 
               libglib2-2.50.0 | 7 
               wvstreams-4.6.1 | 7 
               linux-pam-1.2.1 | 5 
                     vlc-2.2.4 | 4 
                   assimp-v3.2 | 3 
                 lvm2-2.02.166 | 3 
                    quota-4.01 | 3 
               audiofile-0.3.6 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                 mesa3d-12.0.3 | 2 
                    ola-0.10.2 | 2 
                    php-7.0.11 | 2 
python-libconfig-b271c3d9da... | 2 
qt5webkit-b889f460280ad98c8... | 2 
                     xen-4.7.0 | 2 
                alsa-lib-1.1.2 | 1 
                  cc-tool-0.26 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
filemq-e59951489045825d6fc5... | 1 
             freeswitch-1.6.11 | 1 
                   glog-v0.3.4 | 1 
                harfbuzz-1.3.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-0b04ed061003... | 1 
               libbluray-0.9.3 | 1 
libcec-2c675dac48387c48c7f4... | 1 
               libepoxy-v1.3.1 | 1 
          libmicrohttpd-0.9.50 | 1 
                libmpeg2-0.5.1 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** [libavfilter/s... | 1 
 make[2]: *** [all] Terminated | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
                  openjpeg-2.1 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
                    pppd-2.4.7 | 1 
                privoxy-3.0.26 | 1 
         qt5serialport-5.6.1-1 | 1 
                     rpm-5.2.0 | 1 
                    ruby-2.3.1 | 1 
                   strace-4.13 | 1 
               wireshark-2.2.0 | 1 
x264-3b70645597bea052d23980... | 1 
                xfsprogs-4.7.0 | 1 
zlog-6ddb9bbf3ff0123e701bf6... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/71380738cfeb0885b82ae38d15d7ac3980467097
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1d6170253edc5c16750926b650a267d3ff672140
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/559e566021f224d5b041e147b944162e551a35e4
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/56e5d7ac77bfd67120d5df1875e175be44fd09bb
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f5839871c3d27c9b8ef978c157788f4d6e07ee28
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/78773850ab78e98300db9190f6e04c6114a9ea1c
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/64f72739a3fb56b4dddb7213b76f61c29dfe60cd
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5b3c559e74faf364915cffa10640ffcafeea2b53
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/4766070bf66ecaf005ac02d2145c19503a5dedfa
        m68k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/092990e521a44dff302f55ac6dc3506a72721f5b
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/bc5cfd5e6cf31b581f9de7b72be40bba363bab61
       nios2 |              freeswitch-1.6.11 | NOK | http://autobuild.buildroot.net/results/7cefacc3fd22967e14106e2cd67c0c7a6248af3e
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d78449da49603eb7ba19f86d50796ee72c01361b
      xtensa |                 harfbuzz-1.3.2 | NOK | http://autobuild.buildroot.net/results/af8dc008910b529ca2438c7959e3eed3caa790f2
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8c5df74c71097d557b10685a801c7a00d24323f2
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/504501b65e966dd81543a74f7b816ea75db1e046
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/5324eac1abe157ed64732cd39f8babb0702c3b67
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/6ea5a491e86e9b8b0e1237885336452fa7b910ca
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/1d0992256a6b002605e88b12e8a66beff57fc366
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/9ce73eb8f2e6522ea654f16d2affc8ef5fa55d61
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/870bc9c5933241848017c2d7ddb2c0536508fc91
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bec6a65aa8a19e732ae98ac40941264bf92f2324
        m68k |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c457a6eee254aa0d2e9d405e44b94ddf09de2941
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5b051769eea0e88b6cda5e3655e9cce284b5137b
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/99587102c282202e982764336f24a57bfdcef26b
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/47bfecb2871af3d1f539b854162cf9515901f68a
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/106edfa818e54e0ef139c6d0f7915f0e9ea4fba8
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/21f73f078d1d7c00e0476d23f81bab0167a2671c
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ad328981689364bb80ebbbea28fa2e77b74ba2dd
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/74c3d62b8e7951b1cf037a16d901239d45183664
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/176b5f4e5dd9936e1dde6db7c7580b654ba146f6
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1569695801bb6b94d95c58ce2caed18b30d42784
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1dd81d62352247b70d4a19402e1df26195c437f1
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/70e4e6f3b45653e84e44d0223fbcc39c5eb7ea2d
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/43bb1ec9f191975116a16ec19c61ec3a623a05aa
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/7fc1de0f00c0de906ffc06b3312946fd40760118
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/ee9d5ec6c5a0e5dc51707b87783cbbebded9425b
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/8264cd5fb0840c6c2a3b3aa3e17ac25b3d7ae5f6
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/d515ce211e2c6e667a32940dd395c77d10067e74
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/8fdeaab0a602267b3774b99a6e8d38d9af5bc20c
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/3399730db88d3729093a421590d13107108a902c
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/1ab55f47d0ed384c103e58df198054f858bd6a74
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6e99216e2182289dea5f2b0baaca563fde91e9fc
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/74bb1cd711e788a597fcccf04f0f1316226d1de2
       sparc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2713d3e00cfce7ecef8203121d2d52ded173342c
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/c64b13b72e4fba5df7c355c84942171013adc3ce
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/cb20f564bd1c7e69edbcb3d0ea4cd7e6632486ca
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/eb389d427b05e05d30d2b960b2b437ac0532ded7
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/a46d58416546435bbda0935c3812a58d99909078
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/5bc39e6ad16d16383d1713ac33c26d91f5a5eeed
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/4aab7af00f508391b8ab9dad011e4347b5fe204d
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d9970bb80d800c591cf131f471ea6db63be8dbec
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/45df69d0d2f34a59d74488894520ddf0a23aa509
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/79284ea81c9d949a55ec6d4fa5016a383afc3fc1
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d820c9623941f2ef5696cec3e5b8a91a9917b75b
         arc |          qt5serialport-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/b143bc806d45a91d52c43fa49227e88dc8a105d5
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/36cafe65cfba7b8daa10e224d110099b36bd380a
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/d1602614f41ee4ec46265699f4d2d50691d82f74
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a5122bd9ee6cbf9a1c350d68f153e829c53c07b3
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c8ea0ecd502e06fe9c5ce2fd3e46e7138ae158bd
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/877c791a0914701908ba0a205c6de67a126d4bfb
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e4f13132d4e032f7dc37857547fe84dcf350ce8c
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/3370b80bd238a7a37499edb5466dd45d21352f50
      x86_64 |                    strace-4.13 | NOK | http://autobuild.buildroot.net/results/dd32e2b2de444ef1e98da4a8ba388ffbf78ff3fc
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/8513f0d7142742d056d1513d03307b010326522a
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/be1e10ab55c2dfc3a3edd5f340583ae75a2e3805
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/548e4b3d60ef1a640d65ea799b92ba51d276b582
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/ff8ee319f069ca1fa8fb1039eebe24815d617409
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/81dbeaa3bcf1dc1ee8f7a7df6b37097dea62a1a9
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/ba001c72d9920eee28c906304e4df785b529fa6d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/af7b6eac3fcb94365b7d2e99a275eb9d9c462a64
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d1549aba8d71b447c4cca3d044f56b48dd7a5eb7
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2578312c72b41c5a8b1138611427553c084731be
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/02e2f84c76a496313ed0e3bfc49a7f6068d067a7
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5aa3f9e9c52febd074a06863806e807eb33c2e60
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b0169912e7bda4672f70d29add487720cc98bcd3
microblazeel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2face5318b8395496b85966179a7f1a8460cddda
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a2440c3a471eabfaa681b21f643defe424ce0d63
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d659150dedb107d7d92050a72abe0920839e960a
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/28c9f27f89850d46f4a79f522db12118d17c6220
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/587fed2d341fedecd47a4447dc9c37145f61fcf9
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/22bffa2b8eee85e937764ec8bae6b22162659c0b
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b9cebf850dc38154073d38b1899f3ab78db06293
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/113e06e1725ec2f7509c7491d3a3e8becb38be1a
microblazeel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cfe7cd8710306cdca0196542420c10700c3d6490
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4c47a9fc4a0746f248b3df610907515e22d3642e
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0ed91674d60cae8e4ecd5fa92cfee24537c2fa6f
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f9007181c64d3136260d5e9b18431fb1097135d0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2f0d371b77c69704ceae3459a8086d58bc6a28ff
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0aaf3103b7e64ff69e4a22557c049603ca3a78a4
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7729aa69d7357848496e8aea752ab0c2958e4065
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/06ee05fa77f076108b6e21a7770b82a3d91480e0
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a8df14a666f799066f779b0fa8192c01a5299d74
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2ea2b57878cf0601ba9016be822090b0002ee25d
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7bb6cad12bdf80edb4cc741720487d7f619ccee0
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8716b74b306100278ca4325915b48be16bdb1231
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e176a6e603e6db7fd749dbe803a3a3b63aa7bb56
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7fc841df6abb62adaf315e56a4c47a42ac11a8bb
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/897fafc428759045e2f62859209c48a670b14baf
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3330e7e1787d420079d3cf414a12aa421f319805
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/32dae45e57203b28e74ceb759c9ca9e3b7a7d56f
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/9116fe344f5ca09f6b3f038b4c04887bebe6100a
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ae54c3a71b653c85d3dc9c33e9b8a094c6055c46
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c3d80904533f52a521cd2fe3e0ae0a36670acc56
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/029f0cea0254fb9636784d3e3ee460a51552f43e
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/40a6e236e2a433045272f753f7cd8b446f482250
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/01406aefdf0c9ca2cf1f55e5aa22097a8e8d5379
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/81399512227de2d16033013aeab3839bd3005d5d
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/430c1e225f0d017da07e7d1640024eb7a293a8b6
        bfin | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/dbdbf82ff6906fc2723bd29ce4c52d451be3c590
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/c07f493904294e20e84cfde5554b91ec1ef6dfa7
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6d0d817af1d09288e92605f7874d8ca33ce3379e
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/ff82d37c8960d541e64bcc15dd3f081fc4fd4368
microblazeel | zlog-6ddb9bbf3ff0123e701bf6... | NOK | http://autobuild.buildroot.net/results/ea0753d7f3b4c6b93a08fa249e992668fa71c74c

-- 
http://autobuild.buildroot.net
