From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 06:26:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-16
Message-ID: <20200617062640.2C48E2042D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  8  |  1  | 35  |
  2020.05.x  | 18  |  4  |  0  | 22  |
    master   | 118 | 198 |  0  | 316 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 126
                  boost-1.73.0 | 12
              gnuradio-3.8.1.0 | 11
                 host-icu-67-1 | 10
                  assimp-5.0.1 | 3 
                      icu-67-1 | 3 
                    mraa-2.1.0 | 3 
                qt5base-5.15.0 | 3 
               belle-sip-4.3.1 | 2 
               domoticz-2020.1 | 2 
              fstrcmp-0.7.D001 | 2 
                libselinux-3.0 | 2 
                  rygel-0.38.3 | 2 
                     avahi-0.8 | 1 
              bitcoin-0.19.0.1 | 1 
                   cegui-0-8-7 | 1 
             freeswitch-1.10.3 | 1 
   gdb-arc-2020.03-release-gdb | 1 
  gobject-introspection-1.64.1 | 1 
             host-elixir-1.9.4 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
                   i2pd-2.32.1 | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
               log4cplus-2.0.5 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/80f0a7aa4b5453b5df80c5c58df99cc599d354d2 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a02990f0c8aee379869f4079eca002d793248731 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8ade6ffa6d5507c0a839da80e1f7e20e173da084 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a285b7c66d03d783cbbcfc8595761bab6d1bcf80 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/652cea7b664bb062a4f74d302026e6d45796fc31 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/1fee4930e67e68056444ccee2b78ca1733920178 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/247bcdf38e522195ca7d6accd5aedd7a115ecc95 |     
  aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c83c34bc7876fb9473221970de1c619301f754bf |     
  powerpc    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/63c931fc65cdd4155df998bb6ae76273c7d17401 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/127b9119f06978124b7e7c2d2fa37491a53064d3 |     
   xtensa    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c061a146dd449f2b9f80001860f05a0e7b299b7a |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/633d5b0abfdbad1d0f4eb35ca991badefb66b3f4 |     
    m68k     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ea783dfd032716519881f489f47df570f01f4585 |     
    or1k     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d5cf0605ead672cd0b361aeb3f50a57b1dc160ed |     
microblazeel |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/fb18106e032b1a5aa3140a10f4947c810b953c64 |     
    i586     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2cfbea9a8186b41a3c6ff8fa6a1b199389ec9cc9 |     
   sparc     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/574e5917197104fdd9abe8809fd3918d0225a1c4 |     
  powerpc    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c303fcebb629e5a7e3e4765d76b6ed9c014a99f1 |     
  riscv64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/fbab03d36e9e07789d8b47fe65e510c61a46f5af |     
  riscv64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/1a866e8722fe111297e4a99b376cf9975ee92ace |     
  sparc64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/c052d7c9753088ac731f89b5f4fe073c8646b3a1 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/b290f349f312723ed09f88fd436df2145b176fe0 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/9b5f4e9cc2863ab90ecc1663df314a4a01c78690 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/edc28be5b55c7a4868cf4bfb17e0a62cc9571c68 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/0e854e81dd247ebd8e540ec5609dd37a3c9bce30 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/3ba14884cc84775b7dc868613bccc4d8345ea920 | ORPH
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/234f5f472bb4618b8e7375ba7025d759fa60dc0e |     
powerpc64le  |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/fa695835d7499fcf2aed505df60541fb821dad8d |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/f999fb4a31597a26b0e80cdf008d528b997f12e9 |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/54571b286b9ee9d940f80ebe7c23f7c1f15cacc2 |     
    i586     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/91dbee7fc4cbccf82b58ebe74f9e09960fd8a48c |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/7139ef951d0c2f4d3f6d5a68f673adceda5f1dd6 |     
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/f7aa8b06ffb11072456b550250ba3ef8f0e18dcc |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8677cefcd63c091a040e6ebc3eb54c04ff493371 |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/cf6e222252263fea6da9a5c9b3ca7841d7bf7102 |     
   nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/eea8055999e8336ff3f8b25db60d066a52a5dacf |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/55e5a75f82a4e241a36caebb0f1b9cd7560da78e |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/dc9f5416238eb80a75894734334a254d9f5a7da2 |     
  powerpc    |       host-elixir-1.9.4        | NOK | http://autobuild.buildroot.net/results/ea76d1903a80443383058d98df6947c2f10a8c46 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b5bea9f01621aace0fe44f6641e887a47122436c |     
  riscv64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/f805ffac968e02e3840f64262ee42cce3e90f96c | ORPH
powerpc64le  |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/08cee8a15b0b6936b92da0cfa38a92891816f319 | ORPH
    or1k     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/bb53a785d61e5827ec3de39b8a6f3a879e79748a | ORPH
  aarch64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/904bd097c60ca78aaa7941088dbd7cde38060fd0 | ORPH
   sparc     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/fffc80b50fb1c121734d3eca6b45477b6844848d | ORPH
  aarch64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/42de944bf64966aa528001f12a90106a6aa8426c | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/2be7696e1ee226d1f89c4000fe33a8ffac96e142 | ORPH
microblazeel |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/35f86d310af2fb889052c73fd4f9357f79c5d97e | ORPH
  aarch64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/865604b403ced746110b75c679a9498cbba516fe | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/3c93fb8bbd3909b1ddaa884c64df284df0c44eeb | ORPH
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/e6efe8b3ef8cf1ebf0dc7f36a89e0de34c076390 | ORPH
   x86_64    |          i2pd-2.32.1           | NOK | http://autobuild.buildroot.net/results/45352f54c63d791138c9339a98e8420dfb7feb3e |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/765f1a02769119afcc1d85de0867e3985f638093 |     
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/325178761a2c51d2cd196ac4db7a2a8b7f4e63b6 | ORPH
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/69b3a04122beadc529bb4152aeb8956fc765bafe | ORPH
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/3e13e53cfbac9a08e112bd05748e255b46c22ca0 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/855e7d1d10017732ac020f66893eeef2438acf53 | ORPH
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/16a48dc41cc163e42ef5f6a3b93f0870676b2380 |     
    arc      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/7e2238a477b2c9dc3d695d03a0d2be0d55724f49 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/cea4a1b728d8f28e428d68c6c0bc15428572f36f |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/1387718db2ecd4c11afa794216676fffd2478f4b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/16ce41bdb3c8cbfc2396792a0795d8e349d337fe |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/b7719f6470728678ca37ecde0030bc17f3a4ed84 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/e6f230032bfd3af338bf70edf2fc60c50f3a5fc0 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/a8a9dc4f240f6934c9a503d2a229636b84f5569d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1d77e1833a0010088e96a65ac7ca19d7e8b5d977 | ORPH
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/87c21c7d8cb47e7f140d72a3a0a2418b4e90f1ec |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e0debdb482e90d9a4a6b66b825c38de86b061419 |     
 aarch64_be  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7fd228435663d813667c3215b5cd160cdc08e75a |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/8d4b0ee2560794f42938832acf65f70a69b25586 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/1e96d39259f52616ef611b38d13688829f51268b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/ecce6926d8c93ca9287d9f9acba841ac7c903791 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c1b3260302e1f7acea89666c54a0d3a0927395a7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1c1fd75b98e967f33a599634e856e1a924d3866 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f812c29a74b57b2bbd75521c3e549a0ed954d31a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b0be0bb5cd8f129d9f00ca1ac8bda1c28b8f09a8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/443961c8b529141dce16aa85a006b8ac284f3efd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/17d57fca5576abdafb7af274399490b8829e8876 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/2bb05d263016dfd3710e12435e3923ccca019a19 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e12aee800f3ccb9862f7fad5ceceb0171744225 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/136c502a7a3a44ce31a65bc8fea4dc2853b0c805 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/bfb85e907d7473f3453bfae388b5ece361761081 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/545e60c2b60deb2ae30bae1dd4c2ade8af205a10 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e2719f676adf6bd7c25d8421d3aab0c11f3a2f81 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e57e4f8673f6fd65ea39e111a0ac9683affd46fe |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/95f022245e5d2bfcc2bfcb7e84f6ceb8c447bf1a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee053376c5919dcee377695452e75b262ce6b613 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/86c4f9c16e3d90650170dc3934a478b11b785e63 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/7b4b91c69644736f80f6a11a1595cdfe32ca2676 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/d3bd03d2b503dbbb0b1b9b91f142bb03243c9e25 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/51982a9095bf865ff9d4d10b2209162757294ae2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/58a7da77273cf6c85db494653d7ca845d0ebcf87 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/5c9b8b8678e2067620f415887a9838388e266bea |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/fc2d0b3a7fc098bfbc402f8e78b77d127cf034c3 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/7cf78364b3b03a7eb36f8fba245e9cb9ada8d42c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8f1027224735f9f5b4dc716093cf2ebf9dcc0a7a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b3ea75622ab77c4351c7caa86c7c179bca9d120b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e0cf774e23cf7af6d9445e2888d726738b7d91ce |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bda3344f184870971f7717189fe58940ce6900d2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed80380ae64666c100dc5ec45bbd4975b0cc2a1e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/79edea791122d8c9447a8133824671645970b7cd |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2b886b56d0f88684228412d62984f534af2c1339 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/04f58feac255b33ebef81c494db011461c338bb6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9e5ae69838293dde2fe9ab7ff35f4b4d9164ce17 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/30803a166195d743228baadf065a1a873cb21b70 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/8875156a366006e9e81d6997b19de34dc5e65e9d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/84645ebde22d8a6297ff838a5a706b273b28da3f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/381cfee2b2dff30a47057d1458a8fdd574f068aa |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/b9c16d64d601bb9866318c1bc809f341049aace2 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/8b0020d44bd5103a8a1e42a89706ccdc7a8f870d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/368e8bf2e2a9e0e625ecfbbb367cc8cae6e1ddbc |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/df5b5ad42c5dbd595e60338557a8b71c3ff4ce01 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/85bad331d402914f497ee5c7dd4fc63a32773540 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d2dec963ce499f1f99577ddca8d797d3b478260 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e1ab735c805e157e50d8e1b54d819edad390cdf5 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/27e89571a82af24012fe6e7af48deeae131960d8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/476ac2016d5b40e2dc0a93a67868829d22555dfc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bc917f68385e61332fa18ece58216403630903d8 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/12de4d6630894ea2efc432eb5796de163d44446f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/302e93c0039843b2a5245aafe6e0117daf57969f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/af5562148b593987b1ec99a1a014539f8c0b425a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/816d9cf5c357ea4a7b342020221428dbd5835040 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/47b6ee9eca7750b8354ea8227979c937a567ce25 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/991f3177381b14fe5b394e34d98c25aa8fa63d19 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fa76d9a56f4e305c24fa94ec791e9aab090e7619 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3623a0436b9ef528a9da14c07461a5cb598d8e6a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e17f192741298cc05c57e367574737273f2992d2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a98b13e8224ceb6fcf7ebf0414570d7afc9805c9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/2f8f2e045efe9dfd49360e4c5e04b027cc6e71f0 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d5caaa5b1da7b3e4d30bb9e55e8d349c79d6bc52 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0d37fc129a2efbdc471cc56e31a023672a1d85ba |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/87b09a2c550f1baabaf3c1a7bdb4c5d594504c2e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bcddf8a976b4c21f572fd1842686829c8d94d822 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cbd45beaea4051bcd5bfe21d37dad836092a1fd8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b55dc410176b3c0111b6de0dfb304b64afaabc54 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/196ea22c43b58ce8d09c1c9ff66eff9b94f8914e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/95f8990962149846dd91735ea045920553d92a25 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9358812f9145d79a3693e54bb471fcf0845041dc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5825d9406d3c58312178890d1e3d5952a60f0276 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/11502e5ae969866ae2d5f3e3734e00ff969116a9 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f574ad9e5a81531c6c59c9868ab9585d3cca6648 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9c8acf67d2fc33a55e1df6aecd8a439db92ab70e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8d06e2d011052c83d0c6e446042a87a98ea3c8d9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a6619f164d4c0ceccd686af1b3c570a8c512d37e |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf8817abd4760ed8220645d73cc44d49ccbc6663 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d2a3f4a891976dba7b40b9f1cda88d1dc2784f3 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/df01f97642e7dca4192260b720a42a5a6618dab0 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/647d33444cdc1853b3969348a5f6c5542d94cb37 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c43aac2c452af8581bab1ed1b25ce24ba4453ae4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0d8fa027a627dee39bb28aae37fed96e45c696d8 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6163a5e2d07e7f0b25f20f8f2d2f4bbed357e05f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a8054f8d38d63b897ddcd1d2cc708cebd3cd886e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/51c0829855fc397eb77e64b09dc50ec44097220a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/3f466b0720b4b3d81733a3a6d5db885742351b8e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/adc025b6b34e75877816b690057356050082ce2c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b22de54eaec801075ccef0c319b718bfc1619c85 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/28a9c06ab253282476af57f70601684778bcd0c3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e0ddfd599f1e2612414eb5af07e21d13f8dd8fb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8693e48f4e60a339c7e6f896d61696d72127ac7a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/8b09225d462d5a854c79a3b2b1044ffae539629f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3d5a1043b763f88a1541332eb55a7bb8dbef33cd |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/7f2c7f3f0ae1666558103e5544a133fd9d1f761d |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e2ee32c77bbaff611fb6b1384901e0dfc786a8a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/63299a4eaba600854dc466adeef8cd62c63d87e9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b6f3c5592bf2f5dc7cdc2e1e27e4601c53484385 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c98f15a93840d9c3e2df38ebcbf896c83fd810a8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d31c2f54bfccc425fa17bf91eba5ebce0a46ad31 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3e5987b342f4ba15a04af0f4a0aa581c7dd6e920 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f210402a10ace163a855dc29e3f27b4d3b20099a |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/925b662c769fb916ece58a78d8cd4dccc698e8d2 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/152d2c5326d0f78114f782b94b10026246c1d452 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/e333699856df212d994d7bef32231aab506292d5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/740315948525c19550ce8451283a4f0c13ffe08e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eccc8cb15bf48c6b564ee580bb558b7fde9df927 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e14fc03023fb654d258b8cf2999fc789f1e61ef7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/e34411bd96f1713d8254f37912df742c009daa0d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/34b909e19dc4998aaed96cc185e43c29384e76df |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c73290a0c1362a04fc0be462915fdc643cc6616f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/893493039b226a8eab26c37764f6fabd7c54998e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7468e416e5f317d3339ed854eff17892f0d54328 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f1e5b84431f3ad5fab138a012f08dedf19f1db9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d1892e464ecda9861dbb82d83548e4d1c755d34 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef27abc95db58073c9ec486fa8f960ec55e36ecd |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fb2dea13da5974f50b71c4bdf3ecd1583d67d8e7 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/07abb0aa04b61665e4b47102c2e83ac34140fba7 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/250457e297b573985cb7b183e3a910d57818fcfb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c2ec03850f721d109628e98a69d66ee9d184d5ff |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/84f672b0dc80d7e87b0d6d0d97f1d01e8f2f7311 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/93667c645baeacf0eb04dddd247ef4915980b81b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d0b91a1ae4f42c5e887af0f5340db893b1c910eb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a92b91a2615535e746259e03e624320b3bbe9816 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4aa783de9d85863165622ee373bbda45de3070d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/03b535cc4fba2a3a0e07270c88255840d8ba3187 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/78831235b1e37509f401e87e9eafc3e7a83c4deb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/801bfa1399f6e84c6c718f4979bfcf82a318c639 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/afdfa9e760428585c6fe6d0914590b4c7e9b60e7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5473ac9012ea69d02013be138eebfdb2b04cbb0d |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/e20b5ceb7b0b6c338f2560c740ce962c1f803476 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  ndisc6-1.0.4 | 2 
             fontconfig-2.13.1 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
                   mimic-1.1.0 | 1 
                   python-lxml | 1 
                ramspeed-2.6.0 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/593fe23ee46ecdb4db7762dff86b8c5874f361e1 | ORPH
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/acbe509d061bcfee24d401125940448196d63ed2 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/675a040ed1ba06bf73f6b47a1e65be9bac4e4069 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0d2c057624272bf292f67b599b95334f400289d1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c8c5c1a360e34ba55d459698c71122c2d62bba62 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0fbd37087e3c57c0bfb4cfc79516095d4c92c868 | ORPH
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/50def4bd81c85fb2eabd33f944ae8a1c1b3ebe3e |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/1b404b02cf39dcde316f086b8687124442bf8d06 | ORPH
microblazeel |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/b84d91a60fa35bfe7bfb498aebcbf29c2e604b2b |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 2 
                     avahi-0.8 | 1 
              host-grpc-1.25.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3610d106569e39af4c5139095a347bfb2313bd7d | ORPH
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/af557ccfef2b9fe8fb571f87febe99214bebd389 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/608423c034448dfb05e94033b55d599041a76b00 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a88de6c465f5ebd3c6def7b4561e7735b8a61127 |     



-- 
http://autobuild.buildroot.net
