From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 07:16:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-25
Message-ID: <20191126071654.BE8BD2002C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  1  |  0  | 15  |
  2019.08.x  | 15  |  1  |  0  | 16  |
    master   | 111 | 33  |  0  | 144 |
     next    |  6  |  8  |  0  | 14  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 6 
              host-grpc-1.23.0 | 3 
                qt5base-5.12.5 | 3 
                 haproxy-2.0.5 | 2 
                libdrm-2.4.100 | 2 
                libselinux-2.9 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
                snort-2.9.14.1 | 2 
                  cmocka-1.1.5 | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-llvm-9.0.0 | 1 
            host-mfgtools-0.02 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                     squid-4.8 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/5536a136cce748798e7d5e83f77eb5a0508b2e4e | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/73341ebecc3bb3b8929359a647a04dc4861a4633 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3160520c61bc32adc037c9ac4c9015313c8099cf | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/b353097c9c64c3221061350b04a90b8810e4579d | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/4fe16374e219db6e78973b755df0ed55f4029f59 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/d234fd203f33795780249cf8e72360fa790a9f5b | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/9ec9f500f5173d1e7b21302ffc15d612b8db26ff |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8113ede866224c3d749b29d9f68b93726c4154be |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/ae336ab5218eb729f66960bee649dcd69cf961f5 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/d9cd3e9e35efe90ebf74efd1fc3bf5327b4650ee |     
   nios2     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fe5423c35a36965cb591590d01f97a6aa771ef56 |     
    i686     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/43ee72ecce911982dfad3ef22845895b2e3554d5 |     
   nios2     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1eb7dc4b31caff89950b94498d30746e606e77dd |     
 powerpc64   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/2d908725263226eb9a249de89993aae78dd0ef63 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/0a245b35d890f9da44720aa224d0f45c1fc549ef |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/37dd068a9fca1fd1e77ce02a92b8bb6defd7f663 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/895d08ab216f38701d8e27bd87e5297e393dd9d6 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/25c58741aa827a43f8c6a7327ef07030553c521b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a4e973afe251c73db5aa21a829eaa35a89e1fb3d |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/e325ecd2167c291018e9fa044b0d80d14726355a | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/39125cf149e8ef0dc4b6b699fa16a80c4866fc5e |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/d575aeb47dce29d7ee7c4cc57445c1517f6f9856 |     
    mips     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/be027d7ce1a842a6f5c69d9ad9dba7fc009d2c61 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/b699c21fa6420fa3ef7e845d03c119dce9264f3b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a1d43c55cd6e3885da89559eb36e77a15aaec2fb |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/619f98db5f66229decae676818e5ea40498492b4 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/696a535dab7f1d145cfe9b1c8ecdd715932971d1 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/ebb929ec6ab9147e975b30ec67a19847683806d6 |     
    sh4      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/b62474484309018efe1744f3e1b6781a2258d88c |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/979fd30993bb7ac8f21b40c718b0e9f6d53078c3 |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/1c983b6821b3253d6c27ba447d44f7e020b94dbe | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8f2f8805fd3ce1073ae99ebc30547c01c317f717 | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f86f56a53a37f348c05ce1b0a09a3568fa9226f |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/73ef6cfd94d53683f0aa4a0ba0d651b5bab06a48 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/00242049ad61c72ba903a42b0b8080231a5db80b |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 3 
                    libffi-3.3 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 libidn2-2.3.0 | 1 
                libselinux-2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/b97038acbf279c91ce7eddc91c7b89470d76b9b9 | ORPH
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/c51e4a065fa3a3fbcc0f4b4997341c0ed55e4fae |     
    i686     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/b5bf69e9b86ebe959d5faaa9e85ec10bbc2bff8d |     
  aarch64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/55d6e60687f462ecae4a7e75d05db2b97b1a8963 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/62f3e976bc1d0594ebed27c7fcde257416be1bde |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d1c4ccf8f902b09dcb8b6b6b0a8857c56322da48 |     
    sh4      |         libidn2-2.3.0          | NOK | http://autobuild.buildroot.net/results/85589b6378020376f03ed0f89d579d52df5afa32 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aa1b40cb9a31a17ab351138d9313286e05642714 |     





-- 
http://autobuild.buildroot.net
