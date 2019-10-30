From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Oct 2019 07:17:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-29
Message-ID: <20191030071753.10E5F85AD6@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.08.x  | 21  |  1  |  0  | 22  |
    master   | 145 | 58  |  0  | 203 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libdrm-2.4.100 | 5 
am33x-cm3-11107db2f1e9e58ee... | 3 
                    glog-0.4.0 | 3 
              libgeotiff-1.5.1 | 3 
                   libnss-3.47 | 3 
                 ripgrep-0.8.1 | 3 
uclibc-ng-test-c6d62cbc6050... | 3 
                  cmocka-1.1.5 | 2 
domoticz-0f411f781ae4fb4a82... | 2 
      glibc-arc-2019.09-eng002 | 2 
              host-grpc-1.23.0 | 2 
              jpeg-turbo-2.0.2 | 2 
                libselinux-2.9 | 2 
                    mpv-0.29.1 | 2 
                 rng-tools-6.7 | 2 
                collectd-5.9.2 | 1 
                   duma-2.5.15 | 1 
                  gmpc-11.8.16 | 1 
       gst1-plugins-bad-1.16.1 | 1 
                     gzip-1.10 | 1 
host-google-breakpad-7515ab... | 1 
          imagemagick-7.0.8-59 | 1 
                  leveldb-1.22 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.1 | 1 
        ltp-testsuite-20190930 | 1 
                   mimic-1.1.0 | 1 
          python-web2py-2.17.2 | 1 
                qt5base-5.12.5 | 1 
             safeclib-03032018 | 1 
              sigrok-cli-0.7.0 | 1 
toolchain-external-codesour... | 1 
         uvw-2.2.0_libuv-v1.33 | 1 
                  xvisor-0.2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7dc0c580851b02377e9b845c253867492e15eb14 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3a3a21f3c35ea025e9b93e09c2454aed0ad31034 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/84b5d9c79ef5f3499a296bd0ce0974f3ff620492 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/227c01dde06c2bf5f42b9fc0937882d520cb5167 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4b10d49112028736c6df0429df77433142d5642d |     
    mips     |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/0d486edaf4c51b6438adeec61fe2c55099862acb |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/0b830bdd58c3fc4a99de9eaab1057c29f7ee17e4 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/f9088408eac074751c8e2aa027c80ff584dba902 |     
powerpc64le  |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/47e3e65bbf569f9dfca98bbbed4f5deb450179f0 | ORPH
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/7d3655aa129cd8088a90cbac498b24be2db42148 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/b841e1c48acb04d7ad50c0000c7cb72f8c7d0082 |     
    arm      |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/c71e92ce46c50cc5bf7f837c3b86e61d410a3a26 |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/872071c5748e314138760d568def3897ec5bd095 |     
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4 | ORPH
    arm      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/40989a7270ee155dd9a2a0bd019775d2d64b2fe5 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/695c8ab3280c7162a57555cae8fbac1065543f6d | ORPH
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/acd558ce27c04e42f7a58c6210e163b2fa4fef4f |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/274da410dbf97657314bca7a06abcd4f571c879f |     
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/7d9e97e07463c12ea1d3b30b6c918bb29f06a611 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/db50a2dc8258151b28e4a158e979e8ee44b83980 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/848a8354a2f786cbc1f8405587b02a808942bf14 |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/51459f3f26aa2e2a038ee717548266aaec05bafc |     
   sparc     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/257a820bb87a874ce0e2152d2752845be972fabe |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6deb341999e3347bb3e01da689f0c168b2447185 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/a87463e1e0595dcbf19ff68b29d2d8fedfca1f1c |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/aa828cab6e26b077f9ef468254a0df1e4bb51507 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/3f0d0eb35125f3f91bf67b5b7499fa96cc3ccc1c |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/8115ee50d07a9e9788a1047841d7cce414b2f286 |     
 aarch64_be  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/744f81c292950b0353ce0282f314e33aa6a580cf |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/e458d064a9735610dfb51afc934e6dbdd0833ee2 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/4cb1ce2de71a2301985348d454f1759b84c6a986 |     
    sh4      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/3c1a75a08e30e5826db7da682b85805779241b4f |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/76def755fcb3aa5deb8d6c9132e232f1a98443b5 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/54ccc1edf2469ab085c453268344239ff4e2a80d |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/6e7783f3d6ba502c0458059d0bf39a36b7d221da |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5aa84830766426486ff353e9e68236f9106729d1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/28edf8539ee85758a18aa4386678336368f2cf1b |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/b318e7239591610e9845b497e84cc4753076ee9e |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/1275e3fce4a7b28f662c2a6768d56cc7e05b03d0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/62b9713213b5a97944aa2490a02bd2d8200e58ce |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6ec531185f81e83b0daacab850378245b9a08edb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d33489dd636a4e9162b27afe751f9abea53ea620 |     
  riscv32    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/ebb590225262b934cacb66cf5d5d9c91bada45c3 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/fc7326318fd796c9d1ca784efb57d9ff7bb53d6a |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d07e80aa1b282ee3b88ffce32dd867650e18b71f |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c9bfdd7cf6c14d40bbe3a28ac38cf21907a98404 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d8aef6c94172bb4d82544300f84eccd598555c58 |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/bbe9083da0ac406ad32fc1bea3993f6a5d49317c |     
    m68k     |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/5c0b22550097e4a142c4dfe28b54a17919b02316 |     
    arm      |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/59b8cb335a0a88af0fd033eb0519ce5931fbda32 |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/6c7cb790a5aa8949970e9e199137cbca9c955b89 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/eb3b96327043b5c81eaf4af1c7c485fa3c3e3a71 | ORPH
  riscv32    | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db |     
  riscv32    | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/bf19fe927b984b45c4c99b2899526fbc1eaa8607 |     
    arm      | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/b62c7c3785cdf902c46b0b722c7d503da39f1243 |     
   nios2     |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/5d09dbc1d5ca8c3f43c767ae6094753a13d8e219 |     
   x86_64    |          xvisor-0.2.9          | NOK | http://autobuild.buildroot.net/results/21d82ca5ca62d25be214a482017f4a671f7cc3d7 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7754f1a2dab6830e67dfbe944616294ec03104c0 |     



-- 
http://autobuild.buildroot.net
