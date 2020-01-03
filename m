From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jan 2020 07:18:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-02
Message-ID: <20200103071819.0FD392000D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  2  |  0  | 17  |
  2019.11.x  | 21  |  2  |  0  | 23  |
    master   | 102 | 46  |  0  | 148 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 3 
                apr-util-1.6.1 | 2 
                haproxy-2.0.10 | 2 
             host-pango-1.44.6 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
   openvmtools-10.3.5-10430147 | 2 
                qt5base-5.12.5 | 2 
                  snort-2.9.15 | 2 
                       unknown | 2 
               acpica-20191018 | 1 
              alsa-lib-1.2.1.1 | 1 
                  avro-c-1.9.1 | 1 
               bctoolbox-0.4.0 | 1 
                  cc-tool-0.26 | 1 
                  gmpc-11.8.16 | 1 
          gstreamer1-mm-1.10.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                   libnss-3.48 | 1 
                  libsepol-2.9 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
                     lxc-3.2.1 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
             openjdk-12.0.2+10 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
               protobuf-3.11.0 | 1 
        python-alsaaudio-0.8.4 | 1 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2019.10 | 1 
               wireshark-3.2.0 | 1 
                    xen-4.12.1 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/582e6ff362f655287f20510e2cab70ef8a20e954 |     
  riscv64    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/0f251f1a7bae8b3626fc2d69ca6d80abdb486f61 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/f643be646709afef626b2be9c752df57fa7e78b8 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3a49f872769d1c131a0b76ddfc6109b59e13e1ca |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82 |     
    arm      |        bctoolbox-0.4.0         | NOK | http://autobuild.buildroot.net/results/a10382a298a15ec5bd8fb4b8646cf91d50b651a6 | ORPH
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/caf778c2eeb61642eb2553602608b33d2c7ff1db |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/d2ed9a83aa6fd314b58625d3a8060fc4cfab0ee0 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/4ad95ad5db04cf5de8ab0c672c622cc7f1b3bf40 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/8689738393ce9a5fc148eead1a873dd453665c1a |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/0221aeaa243d82f751e87b765729385c8cc1ff24 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/23b35ebf1f7ee9a05fc5bca00919ea639bfd071b |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3fcc8620272d7c3fb325ee975e4f092bd98b5b36 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a71901bdfa966b227238a9536e8f1a9ab6fefea9 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/476b03b37ce4d3739e5485e33fa8e0f9091c89c2 | ORPH
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/31b875d8703d88b3c86abc0335b0c49185fbf02e | ORPH
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/0ad86b52ba0b6acccb26e5db7c2c0f210e2287d4 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/433a7db21654d67626c7a3e5f1272d6c3ce4fe6c |     
  riscv64    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/02e5ada930ad17051b7a88372f902de1645385ae |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d2e2c31733eb9786a249a384c4d339682053bf43 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/08e3c9dc837afd066f6c6700f0fde7df786df707 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/53b397ebdd4a739a1e86e3148824dc9d42089a00 |     
  mips64el   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/37d57959f2c81b73ba7fe85763eb964d9103fb77 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/2937b70b9e46c05e23b4ac69c5efe55a5219e9c9 |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/91524c05f04b1bf0621a6a2fd8d50f50b278edb8 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9ed6699a88cf4752d4a3c707a4e408c1fc08350c |     
 powerpc64   |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/cd5dff4b37fbd8a03ac25268d972d5ce2cbda618 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8f08da355300a394327dd44f8a8f907eced2ade0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b39de71a6ecd47eb2da88d2a8cadedf5f3473ab4 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/8f9b1eaa67ee05f135ca74b283fc2111999025a2 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/d74d2ba470d980dcde060732730c3e1e617a5cd3 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/00bbd058902e12a2ec2bfd6463beaf976ad79b2b |     
  mips64el   |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/bb6d3ad6ed4f828df0c6d97caa44cc01086189fa |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/fb3aff1f247f740228ebdbd35ccfb822ed338274 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/07d4a28ad9ef08de416363acad97fb1040aabd38 |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ddad4be3a0a9879ac66a4caa892af1ffd7025598 |     
   mipsel    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/b5315bc57148b58849aff0f2c2e47d165bbfe9a5 |     
  riscv64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/8f0a2175310ad3448fc1789e07fb54255ccaad3b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/811e085a03087478e4d875d3488f164946c09dfe |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/64187d8b008340398871426d7303c4925ab6996b | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/a65e1b1d1d7e27a2a22105263d35ce67c1c87f0d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a558bd28afcec1c61618db0c0b88deb6cf913bb7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/54bae326440d88dee395b509f50b571875389d6c |     
   mipsel    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/21a68849d95782fa120241fa28901826540078e0 | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/686682d66054f132cf0f2c5fd36f2960ff992a3b |     
    arm      | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/1465e8eac57bf4e54253ec274de6fbcaee6f8b4c |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/aa8b8cebbebafc6119a376950dcca77de2478035 |     
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/e944ef74a4b45742b76a2c9acd99b8b44a91e166 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/058b37661ef793119c56df0f7a2580e5f2744a55 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/8cc02acf7debbfc4fb9422eceecf94827fc22c62 |     



-- 
http://autobuild.buildroot.net
