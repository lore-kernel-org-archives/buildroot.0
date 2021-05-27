From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 May 2021 05:48:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-26
Message-ID: <20210527054900.ED8874048B@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 17  | 14  |  0  | 31  |
    master   | 117 | 65  |  0  | 182 |
     next    | 11  | 15  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 9 
             host-lvm2-2.03.12 | 7 
                  lvm2-2.03.12 | 6 
                     daq-2.0.7 | 3 
                  fan-ctrl-1.3 | 3 
               pipewire-0.3.26 | 3 
                 pixman-0.40.0 | 3 
                    ffmpeg-4.4 | 2 
                libesmtp-1.0.6 | 2 
                    mutt-2.0.7 | 2 
                  ndisc6-1.0.4 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
                   cegui-0-8-7 | 1 
                     cgic-2.07 | 1 
                dovecot-2.3.14 | 1 
                  gamin-0.1.10 | 1 
                       gdb-9.2 | 1 
  gobject-introspection-1.64.1 | 1 
google-material-design-icon... | 1 
                haproxy-2.2.14 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               linknx-0.0.1.38 | 1 
                   lite-0.8.10 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.0.3 | 1 
                 netperf-2.7.0 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
           udpxy-1.0.23-9-prod | 1 
               w_scan-20170107 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/89d3b1ca9e94e9e3d0be5b26312041d558de1844 |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/51950f10e626c0d68d5dcdef3987ee7133a98c6b |     
 powerpc64   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/9afaeee8c16bc793dc37fe32ae2eb7f0621f8b3b |     
    arm      |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/34517f2d123c92855da8b55457281deaf47cf197 |     
powerpc64le  |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/7f6dcc222e1ca7ada452c029fdc6e947f1f848fb |     
  powerpc    |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/9fcad6ad8ada9e0a5bc17f201326aa536230c41e |     
    arc      |         dovecot-2.3.14         | NOK | http://autobuild.buildroot.net/results/ac11fd30a62f93fec540ef85d5e4d2f0b97a18ec |     
    arm      |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.net/results/2cffbad882e3d6be7319082201ddf12ba08199d2 | ORPH
  aarch64    |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.net/results/cfea72063c2e65805176ae40e70664fc7b604afe | ORPH
   xtensa    |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.net/results/850385c903556235f974c1b3df25e0f66e6dcd7e | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/562fcb8a4f57434c21a27f9ea78b32406f80c1c9 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cfeaba3d68f993a8529697000f6b9a0e239945ef |     
   mipsel    |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/480c3fcc61fd816b62706dbf8082e1b28d6b6d21 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/1d4c8d52f981fb5c64011cb643815cb8ddd5dc9a | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/957cdaa913bcadd8f6a2ba1b2e47e40ac109ca0f | ORPH
    i686     | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/49f0d155e06cf3a55346afcb322a294c8b0f129b |     
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/04c46a93b41381b2599b34f93dc0d98ea1413899 |     
  riscv64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/d988b91242b69d9a55e50ba5ded56e17d1595119 | ORPH
powerpc64le  |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/42f330fa208dd83f942d51bc429e1263391c2bc8 | ORPH
    arm      |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/7a07e08e9d6d52cc47f04ed5400897d3ff882d54 | ORPH
    arm      |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/3a2e006f76f59f8015d877e58786db2a221a1df6 | ORPH
  riscv64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/936976e90d79bbf9d0820894d9df25765016f2c5 | ORPH
microblazeel |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/9dc90871257c637ef757df42f5d06cbc0fccfb31 | ORPH
  sparc64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/61e6337f801c73481464ce5a1649c6e93d7bae42 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab63f456fccb1133e0c4f7ed3cab8d000920f35d |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2a6f38000aea5a1076dc71a9cacfe876221bd4ce |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d591f5fc287271748d48d29b34397af1107f5c99 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1c9f9df58d7d190580f861bb9ed462c42c9aa0d1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/18c3630659da9af622d199a98f1e1fbd1e85dc0f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42955bb4ea76bd50e91698c6c6aa621edb438e8a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be50fe38a296d07b100ba38935eb2eafb8d84012 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a1126de2cf3c00e38c042a96420d2e48aa02d7f1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f629967bf0761a42561013b885d6af0873d7a53e |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b845c2060c6e83337e8fd6ab93724e7a6b248d7e |     
  powerpc    |         libesmtp-1.0.6         | NOK | http://autobuild.buildroot.net/results/83bfdd8e5f897b4d4be81c4c16106feb4e17bd50 | ORPH
   mipsel    |         libesmtp-1.0.6         | NOK | http://autobuild.buildroot.net/results/d788315bf708c31e14ba5fb35dccf94753d5f78a | ORPH
  riscv64    |        linknx-0.0.1.38         | NOK | http://autobuild.buildroot.net/results/50e3e9453e379611f9d61e379ee9dcfe6bf2db15 | ORPH
   xtensa    |          lite-0.8.10           | NOK | http://autobuild.buildroot.net/results/5e4f148a19143c2bdaa5339cece4935edb8881fb | ORPH
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/471d67ec51e730d05f04eaa44d7e17a13d36d949 |     
  powerpc    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/8b4ddef7e2bd65d2c0336c2a6e5cd63af33b2a14 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/bb846f1cad6f0b922be64dede152a063430f7d32 | ORPH
microblazeel |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/5142b7c37f60b7d259408694140ab194843719b4 | ORPH
microblazeel |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/663d6871c5b05931bb1cedf7345a3f9a4367fe06 | ORPH
  powerpc    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/7168059afb2f0bed6d4b64e262fa86b530cc267e | ORPH
   s390x     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/757edb36c788242f94c3ead2e5ba5cb88ca0da0a | ORPH
    arc      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/07c611418047593b80bcf100bbd34fe7aa61cd36 |     
    or1k     |           mutt-2.0.7           | NOK | http://autobuild.buildroot.net/results/5dcc35cba75e0fba05c8058f03b5319f338fbd6c |     
    arm      |           mutt-2.0.7           | NOK | http://autobuild.buildroot.net/results/c7a5fa9c6af5957e5b36a7dda7f9a5ca7676d8be |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/85cab0006f594e3efa71c25e8f375b8a572d5eca | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/203f6ac4bd39f778cf503cb906507cb5d0b19cca | ORPH
    arm      |         netperf-2.7.0          | NOK | http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b | ORPH
    m68k     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/e9906260d6a92ace42a02cc31a12993d47d971f9 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/2b8a14b7ca043667843f0bda4ed3b1f609654390 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/79a7fbab75dcbfcdc829f2aae95036e945f76a6e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c9643857eda767129b2071a35e010d6f5349304b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dd162b4e65563bd7baa0e756870e73e5bf0dfb73 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3966498fcd8a8f82bc7863dc8d816929b98053f9 |     
    arm      | qcom-db410c-firmware-1034.2.1  | NOK | http://autobuild.buildroot.net/results/1ca9b93848b61919ae78fd696033dd0cf1da8ef1 |     
   s390x     | qcom-db410c-firmware-1034.2.1  | NOK | http://autobuild.buildroot.net/results/4af95e15b35c03f3d226cbc67c479b853ebaf08a |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/97dbc9e6ea30230a94fa1099bceee932f64433fb |     
   x86_64    |      udpxy-1.0.23-9-prod       | NOK | http://autobuild.buildroot.net/results/040f052bf9970194682703db2dbe4ab45723a3fb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/9635d7b635925eaed16fa4257403f7761d55f227 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/b058f9d58f14773b33471ab0ee0d617028eda9bd |     
 aarch64_be  |        w_scan-20170107         | NOK | http://autobuild.buildroot.net/results/8465be0d90569a9bbf65d319327cadf52d9d5919 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a315c792de4291ee6ba940f09476d17dd7f6fc05 |     


Classification of failures by reason for next
---------------------------------------------

                  botan-2.17.3 | 2 
                     daq-2.0.7 | 2 
           host-libselinux-3.2 | 2 
               aircrack-ng-1.6 | 1 
                 freerdp-2.3.1 | 1 
           heirloom-mailx-12.5 | 1 
             host-lvm2-2.03.12 | 1 
                librsvg-2.50.2 | 1 
             libtorrent-0.13.8 | 1 
                openocd-0.11.0 | 1 
             transmission-3.00 | 1 
                   wget-1.21.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/bf0361326e34095ccf4dce4d04c20a04ae4352ae |     
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/a5cf3dbd785ec06d00298fd7cb4c52a103fc60c7 | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/431050b9d5deee28de2b73fabd6f7636cfd5f6f7 | ORPH
  aarch64    |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/288b25b0ca809d9e9ecb39cc8bc84cdd6bd33ec6 |     
 powerpc64   |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/c83647dd4a78569c40ae03281accaa017bac43dc |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/ba0c0f73de07fe723c950b7eb86f2192c82ece01 |     
 aarch64_be  |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/cf3837fd20f48ea1fad39d06c9de052b125f5849 |     
  sparc64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/fefa183ed8f8bcbbe9bcc86f6cfc6e1fae3482da |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2207a9e89dbea9a157056a5b2a7b2cda34926b3b |     
  powerpc    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/e115d5ebb529158b7b687b8054792761ce505ea7 | ORPH
  mips64el   |         librsvg-2.50.2         | NOK | http://autobuild.buildroot.net/results/282fe563f24017d07d6bf5909cfa5e71effb5e04 |     
   xtensa    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/8c91513ad786af254e0eb208ef66a17884ad86bf | ORPH
  powerpc    |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/4536ed9124e77547c5e29f710fcafccc17b80a05 | ORPH
    arc      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/4f748a9474712992cd4d8209a2b8c263cf07fbb0 |     
    m68k     |          wget-1.21.1           | NOK | http://autobuild.buildroot.net/results/a342a4547dce1551e141c06c454f6e5f0830b671 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
                clamav-0.103.2 | 1 
                     daq-2.0.7 | 1 
                  fan-ctrl-1.3 | 1 
                  gensio-2.2.3 | 1 
                 jack1-0.125.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                python-mad-0.6 | 1 
          sdl_ttf-de50cffd41e6 | 1 
                  stress-1.0.4 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/ed53b7a3706201cd19e736e0b61f817abfecd2be |     
  mips64el   |         clamav-0.103.2         | NOK | http://autobuild.buildroot.net/results/6092092a8f0354a141900385e325100baeb11f76 |     
  mips64el   |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/448d3651365d794a8d967c35be1e29630f3db061 |     
    or1k     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.net/results/624fae80bfbfde571b6a60bc48e8eaa357103216 | ORPH
   sparc     |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/1e252aa5e727d36116d83b371bb1e4010cf41f13 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ddeee666445c983e3453adde9852ec99b25f3c97 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/de2464aaa097c64f4211e7506c1e83598f34935d |     
    sh4      |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/e3d5a7d5772dfa23b5e8329977b2a4f91d005add |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3f7d4dbcfaa90239b9772b7bb12291027af09b41 |     
  riscv64    |         python-mad-0.6         | NOK | http://autobuild.buildroot.net/results/2c037abd4246bbcff6b05a7fbff964794d3d5982 |     
   mipsel    |      sdl_ttf-de50cffd41e6      | NOK | http://autobuild.buildroot.net/results/a4e875174b75eef2a055023a0016c98be107194e | ORPH
  mips64el   |          stress-1.0.4          | NOK | http://autobuild.buildroot.net/results/04730003d00c9729d7c83723f86b52dbbca4f404 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f31a6a763679c035fd371953c306a1092ba65fc7 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/587af78efb3cbc9a30c3681504a29cbfd2d69787 | ORPH



-- 
http://autobuild.buildroot.net
