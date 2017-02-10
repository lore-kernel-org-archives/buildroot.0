From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 08:28:59 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-09
Message-ID: <20170210072859.E4F91207D0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-09
================================

      successes : 170
       failures : 59 
       timeouts : 3  
          TOTAL : 232

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 7 
               openswan-2.6.46 | 6 
                 qt5base-5.8.0 | 5 
           linux-headers-4.9.9 | 3 
                   ortp-0.27.0 | 3 
                 wavpack-5.1.0 | 3 
               bctoolbox-0.4.0 | 2 
                  libcec-4.0.2 | 2 
         libevent-2.1.8-stable | 2 
            lttng-libust-2.9.0 | 2 
                    mpd-0.20.4 | 2 
               qt5webkit-5.8.0 | 2 
                  samba4-4.5.5 | 2 
     0K .......... ........... | 1 
   150K .......... ........... | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.61.0 | 1 
               cbootimage-v1.7 | 1 
                 ddrescue-1.22 | 1 
                    gdb-7.11.1 | 1 
                 ibrdtnd-1.0.1 | 1 
                      icu-58.2 | 1 
                 libnss-3.27.2 | 1 
                 libraw-0.17.1 | 1 
             lttng-tools-2.9.3 | 1 
make[1]: *** wait: No child... | 1 
           oracle-mysql-5.1.73 | 1 
                poppler-0.51.0 | 1 
python-libconfig-b271c3d9da... | 1 
               tcpreplay-4.1.2 | 1 
             util-linux-2.29.1 | 1 
                     vlc-2.2.4 | 1 
                     wget-1.19 | 1 
xdriver_xf86-video-vmware-1... | 1 


Detail of failures
===================

      xtensa |      0K .......... ........... | TIM | http://autobuild.buildroot.net/results/2e163c9506d6529d2892bd00222d2e5ad78aa0f8
      xtensa |    150K .......... ........... | TIM | http://autobuild.buildroot.net/results/8d6fb95782fc6e41d3edc3471e1de409c2e12663
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/73b6b6fba88ab3579533c3ba18d79a7d3e890e6c
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/b48eae8e470083b95a80e222f54f6df0c1fa3726
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5c6d0352e25e988371f041367aac4d805604ee31
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/324aebcb2dc01fb72e4b8cace8de0e0273ec7b5d
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/eb34da37ab489c269904ced7b36275e61a30cc8d
microblazeel |                  ddrescue-1.22 | NOK | http://autobuild.buildroot.net/results/0af569ad06efa36e8e1ae45acd1facfd98b86f20
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/459c33a6f33e63f13b44147a06f2db69cf60a2a9
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/209ab80c3069d9c93ffa983c5209c949f7378602
        bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/499d607643e11cd4c4bed00344eff8ac8dd5ad82
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/6f7568eed1c59964a766fad22003886df4530d69
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/9b9bff5002a2e7e6912e4e890f2c734ff0107e17
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/ff7e010b41e7448d15d20396e9e9bd7319dd493b
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/1e7027b1b87d88b4517b1b19d3a2ae54c24f2c10
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/efaf37214a60b63cc804b14f4c76e13aba3d740a
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/71773bbc1e5a69e711fd256f3faa1e8f7dbb15a0
      xtensa |            linux-headers-4.9.9 | NOK | http://autobuild.buildroot.net/results/469bac4cd4c36dfe681baa2189355fe61b8aec53
         arm |            linux-headers-4.9.9 | NOK | http://autobuild.buildroot.net/results/1eb424ebbef1ca7c01ec600d29e6818e2634bc91
         arc |            linux-headers-4.9.9 | NOK | http://autobuild.buildroot.net/results/42e1958ae28eeb2925fb86c4da374145f0eece43
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d08b57be4af2705944de78cb1c4518f7b1947935
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/fdd325763d300d67a64998da19345b4462fa0315
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/9cb6fc23132ab3714dcf9c6b0f9a42dee5af6996
        i686 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/4a341ed52b6c29f213187a66f17f87dc35565fce
         arm |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/2e54c3c8cb9392966f669aafd9bd61d2b3ad0dc4
       sparc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/ff52f7b8fd8ceb2f57d1cfaa914e2c6f73499e0c
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6188f3572b1a8b0f5001772454022e82de7bea23
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/86fda4de50a02fcbd382c071a0541753cc9d34ce
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9cc1331db82471890bd0402c4e918e95d3a59e46
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6092e1be727024cfe80b01bda803f11311ddd29d
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/44237278c758461ee104c1c78d234b0fecd18818
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/64c9149cd8591561402d293bfb2c07c725d1d228
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/4f3838ba5d81a513b02386a08aac7cc4a4537714
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/d8e6529de2c2d208da4d7c5336d0ae485ab3af44
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/6232138f099c2972a3144a2956d1431053a52d4e
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/77c40c9f02248c476bba86b2d22d596f063dd2e0
      mipsel |                 poppler-0.51.0 | NOK | http://autobuild.buildroot.net/results/35916f2a34ec45ced3e30a25a680cbaa3a0aba6f
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/794f1aade726c16b6ca6e3c91707b10e11f57a71
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/4a7dcfb02a353b04dc7effbc5b9c8489856fc65b
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/43e85953732f8f35d89c9091adc37be0dbb68cdf
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/c4da9d9dba2938ef299fd063b78fb9f21b71655c
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/d367829fecc01b510a67e3dd6626e01ce472c372
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/2bb5f629e0d035f340a890f994949a6f24b77ffa
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/587614e97b12b7d945b0c0607ac322b8aa47ee63
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/f43f046b8993c340948cc51fda402744a546529c
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/3d01a9c1ef1f82c4c030976eeaa8f68a001c19ce
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/56cfbf6655fd6112ed8e74617ce65b7bdd5e0587
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/332575abef46673ee9b0357452adb2340bc3076c
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/77a6652f90c1b6fef320b99c3450586c53ffbe0d
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/26d3cbf96d7fa5917cc3fe9afb1dfa659016da7a
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/abe44e7c1b14504bd9e057639de1fe9697b720dc
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/79d51cc65c8c7f3e99cdd8cfb50ba14acdffd6a8
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0b2e34e915192bb609deeceafb90b6f9c2118a26
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/73f527496589d461a555c2f361b9041839a82169
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/1953a04e16620a9e7bddb4280051f84526740ab8
         arc |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/04abb1378429f96b0de804e7e34e484ee38d3624
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/36a343902122b6dd9360eb62d38d614a6ef7d8ed
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/34ecb66960d39c600f167ec8166747935873ae84
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/1a95a1ffa4cb67e7579d67a720c93a112a22760f
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/f928e99b93677cae14b663eda3900010cca421b1
      xtensa |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/28ccedf2687ba7b3d92494c474d51f68e6913246
        i686 | xdriver_xf86-video-vmware-1... | NOK | http://autobuild.buildroot.net/results/29bdfec67afbbe0bf7c29be4acea4f9245d4c8e7

-- 
http://autobuild.buildroot.net
