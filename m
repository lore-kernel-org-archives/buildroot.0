From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 07:17:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-30
Message-ID: <20191231071753.366D920468@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.11.x  | 14  |  4  |  0  | 18  |
    master   | 114 | 63  |  0  | 177 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  avro-c-1.9.1 | 5 
              host-grpc-1.25.0 | 4 
       alsamixergui-0.9.0rc2-1 | 3 
                apr-util-1.6.1 | 3 
google-breakpad-7515ab13768... | 3 
                  gmpc-11.8.16 | 2 
                haproxy-2.0.10 | 2 
                libgdiplus-5.6 | 2 
           oracle-mysql-5.1.73 | 2 
                 samba4-4.11.2 | 2 
                suricata-4.1.5 | 2 
                      tio-1.32 | 2 
                       unknown | 2 
                    xen-4.12.1 | 2 
                    4th-3.62.5 | 1 
                  apitrace-9.0 | 1 
                bitcoin-0.16.3 | 1 
                  boost-1.72.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                   dav1d-0.5.2 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                    flex-2.6.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.13.5 | 1 
host-google-breakpad-7515ab... | 1 
            host-mfgtools-0.02 | 1 
host-python-setuptools-scm-... | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                  jansson-2.12 | 1 
              jpeg-turbo-2.0.3 | 1 
                   libnl-3.5.0 | 1 
               libsigsegv-2.12 | 1 
                 libusb-1.0.23 | 1 
                    proj-6.2.0 | 1 
           python-bcrypt-3.1.7 | 1 
              python-pyqt5-5.7 | 1 
              sdl_mixer-1.2.12 | 1 
                  snort-2.9.15 | 1 
                 systemd-244.1 | 1 
           uboot-tools-2019.10 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/8ee6ebc2a7cf3ff4c134c84e1969a2622e96ce02 |     
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/00ac5d5b6ed8c24c9cab10a30444df7c4cec8b5f | ORPH
microblazeel |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/76e6558c8745a948006ea19102a7ff2267b2e8ff | ORPH
    or1k     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/70563e378a1be83f5e69f451d91a0969057508df | ORPH
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/0a74b3b33b2dc0c7c256da4aae90851f73a7ad21 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8aed866c599bd5a91b77b14659e0ae3f0c6361c4 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/302510401fed882b65c8f7cc66cdddff1fa9919d |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e6490d5569f2ad69a0dca22259bf84e36a366b84 |     
microblazeel |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/135e246aa70f28c6b9aea5fd6b0eb9c7b45ebfe7 |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/e931a686f9e2d5c127cc65641922aeaa68dcacd7 |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/2a378c1400d223fcae1a7479c663a36ff921625f |     
    arm      |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/094ee05d9446de5d364b6b96c8a0796c1b4a8ccb |     
microblazeel |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/8645a6233364c7159a440ae03ca93e775c2f3735 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/6673687bd163e076352a9baebd556575ef6c976c |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/8e824314d35e12678023f32650a90539a72c9bab |     
  riscv32    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/5545592250d05accc08b0d208809f442ee7e940d |     
    m68k     |          dav1d-0.5.2           | NOK | http://autobuild.buildroot.net/results/09ce6345422f3ecc34ada4401b0bf45b187a6038 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c4595a499515dbbef5a4601cbef78e8ed51d8a45 |     
  riscv32    |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/89b73512cd06c6329b9860a2ee2a5e7f20c37dc0 | ORPH
microblazeel |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/8e45e252953460ce95a61e2d34dc3acc6cb2e464 | ORPH
    mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/bdeb0c0d2ede157338a82e836347190f349910d8 | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/dba2fe255d4ba18e460ce813d602052a5fc59277 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f5240c4c523558d0f34ed2fb43a6b27d30d8ceb2 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/da86013725d2d5ab65a0ef1d2c78c9047fe42b9d |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e04e22dd3bae3390e22fa1f3b23f4590068ce500 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/e1397a38747d188c9e8905a49ed92a77c9eb7056 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/73d03f9932cbad4c8d98d21096606ea74b620f70 |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/d711b998f5c14db4a48a81a6d3a7793f6e58e168 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/4f7031dc3256bb13e54ac3fe960091b5aa8b1f21 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6c81ba59ce09b9fc44ed1f4e341d7716f83bcf09 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a092a19f64368e69f71ff3f7a4d4fb5785eb539a |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/92da77fad44deee14ddc1ed28c094d4d9046ea19 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b3c54037d2718fc814faa9088e9c9fa5106bce9d |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/f009b6f8317e6ce28009ef238c441946543191c3 |     
    or1k     | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/0a278b6aa87251f2685d92d3dc1b7f838ff86f5e |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/245f6645af8c40a52b31ef60e08ac2d0939f99d7 |     
  riscv64    |          jansson-2.12          | NOK | http://autobuild.buildroot.net/results/43a98c19bb3822e2f7e046a13b2879243d255126 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/608789bf9e96cecd1899ff24ef8b5481efb03e0b |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/481be515218e63eb5acc8c73937b6a9aa1c34ca1 |     
  sparc64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/0d38bb2c73f5e75cd2a142af2bdac93a0e16da7f |     
  riscv32    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/155e7977c20a84c9fbdec6f43082b28ea503a4ca | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/25f04b3ecaa7f1a79e2207ad4bcbf81c3ab42d5c |     
  riscv32    |         libusb-1.0.23          | NOK | http://autobuild.buildroot.net/results/26733ef7e03e5d9caa03da1ac60ca52438b49360 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/479ed2754d2f12521cdf543fd91de688e9a4c1be | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/caacb1c8f12254671bee76e2e9b81d6cb68da622 | ORPH
microblazeel |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/4195e4e5b78182cfde7d417bc91bc336e30b880a |     
 aarch64_be  |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/3d6f0004816cab41e3f9ad3fc4a8c537f753d2ff |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ea0c8db44aacf1ce76f75e8288969fe5da6690d9 |     
microblazeel |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/7af629b8acc92c81e006b1b87ae9a6fd461cf96d |     
 aarch64_be  |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/022cc3eaf354d4f980270e8bbaff88e6af6a9c63 |     
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/83f378d9d01424678006434bb1e4a49cf4131fdf | ORPH
    arc      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/cae8261b53cae262dc790db2cf2fdf2bd510d57c |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e8afac43d7ab26fb4991d9632aadba06ebd94715 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/27130ef60960b39aa69f8edb93f28ae00af7c1d8 |     
  mips64el   |         systemd-244.1          | NOK | http://autobuild.buildroot.net/results/d4f68d18897c81f77548d3f4f6660bafe0f17276 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/17221b1c77fbfdb5c873fcfd83667f67f4e3a6a3 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/94494961ed40826046280277595206b55221df80 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/d481f46cbccc249c3e5d8c7003b7e3b77774e6db |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/87c82ca3c171d4713f762f1a2ba1be5d09d06963 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/add09aded691edea6f6a8a4c57ccd443fc0c2c4d |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/686bc8dcfc38f2a4eceaed64211435dbae970238 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/7fd8c04f813f1643841e87422b9efd90838b854d |     
    arm      | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/5a49a334d4b5470e49b4a970ced792c158063edf |     




Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                bitcoin-0.16.3 | 1 
              host-grpc-1.23.0 | 1 
                qt5base-5.12.5 | 1 
                    quota-4.05 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/e18546dd20918813a14669baf52600b8c203e6de |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/780eaf31d45b38905942fad4589ea34e6abf1da3 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/baf4057d4b40801fe85b425e9c85d6d7a0a00fff |     
  riscv64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/d14dff0c86570084ffe910441f101316198560fe |     



-- 
http://autobuild.buildroot.net
