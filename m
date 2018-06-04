From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  4 Jun 2018 08:00:51 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-03
Message-ID: <20180604060051.8D93020DB0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   3 |   1 |  33 |
   2018.05.x |  34 |   1 |   0 |  35 |
      master | 201 |  76 |   0 | 277 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
         libcpprestsdk-v2.10.1 | 1 
                   libnss-3.33 | 1 
                       unknown | 1 


Detail of failures
------------------

     sparc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c4fb1aa85e6f255a096181a9d66cbc925dc61846 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/4fc5629a4b11c798dd4fb0add4a7aaab6cbd0da4 |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/b6dc44452f8f0a08079bd9c622a2e04a0c138a15 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/3ae0bef70c92e20d571bc547cdd0385ad4e8412d |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b618ad3d4891af33dcda7d52d3f545daad409b0b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 27
              librtlsdr-v0.5.4 | 10
             host-dfu-util-0.9 | 9 
                   whois-5.3.0 | 9 
               mono-legal-info | 4 
                   zmqpp-4.2.0 | 3 
                cifs-utils-6.8 | 2 
host-imx-usb-loader-7e77787... | 2 
             host-libftdi-0.20 | 2 
              mjpegtools-2.1.0 | 2 
               aircrack-ng-1.2 | 1 
          host-waylandpp-0.2.2 | 1 
             mesa3d-legal-info | 1 
                php-amqp-1.9.0 | 1 
         python-websockets-5.0 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/3f3dd88e80761aa05ae36030491eda60be9fff58 |     
      xtensa |                 cifs-utils-6.8 | NOK | http://autobuild.buildroot.net/results/92d7c608f717bbfe01ecfb9bc9604cb303d8594c |     
         arc |                 cifs-utils-6.8 | NOK | http://autobuild.buildroot.net/results/2655c0e1fa3ad0a10b4aed39a17feead94e47bfb |     
      xtensa |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/285337352ff08ee31410d3f49d6a6c92d1c6d935 | ORPH
    mips64el |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/cc72a432561d0305e2757024b6c5af3ec7e094c0 | ORPH
      xtensa |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/88bff3be58e9f0bc9e5bc3b67389782d8a032eb1 | ORPH
    mips64el |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/206913d95e5f7e0e12cd7ead0049b3cf912be755 | ORPH
    mips64el |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/78ba706531d2455c164028713d7ba6f385783326 | ORPH
        i686 |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/77403c70efd926c7dc4d72e1880c6b1599dbe055 | ORPH
        or1k |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/c817037fd8e13608e7803d2e7d2826e553737c04 | ORPH
      xtensa |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/efb546f2ad14628a988165b67b04e1f110119945 | ORPH
        i686 |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/6f0140d83ba0ea7e978900cffcddd63017002f0a | ORPH
         arm | host-imx-usb-loader-7e77787... | NOK | http://autobuild.buildroot.net/results/f6a3a62909ccb500ca122ec3f03119d7706fb88a |     
         arm | host-imx-usb-loader-7e77787... | NOK | http://autobuild.buildroot.net/results/347f1b9bce2f0854e8ca6d49b9a9b3fa55de24b1 |     
         arc |              host-libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/88bbe5901e484ee84f8adfc7f5fd7f07bfccf11d | ORPH
   powerpc64 |              host-libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/82047f0e267b4b42ee6c5049f7403f60aa6605ec | ORPH
    mips64el |           host-waylandpp-0.2.2 | NOK | http://autobuild.buildroot.net/results/b0909370b93f96d039c830d334a52b5e388a255e |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/9c6ace134447c4139cdf371294fe0bdfd59a4fed |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/40be161d37d2625b48a4cbc4a1b6f093b2600cb4 |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/43f7b04a90a1f2d0a78c88b8f29f16b076861449 |     
       sparc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/73a73b6b50d76a05bb386562cef146fa14c81600 |     
microblazeel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/822211baf9c9e764f7838d3f1d3aa729fa1a8284 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/498f32b6ed1d02e94bd651d1466d39bde279fbb5 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/47b3d2305f7fd2d20bcc65fdcf3520cd2f91431d |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/7ebfaf155655660f91e98b34597d81486812cc30 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/00171752bf0dac952e8c7a874dcf2abfd14ec519 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/a089cec1291f1177b8b49b9c21c048e9f028cc9f |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/a72baee7388274b836f735d9b9057b25909e892c |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/95ac825dc03e2cba07d080644a5a74614be2a91f |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/b99e751ff780925571a6be69a1154b893faf8eb0 |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/52d8ce4c528d65dc33cbad30b423e51d53258a13 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/2adc6c8f659d2cce0af9091c85ade0e8fa7f4cbd |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/b5965dffb96b623598f9e0c8efdb9beb854675ba |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/c7eef7399745380a68e2a888e4b8e54c50f79cdf |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/81359b7f078ec1a37da5b3b6d36fc0ebf79d9e38 |     
       sparc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/7313c1925c6c89f178a7496c2d47e7f965bee1f8 |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/2ce6ce8fa827b42982f7994213de43306f11f8a7 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/73ab176e899c70d0fdfa1b1001f633bdcf2afa7c |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/26f8a66d1f2e0f31331e0ddf7ce72b8602ad0499 |     
        mips |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/7e0267ab51f66f677aaf4ba3ccd171f6f777ecac |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/058acce2d6f1419b881ec7951367ecbb82428345 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/e94563b2ea8401fcbb4d9552f07b5ee3ea322b04 |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/10aac7377b5ea819d61aa49736d080d724bf9224 |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/71c0200cc3bf064ae21b49f9133148433c20e9ca |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/b06d7b7c12feaa63a041bcd60c663e74dc42f587 |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/8fbef38d5627ed58e3b7251c33efb6f5586f124d |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/1734e3920c147596dc23969430c49d260ce4d22f |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/8beb69de589a3994854d67ebf125fd9df7ef7058 |     
        i686 |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/a9270f1fe85f09c3de19644dacfa60b9785941f3 |     
         sh4 |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/ff33564c6d9cf49a0b966a0649b5917bce5c92e2 |     
        m68k |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/7a35f34caaf46a3ec72ad34cf1e4aa7c6437b1bf |     
    mips64el |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/237fbc22e5ac422873222dd99da35000650f3aff |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/f02f211f5ee5f2f8d0a03a17f101f14017f8cffa |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/ba2573a9d6828ccd36cd13ffcac74a46ac209832 |     
     powerpc |              mesa3d-legal-info | NOK | http://autobuild.buildroot.net/results/00fd8fbc1e89a29b60ed9c6906035dbe4f0a3eb8 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/ca90d1f5d25a137a691b3a7757e006a34e09c322 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d5ccc312cc04095f3fcf1df6e5b00303ab93e410 |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/8d54d22b432b11e9f5ca014b9aa20cea934390fa |     
        i686 |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/3dbef068844292ebead5b5542ddf0e77dca7716b |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/f4d1acc57f835e41519e3c7582f9cf9d3316e81b |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/63d193a2a05d8c6358f28e13a85e22a29f7d337c |     
     powerpc |                 php-amqp-1.9.0 | NOK | http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b45dcf1fad05 |     
         arm |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/77e29c290319ff98a14be4d0d5751aa825f9c6b1 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ab341442f52f25f4c0458525acd50865a809d0be | ORPH
     aarch64 |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/f6bc2b9c278bcd7b37040b43d122d1827a276263 |     
         arm |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/6ba7b22bd7ffded6ffea0d4cb22074f7df0756c7 |     
      xtensa |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/15268ce1b4f22f95a332b5602ad227abddeb52d0 |     
         arc |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/5d13bd7df9596b3bdf1a720962d1ad09af752769 |     
         sh4 |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/99cfbd34632d372d9017d52be3ab79aea0cffbbd |     
      mipsel |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/9730576a13ff7d0df79aa63d31fa799aa8869876 |     
         arm |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/023d320bfab6c53dbcdfdd31d39a1b354e2524cc |     
microblazeel |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/cd689297647a3a8151e84a76794f92d30b536a7f |     
         arm |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/8c2b2ac29ef71ce4a59a1c39e264e7f4d4317c5a |     
         arm |                    zmqpp-4.2.0 | NOK | http://autobuild.buildroot.net/results/20475346bfcb0cff019ad2e98a0e0ab432a6e5bf |     
       sparc |                    zmqpp-4.2.0 | NOK | http://autobuild.buildroot.net/results/da29053c825f69871ecd17445d8aea000c4ed6f0 |     
         arm |                    zmqpp-4.2.0 | NOK | http://autobuild.buildroot.net/results/0ab51649a54f6152a38ef8cc9929feb149fc0e3a |     


-- 
http://autobuild.buildroot.net
