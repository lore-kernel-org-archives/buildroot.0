From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Oct 2019 06:15:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-01
Message-ID: <20191002061613.876FC21FAC@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  2  |  1  | 24  |
  2019.05.x  | 19  |  1  |  0  | 20  |
  2019.08.x  | 24  |  4  |  0  | 28  |
    master   | 143 | 93  |  0  | 236 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      fastd-18 | 14
                    brltty-6.0 | 13
             subversion-1.9.12 | 13
                    bird-2.0.6 | 12
                       unknown | 8 
                 uclibc-1.0.31 | 5 
                     znc-1.7.5 | 4 
                  ffmpeg-4.2.1 | 3 
                  flashrom-1.1 | 2 
                   grpc-1.23.0 | 2 
              spandsp-20180108 | 2 
                   dav1d-0.4.0 | 1 
                  exempi-2.5.1 | 1 
                     gzip-1.10 | 1 
           host-harfbuzz-2.5.3 | 1 
            host-mfgtools-0.02 | 1 
                 libdrm-2.4.99 | 1 
               libupnpp-0.17.1 | 1 
                   libva-2.5.0 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.14 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5webkit-5.9.1 | 1 
                    strace-5.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
          xlib_libXfont2-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/4bfe0504158a8b3e496df262c88105932629faac |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c2682782dbcdef9fa75cbdc77eff9c87d7d354b3 |     
    sh4      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/42cc0eaad83bd373be60bc206a4eed208adf3dc2 |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/92b947d0d834fd492ad5cd3099f31f9549e5b063 |     
    or1k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/aab548ee7880b96c253929a17133db03a3b07414 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8feab88ca9d36096a87dd75a7fea5a5e374917de |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2eca330ff57de0df235eb35b9023d8eeb0aa348d |     
   sparc     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/d9a4fcb040ff8d68c74d274851924baf5b20f3d3 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/af5b68c15d640bc22efe48f5cccb495b9f32d262 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ebf2b31c3a3d6a647230d2bfe32430cb7f9b103b |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/bc63108ba517040ac54fc82c6f9e71bd9bc8d194 |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/bef70778146131289f7d360760857b07ad321011 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c704fa2a49b0fcb88d281682235a44d7a58fab73 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1d2b43a54734b903339566e1707f8caddcd79d00 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/49849b7c7fca78409de0c96ad1ec536e26464486 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2417de275a906fd45fe530c77455394c414ba2c7 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/17d0fd1a73c8700195b745672bf9aeafa07dceaf |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/389b5838fefed3ee5c5f94b288b39fbc2927787c |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4ae05bf7a5cd60b6ac81c262fde6cbc4bf912642 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/89114f75b3eeefba1c1852d2cfa2b25dc3f168d1 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1af4df581a14f53a3d7278fa5e4833797ec42c3c |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0a2421b5960dc1f26e6e89edd6d9cd21e69d075f |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dd4142a99fc2f6b89f109219955151d1dd2513a6 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6ca0442a05f3518db739cf33fcde9bb78c4940c0 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0e6fc5818c233ec412a2300b3b4401b89dca3602 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/ec1efaf8443bfacbf26f9edd285e8a8b243318d5 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/04e2d86cd60130dae1b57db9063fd52990a57e40 |     
microblazeel |            fastd-18            | NOK | http://autobuild.buildroot.net/results/aa9e5500e5cad90515d306ff399cb1459c81b43b |     
  mips64el   |            fastd-18            | NOK | http://autobuild.buildroot.net/results/b930425628848d7267147e2efa550ec6ad50d886 |     
    arc      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/3048b0efe68aa004e7e821e080f2651f365f8c65 |     
    i586     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/7aa7d847bf5b443f6095de23d44bd168f5fb8063 |     
    arm      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/dba0e1b9df3e02fbd2261086189d2b6c483ce664 |     
    m68k     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/e6e01b31b54c556303dd55a087506e10ec7d25da |     
    arm      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/4c52ae461f869be164a1b68d07c03af0e2ac1cc3 |     
  riscv32    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/7e133fa3f21e77ba1274e66505082c3c87e0bccf |     
  mips64el   |            fastd-18            | NOK | http://autobuild.buildroot.net/results/04e90e7cf7ca2ddf8151d5518c4a4a3024437fe8 |     
    or1k     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/fc2e79b49deb416c54a73f89b541b8cb2c7f3b28 |     
  mips64el   |            fastd-18            | NOK | http://autobuild.buildroot.net/results/b7a2e4c686e38112b6ee9abfaeb9d22f11dd62ec |     
   x86_64    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/654e7c01764e7a62d6a84f3b7aa163291e7d7509 |     
    arc      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/33c5718724e7dc7754185d491de597a2d28e3b19 |     
    i686     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/5cd90b738423b376156e35cad2ee4100e2d6a758 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/3a5b6cb7a2ae999e756efab5414e70382060e275 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/d8ffa108b184181466480cb3439ffc65422dbb2a |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/7bf851d8247896ebf9f18e4fbe0ea7553ae6fb37 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/605c3d728dd736e409a270918e79f728c5a4b042 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/fb8d6bcbac9c63c630bc367b65311e9053a1f216 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/a82a946c8178052b94d4e76b7d5df99e48944b44 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/47d2120c7079280e919e263ac0e09aeab111b168 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/5f1984501ccbcf91ba6fc3e0dbc07087d5cd3009 | ORPH
   nios2     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/05b83c0e49938b4b6807edaae995b4b3925ff898 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ecfccabce283e935a9b64455e22ba9d062fbcaa4 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f8432955bb5b6966bff48b239b0d83bb22e7441c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/3130d7f4ae6bb95bb40458675830a1a23dc9318c |     
  riscv64    |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/79776104e681402c24160be15789fe67bb69f833 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/219c90f612ed23bb37135d70747b0d9ca2d2003e |     
    arm      |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/3ba4e19e64e010bacabc2cb55b753e49006855e1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d71ee78503b85486da0aae262cb5f07f90c1a9cf |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/c3fcd016d29fbd6894d4594764cad1a7e77540db |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/c6ff18e6db9ebb337fe9ff5d7e7f703973b83dba |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/5fc651063bb1b48af1578e725a7a75f122c93ac5 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/05c27241de85b29e7495c99c80fe593fd2d71d87 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ef66df43da3957765ca6ab79083631f1ee2de5a8 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a50e303f4dace6276ea5bdebc859c63cb3bc2eb1 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ed64620e16b872f8f4cc327ab0e261d2d89cddfc |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6d0940150eb61936f3df7cb463c3b21f12d98ba2 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7e2b491ee20e6e2d6225fe841048a49e43f7929a |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5a570c0fa81b0cb3403ede5901cf21edce7583e9 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1663cd7a79df3d964eb06315e5f9fea2ec742c56 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3faaee1864baaa0e027ad4aef84d83b74c2b925f |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e29992fcdcad94d46c67abf7c9f1e8e7cd2ed364 |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6ac70a402134b2a73a31d277881ca42a758c86ad |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/db511e408b3e0168c321255a0d820c4650cbabf7 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/edd181c7cec0d26350293e9e2a4203881345a075 |     
   x86_64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7048c4f4215ccb3a63a277cb207a875751396730 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/ba82b7c26a9686b1d5d1690c6579b52b1a9fd0ca |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/208d0d8cb2fbe7639b0964589240f586ce48adb5 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/e6082f0eb696f7832c77807005743f56153a9ec6 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/30963d64b6ed1da9bdafec1a921bbba5610ebe86 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/e040c3bce5efd5765c96cd76763ca5b8d5a0930e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/43077b8ab7a145f9773a0937ea43b0316f0e191a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/de4d96a36874b6b0e7c72c431d2d92d32cb0130f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/ac6421ccffc8725fbcbf0346c4a96d2ebb9d03a4 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bb619c1546894ab0b4f295825d3e45f7df992956 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c5897702d0be7c1a52e9a045f265c21a78149e92 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3b31c992bb9e6dca2bc46f078e0c1d12ea57ae25 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa1a42cd1040b0bcaba33da77cddd487bd49e6cb |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c7696e2c4aa999ba1b38068b3c6a6f39857c572e |     
powerpc64le  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/43d9cab396985ff3c5f6339dda308518621b66cd |     
powerpc64le  |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/165f9f948419fc69fbf6b9281d759b37bb7d40c6 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/c62cc065002123014b47e6fd487c61b406f50cc3 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/0a068a254af262a4c477fd4d10eac395a59f72f3 |     
   nios2     |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/d29b7afcf40803763229af5768a4d2246c57d461 |     
  riscv32    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/f971b1d662c790fb7d46968672d6ccad471f6cd4 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                 mesa3d-18.3.3 | 1 
                         mimic | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/e456c301d1f4395d1b95e635a4e010957b109b0f | ORPH
    sh4      |         mesa3d-18.3.3          | NOK | http://autobuild.buildroot.net/results/c190673cacf3d08e2e1afc57b1dbe59bfe6edf50 |     
    mips     |             mimic              | TIM | http://autobuild.buildroot.net/results/54d06822a93d1d50ce6c509b00bd649b3b16e5ef |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               wireshark-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/5fb8cf3da74525d0e82baa69be85d9506e594ac4 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                 libdrm-2.4.99 | 1 
             libopenssl-1.1.1d | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/62beb9cd329dfc64d1b212648550516dc1d04925 |     
powerpc64le  |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/ecda519730792f63e7421ffc1e37966f8b3049d5 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6ab444f5125c80a3511166ad4d61fd9fd6f24bad |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/dbeab657e30541830bb8cb3b7a494797ced116a6 |     



-- 
http://autobuild.buildroot.net
