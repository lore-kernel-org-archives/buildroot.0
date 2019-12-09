From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 09 Dec 2019 07:17:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-08
Message-ID: <20191209071808.D7A9820521@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 27  |  3  |  0  | 30  |
  2019.08.x  | 15  |  4  |  0  | 19  |
    master   | 129 | 86  |  2  | 217 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 21
              alsa-utils-1.2.1 | 11
             lirc-tools-0.10.1 | 6 
                  apitrace-9.0 | 3 
     python-subprocess32-3.5.4 | 3 
                 samba4-4.11.2 | 3 
                snort-2.9.14.1 | 3 
                       unknown | 3 
       alsamixergui-0.9.0rc2-1 | 2 
                apr-util-1.6.1 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
               protobuf-3.10.1 | 2 
                        assimp | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                         glibc | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                  gmpc-11.8.16 | 1 
                gnuchess-6.2.5 | 1 
                haproxy-2.0.10 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
host-google-breakpad-7515ab... | 1 
              host-grpc-1.23.0 | 1 
          imagemagick-7.0.8-59 | 1 
            libsvg-cairo-0.1.6 | 1 
                ljsyscall-0.12 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                moarvm-2019.11 | 1 
          modem-manager-1.12.0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                  pango-1.44.6 | 1 
               qt5webkit-5.9.1 | 1 
                ramspeed-2.6.0 | 1 
                 tcpdump-4.9.3 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2019.10 | 1 
                 uclibc-1.0.32 | 1 
                    wampcc-1.6 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/80c8ded232973df3863c472d1a5c1a46b3f16df5 |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/097971db496d45ff29ea59e2334ce9815a416e7a |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/798a38bd97b973301b0380d05db5f91b3152c285 |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/fdac42c92d21dfe9a350e052a972ad34d00cf911 |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/8f209d7a426ec4fdeb452744ae2c0d6c35e6e942 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/525b8b53fed91f1c116de55ee0b82a312447740d |     
  powerpc    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/05447a3f9099af2c8c3f8c28d8529fd3088f82a4 |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f545cfe79fcd5441b0707c57dd5c856166b2db9e |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/da9c73cc5e00011b741da7c90bd0aa66cfa40571 |     
 powerpc64   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/833957021f9dd925a14b9d4d7dff13404d98ca9e |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/2c72f2fa30a856154a9e173f91bcfd31337f343f |     
   nios2     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/a6d931992bdba16b9e398addc4be1bc8f2fc688a | ORPH
 aarch64_be  |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/9baffe8711778c72df18dbd4c9b503b9313dd5be | ORPH
  aarch64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/1d8b30b274a608a01ea9da5e71e809747847fe52 |     
    i686     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4b6da04992f469470795231a9f268ea24edd1c76 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/fc69821cfbfa4a0544b7a56657d252867fa91eb2 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/740b4c46329d7995732d22ec08c8fb1add8ca668 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a6dbf19d61f551b67be0017b7a5370381431f316 |     
  mips64el   |             assimp             | TIM | http://autobuild.buildroot.net/results/ec008734e6d4f6bf48e6ec99c6fb61ddfa654aef |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/bdc09987f61c129342352689a29972daea2220fc |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/bb523a4004d4730eb8977cf52f3b64be4f7e0f7c |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/58a498fac83cbb55b252ab54cd8db04570bb5ec9 |     
   x86_64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/3a466cd137c02fa6557e2fc189fb3a593b8679bd | ORPH
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/0d86762c55ec8e181a9482bd197f470ec4a8fb4e | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/b68b25938651ab999d20e289607e895a7fde3a1a |     
  riscv32    | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/fac8fb6275eddb30cfb73c29a670f5f6856f70b8 |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/1898532a1814bbacc66e92e4377f1d512840620a |     
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1ebee769e6795949c697df35ffbf305bc9785aeb |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/878c67ed8a897093b2dda4517e0d2fcb6ea3355b |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/a602b97b41da7dde85fe239c1598298df48d991b |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/0a738c3f63bc06828e3f8d208b5829316ef0e3fd | ORPH
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6bdf7af685acfe65bc94c1af4edef2e6eb5d78ba |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0a7570811abffb6aca49dc5144b0a20738793f44 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c4ecc71fb26c18d0dba7f6afacdf7e91a877b476 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/996d4d7d337dda76ac040d90f03c56f3b7229eef |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a21a662b93dfb9997872563a812a84889e7c80dd |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/521652a08857e8d09051ce966b0a2876b7cf380c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/803de623794d4bea6d661eeeeec7b37560587f34 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/168e6f7f393605a274d13d135719d7b6cd37e93f |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/54f296fae36b276351849d0ef0fc732bba51075b |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5b01199fd606fb03e720f118293b4c316e6070c7 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c6d1e6fa4c2d364f42c24c618dc51788bd8f9bb5 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b9181532de80535970930c34b2af6edfade8c28c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9102c72872a56b9c4268370677341873c3cfb2eb |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e19b0068a0d5e40254ee6699a9bb8b661c2df091 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/630d8681c911bd88418978cb4dfe5cc6c2ef7918 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0e19fbb7b1cb5412e4bc49a9da3f4529cd61332a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/30b1e1adc80a0c5f0747ae5b6988de0c213e1449 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0bd9db1986cb4aab648edc27155a876401c2368c |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6f2fe9ebdc59807597b1559d2f0dfce55c92acb3 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bc821b7e1a191e1423b87503e938dfe644a73318 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/92032cd66509f47a7a4ce5ca8b9cb9f61400abfa |     
   xtensa    |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.net/results/23f2aa903fdf29900161301c4d01e18e2bb20a72 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/78b9e2436f934e5266f92d9ea0ad98b61924aba7 |     
microblazeel |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/3209d35b05957c86f16410d127d9ea942d970a85 |     
   sparc     |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/addd21fd3fb36a11c1f4391d7b392a19ec2d8483 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/9a85bd52cfa1565fe2635257731b35bf3f42ba6c |     
  riscv32    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/c5a4b6a5d71f6801e24f99d9497fd1226fcbdde8 |     
   nios2     |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/cff011e4afce1de52298c854249d90385774cf1a |     
  aarch64    |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/15d1014d178d2e79418b5056c015d9dfd9f90f65 |     
  mips64el   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/aac5ecee4b588d5da3355ab8fe8a2d0850408868 |     
  powerpc    |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/e2cda885181f0fbfd62341f4ccfe56fdeca83c92 |     
    arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/5b9f376c5de9d0137333300def6efa3c27dc397a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a1e2e450355f8797cbb974ba5189f20ca27c6745 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c6d7be25d961a239f4137a376b3de0c58432c12b |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/f16fda910da23dfe5f8ac1cb51f9dbcec444b516 | ORPH
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/bace10a9c2c99307e3803735f2480cb3547e7b53 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/9ff624e8008e245cbb28008982a015265cec128c |     
  sparc64    |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/8616169a6df58f60857bdfa7d6c356c1952d1709 |     
    arm      |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/df6c8f29465f73b43c02ba12fcae56a0cfca594a |     
   mipsel    |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/135dba77b08e423e32f4f713f9e6823dac0e9b2c |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e9846d7c627d8b799ab2345b1a7b9e26d77fbd9d |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/18e3bbf6576b9e2656c7575e5c9b7e3a7f83f4e9 | ORPH
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/120c5adfdc8325138f86da631cb447f5d0d6eb50 |     
   x86_64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/18fc701a66da1622af6d6c49579251d61a396e2c |     
    sh4      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/d1e7ccc101b62b64f05cf40ab0c416a95fdc18ec |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/9acb55546a7fcf469f25a6612b55d338edaf4f88 |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/24d4018cfaff97c6a20bcee052ee96195c3f7ee3 |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6f459f939c4da8708a611ee05e7306b97919ef3c |     
    or1k     |         tcpdump-4.9.3          | NOK | http://autobuild.buildroot.net/results/ef07b316b39eb54711b2c3027f2ad5675e169bf5 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d6d06707799341a3036c2cf2ef958bb612687c33 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/7ea81ce0712e27b92acf7ee440b82367703aaf89 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/2d7c4be6366a62390d5b07b5eaac1db6734c1a70 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5ec94884991bafbf67848e626317a4e381d4ce69 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/8a9a89be3b19f60585905af5600ba3df55d5c844 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/01122f859124c6f9db879c3c72419de126f65d94 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/1b946cdbd6716fafe9ba5b76c2e5a15c3d91d283 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/e859a284043e5e58ab3cb4843849478c6b1f82e9 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 
             host-grpc-v1.16.1 | 1 
         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/995cf843ff00cb3d70a24bc6505e8bd9b212bff4 | ORPH
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/f514bd38ff854f959dc6f74ccbf05e0705403f13 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/c816f353710179aaad49dca40155742c4f4c0bcf |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.18.0 | 1 
                qt5base-5.12.4 | 1 
                snort-2.9.14.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/7a157c691370f7353cda5d202af8ddc7cabeda8b |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/bb74c0fe26ffeec0173b51ad40c2b42b128e2733 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/842bb2259364ced8af40bdfa391cf8a0f21a0eac |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0555bf1b15b8743841f08ccfc51a77333ccc63a0 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | Repositories |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.3       |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.1.1      | 1.2.1.2      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r17   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.7.8        | 1.7.9        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.3      |     
                      arp-scan |  DISTRO  | https://release-monitoring.org/project/00110 | 1.9.6        | 1.9.7        |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.0.1       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.4.0        | 2.5.0        |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-11-1... | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.4       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.4       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.3.0-beta   | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.15.6       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.33.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0.1     |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 1.4.0        | 2.0.0        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.71.0       | 1.72.0.beta1 |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.12.1       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.4          | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/10937 | 0.3.3        | 0.4.0        |     
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.40.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.40.0       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.5        | 3.7.6        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.16.0       |     
                      collectd |  DISTRO  | https://release-monitoring.org/project/17702 | 5.9.2        | 5.10.0       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                          cpio |  DISTRO  | https://release-monitoring.org/project/00353 | 2.12         | 2.13         |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.2        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.25.11      | 1.25.13      |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.5.1        | 0.5.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.14       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.2        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20190808 | 1.3-20191110 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.5      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.25.1-rc1   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.2        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.5      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.7.2      | 2.3.9        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.7.2      | 0.5.9        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                       duktape |  DISTRO  | https://release-monitoring.org/project/21345 | 2.4.0        | 2.5.0        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09.1      |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.178        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.26         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.8       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.92.3       | 4.93         |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.3          |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.1.1        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.1.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 19.12.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.34.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.3.5        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.2       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.17       | 2.2.19       | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.5     | 3.8.0.0      |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.26.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.1       | 1.16.2       | ORPH
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.2       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.2       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.2       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.2       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.1       | 1.16.2       |     
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.1       | 1.16.2       |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.1       | 1.16.2       |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.1       | 1.16.2       |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.1       | 1.16.2       |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.1       | 1.16.2       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.1       | 1.16.2       |     
                 gst1-validate |  DISTRO  | https://release-monitoring.org/project/21856 | 1.16.1       | 1.16.2       |     
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.1       | 1.16.2       |     
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/21857 | 1.16.1       | 1.16.2       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.10       | 2.1.0        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.4        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.11      | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.330        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.29.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 66-preview   | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-8      | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.0        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.3.4       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.3.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 19.4.pre2    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.5        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.2          |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.14       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.6        |     
                         jhead |  DISTRO  | https://release-monitoring.org/project/10546 | 3.03         | 3.04         | ORPH
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.79         |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.2          | 1.3          |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.7.0        | 3.7.3        |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.1        | 1.9.2        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.19       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.65         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.65         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.65         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.65         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.65         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.5-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.5-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.8.4-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.5.1-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.9.4-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.5-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.8.0        | 3.9.0        |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                     libargon2 |  DISTRO  | https://release-monitoring.org/project/15244 | 20171227     | 20190702     |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.28         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
              libcdio-paranoia |  DISTRO  | https://release-monitoring.org/project/21751 | 10.2+2.0.0   | 10.2+2.0.1   |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/07879 | 1.3.9        | 1.3.10       |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191025-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.8.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.3       | 2.63.2       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.3       | 1.14.901     |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/21364 | 2.16         | 2.17         |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.4        | 1.1.5        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.0.0        | 2.1.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.47.1       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.3       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/01729 | 0.9.0        | 0.9.2        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.15.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.10.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.10.1       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.33.1       | 1.34.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
            libva-intel-driver |  DISTRO  | https://release-monitoring.org/project/01753 | 2.3.0        | 2.4.0        |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.5.0        | 2.6.0.pre1   |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.8.4        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.9.1        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0-r4       | 1.0-r5       |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2019.12.07   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.5.0       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 166          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.5.20       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 19.2.7       | 19.3.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 19.2.7       | 19.3.0       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.52.0       | 0.52.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.0        | 2.9.1        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.2        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.30.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.12.2       | 1.13.0       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.5          | 4.6          | ORPH
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.35         | 0.36         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191207 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.23.0-dev   | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.2        | 0.9.3        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.17.5       | 1.17.6       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.13.0      | 13.3.0       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.3       |     
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.0       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2        | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.1       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.18       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.31       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.2          | 3.3          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.33        | 10.34        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.6       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.25         | 8.27         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.004004     | 1.006000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.3.12       | 7.4.0        |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.83.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc2     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.2.0        | 6.2.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.10.1       | 3.11.1       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.1.0        | 5.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
               python-aioredis |  DISTRO  | https://release-monitoring.org/project/21938 | 1.3.0        | 1.3.1        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.4       |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.10.1      | 19.11.1      |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2019.11.28   |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.13.2       |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.11.1      |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.7          | 2.8          |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.13      | 0.29.14      |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.0        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.14.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.11.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.10.1       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 20.0.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.1        | 4.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc1     |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.0.2        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.43.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.0rc1    |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.6.0        | 2.7.0        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.1        | 1.7.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.2        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.10.1       | 3.11.1       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.6.4        | 5.6.7        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.5.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.0       | 0.18.1       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.0.0       | 19.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.5        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.3       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.2       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 5.1.2        | 5.2b1        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.1.0       | 18.1.1       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2019.11      |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.8.1        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.13.5       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 42.0.2       |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.16.0       | 3.17.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 1.9.5        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.11       |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.37.0       | 4.40.1       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.7       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.0       | 0.14.1       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.26         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.6        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.2        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.24.0       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 4.7.1        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.0        | 3.9.0        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 42.0.2       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1.1      | 4.2.0-rc4    | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.1.0        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.2       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.2       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.2        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.39.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.39.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.3       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.0        | 3.1.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.1          |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.14.1     | 2.9.15       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.31-9727... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/20628 | 0.8.3        | 0.8.4        |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 4.9          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.6.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.3          | 5.4          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.10.12      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.28       | 1.8.29       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1-beta.1 |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.04      | 2019.11      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.0.3        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 0.7.8        | 0.7.9        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.2.0       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0a         |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.3.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.1          |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.1.2        | 0.2.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.2-rc0    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                       twolame |  DISTRO  | https://release-monitoring.org/project/12524 | 0.3.13       | 0.4.0        | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.8.4        | ORPH
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                usb_modeswitch |  DISTRO  | https://release-monitoring.org/project/05059 | 2.5.2        | 2.6.0        | ORPH
           usb_modeswitch_data |  DISTRO  | https://release-monitoring.org/project/05060 | 20170806     | 20191128     | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.2.0_lib... | 2.3.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.2       | 0.12.3       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.47.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.1.2412     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.19       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.2       | 2.27.3       |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.91       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.3        | 4.21         |     
                     wireguard |  DISTRO  | https://release-monitoring.org/project/13481 | 0.0.20191012 | 0.0.20191206 |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.5        | 3.2.0rc1     | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.2       | 2.27.3       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191208-... |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.2          | 3.2.1        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
        xdriver_xf86-video-sis |  DISTRO  | https://release-monitoring.org/project/05237 | 0.11.0       | 0.12.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.3.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.5          | 3.7          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 351          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
