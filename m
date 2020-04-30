From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 06:27:11 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-29
Message-ID: <20200430062718.11AD4883C9@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 27  |  9  |  0  | 36  |
    master   | 217 | 131 |  1  | 349 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 24
     python-argon2-cffi-19.2.0 | 10
              exfatprogs-1.0.2 | 9 
                qt5base-5.14.2 | 7 
                    brltty-6.1 | 4 
                       unknown | 4 
               apcupsd-3.14.14 | 3 
                  assimp-5.0.1 | 3 
                   expat-2.2.9 | 3 
              gr-osmosdr-0.2.0 | 3 
              host-grpc-1.25.0 | 3 
              ibm-sw-tpm2-1563 | 3 
                 mesa3d-20.0.5 | 3 
                 openal-1.19.1 | 3 
               belle-sip-4.3.1 | 2 
               collectd-5.11.0 | 2 
                 exim-4.93.0.4 | 2 
              gnuradio-3.8.1.0 | 2 
                    mpv-0.29.1 | 2 
                  ndisc6-1.0.4 | 2 
   openvmtools-10.3.5-10430147 | 2 
                 rocksdb-6.6.4 | 2 
                      tio-1.32 | 2 
               acpica-20191018 | 1 
                  aespipe-2.4f | 1 
               apparmor-2.13.4 | 1 
                    atop-2.5.0 | 1 
                     avahi-0.8 | 1 
             berkeleydb-5.3.28 | 1 
              bitcoin-0.19.0.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                 granite-0.4.1 | 1 
                grantlee-5.1.0 | 1 
       gst1-plugins-bad-1.16.2 | 1 
         host-exfatprogs-1.0.2 | 1 
           host-nodejs-12.16.1 | 1 
                  ifplugd-0.28 | 1 
                  kexec-2.0.20 | 1 
             kismet-2016-07-R1 | 1 
                libcuefile-475 | 1 
              libsecret-0.20.1 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
make: *** wait: No child pr... | 1 
                   ncurses-6.1 | 1 
odhcp6c-d2e247d8d87ecf8c60f... | 1 
                openblas-0.3.9 | 1 
                   pcre2-10.34 | 1 
                 ripgrep-0.8.1 | 1 
                  rygel-0.38.3 | 1 
              spandsp-20180108 | 1 
           spidermonkey-60.5.2 | 1 
                  stella-6.1.1 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/ca1759f732f84a78fe09fa1ed40949270f082746 |     
   xtensa    |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/7ae282aedae819e447401422c230675807b554ba | ORPH
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5db3d6a2162e7f4bf170f7212f128caf23e277d9 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f997960acdc81b45e895695f3b409253e9cdd1e1 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8295f84152a4cab3bb427ca77cb421e9ea005ac8 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/350ffc6eed69aeb74ac49f761f55cfacf1b6ac89 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/70be6c8c5a8d43432143f6e35af46114146d11ff |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/62dc285967cfda9213f36b75c6c23a372bc73cb1 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4eb127129c2f193f9f74e50552774d255f65d5bb |     
   xtensa    |           atop-2.5.0           | NOK | http://autobuild.buildroot.net/results/4efe3448a19c5964bddd4335241594226956c6a3 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a7acf36b3fbc80f6ab0d4126777553154df72a2e | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/b72e487f1f070821378559ac2a5aed6472a87da5 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/06770c0b2bae046589fab1ed552e22af99c747e9 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/eb1c5e256d5b914948bd9cc2a84c4f923cbe043a | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a6e76c246e7b73a0e66bc430e406fc00a0e70963 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/9fa87b5adfc54e388b52b9ce402bebc7627f30b0 |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/ab64f9bc5e07d81036a41fc93ab52397513de511 |     
    mips     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/a4249f1d2c1b184bc60306cc5a9509579177d44a |     
  powerpc    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/ff4b493e0ddd51707b656489bbf5d320ba4fa448 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/5125e3d5328630604beb0ff38a83bbcbc1362556 |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/4f3d73ff421f7d6d012f9a45191551061cb26ced |     
microblazeel |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/55ff133e8772becc959db68a6dd932c4c15d1098 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8a02d6cbbf53122f9a252b435fb5e8e5eb4f0d8e |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/6f1e292f060d0cead11de8c3e2597f8c12be764f |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5cc857bc254df1ffb78f6707d71e29ac454c09c8 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/15c9f221608fe52cc6adca1480aeec87865a3ef7 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2977cd9760798c16eb1c22d7af534d3e658ecb27 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/e7bd44973160a241090eb24ea4d50746b7d5c0ad |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/581670be74dae2375f8f619f73e960ab17b63ac3 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1ca2748905f9ca3d08829e10e654f59587337ac3 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/acf47bb73ce447406683808c5e7836b9b5d33594 |     
 powerpc64   |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/5ed1c42b3d33198f32d1267e5cc2b1fa1211495a |     
  aarch64    |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/b304569948fd481ce33ecd052a1036153c5d459e |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/ef52dbbd62257bbed9d1feb7ebdf63df83debcb2 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/b1e4c3feafd20af3fd3ca5f9ad87889bc7d6e139 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/ee4ace2037ff00e6f447c83bd454490970174baf |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/7b1d05cb2a0bcf72b667a91483160b78144f2bae |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/399b67feeea2dded14780f54e82d92242d201e44 |     
   x86_64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/e380d21894aa21e347c689b041a77ae955649e13 |     
  riscv64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/8cad14c457085bb2477f82f22e1da4d6f23f7bc9 |     
   mipsel    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/afae4391f35fbcbccc002fa1734f96cdaebf5c5b |     
    arm      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/5bd2dfe6353a520159773baa519c645ed351f4be | ORPH
    arm      |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/4cf40c5bcc5408083baf9aa5363282a1c0790b29 |     
 powerpc64   |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/f648706c0ff4f9cf31ceb56f63310751887f3a5e |     
    arc      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/c8f7a7e33fb78488ecf6f4c0ca14654a1ad928ff |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/222b07e59f0078c8fbab7bce38c29bfeb7158f6b |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/13becdb860b0491ebf1b7aafc8d97364907be7ca |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1e3ec2681134664c097674856efb442c1178e8a |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/14c9f7453c508b40227187b6fd2195ac2e81d90c |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8f249bb62930ab32669b9cfc9eb4866e55512cb0 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fb7f7b60388ba8e5d5b4ad3b8e1d47f737b10f9c |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fe52b7b699d6bdfa1f0c9682dedf532e58efb649 |     
   xtensa    |          ifplugd-0.28          | NOK | http://autobuild.buildroot.net/results/a6aff9c7e692f473a1b11c957941f589b476930f |     
    i686     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/0896fb1ca3179db869a25655f46b2df344e0a802 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fd5919a9d2db4f627448c3e1b7cda0419396c1bf | ORPH
    arm      |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/8d3158e43815b227fe9b154282d512fd3e0fedba | ORPH
  riscv32    |        libsecret-0.20.1        | NOK | http://autobuild.buildroot.net/results/59f5cebc08cf81da594a4fe30197f082c5c02831 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a6f4d9a739d8211deba8cc30f4dce0ec087a2eaf | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/376f6f2b6c51abe9199842ed17b86587e8744cab |     
  powerpc    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/98b5e61891895697f179123dc61f465fd643747d |     
  mips64el   |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/fd05f36d5a4bed5b8490ca9980f7a684aebbe347 |     
  aarch64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/22deaddf9840b4bcfb64480afd7b9f7b839aa5d4 |     
   x86_64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/f5b669906d2d4cfc710dacf725421697830e368d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/72756287c1631d12940e7b314352e71035f8a221 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c841c5fa27e1f046ee2cc0cd41dd63a24f4d8d15 |     
   xtensa    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/79f64f804b0c455cd931f537e7a4a628dcd1b3bc | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8237ebee7229ff3cb89895bd54fce7c97c67e17f | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/dcb0b0fd53b177cb5985dd776d975e115c26ae22 | ORPH
    arm      | odhcp6c-d2e247d8d87ecf8c60f... | NOK | http://autobuild.buildroot.net/results/e53518faa156dfa15f378d4c2e15264027aae649 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/ae454b2b7ee1aaf9a4782d8e8c12b1435d317dea |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/ee95960ea4bc4b8c0dfc3f9cace2cee23f4b61f7 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/e793aba3923a6eb59c03e069abf2d074b1a27a42 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/ac009807b415a2c4ee96443e81267e755de9667b | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0776be0f08498df70efe20f3ae61c1d782dcc723 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3e69c54fad7431a0114aafbdae616d6f7fc008b4 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e67b974d80aec8ca41c69e9c7bc30c96165c1015 |     
    i686     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5f51c2f88fbedaa0c61843d28478b80fcedc8d58 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c6ed9fa681019aec1ba742b35fe17eff8724ae56 |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/70338e56f789721f64b955e20d619b8cec1d8dbc |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c3d4171c873ee17bbcb6ee0f4ecf25ea7a9cf9e9 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/ec1a51b5b40663f7050459ab160bb82fde6b97ab |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8adce9b64cf0443cf4d88e10a41de8856767f2fa |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d783ac3865f3f4e16fa13f8614c1bd3f07089f99 |     
    i686     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b92d8fad3afb865a79274f936e9c8b2d77c9ab2c |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0db25f9d91938388950125cd78223fdc323f73de |     
    m68k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8d2cd722ab6d53f35658190eae9ed50307e24234 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5d9498d2888f358a869f39d9c5a16a84925f5160 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e5cddd934f9f51973274292c49d8e0cfd1f2f019 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d89966d8d6398da4117cd24b4b35edf270241dfb |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4ce83f70d2a119214cba852dc0ea3f50969bab1b |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/af316e30faa0cbd64540cae4b06d336a1df2a4b4 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fe5e7c8bcf8151e76774b6f882ad01536026aded |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5adf4d9ad3fc5309218ecd03d46072284c005f30 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/09e956e94e21afa918c94f525ceace916a2b25c4 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e3f09821d88a10fe33e63ea516b2e7b7518307af |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/473469adb7e8c7515f13c90cff3d68b3d36f8465 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f52bac74cf46922ae0b306faaa5eb377b3a04c7a |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/87db2fd227bcd982266b470c0bff602dc1187252 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1d590959b87a91b182d66577361b3e102aae11df |     
   xtensa    |          pcre2-10.34           | NOK | http://autobuild.buildroot.net/results/4861865d56416946165704bcafb6eba8b902e0a7 | ORPH
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/361f48a200734c43a1000fa579028351e7f9f94e |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/596036f7507aced023c0a999488aa75c68a395d1 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/cd0459c09497dc9fe26b9810cb7b1cb7d4324fea |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/fe61e074a0d001df113d7f25a9bf1e2bbb81abd2 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ec6d0e01b2762db92f1e0880da74683799a87df3 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/11b9bf65355a58d26a3accbe3dbbf39ce4f93170 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/d6e8b5e9470f61fd05f00df04bcf386645621f90 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/03a0ecf152df27366b6092360919ef78fe1b58c1 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1578031be5307dbc1d6093059205719a5e354fe8 |     
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/af3e7d9eba93a62b8f2737824a1a9fce4334d4d9 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d0183129d6c69c3b1149a17ca9e13d29d00a2e48 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b70d7a097959a276d8c760e5d43cf7ea942e5a93 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a07107c72e90a6eef56254eba2ad4e0c1773fb1a |     
    i686     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/fc56f1a47e05e34f0b38f51c8a2c6d96270ad0c8 |     
   sparc     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/21dc5e542bc29a2f0eb6d863a0b19dfacf97439b |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1b6ab53fef6b64791fb4105e52ff1b579a9462ec |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2f185ed7a0edfc0e5394f7a2a27ca7ea148a92fa |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d281fc08e8bf8ee46036c1759e01c8693a2bfcbd |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/12612be6abfc09941b1cfff92ccbcfc190055470 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/09e026d6337467cd72015b211025073e68b6d17c |     
   sparc     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/f1265b3938e6b81f1d60e8bee0a358083e767be2 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/638243586f29da0445ffb015846ac988f6ea397f |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/3df98e3f68579a42da9950b9ff707ce7fe35052d |     
  mips64el   |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/d8fb7c642caf992433205c133247a0a7607a62e3 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/87af2496a513f7082bfbfe4a400798e0974d0547 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/17273cafcbfb9106c146b38256cfb108d8379c48 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/610f50f387daf21431225841b16cf85cadf12b1b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ebff70f5aae8b0fa95b83584d341ea63ac747937 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/43899efcba684303fea5c096f9c113c1e5cf3c3c |     
  riscv32    |            unknown             | TIM | http://autobuild.buildroot.net/results/5bfe313d3688c579db5d6723ccba64b83e02a283 |     
  mips64el   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/d36bb517039cfbf7c355543f56763cc3bf9b59df |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2707e48b3e475a27e79925cbdef3cf58e1c3b20a |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  ndisc6-1.0.4 | 2 
              gnuradio-3.8.0.0 | 1 
                 gnutls-3.6.13 | 1 
                    mpv-0.29.1 | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.5 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/d5565dc619fd948d903f4832f76bd56bc5994438 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/ef42b72a98b83c18359411f3f1a9d7681a108b78 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a7a86ca146f759958c18de9f9ffd096732b9364a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0aed061d2600c4af14855392478e4792aca3d549 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b2beac08a83d2ff4a644a0b05167dd1a66c4d940 | ORPH
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1fdb40410cb509415fb0fd6dac9420e9a4144122 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/bbb16b77460506ba852d037f5238c16ed495230e |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/440f5ef3547ce5822ce33d15bcd8ed44a7699716 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c3be422ec1acf8e77c587e744fe08b036dd864f0 |     



-- 
http://autobuild.buildroot.net
