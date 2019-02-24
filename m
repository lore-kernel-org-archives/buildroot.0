From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 07:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-23
Message-ID: <20190224070047.BE63685485@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.11.x |  20 |   4 |   0 |  24 |
      master | 189 |  61 |   0 | 250 |
        next |  50 |  19 |   0 |  69 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           qt5multimedia-5.9.6 | 1 


Detail of failures
------------------

         arm |            qt5multimedia-5.9.6 | NOK | http://autobuild.buildroot.net/results/d992d855a06dc031a61da8c1b2cb541f0ff460fa |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 3 
          shairport-sync-3.2.1 | 1 


Detail of failures
------------------

        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/fb72bd5e6de2cd5691c2b0d246ff0ee9be8843a9 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d361add5b475e040c371296ff7263e371295e35a |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/01eda0fdacc3811e47e1162579adc2130cf94070 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/cfcb4fc9e273490c9f7e91b38c647ebc999d08b5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               ibrcommon-1.0.1 | 24
                 qt5base-5.6.3 | 7 
                qt5base-5.11.3 | 4 
               runc-v1.0.0-rc6 | 4 
                   glm-0.9.8.4 | 3 
           host-cryptopp-8.0.0 | 3 
                   netsnmp-5.8 | 3 
                gerbera-v1.3.0 | 2 
              lua-curl-0.3.9-1 | 2 
             stress-ng-0.09.47 | 2 
                   dvblast-3.4 | 1 
                  ffmpeg-3.4.5 | 1 
                 haproxy-1.9.1 | 1 
                   i2pd-2.22.0 | 1 
                  libssh-0.8.6 | 1 
                  linuxptp-2.0 | 1 
                mongodb-r4.0.6 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/51f8e2ecb957df0fab232fab1887561f42add95d |     
        i586 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0b5ac880e93683ac795c4f04dcf5992d3143df6f |     
      xtensa |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/84916db2418602ee7df39e8e792127b5652d2af1 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/79d698b699be5b198b2f2b141385525dd4f63236 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/7ca7be6a38e98160d9caa65de3a63e3d4f024a7d | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/beca611047c65791443cbae2671983449f0d2c33 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/cc9550f496c3105389a2aec2b6340190cd121717 | ORPH
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/c9e63a216de28d9433edca5aa97a4d7adeee3b7b |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/958ab6cc99da9f462f563c35c6a2e18f258ed0cf |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/af9acbd7bc5a2dd1e570a49803e90bde15c632c1 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/8db5835ac61f1912ee9f46b721102772087d47e4 |     
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/45bfe50bd4a45a9d6a17f3e5f9f004da8fa42bab |     
  aarch64_be |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/35f8350b36f416d88d68c3f53fe90b904252dd37 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/bd99707eb951c8bb4578f779b05cd36f6b7d68c8 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/bd6615c8c5af0e8cf61b2cfcdd66cd94ced51f01 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/eadd5ce379efe5b593a4f570cd5c3f717313984b | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/207c14c01d30474c139894e5972fecb314eb16bf | ORPH
 powerpc64le |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/96e233d4587a979fb1a73fc718707f03cda0c940 | ORPH
     riscv64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/815c4ca6a56233620f36b0e0d8325d649ad956f0 | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2aef2b48dacfb5b375f08c86f9d85782c06018e9 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f9f5539030efd48f6f54c4ce200e0a4e5cab9883 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/7b7f1b7c12a37df235b661429023a63b22617836 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/070bdd583c728f1d179a977477b33b1966e35f2c | ORPH
       nios2 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/4f37560fc9e9b84e58d94ca8af118cfe60ad485a | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/36fd99fa06bca73df2ce7be2f82d007f47ce99d4 | ORPH
        i586 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/75a58bb65c27acd14ac336bfa3f852ca6de57ee6 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f4a6e6ea83daacbfca4cbfa5c68e6febbfe97bea | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/60c0e86abd8152635ac9361bf29d6b3046080b4e | ORPH
       nios2 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/50f2db9a8560859f28eba310b8f1edaa45c70e23 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/e1238d5441fbbbde792227e87845bb55505cc0d6 | ORPH
     sparc64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f7eab9774869d7e737652d0f984471a6bc54393e | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/520cdb5046f98e4c814de0df2ccf5adff248aa87 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/14c371002feae26f8a3e7971a1d648712763dcb9 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/57e68e5bd8fc73e6a868152ee585ed6d6f5bb5b4 | ORPH
       sparc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/121dbcb88077258c8f5527643ca6e85fdbc46384 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/3177887b703a4b90ddfedb6aebc76806d0bf199a | ORPH
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/3c2125b7672a4d7444e6fdf86198630089963a71 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/93903e8abfeaa7df0b6525033fa63e29f2c9e7ae |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/8d76ad49837b368a7bba3c3dfd445a035471268a |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/ac4540843c7e1bf99eed9b88721a6198e4d695c7 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/40a465d117d565befefc73c3537fc3c302a1b1cf |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/20d46dfeb18cd113e8aec53b36e22a4ad08567f8 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/046627b7d8a8aa2f3632bacc9576ddb5864797aa | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/bd8829b894bd08e76ff95424b3daf4efa2ab4b2b | ORPH
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/5fcdfac90d6da602b2bb05bef485fb3b625a2c2c |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/46e4897bae89af891d89b558f391a8d8de56b9e2 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/4528b041ce2dc72c351852c1d85901c32bc167e2 |     
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/91566aaca04680dd24009b227183c710b67ac031 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/1e5c7ef00681cc93063b1a57da7a0ee04d945440 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c69e185eecc03176daac5ca05269aea164d1e275 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7ab43412bc00dac132a6df57e569fd1d274e8b7c |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/01f840bb9756621bdad4faab2528e615925af98b |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/66bc8fa52ab82be23a3643f2bb608020ef3d8780 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3b9ef545dbab3eed8eb51e1d562dec00c7c5bb5f |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bbb0e845b6818658a0dbf82031c00ebaed1df62d |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/7561b37d00296cdecd62590857b39f14f4daf557 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/1010bf98416fc7d67b909c3c38ab81be448deebf |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/23dbd694f61dd50856fa96caa666e9250de606e3 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/bc976bf715f1c11fe83039516154a518ffbdf37b |     
       sparc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/33740b315d83ab8112c8e819d47c7c8b48a1cb88 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/753d63379e076e64180f29f4c535ce0f1ab7cf2b |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 4 
            optee-client-3.4.0 | 3 
host-imx-mkimage-rel_imx_4.... | 2 
              lua-curl-0.3.9-1 | 2 
                 qt5base-5.6.3 | 2 
      host-uboot-tools-2019.01 | 1 
                  libssh-0.8.6 | 1 
                   netsnmp-5.8 | 1 
                     pcre-8.42 | 1 
          wpebackend-fdo-1.0.1 | 1 
    xserver_xorg-server-1.20.3 | 1 


Detail of failures
------------------

         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/1973d39b113c37e65c35f1f0a56354f192ae02d7 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/daad194ab2e7af8f5a462da1f94de6ff911dea86 |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3ffab90c1df317d80adcadfe313fcec6770fee4d |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/e95d5957c19ff01120903a66d1167279a34da2ce |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/94e277cd8f387faf9f665fab4603165563e83d1a |     
        i686 |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/e77d3a82633f04bd3f8072685e96970620aff6e1 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b1ff53954c0955ffee8091fd49c5b0b5e7c5e6e3 | ORPH
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/36c08807f1a82295f80c3af52f3f873126aac663 |     
    mips64el |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/5807166facabbf5f8afa4f63135d59ba42cd9753 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f63bacd466694ffe6eabcac05520fb7b09ad9981 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/8e48369aacd446237e0b41324036925e70780512 | ORPH
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/56fb58bb25b4d8125b47af7206c2270edcaf952e |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8e42e15ee4f73197956e698af2fe1021137f025c |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/2663042f6799305ace44533f59a6200ae6e34030 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/441e00095c7fd7dff84b1dec66965463d1c0c6fe |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d235a8b359b952a2527307604af2f8827ec4f5ef |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ef5e2248a4630b0c271fec79cc737db232b63fc4 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/5f18ca2625af3a448bd751d216ad766c2342dbd4 |     
      xtensa |     xserver_xorg-server-1.20.3 | NOK | http://autobuild.buildroot.net/results/411920a917d6beb1d68e4d20cbb542ae19858fa6 |     


-- 
http://autobuild.buildroot.net
