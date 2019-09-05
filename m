From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 05 Sep 2019 06:17:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-04
Message-ID: <20190905061754.579C586B02@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  2  |  0  | 28  |
  2019.05.x  | 19  |  6  |  0  | 25  |
  2019.08.x  | 19  |  3  |  0  | 22  |
    master   | 154 | 108 |  0  | 262 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
           host-nodejs-10.15.3 | 1 
               host-qemu-3.1.1 | 1 
             libgpg-error-1.35 | 1 
                    qemu-3.1.1 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/903775d140d570a25be1fb4b4edeffa0300ebbfc |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/a801c6e58a175c5b85231ec11062d2869af016a7 |     
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/48aa09cf1b4ad6df6776b6af07265662f1e07d82 | ORPH
powerpc64le  |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/e14aef48780b7a8ee0202ad02048472bebcf5695 | ORPH
    arm      |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/71f711d30ddc9edc8da0d1a60636e7a13b546ebe | ORPH
   mipsel    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/9cbedf8fd18414efb39c1f76b6117e9da1322be0 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 19
          host-capnproto-0.7.0 | 13
            wpa_supplicant-2.9 | 11
             libgpg-error-1.36 | 9 
                log4cxx-0.10.0 | 9 
                  luv-1.30.1-0 | 6 
             subversion-1.9.12 | 5 
                     apr-1.7.0 | 3 
                    flac-1.3.3 | 3 
                   dav1d-0.4.0 | 2 
                      icu-64-2 | 2 
              spandsp-20180108 | 2 
                       unknown | 2 
               capnproto-0.7.0 | 1 
                  cmocka-1.1.5 | 1 
                   cups-2.2.11 | 1 
                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
                  giflib-5.2.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
            host-mfgtools-0.02 | 1 
                   hostapd-2.9 | 1 
              iputils-20190709 | 1 
libcamera-caf25dc5cfd11b965... | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
                libselinux-2.9 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
        ltp-testsuite-20190517 | 1 
            lttng-tools-2.10.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5script-5.6.3 | 1 
                suricata-4.1.3 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/2a88facb75e171eb280025d07044ff452258439b |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/3c340bf823f0dcac291c3436695bf18f10ef1294 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/493b2101d106ec81132f4e6d2eaa838a17364d61 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/7a34eaa09ca3fbc6d40573aace61f690f88a2137 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/99ed65f5e0c31d3748ab8d11e6ae7204dfb9b37f |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/9c5f39bb91c08892ff501b8ff2372e07141ec42b |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a0c9f73219fdac3f4faf050ce6f67dd50700b013 |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/7101145a725e259dd89ecc2eeafd658ade878caf |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/096071bd37d89a13bad25d314c7c160209c244d5 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/068c896b73ae0d16dd05f7b83bd6d373b91bc7cf |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b3e1d9f0fe1dd516bb716a6ab372ce8293d959b2 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/643cb4c92d2ae369d92fc82e86e0c8b6a9d77554 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1e444d3ffb711f1601c7ff13ac0e148541618f6e |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/52b3e7056a2bd442444ba8fe8e4de0b7796869a3 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ee1c64a0029efe1f5f98843485904f086788ba71 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/f2461c1ed542e050afd761db5faeaaff1f51775b |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/9277c8f1b48a506d24c4b3d212fc6be2fa804c35 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/412c75800e4ebbd183cdd9ad3c60551b1f40cc8a |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1daa7f6c0a62cca8ce2a25940efde52ecea668c2 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e5d67c298755fa898fc6ff1e341cd47c5a5d2649 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0182975dad30d11a197dc7d52e261887f39d7560 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c3ba84c0b534ff4eeae91e122a1c37f88ad25330 |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/f6b0219c8cfb8bd46748f527cb2381ea1088e170 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/cd45c6392e578f6210bf373e3c6a5256da61d9da |     
   x86_64    |          cups-2.2.11           | NOK | http://autobuild.buildroot.net/results/4e874ed2fcc1f969f2f8ece88985ccd625f2c55b |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/4cea773805e62911019d0627dcdf5d17b71032b7 |     
  mips64el   |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/3177cc478954d1a6fdcfb100eb6846d5a6b4342e |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/855bdcd24a7b58f69d35d00b76d9af46806f4bab |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/2976cf67834f4ce077f6c1131279872a98b43f6d | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/0a63b4fd1c371d05bd9c7d5234dd1daff842729d | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/fa180de8a7d6954b9fbddb1d960f06b88c598750 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9147d220f9638689dfe0a77401226debe30e9306 |     
powerpc64le  |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/a2bf214c14b41d0453a81d1fdd77cdbb95ebd116 |     
    i686     | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/5531875de364b2b200f6548c8b34ebf81d70b92a |     
  sparc64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b4629907e0a0f787ac6a16afe21423d8b358e1d1 |     
   xtensa    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d8abc93dfad1e25808ddb878471ae4acf4658912 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/dd051b1353e7b45615c83248c8df54a3cbe7ab72 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/8dd8f87a02ef08d82d1896ee89044a478d3f3db6 |     
    or1k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/54bb70e9077be7676e9aa42f901bb1e2b5c8054f |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/15e0955c62f4f3152dc55d1797842c128e1f8be9 |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d64ae22ba7f64b705b31ec5dd987268511d5edc3 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/664628c9a1b629990b8dc3f3a78a996848a7a59e |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ed028513fb1333010370e6314f38748ff60afa7c |     
    i686     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b955b258099052a9ecca22a5c9806b201260be5c |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0f9614648706118a1aa2bd7af2c60c2412b4ab56 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/2375aeb0aaaf9e8d9fca8479484815794063f14a |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/46601ccf5573cb51da03fea2a62225b26408d4c3 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/7854d2b323a87c9bcd7b47571d47b791f1775d69 |     
  mips64el   |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/cd283dfec5fdb22423830bb6e77a04e8f4191b44 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/154b77c63d8cdf3a8b74087c3476c5c5b7ec8273 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/a3a53ec1578ed088692d3374b5397bd595a3d817 | ORPH
  powerpc    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/1d5fa16d02703dbc13dd7915483d04011a4eb943 |     
   sparc     | libcamera-caf25dc5cfd11b965... | NOK | http://autobuild.buildroot.net/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/fc22cd39c72c21fdec0bff85b38e2d195c9a9fd3 |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9bb392ee0fb760a7822dd5d65a872f2583be6d2e |     
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/87a3076a815db2eef0c3cbee5a767053c1ecf827 | ORPH
   nios2     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/500bbb7427f91baa69a4877afe9ea2ce0d95abe2 | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/857d50c4feb0e14608b8f69ac228fd204c4a191e | ORPH
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/e86c92b7491e3b5f5d213e76e079c12d3a2c226a | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0cdf578ede5b050e5670694ae011493b8a187275 | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/2da65977232515b9dabeeac8f5601c77174b8fef | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/74e971914c759d64d8e9637e35bfb4e43d823104 | ORPH
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b6c0b6ad6a3e3f74faccd29975b17e0b826f686e | ORPH
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/46f4c20c6a1982642dcbc60b27476b26849eed2a | ORPH
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db98e96344dd935284954c4d5d676e07ea0f2318 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/18e60f33357c3f76969af32110a57944500b19a1 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/0751f518b44c69094c836febffe51fae153c4838 |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/51c406ea55dff9d8175f0567367ccda92e4ffb96 |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/b7d05ea20fd67532933bf4357eb6139533929018 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/3b8108b684e9576f7793af5ff6c4b5d3d8020409 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/949761a4aa18278e61789952e0bd1efb59e7307c |     
    sh4      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/536e43292046324a948f03edfe9417ef88e89d71 |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/0b3a4d6e877d27af423893b5f06661f877a8b0d4 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/042365521f4e179a1c420c21d0c45612c2e4dbb8 |     
    m68k     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/ed8aa61126c8c2961a4979e9f43bb7ffb6a57240 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/b5f02b7d3cf754af9de97358fdaca7abaaf47ef7 |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/e8b72f5d93d3565d41364a52c0024a0292a06b41 |     
    arm      |       lttng-tools-2.10.5       | NOK | http://autobuild.buildroot.net/results/8680c5a355b226cf978397615cbe5df1c5f8c656 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/4cb2edac0c080bb74c550e05e413a7eac4812a1a |     
   xtensa    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/3d78d50ecea9c0287fb35f0a3f589c02225190cf |     
    i586     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/bd19721a9cd9fc486e932fe4efb61aa5c6774d49 |     
 powerpc64   |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/77fa8747c65a6a8f1debedada414ac42a82e0991 |     
  mips64el   |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733 |     
    i586     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/9544ccd4b1297d44c93799ece1bdf7434b6c6a9b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b3213b599e5e948bbc39c5bcdd80a3355ccd25ce |     
    arm      |        qt5script-5.6.3         | NOK | http://autobuild.buildroot.net/results/b629e53ae0a2067646733227b620057850ad304a |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4388f41172a50486fa8dcf2ed8f6ca6da2dd17b9 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/29139d3502db8c87fce2bf1b93c21985cd9f920b |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/39f9631f4af21a06f7321261c327a30af1b1b111 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/911fd6e6ef8cb6d9e638bb1518ce04b32a6d79d0 |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5751f67f1e3ab33981b5718f8e3638f6081e5d78 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/035af24f336e6a650e8bc7fb24fb75401f4ec024 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9a4ce9cbdbcfa206766b7a08f5f0e2ff3f9c5f95 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/41578ad60296892e73ad27e67f9dfaaf4069ee79 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/80b0e18d7c306b3f72dd347d25c667b2f018b826 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/71d08a2ec0daa101c4fe398d31c103518090c770 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/e0902d7d74c5f4a79b1cbb1b69e6b4ccd1efd51c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0cff415416aa713244565ee810616ee32e6699aa |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/465a69a755fb833e21011e5f6c3c899b827e8bd5 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/10ba781c09403654286993077dad67a032592b69 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ebd9042acd03a2074f969f3e6c9172557762c170 |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ab826478d6a8835309ca5ce646096d0ac3a134b8 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e6ec69df05bbb3c1b95f53b95962bdb7679e13d4 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/df835d4d521201798645e3d2407220527051c408 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/82d9b53679e04c77f65efa7d45517f1e840f1450 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/677e35c468b3db9aa91c3c40e3e83f30aa7d5ca9 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4528fb018b9f0cd9c412198ec5168cbf62736731 |     
  riscv32    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0a8f2c60bb0102ab2c4db0803dfefbc9c06cfc61 |     

Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
piglit-ef761094be04d14e258a... | 1 
                 python3-3.7.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/138d7153fb6ae2eb0afe5b04f394aecfc65bfdcf | ORPH
  aarch64    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/e7d6cb25f2e70ccea443ce0e676d2dcfb95496ae |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/aa0c6e2b297df3b3cfe465429cdf120881ee1208 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                    qemu-3.1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/910485e4e059fe7bf21c60eccd258a1dbd2bebe2 | ORPH
    arm      |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/c9c87a81918223b6d3cc3f72344a8842d07c8234 | ORPH



-- 
http://autobuild.buildroot.net
