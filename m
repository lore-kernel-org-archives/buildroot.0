From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 06:12:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-18
Message-ID: <20190919061247.E640B867ED@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.05.x  | 10  |  2  |  0  | 12  |
  2019.08.x  | 17  |  2  |  0  | 19  |
    master   | 92  | 107 |  1  | 200 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.62.0 | 76
            wpa_supplicant-2.9 | 8 
                     apr-1.7.0 | 2 
                    ffmpeg-4.2 | 2 
                      icu-64-2 | 2 
                 libdrm-2.4.99 | 2 
            python-sip-4.19.13 | 2 
                    strace-5.2 | 2 
                    flac-1.3.3 | 1 
      gst1-plugins-base-1.16.0 | 1 
                 host-icu-64-2 | 1 
           host-nodejs-10.16.3 | 1 
                  libzip-1.5.2 | 1 
           lttng-libust-2.10.1 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    python-sip | 1 
                snort-2.9.14.1 | 1 
               wireshark-3.0.3 | 1 
                 ytree-1.99pl1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f779248614cf70e7d50cee106d69c644f475618c |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/ee5396cc66326aa768c5c6cb7317d8a45e84423c |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0440e94ed68f265b3db9ba94d6fb3a37dfe8eda4 |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ec2922361e5cce5fda41ea10db7eea34371fe1bf |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/97d1007f5163d3d54897e092c45a4fa9f1fda554 |     
   mipsel    |    gst1-plugins-base-1.16.0    | NOK | http://autobuild.buildroot.net/results/b1bfa505bba534440d331c4948eea5eb2d165c97 |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/33e7a75daedb3a9063539e4a8d2fc748f61521e0 | ORPH
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/993155f6cd2c0d1c45814ab8855e357703e8e7fd |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1e9eed3d2d1fb25c36a91ae353ab3587a0f3a7d5 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/866b60ed0f97a65c430743524c011d9f39098c5d |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c14ab1d6bbdb4a79cbfb7a2088303dad75c96aa6 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b800bf70fdd1479b043ccf6af2c3b4d8f33ccb1a |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0fe81ae2f42d7b2ec42776ac83c83710a69dc4a7 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4ba96166d125177922b5cb68932ff4970ab20324 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/68191f4eef09a20ac6bb65c16ada7b10eef303f3 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8f8865f1e32ba346434aa1a13b2bfdddeea66d25 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0dfdc50ef845657d429add2b92f24734ee1a02b4 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4d80888c9a2f194620bc2ae2d0e7a88e8950067c |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d26f8d0d27e01bee3de71ec13e3f5b3120aa64f9 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b4d288f5c9630d57c4240fadefe1d32b5c5ac9f5 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/34809a6bba89d8f45720270a4e62554d35a3b783 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fa70f98adb30291a4ab5708735bd08e49ceca509 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3b9143a638d1ee0e0446ee332b2acccf219d695e |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bdd4482b3267dbde769b474365b0d5b64c83c940 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f5928596b481d38a7f3feb4b5a5bc97df97eceaa |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5a7ef392e6410c2de20977a11c7f4c4f8a5f62c0 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/feafdc81f8f1aea25a8ff91966d7da56c74e9206 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7cd0b0364558a5d9a13b0eef7d0126f5f66f3773 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4f855589bb20018607eb537bd116acbb6ecb855e |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/13330ed65087ac121515d550ba74f98171cfca72 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4c27b132198c8ab5e5ad1190abcfdfae0b435479 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9d4a71221a07b1431e28edd3477a1a924b1244ce |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/86ad39ca005c99f5b9f54750cff03cb87b9b39f5 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9c0d94e94feac7301f211a6f899432bb6e1349fc |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e80fc81b367a3a8c62c2529ede8ac9eef40c20a0 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/11bc009f08ce9f9eab958f485436f91a0b3ec050 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/126450a0c2f18db705e3e12a52649725900e92ce |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9122a55ebc390d9db842996dce28a0815a630427 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8c900c1e5ef82fe246aee7b4b768baa6fe317abe |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0d286a0e529a4eb91bb2760080581e20c36a02e9 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a4e5d28bcb68882b33428d69899bacc5a88665af |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d3a92abec02054f85f05fb260c2bedb8054a3078 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/25150692b5778020aee8a8db65869f2fdf945f33 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1681ea45569230e46402f954df63fe2e247ed7db |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/57d12b82779d921fcff158e2241c736e4ce5839f |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/06f9a7ed32878928ab0153e7e4a944e6437a9e5f |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2928b4aabbd863594b915a64e7a76ef5d8f8c681 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e53c0baa6a1efa8ac345464e924081bdc0c35934 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/211c031e201679834a06f4ab4eaadd142f546d4a |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d81712f236acd73709217c487fa0d4f529eb7c9a |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7a7b394411a37fe4825b99d30dfa5b59cb62977e |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/03e1d0c5b1028e475340170683d8bc70f3369212 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/be4cef0ca2c4f268708171a2f8ba37d89ba71762 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5c636145003d34e240326a02b682527e25e8fbd5 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2fdf7259bf1efe40fc6543e595b55ebefd63ae89 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/657ff62c654e32a992cd150928aea9da1a10ceff |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/83fee674338c7437cb9e0b59e8c9033c76a57a66 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dcc2352a036aba9650eae8abaaa23819fc67332d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f9f6b2413fc5ac9b849125f05ec73029aaaaa1d7 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f97854bdb9432244fcf68c36fd80b11df8f9a1eb |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eb97dcecfa2ccbec91d44e5c2c9caa2f876fc73d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fb8571e87bd35fe9731e14541c281203c9e45c29 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f66885a2823fb5795671f8b9b5398efa348223cd |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d4f213f46f46bddc6b223fe7ec2704c80e344800 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7fca256727f417de18ebbe893eaaf55ea925c6c1 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2be9e4057ccb86db0281831719cceb3af96bae42 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1aa7d126c2a65897fa6dd7beaf1d3f19c7aa8d64 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/756c5f3c00bda13547f617b7b8e2ca180447f0d1 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6ee569e6aa991602ecfec7f502abeb8d9c4aaae8 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c50f5fcde6843dbe7d2450bf789e67c3af61c88c |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/be4f33240b087b738f984e32111dab9d661d8a60 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/122b11ab29dc40ad6c5b31d40088e9c5e47b4ed8 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f0b010aa98c7aff0e93a56f302dc4203ab22dd0a |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/be5fc36e6b6317aca6b3ca11f968dcb96c83de99 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2a5857bff72e141f63b443d6f8b573adbc45774f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/89ad3cfac2ea872432a2f91d21e92a79f0dae933 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a2724f6d8418f68ba9105bef36d18cbd1ab926c2 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5cf4abdb657363fa0eb5857239eb63329192460b |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/17a4bcb09eb8eed84eb210a407f04a53c2953830 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3fbc5ad85576c226516a49558c01474049df0043 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c60d4ecf1d332f74b0423f24a73057c9c6a3fadb |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/181e32a3ecc8de59a40672973d6ed03156bddc7c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c8cf8099ba2e81b1c1dbc5ff82a9209c72770d67 |     
    i586     |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/bd70f76057b4b830f06b53f8f615e1a3a1d59fd7 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/84daf4f45858c259ab034567891a1528a9cfaf82 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/a9e8905032dae3fcde6c62bd7dbc0179ae3c7056 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a73d152f4d0e1526f8805e85d664fdf2cdb4b73b |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/dacb5d75b6efe0e977bba52d42846e0ff7a11c81 |     
   x86_64    |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/3033f190417a12fdde0ab2f361b0e6047ae8ac4e |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/5d53a23a3946988545f272f639f779ef48c78eaa |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8804198a7ec73b89c8a127716942615b20383637 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7026426bebef0de3d0cbe0d683e78ebe8255e6ed |     
    arm      |           python-sip           | TIM | http://autobuild.buildroot.net/results/01278cc216736e8bcccf987b30587128c7bca815 |     
   x86_64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/ca766120fe03786287b1c73578cf3a48de816ea2 |     
    arm      |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/7ed8598918efa5bfe9be4534599cc0289fe62415 |     
 powerpc64   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/989045d5ae2ad2e2536af7ed9577ab3986d34973 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/e7a3b0ef990902b57791e28aff89eb3e6685c641 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/86ab4083282fd8943b429f6e54af8c2ee0280e5f |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/e76895693c1ea3a2e9f4b142acf252857e03ca19 | ORPH
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/9de7e47bf75a830f962f85114ee4206f3eb9a642 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/dac47306ec189f5f64cd47c5a40c43226aed6ac8 |     
    or1k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f23cfb5b1d30eb63e4d11697f1124d724c6c8e83 |     
    or1k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f6deb6da8d67ee85146cd9345336fa588c21bdde |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e4b0a442cff7a7f6f472d9b05423c84b23b9d30f |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d13576d5f5ff6370f833ead186c998f1cf411f84 |     
  powerpc    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/59f95abf9bc071f9ec1c36ae21b476c81d0fd22c |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/9034283d43c29d1f3e1ce2b0d78f22487ec51edf |     
    m68k     |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/bcbd0b826d5af1d429c23255d63dce6c7080085e |     




Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/99506279644b98e70a39b1060aede6745b6f71fa | ORPH
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/224df857a28b76bce0a74ac9e4a3a90057485b99 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c73371a83978146119d71d8f71af63740092f409 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e9f33953ae80f39b484817d4c6475be5e164786 |     



-- 
http://autobuild.buildroot.net
