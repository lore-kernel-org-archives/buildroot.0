From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Dec 2017 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-07
Message-ID: <20171208070036.84EEC20956@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-07
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 191 |  50 |   3 | 244 |
   2017.08.x |  19 |   0 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      fastd-18 | 38
 netcat-openbsd-debian_1.178-3 | 2 
                  cc-tool-0.26 | 1 
              host-erlang-20.0 | 1 
                   jamvm-2.0.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libdrm-2.4.88 | 1 
make[1]: *** Waiting for un... | 1 
make[5]: *** [profiles-do--... | 1 
                   mpd-0.20.12 | 1 
                    mpv-0.27.0 | 1 
                      qt-4.8.7 | 1 
          qt5xmlpatterns-5.9.3 | 1 
                  samba4-4.7.3 | 1 
                       unknown | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7d999d931bc62a359bac0fcc1e274b821713c634 |     
         sh4 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0192c74df68f001521a218dc777ea719ec6abf41 |     
       nios2 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/2fcb25cd48112e218beb06ae2f547be97369d827 |     
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/ee97fc76bffdb9de750eb27a2f27dfdada4027b8 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0715ada7d4fd8bbfd007d48fc6bb9157e1ebd34d |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0f3348e07ed3d3a24cead63d7757e726d2486c11 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/628fbdcb6a959c6f22d74b42949e23d1933c20a3 |     
 powerpc64le |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/5d00bf16e1b184d7d16852d7ad41f757164e6480 |     
      mipsel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4551bc57119bc91fa24af06bdd7d8bd46c9241f9 |     
     sparc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/5c3dae85d6bc8ca10c6a67f49bd7aad7330c02ae |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/a718d8aa1f19158956f37b77ac50801d924e5ce9 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/fdcd02180b0608d835f2aad029dd087a19b75658 |     
        m68k |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/15e3a503560513e8a34b3e87d9bbc54f8e187847 |     
       sparc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e09e166b3308f7f958de916d5666fa3564837d04 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/b97369f6ef3a46251338140c9502a32870bc44b5 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c93d791874a810dbd5e5d7034d1f7f29da3b1058 |     
      xtensa |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/a546e626b4f611fea90d6be4fc8709a34ddf25d5 |     
         sh4 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/17ca589e0e7b4e6c418b767bb5fbab4eaa043248 |     
     aarch64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/5fcce0fb1a9aabf2bd8b5b4cc90c8a5cbda5fb5e |     
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/82b72d9b3020f82f7142da113704482ae2341716 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/50a5bf82308fed989fe68af8499a280a03a22702 |     
      mipsel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/d09fb3294ddc615f721b69157bceb7c3cedf496c |     
      x86_64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/8c9841e8b085e6a1138202348a4a916b1e6518ca |     
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0c8fb742cc755d9c312c17d6087b36c0847a8c2e |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c1ac0f6d2fb05149cb03fdb5afa4e0ac25d36d9f |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/aa86fa14cbaf377b370ed80826ce86d37136db6d |     
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/56b596b7585aadcb68b72a159f1b81f11c7a8709 |     
   powerpc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c413801f65bd33b9d06b09ac1c44bc0b90ecbfda |     
      xtensa |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/5f9b244ef1460d4412d2c265ad7234ce7f0c1f2c |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4c441e41db273ad56c2f563a53bb4b656cbc5b32 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e2f8a597ad681e0213eee839f5278d90c520c73e |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/35af98e12bc9e8515853b2a94289c7124a5a855c |     
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/aee8e4ec10b9d4c0bc44f62f8390774be02c08cc |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/65a349394c493a2af473893690b17c786e26c271 |     
      xtensa |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/22e6ad99b3626488f199d941dff8c36774f48f6e |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f815dbfee7099f3b8fea7036e1fd10385f8c6a80 |     
        m68k |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/90c526491a9eb6b5ceb38a0218fd480c03208217 |     
        i586 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/3299d413ee98963e62c0df4087604c9872fcad68 |     
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e30c6db055e8897eb53a04ee18093a3a0bc3d5fe |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/6ccd34ef0ca4f33ed4881128ebfbe6b77c514434 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ee7062386912e35a3e4ace4580a61f1b289da455 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/84c9fadd7e08da194ca573abbbd6e2022a040844 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/a0f40487927d6f1c66a625b7b89aeebbd70f0a6c |     
         arc | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/774a4368f0d414d5d1ace950b8ecc72c7291b171 |     
         arm | make[5]: *** [profiles-do--... | TIM | http://autobuild.buildroot.net/results/2347c6d789de5888dff76dd84bfe75bbf503a486 |     
    mips64el |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/2b37e3683215fc83e82757b08a274331e3abaf2f |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/40ac24b052e10f419e637762443996957447d87b | ORPH
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/a3d2d17317182d253a3c5420613cbba4f63d5ac9 |     
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/f0347ea0db5dbe9f4aa43796fc0f86ac79cbd018 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c3c3076bea4f45c2b8de55160bce70aec19d93ac | ORPH
      x86_64 |           qt5xmlpatterns-5.9.3 | NOK | http://autobuild.buildroot.net/results/c2d79e19d0daa1a9b5f0f088d2be3125bef0d20f |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/a9166a35f4fe6ce0b83800e79fe6cf16812f1a32 | ORPH
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/7a54a30c0350978f646fa4892158f6fd26bd3479 |     


-- 
http://autobuild.buildroot.net
