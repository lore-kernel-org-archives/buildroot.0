From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Feb 2021 08:15:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-16
Message-ID: <20210217081519.DFB2D867BB@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  3  |  0  | 15  |
  2020.11.x  | 12  |  4  |  0  | 16  |
    master   | 115 | 63  |  3  | 181 |
     next    | 30  | 19  |  0  | 49  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                  dhcpcd-9.4.0 | 6 
             libopenssl-1.1.1i | 6 
                  perl-gd-2.73 | 5 
                libselinux-3.1 | 3 
                 mesa3d-20.3.4 | 3 
                  zeromq-4.3.4 | 3 
                     host-mono | 2 
             kismet-2020-12-R3 | 2 
          libmicrohttpd-0.9.72 | 2 
                libshout-2.4.5 | 2 
                  monkey-1.6.9 | 2 
                mono-6.12.0.90 | 2 
                  boost-1.75.0 | 1 
                clamav-0.103.1 | 1 
                   delve-1.5.0 | 1 
             gdk-pixbuf-2.42.2 | 1 
               host-lcms2-2.11 | 1 
                 iftop-1.0pre4 | 1 
                       kmod-28 | 1 
                 libgeos-3.9.0 | 1 
              libostree-2020.8 | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.53 | 1 
                openblas-0.3.9 | 1 
                    orc-0.4.32 | 1 
                 pixman-0.40.0 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                suricata-6.0.1 | 1 
                       unknown | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/c3df1c2358fa8e10ba194b2e05ef7dd3d64795a2 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/beb94161e9510cb17f4144b173572e26a3e8f18d |     
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/c86280850f4bbe8732261ea655ad87bf20170775 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/eea65592d3a4b81e595e5ea3eff7fcd01fa4ca81 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6da6348c5db6c570040bfa38c9269e8d0ff90733 |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d39f3a22a946d6ff79adf11f58d982fc40900781 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/fcaff478fde65bf0fcc851fe97b3ae2bf40ad977 |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a9a8575f025a370b287c163c57e73f7e42f6ceff |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6c49b1caffe055e2941c425a94d041b6c1ce840a |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/7d37b07421b38d7b0bde6fd56dcc64fe338161cf | ORPH
    arm      |        host-lcms2-2.11         | NOK | http://autobuild.buildroot.net/results/58a881969eb04241d9d8b32d44820ccde8622147 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/6b4930cd56b90df5392f3feda058fd8dd15ea74c |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/b14b44802575a12ca768d3e24ed5cbdd80222593 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1cf0e019f3631e96aa70449ce64cf2b475fb1e13 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3428ec0e74b6ae73e78aac8868f5aea086c89bc0 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ee5bd043adea4ea7acca3230427f0f8984e234b7 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8ecb7ff5a78bcd23c3c9f5600a23d0c8a1c59234 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/84fec3c53cdbbf90c42308ab04775b96d0bbb6f3 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/410543400c04205d81c039ce3d3ddb0441b244a0 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0134d2f9a2ba0e64bf20cf8c21b26f4f2d4e583f |     
  riscv64    |         iftop-1.0pre4          | NOK | http://autobuild.buildroot.net/results/95b9438af690c605ac9295461ab066aae1f90a6f |     
  riscv64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/16ac6c8760613722868d0d434c50658b4e321966 | ORPH
    i586     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/9af47959b6ef44f72eae21264f46343db8a1ca12 | ORPH
  riscv64    |            kmod-28             | NOK | http://autobuild.buildroot.net/results/9cc18e0723f94994d2c70869d80c699703770d14 |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/7f8b054e075c10642d27e0a768f0639490c65725 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/6a86d9cb30f3a2ec91fc56945f6766a8c3b72f8b |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/4371b2e80c0fcd9eea9001d4ecc03d2ddd89b92c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/0f2d83920c8c5c773bfe6d26106a4cc0b61cd122 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/317c099dffba528dcc062bed84e51cb94fc5ffa9 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b4ae75f3515748f7fe97579df30bf0580e3e01dd |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/6ba1d2d48f613e16e0467c24eb4fc46580a245e8 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/53eb2f24fdf619ddff62b7ed9970c1b1ad6c6ee6 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/bec581e4a15ae426bf2beecd0ad42dc1eed9b00a |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/8cac73c773eefaed2e2061d962e5adc5b6756cc9 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/c3f6b86e0ddc2ef1995a3b013856fc7b4cec779a |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/628c22e8c0bf1cd80fe4ce494f756239208fc086 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/30597a113363c8f6c357ce244b2b87b9cc6ebc91 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/1ca2ab7a1a17ee717e0d53b2ce6ec976734d40fd | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/3cf94f9e3700bfd453bf21f10d5a41242a3200a3 | ORPH
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/b9f66317839d45d9f2e2ce75c6b9d789f1a88573 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/58ce5e44a083d1d68e08c2b64a5a3dcfee8b0436 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/b234a73bedac011f4fcd5fe1ada77a7cc35ebe08 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/330faa84d1b0aa38ad3f791a2d11fe2a951dadaa | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/e35a5879ff222aa30d037ffb7b157f6932266b51 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ee1e4f0e50111e9c8299282e8b856c7618dc02fb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/74b40500ab69d91d3346742ca333b9c7864abc99 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0f647d5cd2a97d0166f281c693a69c45df70cdc1 |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6991d59b2465668357018fee87d805371225907b |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/2b4ca74332272d1f70d569b2906625a2efe40069 | ORPH
powerpc64le  |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/91bd880289fda80da1067dbb16a18a38f7221467 | ORPH
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a20d152498838543eadba0c4bca6298685f2f1c2 |     
    mips     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/da3ca334c3130b92ad88518c89b87a1f6b92c0d5 |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/900f37c758284c5e43f19dd4476d24942cc0be0f |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/31fd0fc918fe6d9ad2d73180af70d7477d08bdd5 |     
   xtensa    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/fc695c00dcb595e00648b8e92e35661825a76035 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f0283116037fbb4f76d1253b3d27a3421133a032 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6fbf56b2bfd784881c448cf52045bf89b961a7b8 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5d1b896b8fbd75bf526e01264abb81eb0b8a3bb5 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/ad8c3721c0085ed189f82921b1eba1efd09089a6 |     
   x86_64    |         suricata-6.0.1         | NOK | http://autobuild.buildroot.net/results/fa58978de00919db3d91a772565aebe4a3bbaa13 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/ff65ca087814d2059493cc0e701ac4ce44a9a362 |     
 aarch64_be  | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/36773085f933ab2ee558f53a6c0ae5365077ad5e |     
   s390x     |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/7d4b59d040378ef570b23cb699aedb36278a5b17 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b803e1e91f3a71f7a614d10d350c703e006391a7 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/238d83b54fd1b1608001358941e6db74233a04ab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/78e457c68785cd3e2c17280514cca7809b9fa96d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                     flite-1.4 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           flite-1.4            | NOK | http://autobuild.buildroot.net/results/9b5fc5a044ba0dea67b19da3fdb96fb1bcc90669 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cbcd9f70cc73773387cde455a906ea8a154d1411 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/ae45f4c33f911cbbc1e3b94ea41ddb78f719f135 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  autofs-5.1.6 | 1 
                clamav-0.103.0 | 1 
glmark2-c493520253fbfe3676c... | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/e783e8499acde2dd77ef0388dd39b6a29f6824b7 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/863feec4d2e5034c66fecde8aa09a896edb7bcd0 |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/bfa11729a63775db870846cfe9497311746aeee1 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/930b1d8ef6e0c63ff3982511deb249f649e28d1b |     


Classification of failures by reason for next
---------------------------------------------

              netopeer2-1.1.53 | 3 
                  perl-gd-2.73 | 3 
             libopenssl-1.1.1i | 2 
                  monkey-1.6.9 | 2 
                    mpd-0.22.3 | 2 
               apcupsd-3.14.14 | 1 
             babeltrace2-2.0.3 | 1 
                  dhcpcd-9.4.0 | 1 
              libostree-2020.8 | 1 
                libselinux-3.1 | 1 
toolchain-external-linaro-a... | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/868570f27feed530a8aee84fdaad39dc342f001e |     
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/f1ed7f36649a1d143f87befbc6cd1c1e3e4d3f7e |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ebfef8d25728afabffbe8bb08a93f91f90d4aead |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/2e36613aebf6e6b05100a4e0a8fd9be62e6921fb |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/1260db18ebd243a7a90b5a09de45a83df1f79e60 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/6aa03495b2c1d2a912d230f2bb416b33c8177a87 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/91cfbbc5f4026c6863cd39fb68173c76f16280cb |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/25560ee194bc2c26cc16af0130daeda9a383e219 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/38bbbae0318291c9c9ce763b3a54c92a9cd46b35 | ORPH
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/df8e7c1af0af2477517f682359d2e5f1d2354494 |     
    i586     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/bec9bbbbb515355cbb34b674eeed8c3b30a41aea |     
    i586     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/96f681c78a7eab64686ebbf0e55021a5fbae9dc7 |     
    i586     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/227c81487d0ef8853534c17c14a6c0af5eb9088c |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4718f46f859e6cf6cda30693ac7253349aa9f4ac |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/aded8a66ac5b6db82273e356880c082718b24f26 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/7a653c64df82cc2eccc9ac19e2de286b3af02b06 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/225ebd91e5bf95ddf03787a8cbb658cfb45d0a3a |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/b7d747eae1f30a7a0eb162f59a770bda308c3e5e | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/bb1b552861c67dab9640da4bc9c5218107643188 |     


Gitlab CI results for 2021-02-16
================================


-- 
http://autobuild.buildroot.net
