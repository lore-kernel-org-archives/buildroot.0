From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 07:07:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-21
Message-ID: <20200922070758.AF0C085B78@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  | 11  |  0  | 30  |
  2020.05.x  | 24  | 12  |  0  | 36  |
  2020.08.x  | 17  | 12  |  0  | 29  |
    master   | 150 | 104 |  0  | 254 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 17
              asterisk-16.10.0 | 7 
 Makefile:752: target-finalize | 7 
               target-finalize | 7 
               apparmor-2.13.4 | 6 
                       unknown | 6 
                   libcap-2.43 | 3 
                  zeromq-4.3.3 | 3 
                  autofs-5.1.6 | 2 
               capnproto-0.8.0 | 2 
          gstreamer1-mm-1.10.0 | 2 
              host-guile-3.0.4 | 2 
             kismet-2016-07-R1 | 2 
         libcpprestsdk-2.10.16 | 2 
                   libnl-3.5.0 | 2 
                minidlna-1.2.1 | 2 
                rocksdb-6.10.1 | 2 
                 uclibc-1.0.35 | 2 
              alsa-lib-1.2.3.2 | 1 
               apcupsd-3.14.14 | 1 
               audiofile-0.3.6 | 1 
                  boost-1.74.0 | 1 
                coreutils-8.32 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                    flex-2.6.4 | 1 
                       frr-7.4 | 1 
                 fwts-19.09.00 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                   guile-3.0.4 | 1 
                host-gdb-8.3.1 | 1 
                host-go-1.15.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libxml2-2.9.10 | 1 
            live555-2020.06.25 | 1 
               log4cplus-2.0.5 | 1 
              memcached-1.5.19 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
             openswan-2.6.51.5 | 1 
                qt5base-5.15.1 | 1 
                  quagga-1.2.4 | 1 
                samba4-4.11.13 | 1 
                 systemd-246.5 | 1 
                  uhd-3.15.0.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/ed253c685cd723f23cd4eeec4d0311edc02b1c86 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/23768155dc9429425e1e8eacee2b1a83d624e8eb |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/226ec01b6032f72ade596ea91af9684d76742a88 |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/e43422f9ecae283a045b40ead9d63a813f93413d |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/cf3aa2c5a20e53388ec5ee854dd8d1bd03574c22 |     
 powerpc64   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/c107550259362ae8a2097f44630d3637bd6b1a18 |     
   mipsel    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/c677b246b8c1f193c2f1a34a67cdcc7deb3f6bd5 |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ccd5d855fe8a7e84fa321921af038c1112a1be3a |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/dc65c0407634520a20c72bba41f4d1f53c7f8ea3 |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/eab2fc9a70329c89b14ebc32c89a48acd6b9cfdc |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/81e73c83cef1b2777d701511f29ebe9d8ba0223e |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/0ae351a4827fc00e3eacb700cfe385e398f4c2cd |     
 powerpc64   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/09f3f8c2f5990a315f453804e13fbbdcd27ca1cd |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/d8960bdd88f944d3e1cb825f29879368653f7c75 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/24a7fa420bd81b8b7e0e8b6a21f2aa4448c5f867 |     
    arm      |        audiofile-0.3.6         | NOK | http://autobuild.buildroot.net/results/a6cff90cbcfc073e64c9257b44e19449aa4bdabf | ORPH
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/ddb5fef75474e217582beb3c5f516f5bf6295857 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/874b478c3d26de6740bb70fbe16f505b213473a2 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/73c03eab8011046e348d08726568e82fe2f6a8d9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4224bb56e77d77d186be36c4c7c5543bc318274b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6f1cf8c66c8fa547fdb3bcb4f57df3740fe3663d |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/223171ced6426098da559f4043b9041622562922 | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/0a2dd7ffd23d6c0232c069cfb3d882e925065a98 |     
    arm      |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/4f587665a5c8f41391a280aace6d5c6c9b29dc72 | ORPH
    arc      |            frr-7.4             | NOK | http://autobuild.buildroot.net/results/f0df10d66eed9569105e195c1c07679c5eef1bdf |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/75d02412d4fbdf466e55477ef4fd0f24468c58a4 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/42a733d60ec4aab0bbbbe200b743e2978fcff7cf | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b812f15f86a1d0d2a5e3ffe07eba7b1ead01df95 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dd133780e91ae6ce9226faf3dba96503b9c4331b |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/97b8053ee99fb66e1f9ae2d26001f82a731fc7c0 | ORPH
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/5f629ac3ca43a58b483c2fb56b452ce6e5651142 | ORPH
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/9e6e225101124040d75372a25c691f2c800dc1ec |     
 powerpc64   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/4aba96bf9a98c3d2c5b215fe800be4b90b577680 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/76c7f8f1903ccc4ae54dbf3175c8014886395b8f | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef745ff91579f614eb7e3c87a8d3729b117c4e9f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/df67c73e997c57abc44752c3d394f13afb8dc44f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8264543f1a11bbed03baa8e1056ec3042c8258f4 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7239eb67ce275eb83db28076d50e931abff48c75 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fb77d1c0d213ac824c75685a1429ca12503c1e7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d3e4edb2f87cb8a140db82c6e7186af92cc08033 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/deea3840f705261f5fe047f34d0302a0234d4b52 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8f464caae9a30b6d2197acbbec2812f2fa33825 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/26f2bc499d8276aeaa14bc254afe0082d32bae6a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/acbee39e72eaea9effb8ba7650d5a38b096df041 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/47cbc76deb4df3bc6ea644c0f62fc4dc36740edc |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c13eb6bbfb6a5048001b2b42285ab8ee5d084149 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1a2a2ff1b9e2549cf9872ec80e6b49143ba8535 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/801e9800336c6e3cb4f3c5812468d631a1788e25 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/691ffab78a3fd5921f462ec1dc6364e7a2e3df6a |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fc109070b9e93461453fa4cfb9909d46eb1c27c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/90a1f89d84665d402fdd3d64c47aaab19ae3612e |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/834c8f85b2b860936d1a9806e2dad2e2dc89fdbf | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6b97f4a3fde9345e5f6fea80f70060e2e61d4394 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/8692025554f64e2e97f2904df81e8fe00d94aaff |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/da77fb9a80c53f0e922e9ea6601515f1de0118c0 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/624968d520d3ec54afacd92e55881d069a59c4cb |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f740f0c4e0ab1c0abc5bc00219f6e1fcb41753c5 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/1c5603dfa7272362ffb1245dffbcc7a66f854859 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/693384dd4026905d38a9919339e83dee03bdb45b |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/007b1710ae72f38657e5117078217d758600ecf2 | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/b49de995741c6a27a54bcab06c14d84c814c4980 | ORPH
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/bf398c7ec6448e382c35f8608ad157738100dff9 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/be633e0d2cd0e47269887c62787fba85e3024f43 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/e43bfb37b7530d1a27f0e70f24023301549c0ed0 |     
    i586     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/b87a0b8f5c31f686c229c59bb72fbacd655d7a9b |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/6f17cdf6336070a2d5655ae4432e48772c8084cb |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/f428fded8bfeab134efd6d5e4de2112b797c74ae |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/a2c6737b55d11a0131ca309e698cc2f8b4f288b3 |     
    arc      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/1750a0755a9992ce4d61be6388e6cc9803b9bae9 |     
    sh4      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/1b207b2f291786fb3150baf3d5ec4cdab7469f60 |     
   x86_64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/a45d1e846971a862be33baf5009debcad89f80ea |     
    arc      |        memcached-1.5.19        | NOK | http://autobuild.buildroot.net/results/f777cbbf002e4d3d7ed190c9ef8d785e83254e5c | ORPH
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/fcfb07763053bce51a5b0dea4791b7eabed22f00 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/7d9c6f5a8469617db88ac620cb1986526c3866d1 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a4134166d413e3903325cfa0a156b3fe8e412586 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/e73ddff64ca59057f75cc7f9225cf92dadf15624 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4cac279313fe77d16c51d4dec7b2a0b31937e88e | ORPH
    arm      |       openswan-2.6.51.5        | NOK | http://autobuild.buildroot.net/results/6505018194167e06e0a926c1a22a34e69c027185 | ORPH
   x86_64    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/00c06dec8dbda65130c3bb2a88166a94a7116e8c |     
    arm      |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/82b15cff3f7b943eb93d8270790f1b8561d31d6a | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/0f6f773e019adcc4d8310263c057933c31195baa |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/72663c445c56eb88caf8e114e40fa858d33ee399 |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/a0c12afbb9b9783ccbe02d212034eaf724ac970b |     
   nios2     |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/ca34a1c06733495ab8cbe208d85bf3c21f9413f2 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7ab8b2800a5b44161edbb4f01c779b0833683b1b |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/f332cba7618c0584c7e147ac79a7891412a85f48 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/0a994c2bcdfd4c3a4347c3944a178e184f128fbd |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2b37f24855673663613d07a2ad08837aab7b5538 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/68488e3d9de2844daaa7fe69fb211a3f589f1270 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/860012fdfef8c8c13fe52d31dd2e66a6e6c7c062 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/45e7275dde990bed4f21cc03bad672729ebf48f6 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/6545a94cd7cc982305993e94ec447f14eb1b6931 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/83efa59208cfe37a685c8fe811f5ec47c9766d38 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4f82023651d0b76a4336fadf9c5b948f40f43c33 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d74ee2d5b94b2994366f8e05223f71ef532c55d3 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a1dc0c46822fc2d00aa22d287eb57b6e35ab7444 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/85f3c191de65a8b1c6eb50fb5fd4db5005a6a3c5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/00ae08f1bb51042a1410733c0b40986f37aae57a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9b6fd8edd3176f2801f8395c2931e225415fef9c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2551a648fdfa7a2e51d8a240b7d302ed88bb9e55 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/eafe0cf90a440dc911a91e904fdcb5e438473232 | ORPH
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/702f4cb47c5b9f158f40a2c85a557b3a5287c437 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/516a35f4534926713575561cc2427df0d1f45199 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f5a33e311c61a213e4f75a9245be57b374d4fb27 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
 Makefile:753: target-finalize | 2 
                 rocksdb-6.6.4 | 2 
          gstreamer1-mm-1.10.0 | 1 
         libcpprestsdk-2.10.14 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1133bd27bbc03ccae7a5f3434554ea17adc0076b |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/771e8172296e2179ffd1f5f2695966d0424a25d0 |     
    i586     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/6e25527210d15d1fcac9a8f1e58758484cc50226 |     
   x86_64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/268955367d75f94a66d4e6906b39ec99a944ac42 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/089a97199e6157f765666967040738dee291b82a |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/77d7e5a0fda814715a04aeeac48f018cf2a9ca37 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ce9f43514a495dd78f356840ed787b029fdc314f | ORPH
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a15ccda469625cb8751466116f07d4525d2109ce |     
    sh4      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c9689b4cb3ccc2f1fcedc1a9e9648199757df73d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/38424ef5c54006ac9bbfb134e0e94a54e76e43e1 |     
   x86_64    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/20c252688d06e4e400fa6239dd6308175949cf7a |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 6 
         libcpprestsdk-2.10.15 | 2 
                  zeromq-4.3.3 | 2 
                openblas-0.3.9 | 1 
                supertux-0.6.0 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/cc0908e20c3cc0093f9cfbfb6ffb8c998371bb2d |     
    sh4      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/8d6a095cd97c8799e18d57cee996852bfe8dfba0 |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c4f925e0fbe55e2bb1feea5d94038224438c4d5e |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/657633f5007b75ca3a32d7cfb9c04836a7ffdd9a |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d9d9bcf47fb0c711e04f21b6b5e899c47341dd4a |     
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/cb7ffc2873a921a620e98177f9c9108b8028794a |     
    i586     |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/0df7512ca262ca188e29ef6a69889903ee5765d6 |     
  aarch64    |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/fa627f50994122cb02e8de5249fe67efe693cdd3 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/2c607467da62bc7d4348091a1ca511934da22cbd | ORPH
   x86_64    |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/fb46de6e2da7039cf068bc36b0d3b5b9b6d6ce9c |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/57bf6c97a0faf68b01ee8f29400cdc37918dee2a |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6fa2eee38ee99d1f069fce61ab2e0d55d3a7263f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
                      tio-1.32 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
            ghostscript-9.53.0 | 1 
              host-grpc-1.30.2 | 1 
         libcpprestsdk-2.10.16 | 1 
               log4cplus-2.0.5 | 1 
 Makefile:752: target-finalize | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/35d81020f6783d7d04232154865e51ab69ab055b |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/5d33ea06c12ba7ba77c58be824c385af3ead6d67 |     
  mips64el   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/6c6a2a606c84663e3152a0b53ea44e060cd61c49 |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/35540037820498fd90122a7c254a622c26a9fa0d |     
  riscv32    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/909513f61aa4768e4515bcc7c32811788d6f5ba2 |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/11edd05c59797fa45d3906a2b2369955ffe8d63f |     
  riscv32    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/56afa1dda3737e6249c95e32c1740b4df27aca49 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/07186f3187f96a0bdc999cc37e8c0aa22916c8ec |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/d16e9c2f44f6f52216901d992315467d64ccc683 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b5b1ecd4cf9b9929371fd2d70acea4a02b3ba778 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b47e98600eac0858a951d9674e7b2eb9f2b16d96 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b5cdfd14e0b676250821bf5a9f24a5045625dac2 |     



-- 
http://autobuild.buildroot.net
