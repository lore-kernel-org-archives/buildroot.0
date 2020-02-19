From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 07:48:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-18
Message-ID: <20200219074844.F3D6C85D78@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  4  |  0  | 22  |
  2019.11.x  | 19  |  2  |  0  | 21  |
    master   | 92  | 67  |  0  | 159 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   erlang-22.2 | 9 
host-sdbusplus-4212292bcf13... | 7 
               libglib2-2.62.4 | 5 
                apr-util-1.6.1 | 4 
                    brltty-6.0 | 4 
toolchain-external-codesour... | 4 
                libgdiplus-5.6 | 3 
                       unknown | 3 
                  cairo-1.16.0 | 2 
              host-grpc-1.25.0 | 2 
                   libnss-3.50 | 2 
             libopenssl-1.1.1d | 2 
                 mesa3d-19.3.4 | 2 
               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
                      bash-5.0 | 1 
                    efl-1.22.3 | 1 
             fontconfig-2.13.1 | 1 
                    git-2.24.1 | 1 
                gptfdisk-1.0.4 | 1 
      gst1-plugins-base-1.16.2 | 1 
               host-llvm-9.0.1 | 1 
             host-pango-1.44.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                   mimic-1.1.0 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.10 | 1 
                      tio-1.32 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/81ee33eb606062a62765d95b66a26f130d280c53 |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d10a06addfdd927fd2ac772b25aaf9a057d20158 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/16d2a2efed3b13ca648c83b64150da4c2c53afd7 |     
powerpc64le  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/603f1be80822977f3181c99b8b01b3f2d531ace7 |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7b4780dd10b471243451f7f89c6b7de0c7e7ec4e |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/4e1f7f335d2c853e2a5e6ad96c14157ba8f003c7 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b9edb405f6cf3322ddbb640c8e89cca57e840fc2 | ORPH
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/16129b6d867578fc1cbcd36ed3a6cad806c21b10 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7442b75921b95f5772520b62ff4004bc98251ee4 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/979be1e697bb75cc018141e8fa83905696e738cf |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/240de32ee2a20b56db535147c98220783c48295f |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9552e97cd64c447c8582efbe326ddafa42bf9a01 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/976d99bc9b052f8d9429e666ac7fff7768ffff6b |     
    arm      |           efl-1.22.3           | NOK | http://autobuild.buildroot.net/results/4d7861fd5908c59546de19f6af3c27d061fed60b |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3cd8e2c64e8051a95e0e097cdd0878b00afacf8e |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/edde1b609fd6b0e6be9870f78c71a6ababa49884 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b24891ac2f7b661db63c54f52024efc1e23f0339 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/491215f51a2f1c725099c53685b34513e3ff55e7 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/d3552e742381c737e5cacc5ca421c154ef93cde1 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/385f0b988fc1ffbf918fb9adc4dd556b2fb367ab |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/26137934eb18531985f5b648f391501835445331 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/32b5aacc2cae822d169b9a61ec4d7c1292caf877 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/cc1e3df1eec85a9eca98b992f646061fb888512b |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/4a5a8cb6411d709acb7ea8c83b3c8e45fdc0a10b | ORPH
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/432a2766836107ed5536f861a8fbcab33e1f8cf6 |     
    m68k     |         gptfdisk-1.0.4         | NOK | http://autobuild.buildroot.net/results/6db5f9d8663730a54b04c1e624438095598b2573 | ORPH
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/b97923f7db5e0d7d5609152078573360937e0318 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/89a2785352caae69cdf6aa02d55475aa4ed506d1 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6e8ef0be643e030434474b58b15b3eff43081e5a |     
  riscv64    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/b922547540022a6fbde238053e2e5373a96ad48b |     
    i586     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/30699ba23805d2b267644dc321b8aaec72a6bc89 | ORPH
   x86_64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/bc06573718c7b05bb2ea081089cb3afa6b3cd2c2 |     
    mips     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/929fb828553ca99c9fe3480286627f149226b857 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/3cba9e7e96aeb5ca6c68a82b972988a7bc1dc87a |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/0e67255cc1b184273749e8fdb721f815b144031d |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/6216d389edff9893f8f791ab2fbfe46d8e1276fc |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/34644e28467ac49eb4bc676ac0eb48c0978d4eb9 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7ba2762786c08231a69a07558274e52750b7627c |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/17cb7ca0e7ca1359fc2b575a6b6c93d493dd54fb |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5b619163f23e356c790a04c027f9b9ba8b650c43 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/d9dca72127a005952a7f97ec0297cec2fd3968f4 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/68b4aa933fd5a60f4ac2ea023079053f805c621b |     
   sparc     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/279f4f8f293a4aa73b6534e4cbc90e5583951daa |     
    sh4      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1610673bc92f3cab2b858af8c4b1d0b6c871e614 |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e27bf4715cc68ef976b2124663cc1c2d08a06d04 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/b43ef2ad840c5bf897d0453f86026b58654f9377 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/673d2a580afb774c39faf69c859418579cefccde |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/7afbb81c0ebc93a75ec58c067f9758369bcae5d6 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/f9d3d8534d090a575d163f92920b6ad6cc1531a2 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/acf87e81130e85e7fb05edf5f6dedf095f16e226 |     
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/67d341c0cc272323d6e231a20796a6848c21d760 | ORPH
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/49c150649fa50e9dc67939e072cd5a1d3a7aa661 |     
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/86036e0e4e29eeffbe4aa10ca6e075155b675e72 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/61f53630ed85ee0d0d6dbf71012db77f4d7986ad |     
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/8c49a36b1fe423561473395d8f055c90436d2a5f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e0e7ed448df8bdd6cb13a0989d7a6c7dbaa5bc4e |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1ee145c19ee2cd5e6c237bc2864bae75e9ee4115 |     
    i686     |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/0996643e6d235168ca77271f15b21f8c167e400f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7612824c472bd34f352a83aea50a9707442b1b42 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/cba93a681d10692c4e4c5584e4c962bd18a608d4 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/efd344724a244010e3411bb6599dec42adb8acaa | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3f7c9d3738db5154cad27e548495643225dde0bc | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7513ce8a3c501aa31aa1bd1a9908ad090b2b11b1 | ORPH
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0c62cf7edda5c811c7f2eda6212d3889f2920df |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/593c94c707508b549547e4b42727ce669229c820 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/47667ea26dc4ed87d4aeb4ac9ae86fcd42223c6b |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ad8058cd98378d8813ab72bc292c8c5b9e41d7a0 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 2 
                gnuchess-6.2.5 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/8f14ccfe6d011f8072ce46313c8cba5bfcfefe8a | ORPH
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/c6f28e5cdd042f26f6f0130b5af39639f90a889e |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/34cac8b28614b9b6832d3f62e561ad6269be00fe |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/de6f8318eee7b7c56b7600b086aa150f7f1d41b2 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                oprofile-1.3.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/9d9c718b36d476976a828e5d548e6a431e1c55a4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6389e1c454ab7953603165d2d1fe85a408216db4 |     



-- 
http://autobuild.buildroot.net
