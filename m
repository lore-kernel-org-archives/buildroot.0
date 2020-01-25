From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jan 2020 07:19:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-24
Message-ID: <20200125071936.EF20788400@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 22  |  1  |  0  | 23  |
  2019.11.x  | 15  |  7  |  0  | 22  |
    master   | 108 | 86  |  2  | 196 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 13
                 libnss-3.49.1 | 10
                    parted-3.3 | 9 
                    brltty-6.0 | 8 
           host-doxygen-1.8.17 | 4 
          libpam-tacplus-1.5.1 | 4 
                      bash-5.0 | 3 
               acpica-20191018 | 2 
                apr-util-1.6.1 | 2 
                 exim-4.93.0.4 | 2 
             fontconfig-2.13.1 | 2 
              host-grpc-1.25.0 | 2 
                     host-llvm | 2 
               libupnpp-0.17.2 | 2 
              spandsp-20180108 | 2 
toolchain-external-codesour... | 2 
                     vlc-3.0.8 | 2 
                gptfdisk-1.0.4 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                libgdiplus-5.6 | 1 
           libsamplerate-0.1.9 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.5 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.3.2 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                    olsr-0.9.8 | 1 
                qt5base-5.12.5 | 1 
                 qt5svg-5.12.5 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/f3afc2d65eb5f84be2d95c7f57940a703055c941 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/e349fc897a826a4307ba0271b77a96e98320b8f2 |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e31e1a6aa1fe76f14fc1b5b12aaf89fb0d32aed2 |     
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b745c12e0cf26cf5d62f1179c09554508f729263 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d5636093555b274b680a4da0cf6b27a98a31918d | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/6c855f78148a7821350a2ee1c40ff4b3080f2bbb | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d67f10b739e3536964f392ffb50940ecacb5c713 | ORPH
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0d10a9ed3ee4c566adc7f3dc36d8cef3d3ff9707 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2620371643626527ad6b4c34525a7edfcfd4e59f |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8a82cf74e283ce84905683cded36d68a3498df97 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/741937bf6a684fd7a855d70ace75f5c57b16d089 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/10dbdf937f8a4d0bc600fa78b7aae8327d1c5156 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e3949a6728e594364da024fbc89136f92c4a3f4f |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f6256217cdf1fbf6ad24c02028bab317af6e0543 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f1486a54ae4c92d469c355f3d7632e193d325396 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/b5dac7faca66be6e70d0fbcd45858ab6fb3a36f7 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/c14a0a77ce2cfe93194b7a0d28255ee168845fd5 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/702dcc9b3df547287a712c9aead38c73ad9778b5 | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/bc91c154cc7f2a85ac75c6cbd6e40cf2afd18400 | ORPH
    m68k     |         gptfdisk-1.0.4         | NOK | http://autobuild.buildroot.net/results/03d7f4c955f55b4d15b51b55c8e779cfaf25c089 | ORPH
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/50194b548c27ccb597605775e843e00724ec21e9 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a35767667715ae93c7e283704f14bc123bd38e19 |     
  riscv32    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/1b7fd0c6640cd9094e46d3fb28333eec7cd2d5a5 |     
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/f514d4f61ad2bbcd75811461c638f4bcd37c12ee |     
    mips     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/3466c0d705285a64fdd9700ebfbae1e12a658735 |     
   mipsel    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/dd619f0cfeb104f8c4c3501a55bfa63a196a2113 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/61f4abd6021213f0f85e796a98ac461f64bbb939 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d5620c8383bd5950f0953d7489a5ed6c31c3e67e |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/beab06cdf552c50370463b2ee89642b94c916ef0 |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/8c84265511f66e06ffebdd2b1cef8f772b8fdd80 |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9d9aea70c2d945aa7ffb7dbb010cb752b5d0f8bf |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/bdebc413a0e5433cac385e3e5d4f9a6502fbdd56 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/cab1a156aa06c13c19ed528f18a7b89a08dd90b0 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/554b6c6ded3c50030f7e1be319451770620c3cfc |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/240c9c62d42e65d1b88ddeb368f0fe25188e5679 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f8866cb91abb38aa11fa72e59f0c15a54c154144 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/940d437fba421a4499164dffd9dc7b1f194698cd |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/ae51768574ff2a318c6917d188d7158d9e02cea4 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/a05a2e38e54091d147b8e9e9692d0ccdfeed22f0 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/913ac0a43e9125e8e294f860d1263aaa54bf55a1 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/fc46cbe4d35c67e18bdf679bbf000c10c9f058ea |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/6d9a5edf23b0e4617a56fea3ddfb0fbd6f55d2ec |     
    m68k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/16a1bc36d3f1dc1200e3682525b449165d5d780c |     
microblazeel |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/594ff1c20aabdaee806a5f31465b99b022c8b9a7 |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/73f73cf9d903173e189e45a15249ddf0f894ad7e |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/9e946ed8b75b3ba48e662058855a5dc695e86931 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/6f3ef4ec81dddc5f44e30014e6b302a906526856 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/955ad837d44f11d5a325a765eb3f036bfcb46317 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/96e83addce1fc158f4f56ebfa391698232b480a5 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/f32a80d065a0d891b024840aae564aad5164cafb |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/adb2b8d12365f3f4c94d71e7ee7d6e653004fa13 |     
    or1k     |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/0889db276e17e0bc3332609e8c1ad035bfbe6933 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5b38f4171cdd9c155f704206e52de7967484a07c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7697cb8fb95b75a6b87a9627d64bb009dff56f5e |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5b8f41da2219f8b83518bba026ad732e11e574ed |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a915ccf7d3fcfbf79be2bcae7910780ecf3fe0b9 |     
 powerpc64   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9490953ac54d6f0795c4039672ba7daa94915110 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/85cf3223760a40098d2bb1a5061d076f174bc2d6 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/39588f5b741d72ca16d275c36eaf677630acf4a7 |     
  sparc64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/95f8699c1ccd86107733d84084d0bb69d07c568d |     
 powerpc64   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2877f39ab12edabc4616336a5fa1ada62c547e8d |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1582ced8acc7f7c167bc55936cd013c1b09293a0 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/573ee5ccf65beaa007fe34df6d2720eaecc632a7 |     
    or1k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/cdb6fcdac5258c4bb5aa041398f4f13c27edec12 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/56a6b8522ed088dc52ef47a06964084acb9d45ac |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/05ccdb666d221d10ae8afa0700ece3f1ab0b322c |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b4e51d6169841453dfa773d832c6a1ee36271a5f |     
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dfa556cca7b12feead70068bf610c491ed6846a8 | ORPH
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5a6c55d45e2c40f82687b02fe51c2b7f5b904082 |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/6dd0d98f225d3a13aba42bd7dea3716e16b8e3c0 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/a75a250e3232e0e4e4c28b1032abd00cf21b8dad |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/319639ca6b7ba1e8fcf8e5202387762d8c3f172e |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/9b3888e318256e27ddfbac883d7f555ab2b5cf4b |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/26f455af8286ce0d6e64af5044cbff20d86fcab7 |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b895c6beb66e6bafe48ae09f7f1d18a1e18e459a |     
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/87c162f41cdbf3e6c75db2805644eabe7efaf0e8 |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b0ef1348e5026787fa0190f4aa3c5b334b0418b8 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/1d67591802ce03d04d99bad45f4780b3695fbb6f |     
  riscv64    |         qt5svg-5.12.5          | NOK | http://autobuild.buildroot.net/results/31b5989e562d08a5f4862733576a1a40236f4eb4 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a08d36c073e6e6ee5f6561188ebadd2d10e74bfc |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/628e2826221a1adf31009898f81953a8da6bfbae |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/b2cf03e81f549e07572809a5320c81868bb3775a |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0983533524f64cad660afdfeb56f431c7ab93db9 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/aadca937ee54746c5e3eb761c3371b9e0c4d0258 | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/eda9865be6447eea67313c6142ed85899aa23a6c |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/85f61c78162201ca557b6d3e9767ffac738e74e4 |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a58d95f22b9729eded8460287ef43e1599fa39d1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/322b809008e4be82d08a1e46312570d7f506b12a |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/7ac1f90260b2624ff17fbd29f718b4f726c19cbe |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  gmpc-11.8.16 | 1 
              host-grpc-1.23.0 | 1 
               libsigsegv-2.12 | 1 
                oprofile-1.3.0 | 1 
                snort-2.9.14.1 | 1 
toolchain-external-codesour... | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/341c7502fee3d86e176366ac83dd4e541db1cb2e | ORPH
    m68k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/47043f49bc11034e0767ea3ef98b7c3b0ff30ce8 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/ce9f95ba64ba0a2eb58d05adf182b3c954a18d01 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/c2cae595a5a6cb9f55e51a29dc0073ff9632300e |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ba98db545f4b70c4096a07eeb2aa6558419fc518 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ea76c985066b75363171004bd881369ec1dc8aef | ORPH
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/2882ca7aeaed21cd6a01860f915e7021dd3e2bef | ORPH



-- 
http://autobuild.buildroot.net
