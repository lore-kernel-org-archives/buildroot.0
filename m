From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 06:17:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-09
Message-ID: <20190910061723.07F4185C4F@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 29  |  3  |  0  | 32  |
  2019.05.x  | 24  |  2  |  0  | 26  |
  2019.08.x  | 22  |  5  |  0  | 27  |
    master   | 149 | 101 |  0  | 250 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 14
                 apache-2.4.41 | 12
              host-libcap-2.25 | 12
            wpa_supplicant-2.9 | 9 
                  luv-1.30.1-0 | 6 
                log4cxx-0.10.0 | 5 
             subversion-1.9.12 | 5 
                      icu-64-2 | 4 
                   dav1d-0.4.0 | 3 
                    ffmpeg-4.2 | 3 
                 libdrm-2.4.99 | 3 
                   libnss-3.46 | 2 
               log4cplus-2.0.4 | 2 
                     apr-1.7.0 | 1 
               capnproto-0.7.0 | 1 
                  cmocka-1.1.5 | 1 
                    flac-1.3.3 | 1 
                  flashrom-1.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 gnupg2-2.2.17 | 1 
                  gnutls-3.6.9 | 1 
                   grpc-1.18.0 | 1 
       gst1-plugins-bad-1.16.0 | 1 
           host-nodejs-10.15.3 | 1 
              iputils-20190709 | 1 
                libgdiplus-5.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           lttng-libust-2.10.1 | 1 
                    mpv-0.29.1 | 1 
        riemann-c-client-1.9.1 | 1 
                snort-2.9.14.1 | 1 
              spandsp-20180108 | 1 
                    strace-5.2 | 1 
                upmpdcli-1.4.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/fcfa63150e4e3d884dad1a190288e06db5fc96fb |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/81b4612fc06d6fd7c24d81958d1557a49aded560 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/aa7175b0f1194974ef0d25191915984f66262907 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0b5690edc82087ee2dfab627b65c1ea35a4d9305 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/8a09bfef4df04d41e4301dcf32072ba36bac8728 |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/42f4c7aade21dab5bd75677175aa4dadf6bde612 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5163e96d70e68f1132a2d009cf18fff7aa2b241a |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/668a1ea059d774240671a9a3682ff7590b682552 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/09f34d5becc2e5b6a2ff17ea5773219a7ccae1d7 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/47702db00c503396c9d7f7db299046c925c32655 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/73ba3847311c5ec0e2566f1baf3e4e09f9127804 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b9a08dfde32b9395780e25d1eca7f021da065023 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/5d27bd0958a57f0233cba4ef564b79d658d9f883 |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/69706bcd156abe1c043f87fff5b9cce9cd7a51ee |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/132d75bfa0b575bb28aa6db625869e3c145585c5 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/43933ebb9a030157f0f2654f20d6a14f9e207f83 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/1b0e98c2a02e711a65423810fe3d59593375251c |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/68fa3b2de185e9e3ec1ae7f1b129632d30bbe279 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b96e26f4d925384aa4dcf9feaebee0cf856bf3e9 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/f7cdce53049b23ac7574cd8b83cd30b2adb20d04 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ac21e74cea0de5a1264200fedd65cf3431db5712 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/6d27de0eb8a41913b7979b72961f3bf24a0b4930 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/38ab1a0e7934cb1ceb390a661957417ea1449f2e |     
    arc      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/961504347a56b307a67bcd4435e6bab6139c37c7 |     
   x86_64    |         gnupg2-2.2.17          | NOK | http://autobuild.buildroot.net/results/034e42035ad3deacf7076017eb05d43b7b479cbe | ORPH
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/c95d143aa7fb10aecdd79f2321c0fcad8574115d |     
    arm      |          grpc-1.18.0           | NOK | http://autobuild.buildroot.net/results/cc5193d03355f03bcfa100f884d62db3a63985b9 |     
    sh4      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/50f7fe935e21746d5b5391fc7b570a97259e5bf6 |     
    sh4      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/3e459ca9f343e40e06690b74f53aea4f9be29cef |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/8606c7a0baef6ea475377aaabf5d97effc0e840c |     
    or1k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/a553a33e317492674a6bcb1fe5c9360f2faacdc4 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fc839b1ed35a1f1adc4be2da9b7b0d4a897811f5 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d35350283c92dc4912519a5c5d1e11b62574bb68 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/dcf4f7e0a72b5064887b863d5998e3d10ed302ce |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fd929314c5b1cbee0af51f49a1a563879f8a2c2b |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/c06ee39d6ae547b9de0b0e2a07b5bc5e26fc019c |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e9587c0d818fa2a062f087ef9c8005a79490bc15 |     
 powerpc64   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b121de84d20100be0d70217b71ebfd32d703806c |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/acbb06492e01b8627b722f021cf19db1257213a3 |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fb7a594ab090d429240f263acef1549cb9d41e3f |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/3a599e89589c7ec47968bc5d937a8e0877924e6a |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ef91e9501d4fec9ea7217319ab32e0bd81551113 |     
   xtensa    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/d07a0ea747adaed8b7e57c244aef3726b3040d47 |     
  riscv64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/3485c2c4f5ee892989b0cbee75a6efb8bb82dc58 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/0f1d13faacfa33fe6a8d3dd94ab9f34476ee9bf4 |     
    arc      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/48f5aee575d58c64e04e0e6c699a3dfab5067275 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/71b7b80295d0d4bc03179fd93d31793578732adc |     
    m68k     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/e224216c2b25ee7a4f7ebf25fe85cbcfd89b7fee |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/3b964f33f942e5ecbba93c5684bb6f727780a930 |     
  aarch64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/0327d077777ed6bbe6c5c57f5cdf5e008cd3dcc9 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/967efbac8a55d5298cae3a84a200095e6e0a8633 |     
    sh4      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/8320a41b7712b615735ad80df9e8580c0e668708 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/713d193ad0a2109e422f4a629cb76796a65f5f7e |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/4db6fcffd4f1432d2f2349ecb58992c6be568073 |     
    i686     |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/57d3f2fb2c0303c338b03a407420b1e1740ccb9a |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7b4ade534e098d09296d7082f468abce5f567502 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d7eb2069bcb06ec24de68fe008ebe4076fcfd6e4 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1245c6977745b021dc08e09f1f42c8e35b683c42 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ca3c70e0c5e02df7e364fa5fc38a3334dca754ff | ORPH
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/da3bd4c36b83f234075dae21c35e51b44477ecae |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f32c363260e35d5cc5dee5e38363b2dfc41b3ab5 |     
    sh4      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d2e29a64d565729a19c6b9c95aa3c3f9d1909817 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/763a0c465875931a9ee68c9b1503dcbc9f18be48 |     
    i586     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/bfd399ab778ca71dc97d1e7b2396f20ca82e8afa |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/bfd29593bb6c53d3e9e2d02d2ed6bea360d99c00 |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/130b0edfcb27df4924d8b708705895ebbaf47a6d |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/63b52985504073abe99464dc555398ddcd3b2ef6 | ORPH
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/b76dcfc38dbdfa40b4075bc23b52a8f4bd8ddc91 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/0d51e1c7013040307cf6d83ac09a2dd7de2f3c0d |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/dd96724d156e607de6ee19e1d9377736f6965656 |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/46377a859ebd3548f934216b41c5863352b7ad24 |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/ee01d3a9b0960c4c76a82248d3f6810726ee979b |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/f7b19e2789bb4f1384839bf8b38de92e754f3962 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/89a3680b946adb55a3b99b9ec34d2c957b45e16c |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/698e816ced1d7267798a0463f1ddd6f8b39be8cf |     
    i686     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/72c2cb1f464b47ab8c7acb3d7c372bcc47b0ee90 |     
  aarch64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/3ba247222ef48284c315eded1fc3bf5980c6706b |     
    arc      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/4fed4ab3a2568c75ac2881413c46259199fa32a7 |     
  riscv64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/70b6229b7186e6524c2c7c097b8ddd08d323f5a0 |     
  aarch64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/49f7b0bf340b43ad331a367eb0495fc527a4fb21 |     
 aarch64_be  |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/5998d26bbed8e41e46d958a33b704bab7d461a80 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/31c924b79a110b5d1d0d9b953ec9569ad80ad1de |     
   x86_64    |     riemann-c-client-1.9.1     | NOK | http://autobuild.buildroot.net/results/ef81d46b2ba509f666f99c2c59d5ab415f223045 | ORPH
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5126b393fc522c61f40fd261ffec64887d6fa83a |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/f7aca3d871231eadc4d44dce6b28751c41ba4160 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/4bf831b98e79bf69dda485a47908484305d14b4b |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/97fd8a963784d492fe23937a9939e8dbd69d120d |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2299cfa3b5ac2298959d7ffdd8861a70887d4f40 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d7e94713b43826d1d6970067a982c1347da26e3f |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e542470d8e9b75cff453b4cdf8d522aed398a5ed |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/061989172e1a4e4d6703bec15d1ac6302eb536e0 |     
    arc      |         upmpdcli-1.4.2         | NOK | http://autobuild.buildroot.net/results/9463bb4151d9e2cabd4a7e0886d46ce21c5d1790 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/b366dfde6d718c4f7f065c9b9018842a79621c90 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/15325f0ed0f702893897f5176c898652123574b0 |     
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ada21f2c560b2b98b7fec6170ecf84e77d224c95 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/70fee103ffc3a8658e8f603da0aa263015b48ef0 |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/15fd4816e8f1e1cfbb2ccd5eef46219fc1ec050d |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/73e71195d6f40953da2f034c8d8650745aa9c6a0 |     
    or1k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/71a0decb5ac484f9a26c6bb97812d9602b406f07 |     
  powerpc    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1b3d201d159742e0ad38657847e019dd7478aa69 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c64bb8717e0df10d1c70ec4c39486ffe30322a93 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 3 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/ec6a2a019e2ddac09646c9f96b1d4650aba112f8 | ORPH
  mips64el   |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/d34f43cd23fe5bf3e70cb56467f2af534269233d | ORPH
  riscv64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/4d7d7080713066fa6bdc4c3cf650029538af59d6 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 1 
                qt5base-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/12585b9d06bad20bc347b4d095882622392e3edd | ORPH
 aarch64_be  |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/30e008a22a126ba80c036863056c582dee772b38 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                      icu-64-2 | 1 
             libgpg-error-1.36 | 1 
                qt5base-5.12.4 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/114b8e4eb505983f0a0930f172d1e22d10ab95ef |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/72de6c30b3f0806fd82fe455429a79d67eacdbea | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/22a5a9183a1a858a51f2d7a2a01905958e306ed2 | ORPH
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/b741aaae23c3d47c8c1c6c9aa42760e52841836c |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/cf4860b1958cd86d67ef14b769e1aee427253abc |     



-- 
http://autobuild.buildroot.net
