From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 07:17:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-19
Message-ID: <20191120071730.7525486BE1@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  2  |  0  | 13  |
  2019.08.x  | 15  |  2  |  0  | 17  |
    master   | 109 | 43  |  0  | 152 |
     next    |  3  |  5  |  0  |  8  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 4 
              host-grpc-1.23.0 | 4 
                oprofile-1.3.0 | 3 
             gnuradio-3.7.13.5 | 2 
               libsigsegv-2.12 | 2 
                 acsccid-1.1.7 | 1 
                   dvblast-3.4 | 1 
       gdb-arc-2019.09-rc1-gdb | 1 
google-breakpad-7515ab13768... | 1 
                 haproxy-2.0.5 | 1 
               host-llvm-9.0.0 | 1 
            host-mfgtools-0.02 | 1 
                      icu-64-2 | 1 
                 jack1-0.125.0 | 1 
              jpeg-turbo-2.0.2 | 1 
                libselinux-2.9 | 1 
               libupnpp-0.17.2 | 1 
                 libv4l-1.18.0 | 1 
linux-serial-test-5d11b31d9... | 1 
        ltp-testsuite-20190930 | 1 
        matchbox-desktop-0.9.1 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                snort-2.9.14.1 | 1 
                 tcpdump-4.9.3 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/c7f25bb16203e4eecb8e5e4b468091c3914e4694 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7419e13ba5272d57513001d08f8def340c7a40f1 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/a8c2a8c63d9be09d5c8d4ef0288b92b77645b96b | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/e1df65d6faf25fec199a51ec791a4fdbb3cbd9c9 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7a2c703f790d509f5ecdf54693d66b54a214eaa5 | ORPH
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/5aa184bb0d3ef3fe803a788cfff8a52483299782 |     
    arc      |    gdb-arc-2019.09-rc1-gdb     | NOK | http://autobuild.buildroot.net/results/a082db3f3b74fc3a879e5bab2cc989a9f1fee829 | ORPH
    arm      |       gnuradio-3.7.13.5        | NOK | http://autobuild.buildroot.net/results/3a2dff3be2b36578ae5ab89e9620ec451b4a5831 |     
    arm      |       gnuradio-3.7.13.5        | NOK | http://autobuild.buildroot.net/results/a1d52a3bbbfa1e594c6623944693cfb06f2bccdb |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/af790f9019267b4b80f79adc3167272dc1f28cd3 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/ff6de821ddc3b2c4ec52f68576b29dbd08f87371 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/387bea03a1713e47b8595e6bfa7d1a564b6337f4 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/15986117c68af859e7d9e0e028912e7142e66f4e |     
powerpc64le  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/46cffdc17d3c2fbd8a7cb27bcb16fcc26e54b1da |     
 aarch64_be  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/41df86c5ba783e9bc55ececd3a62f87b09a68c16 |     
powerpc64le  |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/9af491bed12e8568022bce344625038827b977bb |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/614a79ba3117c6c5a2a713da1cd67003a6f69542 |     
   x86_64    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e9cabef51bf12d7ce974eb5dee810999711560f0 | ORPH
  aarch64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/d81d4347c1970ddfc8046dd5a34617d508ca2768 |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/7d51d98d12316f44f6611ca7da4e4799f4227dce |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5def75e40f1672281ddae23ad258cc8a44bd71b5 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/90103becfa32f3706f43a0c99a5b7a4aa829004d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/1b5048c803a7854e0250dd4f803e68986a16cac8 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/860bfc5858bbc9586d4d908c19ccdc54fe4f18d0 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/dd6411f4889235d4234ac3d866f6e703015b9067 |     
   sparc     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/978c3ea682691f2ff48d0a1a2b0fe466a14074e9 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/f1b4b129ec94795b2144b4501b4301fb20892e71 |     
  riscv32    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/c954088831ee7879a7c7cd151c1305067f3410b8 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/a5c87a03747dedd59ee33b816e898f40ca042209 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c9772db3cbc986dd52ee8f4d09ba6a391e536929 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/dd419d66044bd530fbc300f09c09c21989ba19cb |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/0694ec9b3e9929c05dfd51ba759b8e63f7c04dfa |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/c0cbb79c25175ab919c0b0da2c3be799a890cb82 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/877cc0f09e86e09b5ceb2f2008985e621b180066 | ORPH
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/5ec4127d7d0cca7c75f231b81e38c9ceb7166ad1 |     
   mipsel    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f4f41aac2ec505d092e46813502eb3f719375008 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/be9e734355209cfb7cbeb430c286930fd2d27f15 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b048c9ac0f201726931136e91109a68b196731dd |     
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1daf72696dbbf15b89a1e353145267cd53209c27 |     
    or1k     |         tcpdump-4.9.3          | NOK | http://autobuild.buildroot.net/results/ce57227cff045852ce9df7a8a6016aede482082b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/50dcc972c52ecaf5d4be50f6f30de0a34c23756a | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/cbf2e0a346aa53290b84f2483b5bebad5f1a3e7e |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/efcaf1ba11624d38e0307e10e5140cdfbb4e510a |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            qt5location-5.11.3 | 1 
              webkitgtk-2.24.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/cdf59764e5dd372d8c46f17adfeba417a09b84c9 |     
   mipsel    |        webkitgtk-2.24.4        | NOK | http://autobuild.buildroot.net/results/8a27674be8a097ebd2c91002c0bb42ac89309a9a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                snort-2.9.14.1 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/fda164bbb722b2d2863cd14f47827e5b694bd0be |     
    m68k     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/dcdf9b06918584b182d88ecd7284141a1a1c4c04 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.7 | 1 
                  flashrom-1.1 | 1 
                   mimic-1.1.0 | 1 
                    php-7.3.11 | 1 
               protobuf-3.10.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/e12e1b1cc6a55d2bbabb094ec1558ec198dba72d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c3ee999b88fbe3ea4fe06dab638d14fe1fb40693 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/994392a3452aef57b785edf865b389a624bf7528 |     
    sh4      |           php-7.3.11           | NOK | http://autobuild.buildroot.net/results/15f889c1054facdadefaf1650e97348133b4a3d9 |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/c1e18677be1e3df2ab00a904d4be4cea74ac65bb |     



-- 
http://autobuild.buildroot.net
