From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 09 Sep 2020 07:07:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-08
Message-ID: <20200909070716.77DA886DF0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  4  |  0  | 28  |
  2020.05.x  | 28  |  6  |  0  | 34  |
  2020.08.x  | 14  |  6  |  0  | 20  |
    master   | 139 | 70  |  0  | 209 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.10.0 | 10
              host-libcap-2.42 | 9 
                 gnuplot-5.4.0 | 5 
  host-libxml-parser-perl-2.46 | 4 
host-meson-tools-0a02e2d344... | 4 
                       unknown | 4 
                   libcap-2.42 | 3 
         libcpprestsdk-2.10.16 | 3 
                 uclibc-1.0.35 | 3 
                qt5base-5.15.0 | 2 
                  uhd-3.15.0.0 | 2 
           wayland-utils-1.0.0 | 2 
                coreutils-8.32 | 1 
                 fwts-19.09.00 | 1 
 glslsandbox-player-2019.08.23 | 1 
              gnuradio-3.8.1.0 | 1 
                   guile-3.0.4 | 1 
              host-grpc-1.31.0 | 1 
                     kbd-2.3.0 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
            makedumpfile-1.6.7 | 1 
                   mp4v2-4.1.3 | 1 
                 musepack-r475 | 1 
                  ndisc6-1.0.4 | 1 
neardal-4143d130ed39299bfc5... | 1 
   openvmtools-10.3.5-10430147 | 1 
                re2-2020-08-01 | 1 
                rocksdb-6.10.1 | 1 
   sofia-sip-1.13.1-d10a3d268c | 1 
                wlroots-0.11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7c24eef7d1a2795a27ead9e7fc9fd35365e35619 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/066c1ffb74f40088d668893d32080547b0fa76c8 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/33438a0ca42e00e18924ef642cf0aefc5a442f0e |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/24215383d8cf6411c845f682c7ec7d150cdb386b |     
 powerpc64   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5030fbf5d679a389228cdd897032eec8b48d8609 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/a7cc5a9e915f8a11d67915be4692512b46ac51f6 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/57d26fb87b89e891c2ffe961a428f2a83d611883 |     
    i686     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7f8677aa2ba80c03367417a9dfc51afd4bf0d673 |     
  riscv64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/68ffb47fe20b13b3f6d7977d1d819bd3cf6eebaa |     
    mips     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/064a7971a356a2a78bec8fcdd404dd918d8e8498 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ed467354be97084cbc4ed93ff6a13ac48a555470 | ORPH
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/ce837cd44f689120e676173e32aa2c9473bdc191 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/6a99c0fef4546d9cb40456932bfe53b16cd8d113 |     
   x86_64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/7730e62a100954f705c1e1404b90516f51f01d8c |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/d221af1b5186eb36934023423cf6ce329495e2c7 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/a5643cf79e6a63fe71d269044c3ff115786bf580 |     
   nios2     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/a3047fbf84d8b97b4655f701e75b60204bd01aa7 |     
  riscv64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/1d6318d03f9ed30c0965cf58b2c3acb0b1f69a69 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/397637fb5dd18a89e4b28a5da55acf62e2d8fa86 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/8d662b4abb1752a144fe0ad47139059a4ece5071 | ORPH
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/51065494e6efc6510f9b970ecdb9fb60b1458136 |     
    i586     |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/e40a96fe17162b71038f9b759ea8a2f0a5eb7840 |     
    sh4      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/18711d8d5e66b655de02943bdac766c0427c59d4 |     
  riscv64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/973cc30e5ab79bc903368fc4b144af21efcd598d |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/7981246437864b7d67c0e16cb68223dcd1a5c552 |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/62460d239785e46676a741c95205010795304f02 |     
  mips64el   |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/656418e0c52f10f8935abc596e457593dc8acd22 |     
    i686     |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/bc53aa1137b6289899ad818132a16b64bf6112c8 |     
 aarch64_be  |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/e9a4b45d0167dd92f95905f52e5b38a68d68b15b |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/98ac5fa70a2c4539de6540fb59ac2e32fb26ee01 |     
   x86_64    |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/7436ccf989e8e09f72c9304124b479435073216d |     
    arm      |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/08c40f2d94ea8eb2498ea9c8728db27327996f4b |     
  powerpc    |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/633d5acb44df453a83f818aca20e606c7654929f |     
  mips64el   |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/2ed2e5ccefe9047c597f84d5880de2e8de2bdd94 |     
 aarch64_be  | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/0a079791d111c23ddeb250b15930f954bebc6c39 |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/8fb32facd03ccea63ffb22a9de81d28b98428665 |     
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/391daa964d5c446f7a2f70e44101c3644e123bb1 |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/d0937a1ffd59569fe95079156968700d617b23ef |     
    arm      |           kbd-2.3.0            | NOK | http://autobuild.buildroot.net/results/b74ecdda44543da1d47fa2c027fb046a3ca1e2d1 | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/57e4c3f98aa5cbb118edf03b1a83c94311fff01d |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/b1f7bd8f9f1740778b8be3cfe7203935cfd3abc4 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/f33b854b1a1b9dd35586a0a2158b78b920308cb4 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/6a7947dfd1093d76c3ce8b7735b4a0e3e5da62d8 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/c808f7777b884c1523af0c2f6d40d63aa6c9074e |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/97228cb6b8434da52f1534d3ebf9db192ea38788 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/7eaf6f91040c4309b7b5c23f8e43369b89b03708 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/32563cbaa195106475ffcb87a26ee15ff394ad5c |     
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/e480858d63285e9bf79a4a96dae802ef2ce605c2 |     
    arm      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/2f608cc372eab5ae66e93f9de89084e7ce7d96a2 | ORPH
    arm      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/9971da8c59484a6a26eb79d6e157461a47855dbf | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/67e64b6f9d33623d466830555007badd21960d6a | ORPH
    arm      | neardal-4143d130ed39299bfc5... | NOK | http://autobuild.buildroot.net/results/43ce6143912289f1a6701e2cf283d055ee4686bf |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4eb359080d6703dd54b92481045db612b56f00eb |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/aa2539cedd55eb95c57589aebbc852b8096a0ee5 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b33f1fe8bd30c8013a42eea230eb2245cd1eb725 |     
    arm      |         re2-2020-08-01         | NOK | http://autobuild.buildroot.net/results/6dba5feaaad34b9f074e78672f6d037aed5713c9 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f952d86dc286b0c4594b796605c21f028b74d0f8 |     
  powerpc    |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/22d0c63ebba87c50b164aebad30779d06fab282b |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/64db6fcb132896ef3552b52ea743d53d05133982 |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/6453da1471398e8c788e5b86abc4bf2e83e6c0b2 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/f4a432ae114dd93730fa0151494ec4ac6343cca1 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/faf739c4b5ae6bf97454fa30d1cfef753717ea42 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/24f364d1853d1ea3a02fae44559a210a4684e839 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/58314ba597f958e739e0863b46f5abc62b0df387 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3689505237acb81310b5cac8e3852e631909176c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/69c18cbdb0496729399adca1c5859391874cab43 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ae5a4c44785608428b2d525409d0f5042232af5a |     
  aarch64    |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/7541d3a631cbf7f9647f1c4ef8ce7d5dd949f8c0 |     
    mips     |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/6382eb984112dc347bedb93e04add7560d67176a |     
    arm      |         wlroots-0.11.0         | NOK | http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                 binutils-2.32 | 1 
              bitcoin-0.19.0.1 | 1 
                   mimic-1.1.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/c61346ae64f82955f89595ad6d9ce2c6f4519aaa |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/379d73cc47210bca09c33d954158b329328592d4 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/1878e4520cbbbf43cfa79f3c0d285d81facd9165 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/93ae0619bc8f7682f14bae6d5a83b7d1044653b8 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               apparmor-2.13.4 | 1 
              ejabberd-19.09.1 | 1 
              host-grpc-1.25.0 | 1 
               libupnpp-0.17.2 | 1 
              syslog-ng-3.26.1 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/1094fbed95800ce69927b3ff73ebf34ef8d9278d |     
  aarch64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/4e44944813590ed69e55994fbb679546c9d36965 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/91545c9844be866a18fcb84375ef713c31410499 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7ad07fc6888cc7362e63a5d1f06529e34d78e3ac |     
    m68k     |        syslog-ng-3.26.1        | NOK | http://autobuild.buildroot.net/results/6cfcddcfa8fb06057a9e84464c48f89eb747c133 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/37881f75971e1dc5e45dc54f535f329336d35d76 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                coreutils-8.32 | 1 
              host-grpc-1.30.2 | 1 
               libtheora-1.1.1 | 1 
              micropython-1.12 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6bc16ecf83328c7349527c0c8a3ed8ef2f00adb3 | ORPH
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/d8e37ed85434b9a97d0c7ada444fc644353c4e7f |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1b0f8c8214fb09676c0e4a3c37df1cc9e5eef8c2 | ORPH
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/de3a7b8da909c7a31745a09cb9c46aaa2db87b15 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2289a3875b4388a3507d3d528f89803ea029bafd | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/409de1c9cfeed2326b5ccfb8a2bbb187cf6ab9ca |     



-- 
http://autobuild.buildroot.net
