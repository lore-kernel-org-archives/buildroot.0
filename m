From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-20
Message-ID: <20130921063008.1D1C452C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-20
===============================

        success : 73 
       failures : 112
       timeouts : 0  
          TOTAL : 185

Classification of failures by reason
====================================

                  zeromq-3.2.4 | 21
    trace-cmd-trace-cmd-v2.2.1 | 10
make: *** [/home/test/test/... | 7 
                    orc-0.4.18 | 7 
make: *** [/home/test/test/... | 6 
           python-pyzmq-13.1.0 | 5 
make: *** [/home/test/test/... | 4 
                  civetweb-1.3 | 4 
                       bc-1.06 | 3 
             alsa-utils-1.0.26 | 3 
               alsa-lib-1.0.26 | 3 
                  zeromq-3.2.3 | 3 
                directfb-1.6.3 | 3 
                      pv-1.4.6 | 2 
                 qt5base-5.0.2 | 2 
                libtirpc-0.2.2 | 2 
               libglib2-2.36.3 | 2 
                   dbus-1.4.26 | 2 
                aiccu-20070115 | 2 
      host-gcc-initial-4.8-arc | 2 
              cryptsetup-1.6.2 | 1 
               audiofile-0.3.6 | 1 
                  ne10-88c18f0 | 1 
                      qt-4.8.5 | 1 
                      icu-51.2 | 1 
                 python3-3.3.0 | 1 
make: *** [core-dependencie... | 1 
                 webkit-1.11.5 | 1 
                     m4-1.4.16 | 1 
                  nettle-2.7.1 | 1 
                 binutils-2.21 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                 libnspr-4.9.6 | 1 
                  libnl-3.2.21 | 1 
                 cairo-1.12.10 | 1 
                  poco-1.4.6p1 | 1 
               w_scan-20130331 | 1 
                beecrypt-4.2.1 | 1 
                  python-2.7.3 | 1 

Detail of failures
===================

       sh4 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8c65e9f878af6c3b4edf8ac84f7dc3d8a703a189/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/5fca5a9f7895c7d4b7cdb5a95e476e15eff3e3a6/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/84f27569e7be5b7b0c48d5b11f5dca88f1ed887b/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/af4c876e195304be50283c9fa5fc785f61798f95/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/de4e219ff882aaae23c4503560be38e8df8893bb/
      sh4a |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/a4ef3e29e385468adce61e88863ad68f5f4be3b6/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/4809e351522514bcccd855a3e3a77c80706f15cc/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/458c4e91b6435de59a225b973323555324937cbd/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d8e14e86c2a3b2212aef9c915aa2b2a7ac3bbc11/
    mipsel |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/c06f1e08ec3ea68a4088875098454138f554a99e/
   powerpc |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/5390c3187690f81e812fdee1557a8c01f4ed551f/
       arm |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/765cb9e22e14d10d0bc0f58ca74634fa1cd43eab/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0b729b85a6462b5c75f8e916edfade69f4585fe8/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/de2d9c9dbae224e01c92245f48a0b5923a39d14f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/777c8452a6ef0eb11950019fdb84e7c3e2756f7c/
   aarch64 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/bdbee9ab5603d4762ce01c90c11b5624034c9317/
   aarch64 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/83b9cb46b8a31a2e2c75330cd1e175af6652a290/
       arm |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/0407d11208823eb6df603633d437406d3a5474ce/
      sh4a |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/a406e58d717077897d19e195e65ed4688b3e5102/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/9250afa239d8348be43d95d86517ac4498494948/
   aarch64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/d9c7c0185ecb42758acfb588b63cc2ee25cc6835/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/cff90bfaa16aa2c74a6bfe097dc70ab7f163aff1/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/38b238447d1904c3683626cae0f9a44a1dcbcc9a/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/f6c3ec416c35c0d37ac533152dcdc4b26a1d4dbb/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/dabee00c788035ea884d23942cd63d63670981e4/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/3323b87a7fd808dbae68b6248a6d0f5ddac66ba7/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/b4a4092898aba9d8541412f4de506bab5184edbf/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/02acf915e044cbeca4956addb2931e7fbfa9b01b/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6fee6fd3071faa68be77278e1a9a2a5203be95cd/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/73de897120c5be2e4eae07f8c3815f8b6f6dbfad/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/85c9990f0b5a62c6adbd247f9308e71d192d5c5d/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/dca87fe0ada00d29116992b70e6503890e94ee5d/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1527e2281337587985f021bf516ffb646f86e8a8/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/cc79c0ea9b09021547fcd0e5e48ab0699a0af109/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3ad15cb5cb29074c65f6fb0424c7600a70f7de2e/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/4fd49862c1c91ebe45dc4d63df9e8573b7a958fe/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/60250aefd9f405eaa81361622bd61c6d3dc75d7b/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/1642cd4a0f63b4a713ecc8ab1011bf0382be9cdd/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/8f402b9cf2888539ab01b252b1f80a4106736505/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/978ff61dda9c54f1b7f77cceac37fb3884f2b040/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/9526d12e6f26d9d91f5c13a2caf06d81f57820ec/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/ae93db3590a9419c4699b29a75bb028d9154425b/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/9444c186ccec8cc1260351179f88930c1c4c58f2/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/0359230487d49f51772fd5833fcef7aa3c279caa/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/10b31ccbada80d2a6e968b06f37be3479ea4b0b5/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/bf6ca62c0547740951d64d5f6969e5f697031556/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a92c4893b29ebdea35be4e54cac8973b98bfe784/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/509a2c5a6b17c216f36c1b23b90950547cf6ba38/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2b8a2343f55e460c0776eaf7ee3e5efec0a803c9/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a8f213f2d2cd54c3a1eb46b3d7d924c82ce4c6fc/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/8fa35298f2f98ae4d353ef59182e1235dcf52771/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/436e0610d4cba59df33e0de306b02ffda9da612d/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/861ab324ae116c0bddc792f5b4c34b67f3ea3bf1/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/c9956c12ccda23cf71f9f6d08d39aaa6eaff8929/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/0a2d750275eeab76fcd3c4559149be2f8095d9f9/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/42194b7919e44bf346d93e974b38ae33f0ef3438/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/cea1514b2f551c4da778d7b3f4e593d31c4b3c86/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/cef9848d7a7745e75828ed18f63f95f53a1a8a76/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/96d6ede45e83a2ee0187a403dbfc6aa2b923c48d/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/51f33778bc2b7bc2f04481f913a5df49f0b2457e/
    mipsel |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/ad1d514e887e53f37bde79f6a9b7eac246552952/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/6942e6ecf585c5491f7bf71933b22153b4d6a498/
      i686 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/298fff81e31e8f537ecc8861f4dfa9984cafbe16/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/389607f79a414395d8332c103fd1eb48f44293b8/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/05a5705a941a388918b11a6e1ff442410760c70b/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/08230527cf13946bb790ceb92b385320050d6341/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/77f3d9cee2351c166a8473543db72db1f7467f3c/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/558c8057b367b92d1b7ba8c9e5bc35c7eadaa693/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/5fdc426244e1f6fdddd43039caa653714b0a0f6c/
    mipsel |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/ca19d01377c47f2724700ceb847ea7db466046d8/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/c908256ed086a6f8d749242b5e45e3c4ba9751ce/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/7c263c8b5ae8050f9ecdf17c4c5689159c8533c4/
     avr32 |                  python3-3.3.0 | NOK | http://autobuild.buildroot.net/results/43ba0e6db4f5206f5b6e5d4bee8cb4161f17e7e0/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/022009d9fce6156e8dc007f8e6504c019a8972fe/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/03b346c1ac43d95de28f4881f960018c4b7343c1/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3f557edcabc3e50149f79bac1476abc5a5e11a64/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/582c7fad99217809787f68bb44b8a9a1bb754600/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9f60753ea575d38738bbf865559123313c2a7e96/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1c4567a230940a5287d03e2a5c2c7afbdc64cd36/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b88638e436117e5c3fded5ebb0ab50572a9aa192/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f69970ffe56d238e30b5f22d002be8b12f26c71c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/73b7aa2714aa8f95595390c34041f94f9b8ddb67/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d1ad09d775c69dc99c7c4133d065914b51aab46c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ed719d7a17032e9a1f2611395706029583c2d641/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6681064223fc11ad44811aa9af4ab36955c777df/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/09f1c6cbd5b41a455076cca09ae3320b8eb45f6f/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5494463f1dbd40f252e3a1105f56d5f5a847a93b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/839920de3f4f9d2edc3904b76bf6e3ee6f08878a/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/c0d857a939de78fb7b9173b4fc2f3ad388abea73/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/fb63718573abb8d62c9b65dc557731da7e3920f3/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/9cdf1fab08fe4e19505dff611d9685fc49307e6f/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/b947f2a45e6439b5ecea926626ef531005984180/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/8c7d1383de8d00665be01b1ee8e98b66c687cfe9/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/ce28bf104699cec6aa14a65a873eabce2bb98e22/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/f173a22566f9bddb31df38f6c5128b46fedcd043/
   aarch64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d9eb50914eb362ea288a963df06f86b3e485d0dc/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/004968a21c1054052f1a0d0147c6424bd20c838b/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/fbca727ac93c60e4bb0ef17263f00ea599434ac9/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e163f2c626a8c6e8c8e8e944afbc4083de28a6ff/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d793f621cb0a7c7183c92cc96bb406eaac61f9d5/
      mips |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/73e40e27bac0d2555dea2fb53be0d534c8050ad9/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d83118fc9bc4f373e911288edfa42fc4f2bebb94/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/2f6eb5572993fd18ee7457ff53149e9a89b37d2f/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/b4284324b9ba0bee106742c985ce2714124cf67e/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/9352adcd1f038e4868f0d4478fa5e0a9e500cc21/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/8cdbbd3c8dd792cdf0268c91d84a02c9652f6658/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/cccb85fc4faa5b3521c98d2d517b9c1e2c0920fd/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0dc5cc342aa88053a569db715cb5f83d64a3e721/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e19f04671169cbf5c3336f95c177ac5e07d9c753/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/a5318b7d92f83b76f3e42add7a284a6ca178d1f6/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/373b35d9e18e66b411a298067ba20c86de0c3b39/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d81374b7e386a446bc541b049d7870c7ce063210/


-- 
http://autobuild.buildroot.net
