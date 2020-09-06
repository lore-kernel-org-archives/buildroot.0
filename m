From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 06 Sep 2020 07:07:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-05
Message-ID: <20200906070725.EBCC820464@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  6  |  0  | 27  |
  2020.05.x  | 33  |  5  |  0  | 38  |
  2020.08.x  | 27  |  4  |  0  | 31  |
    master   | 128 | 114 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

                    olsr-0.9.8 | 19
              asterisk-16.10.0 | 15
                   libcap-2.42 | 13
              host-grpc-1.31.0 | 11
                easyframes-0.3 | 8 
              host-libcap-2.42 | 7 
host-meson-tools-0a02e2d344... | 4 
                 gnuplot-5.4.0 | 3 
                 hiredis-1.0.0 | 3 
        ltp-testsuite-20200515 | 3 
                   dav1d-0.7.1 | 2 
             kismet-2016-07-R1 | 2 
            qt5location-5.15.0 | 2 
   sofia-sip-1.13.1-d10a3d268c | 2 
                       unknown | 2 
               collectd-5.12.0 | 1 
              cryptsetup-2.3.3 | 1 
                  flashrom-1.1 | 1 
                 fwts-19.09.00 | 1 
                   guile-3.0.4 | 1 
              host-guile-3.0.4 | 1 
                 lcdproc-0.5.9 | 1 
                  matchbox-1.2 | 1 
                        mg-3.4 | 1 
                mongrel2-1.9.2 | 1 
   openvmtools-10.3.5-10430147 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   systemd-246 | 1 
                 uclibc-1.0.35 | 1 
                  uhd-3.15.0.0 | 1 
                xfsprogs-5.2.1 | 1 
    xserver_xorg-server-1.20.9 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/ca87389f9e58f1bb60f4d7bdb3cd302b7ec35991 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/4e4bfe641076bf31c8c592d537b22c2864337ffa |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/68e3bc1614aa6df8d3f32b86c35d637a71dc5eff |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e2618d8a72981c342afc4f54248d55cd6b4f062c |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/dfcffc78a2704abcdda95f22325a927996813a58 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/b36d89b72b797549cb5a27da28830388e7badc25 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/c4696fe6e8a8a0c47625043cd8e9ec27e286f24f |     
    mips     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/113656c99656f3822e1caf8adabfc4e5356b710d |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5cb3d6abd58c828b93734f05941b03e2ddacb108 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/671d3cbb3dbbd4320ebf46de1bfbc144dbd070d1 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/b31897abfd347b43fbad8e9c3157ff7519e0e841 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5fe29a7267f378cb28cd1fa9e1e08570e395f176 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/4c6ac9b1f5c8a5820cb820e6a766eaf1758796c6 |     
  riscv64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/8a714f69c18ad74040d12c6dd51528ba23ee134c |     
    sh4      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/6912cf2c0888434a4d6f72df7845a0bb0e375037 |     
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/cd4d75888b5259b028132dd224be34f69bcbb702 |     
   nios2     |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/30275f6eb9cc121115190a4c6ba75c132635b992 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/7e340a3ab2ee255d4768ee609a4346d62b610833 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/028725d8db133b36e442d181ae594391807523de |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/876bc7fb2db7760f53f2820c0673646ed61d65f3 |     
   x86_64    |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/295cc8d443aef1f0286b3b1deadea451614b97a9 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/2503a80b58b023204f0ffaef146e5d8977bff8d8 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/99062bfc8c21c32bc835acae675aede7c9cf0c90 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/044f9320ce044afaa899ed96c7f92529e1fe10c2 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/3490f2be34b089fb4a8d7f86180d65c474171af5 |     
    i586     |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/b321993962a1d81d149fab64da7933535d32149a |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/938afc847a3168716df6b2d46ccaff284072b0c4 |     
    arm      |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8de8d2f48d1182cb0fc18b4bdacb37f79348bc76 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/36ad62922ce01d39caabf19a85bd4aab30ac1c92 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/0956bc50b9823374254a2032d7897d48aff2d1fa |     
   nios2     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/148f351831c031a8df6297e7e8fdff6e458c13cf |     
  riscv64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/eb161e424dac93b72123d6e620b1c3894e251618 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/4c1ca298c976a4782a6909b967da7879493700d8 | ORPH
    arm      |         hiredis-1.0.0          | NOK | http://autobuild.buildroot.net/results/f7aa90d6d6750fb8bf46334513df09360a8c1c7f |     
    arm      |         hiredis-1.0.0          | NOK | http://autobuild.buildroot.net/results/80ac7500055d167e5ec9a964046de7cca4b4f9f5 |     
microblazeel |         hiredis-1.0.0          | NOK | http://autobuild.buildroot.net/results/02017dd7d52e55e5d2323b5de3ff24f0e609b154 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/9334acf1135b94866e8927e3a616bd296a91196c |     
    i686     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/703433e3f2816f6e27120a2a91efa984eb46291b |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ef69341bcabfaba7c9f702254d09871e10f89527 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/8c66e5af9b327c920aded2bf422d2d101da2b1b9 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/e7e1b14a5d1c4a6a493eaa9fbed80d10098fe11d |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/8e6e65140c78e7892d47e3a336e6bc54a74726c5 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/9fb5252eb9babc2a5ffbcd7d8d2705a43fd42db9 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/5fe7e7268d7aee859d3b6f94c69bfe5b3b5f43e4 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/542bdf401ed91506a7791b6a97f1d99ef1aee7fd |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/8e5f48afbe25b6dd3d921f930ca071f196ea0621 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/0f2ff9c9adcaa366573f9707c68d18bf0599dd3b |     
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/899f9f45efdbe06bbc2a86de2cef38db67116a88 | ORPH
  powerpc    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/4c0b1a395fe68eaeb8545e743ac632fee0d9a8d0 |     
    i686     |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/fedeea7a781fd719a4c4d04108da77f8fbba2228 |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/12a695ecf9d74451a438c0e3bf1882e19fc20e04 |     
    arc      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/6b787a98b567129dbb642381a17239b35cdf602d |     
   x86_64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/c6a942b63ee50770df4cabedd2812a5fddc8fd3a |     
    i586     |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/adee4f5cb300129292e9b1257fd99e8ebba11a8d |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/889756c448cd1aea6a4f738529bf2e780ab4d232 |     
    arm      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/e12969d7ce85784f3d3e729e756c598faa251017 |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/890f024cfd4a22629bc316ddb894c82d192ce6e5 |     
  mips64el   | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/1b76b51efb06b79e41f566381cd72e6a84404627 |     
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/884d6bfcee8089b9ed9b0b9fb4e646bef2da4da6 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cdbb0f5311f80eb61e1df0ba9241b86020c73a47 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a66fb34ac5c96071476375236d0491e4b50d6b99 | ORPH
    arm      |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/67367f43cf8b2cc74e9a4f51f9d685ef058d5745 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/c88cca470b5abda03e5e110b43610dd45feac136 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/f5e21dfb64f71da5eca75e2aebcdd05ecf848172 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/f9a5df8158fb9f7c407e312886c1cb68af139053 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/4e9639b919b4e55f6b2e59bcd7c041263aab8f5e |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/ff9699119a8efe7cb52496958fec679694fc9389 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/4bfb5ccb7614efafbebb473a25d084e04a1a2b34 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/b6c19a23a9cd1e6610f2130ba8294a8a04fd9ddd |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/cc7d61ed4ff2bdb13f9ec0292f56dfd187629bb6 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/99bdb6057ef2de04d02a74b8b06c10ccc2ef5719 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/3dfbc8aad4b5e23e126ee1235f839f1881e5c9a4 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/e8377aa9811b9ebd222ca93692150cc1fdccc813 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/d4e89678b349cceced25cb1e066bc9e36cb36cbf |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/387799400231ead94214c6cd467886d4f407d756 |     
   xtensa    |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/a68c7d624fc71122c103fbaf90a5d54f5db8ae2d |     
   xtensa    |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/30062d52884d72e678cfbea76c899bb37bc5d740 |     
  powerpc    |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1 |     
    arm      |          matchbox-1.2          | NOK | http://autobuild.buildroot.net/results/3f552248869d9842b3db8b71c1ca0b030b1a64ba |     
    arm      |             mg-3.4             | NOK | http://autobuild.buildroot.net/results/aacc02abf41e120e0d0b22faa38642e6d149d73f |     
    arm      |         mongrel2-1.9.2         | NOK | http://autobuild.buildroot.net/results/858488774503c6cc6a5489bc1e080562f5fc6461 |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8388428f7378239ac3cda17570fc8f34e850134e | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1133a53d30a83380c03a1e8be86b5509dc7e94c4 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/be86fc21d97bd2c2fad496fccb693df0613e93bf | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0b13adf938ad46e82008ca194faec1936ec66694 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/439640b06f0207572b44fc49e76c0055c36bfef1 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/02e6df3b59ddff8fca2f52e6069dac38724e27e9 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/865199b18723ebf595a465f6c08b58359d7d2f26 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e949381f36455438ec45148eb52124f8fadb1c55 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dc28284b1c0424cd54e9f14c93e203f4b6a19217 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e4ea08b5e1142f2ca709a8ceea137804addca733 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a9c413266e0ba3cb32c46e56b3a7b2fd50204794 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6c50a50fb35948dfe3e8303f13377e3e408b809a | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/306468dfaa7c150ef20cc8f4a25cd2775032fdb4 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/af16547f31d7d0f2d1ed67d9e479f724b2fbbbb8 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d8932c7954fdda1003e039610f360ac97bde32c8 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/20838ee8a0a67a693c63d8f600e6b97413d2f29f | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ceadb5c4dbbe15f198fd817ec12159b9556124c5 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6efeb046ea9f5ac498fa48d467dcf8fe209fd6aa | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2723e7d90c44cbf9fd0c30efeefcc3801beb10a8 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3737154818b5d689eeca21da4c5d66adf67a6c59 |     
    i586     |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/ef3c12bbac6e190d22567e91fb092511208ca69b |     
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/de2daf1271a53eb478346eea090109d22d69fc18 |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/95b6c489fed07d6fe626200ea057c83756d54deb |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/b0aa5878d2d0020befd5bfb560a78b8849a7ad72 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/31de5192274077c4742b51efe012d244fceb2943 |     
    mips     |          systemd-246           | NOK | http://autobuild.buildroot.net/results/229866ea234097b5d6c6104bf040f47fd22ffacc |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/a156ffcbe16af4b2f5440dad06c6985b8fcd045e |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/fce29507423137d5f49cf4896eca06983c92ad4b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/95b1414cacaafa0094bd4ed9114dbd7ea97d81e9 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/de9c1ed39a5f4d9d6c80bdeaf624e1ca8da0b9fe |     
  nds32le    |         xfsprogs-5.2.1         | NOK | http://autobuild.buildroot.net/results/a21a8d5692ca9426d7faab6cad1172ccb09f5dd4 | ORPH
   nios2     |   xserver_xorg-server-1.20.9   | NOK | http://autobuild.buildroot.net/results/9dd99e633dee8f11e7b2b973d4a72e51a2812ec9 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/603eb4d062859ebcdcaf3591de8343c2b48c54c0 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                qt5base-5.12.8 | 3 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
                    proj-6.3.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/976c908f2c4df8a599586d9aaf38804d5b4da8b5 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/832e24b56ff1ebf634767946ba7dc0c66da3daac |     
   mipsel    |           proj-6.3.0           | NOK | http://autobuild.buildroot.net/results/b6d725efaefec94b81dc7ca7d4ebba92511a0924 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/1141e3fe66f05dea63da28f5ff5819a0eb858b43 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/f89a21bf860bb5dc673bc5f62e99aea5d4a06f36 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/881d9ddc054a100676f45fe1e1e390aa9961e8a0 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                 rocksdb-6.6.4 | 2 
              luabitop-1.0.2-1 | 1 
                   mimic-1.1.0 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/6e2fb0aa096531467a0b44a67598ee70942ff99c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b295c1a7898343bc4065f8f46bd11ea5f980f85f |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/4f8febbc514aceec22b8a3aa6c7971f03a4072e6 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/74c62cd88769764d40fce61b44b31b324bb6eef9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bb01ede977306ebcbe0c9127b55aef9320db44a4 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
              bitcoin-0.19.0.1 | 1 
                 netperf-2.7.0 | 1 
                samba4-4.11.10 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7db2301c2e4558dd102394b3d1eba828133f4776 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6d992238fb41a6c49403c9e706c519fa13c51bdc |     
    arm      |         netperf-2.7.0          | NOK | http://autobuild.buildroot.net/results/547d9a803375cce93b8e3e7a59243190b71c7688 | ORPH
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/0570921d91f5c31f09f302eb8034b8dc195a91d3 |     


Gitlab CI results for 2020-09-05
================================


-- 
http://autobuild.buildroot.net
