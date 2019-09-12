From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 06:12:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-11
Message-ID: <20190912061259.81F99857DC@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  7  |  0  | 28  |
  2019.05.x  | 17  |  0  |  0  | 17  |
  2019.08.x  | 16  |  6  |  0  | 22  |
    master   | 135 | 77  |  0  | 212 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 12
            wpa_supplicant-2.9 | 11
             subversion-1.9.12 | 7 
                      icu-64-2 | 5 
                 libdrm-2.4.99 | 4 
                log4cxx-0.10.0 | 4 
            python-sip-4.19.13 | 3 
                  cmocka-1.1.5 | 2 
                    ffmpeg-4.2 | 2 
                   libnss-3.46 | 2 
               libupnpp-0.17.1 | 2 
                   mimic-1.1.0 | 2 
                snort-2.9.14.1 | 2 
                    strace-5.2 | 2 
                       unknown | 2 
                  flashrom-1.1 | 1 
            host-mfgtools-0.02 | 1 
      intel-mediadriver-18.4.0 | 1 
              iputils-20190709 | 1 
                libgdiplus-5.6 | 1 
        ltp-testsuite-20190517 | 1 
           lttng-libust-2.10.1 | 1 
                  luv-1.30.1-0 | 1 
              micropython-1.11 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
               qt5webkit-5.9.1 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/639de814b8af840ed92ed51019f414e6b524321a |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/4e77ea906c0bc261bb41880d90c286cabbbad044 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1ae02dfd2e827587049d7d00a456edb9c0cc0ef7 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e650f98fb6cdd5ce2f5ad830944e1381f5769d8b |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/7cce88cd1824491c63d4b94c321064ace59acb30 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ea0af685c9b80e559ffa67ef778fbf8c3ffe8cd4 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/4c953d8ae664c705b862fcb659968273765f4013 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/07094ab0f17b9a1a8481be159cbb2118a7b79437 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/8e8df2697269b968024d151044f1b3f89df304ac |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a994a86a3e5e1c917e9f0c95a9bd083bf2e68627 |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1ef568799c36ef6388e75797aeefa2853e9ba9ef |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/616d86076611c2ac6fe7c611f6da30decdd6fe51 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/ec62e4e85261286101f35351995fb7a81dc39d96 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/7951502e17f1f6e4b7ed64ca00da12aefef6f2ff |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/871dfc7cfc112ea3fb1f5604057a6bb3075dac50 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b8e4da4f96c9d41c542fc8ed798e03b21050d566 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/651e299329713d66a659ad2f9521995721c8e4a4 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ac54472c409431fb250335cdc70331d156d855a0 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ef96df3e65881bd07637e6344f04ac3b3e25fea2 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/dd5c8dd865602c7a6eb8ef7d1b100817fd6ea608 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1c63a6835be3eb56e61f9431ac8b10a7bd6dd30b | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/c8b7cbf130adef5c1130e1abece47fc4f4a01dad | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/44881e9e791035376e00bb54f2b4dba8ed5d0acc | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/838a68cb38083abfdb6789ab69b7f6f64ede132a |     
  powerpc    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/cd428c60e9f490c44d723577a6c28bea40a2bf4f |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6a1ee2fe89a769de3bf45cd5ef25c7080d5cd0e7 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c93146bc74dd8bbde7cf9ae9c3adad36da3e2de5 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/732b7779f4a11973644dea76f9867fe4d5c51697 |     
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/48958c4d4de883247e0b0bd1101918de1ef99cc1 |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/900a1847a376aad5aa0088a180d37cf0f18400af |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/ba29213a14b875041a100c0b3622bbebd24319c2 |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/cd67c89632bb3f1c1ae8eca83da907a501c79b1b |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/6935c210e0d86787bfd0d51bff20b8f6754fc50e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a66095123fb294ec86bf3ab1a57ee4810aa279e7 |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/d0a481862be6df840107d9eab84e70645d8ee835 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/52fd4d4009aba2e279ee1fe4888365f6393561b9 |     
microblazeel |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/52e6c06ef1e7a00f5190486779595ab2647aeb86 |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/00b3c5f0f84b10848c65480e109c3b9639652865 |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/95bb961f8b1f893eaedd09c6327acbbbf5177f9b |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/5562eb2e13cf7b09220a3cf1570d1b7ac51eb5ab |     
microblazeel |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/36ea87763b383866b5c422d74c53f28c97956983 |     
  riscv64    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/cb0c7a52745b0c153bd9702b83f94a6cb492cf90 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/012942ac9e611e0621cb8c6e7a95107a786f396e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d1fd087824a823394acdc1e95fcf362c2ea560c3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1d14dc37c0eff2ca9e0efcae9cb728c006a281c8 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/15904bad8b83399f851b58f122d53358f4e9b0c1 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/eafb927761a157e97391b39f92d62af829aa36c8 |     
    arm      |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/3b088b5306ffb33c3d4f5227be09471373ff3a2d |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/ded043b6a9ef22d7a35fd5e1cf1b159a56eaa360 |     
    sh4      |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/c9d69e2564f6e7c5f666feac75ec08e703a931d0 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/54ba0ebe41646cfc512181cd5350d29fc634c8c8 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1cf97731b83fd994043a94837d6997c3c990a2cd |     
microblazeel |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/bda1601c4697f709b276ad23fd1cb9cfa9852a1c |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/7fcad42c65b21322eae14e91b61028945c3c2ff6 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/c103d31dd3f5d98468aa26511e4a399fcd870ca8 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9f916c6a03921aa841934b15d9b3aa651ef03fc6 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/63a958093dd364db74d9b2a61afd3de5488900b6 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0e8bdd78b4cbf2fa89ee7e64d195f414c52d1c36 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6d7c4556a5e25c88afa66c9fe8a61b8b1bc4d116 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e2d7ea213eb5a9f32c4bbef0be75af670539b611 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a06ee32a5a2a37b443d4b73d07e477dd9ad5b851 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d8646483b875df3a3ee96d2ce1b5ede81a20feb2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/71b1d084c73baf736f2b12e8dfafa8c794842af6 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b88317264d5d9bbffac7f48fb0749825593240f4 |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/afb1bd17b8290e42069129be51f3d014f9377881 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/5c87ae5d6d4d31e58621513a17cd2bc740b9deeb | ORPH
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/02fb25703984844f20906a34df3277e11a1b5260 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/fe621acc92c81e4b625dcb7887d38750891df93d |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/7b58d6ce381861f944ccb5c99d7790a8f2db44b9 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/559cde9c58985fe6d8f5e0045dd829e8408de293 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1f29f64abdbbd93a2e76cbda59e8687fb9826dec |     
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4b67d130b51e4f99a49495e9506d6b58b82e26c9 |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d8cba86db2c037e8d119f37d437644fa92613217 |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/2bb110be1e6d78a5d2f1bf7aaebbab7751ff46d5 |     
    m68k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/5db4fc20146a2ead06193e7379b204a6d75d96cf |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/9d98b29891f69e9656f02f280e0d0aee50f94913 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8a04c5987de930068d7eee231318401b60dc69f4 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 3 
               host-qemu-3.1.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.11.3 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/9b4d652ef27321adc7f798633e2220e519932cfb | ORPH
  riscv64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/a68bcea3b5328cc8780487fbd894f18c1bf0729d | ORPH
  aarch64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/6dc616f40d522135afed0552b96d5b5f1fbdbe3b | ORPH
  aarch64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/2b6e0bd83374e325daf8efba7826509650943511 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dc7364dce8294ae1dabafe961f1b1e01cddd7ea6 |     
  riscv32    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/2f961b50977bb4c92e80c1a3fd9423efe09f801b |     
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/3f03db15f510ea63dac4e1e390b3143aff8253e0 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 2 
             libgpg-error-1.36 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/f2ad8f9b72b9ee89ef3743c00bde782ae9c41965 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/87b46281ec1f333501f43b2e30d222424673c50a |     
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/d5eb835f096f5502510781ae67a5b7b3acf385c5 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9d3126e00707ed05c89e6c8e042c5504f8508886 | ORPH
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/d9bfe5902e336fdbea6b9f89326acfc261e240e3 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/4594b697e6657c1ce94b3721f6078c01e369524a | ORPH



-- 
http://autobuild.buildroot.net
