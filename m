From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Oct 2019 06:17:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-10
Message-ID: <20191011061741.90207220D6@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  1  |  0  | 25  |
  2019.05.x  | 15  |  1  |  0  | 16  |
  2019.08.x  | 14  |  5  |  0  | 19  |
    master   | 132 | 104 |  1  | 237 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 16
             subversion-1.9.12 | 14
                elfutils-0.176 | 11
                    bird-2.0.6 | 8 
                  libzip-1.5.2 | 7 
              libgeotiff-1.5.1 | 5 
               target-finalize | 5 
           host-harfbuzz-2.5.3 | 4 
               lightning-2.1.3 | 3 
                 uclibc-1.0.31 | 3 
                  cmocka-1.1.5 | 2 
host-google-breakpad-7515ab... | 2 
                 libdrm-2.4.99 | 2 
             libopenh264-2.0.0 | 2 
             libopenssl-1.1.1d | 2 
           libwebsockets-3.2.0 | 2 
                 mesa3d-19.2.0 | 2 
         xlib_libxkbfile-1.1.0 | 2 
                collectd-5.9.2 | 1 
                glorytun-0.2.1 | 1 
                   hostapd-2.9 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
        ltp-testsuite-20190930 | 1 
                   mimic-1.1.0 | 1 
                        opencv | 1 
   openvmtools-10.3.5-10430147 | 1 
                    strace-5.3 | 1 
                    tekui-1.12 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/5c5352adb222b06926a3a569449701fa86fd3785 |     
  sparc64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/faaecf4857431345761d131ab0e8d022458fd557 |     
   sparc     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/4b8de6157fbb7219678100cfa9725550dc763e73 |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8c12285b1933d715cee21c064c341a8b0a6dddd7 |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/99bb4685b214bd4ea3bfa5a8cf59c94b9b110ae5 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/caba636d1a20a9bf18b61b36ed2eb04cb1d6dcf9 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a0bc3ccac19a43f2c80f2f34cfafefaf0cb7a726 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/fa2a7a0827d853c1054bf925c2e2a221b6e7aadc |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e48b3901dc84dcf3b18e809ad151f45752608ec8 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d0f500dabb616fd037198da2eff065fe271663ec |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2ca273710567ea57b173f81118d9743e159c98f6 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/55c6c742c06fa6989c0178920fd7a3c4e598a4f3 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d97e662f8125f11db49bfa52973c65345bf86b0 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/24df5ee3cddbf295addc099bc1946c2fc13518c3 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/59bce889822c54d0f7e7fdaeef3323c9fc36d40b |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/45a20cd9a494c6b49380e6a2e37ba5788ec01907 |     
    mips     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c88cc0cfaad8325ece10e8befd7b8315af84d2b8 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/caafdb5371ad930b6ad4f99a9c41926b77051105 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f4b597de91496ba32ffc03e431022ecbf953d915 |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f4d0364d8851ae8f32f945459ad13b9da3435f66 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4e8cfce8f9fe491c3ac0c1c6070f7b2250ad55b6 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1cde8d011649fb833c562c228b562cc94f7aeae9 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/386c2ed029eb5d03b3a26528b78c660bf3eb09c3 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/68437292b7a0e6eeaf30ba2a23948c2c1d0db7ff |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/c7a336d0f213d9f85ee56e71fcecd6262f6029ce |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a8cd78d48fd7203496d652bd8ab3ac9d7e596df2 |     
  riscv64    |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/cd5deacbe6f4f97aa0bbc8040ac9aa7860ceaa6e |     
  powerpc    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/f61a31a74c3d8d6aa636976f1b330c8bf34eb395 | ORPH
   x86_64    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/824b909a47aea851884e87491c180fc1dfc95bb9 | ORPH
   xtensa    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/e64eb964083c9973581e5ef2847a963c11b194c4 | ORPH
    arc      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/af2db54640435677ae5e20df1a79b545eadca35f | ORPH
  powerpc    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/062a95aa3c4c6616e301dc28b743d41951fae8d1 | ORPH
    arm      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/85977510323875c32d919d8fe66e15cab08d1511 | ORPH
  mips64el   |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/02fd5b7432b72668605e98a2586bc8f475bf4f18 | ORPH
   x86_64    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/a40948e7ac0ff7c31054d64fa7e02efb80755b23 | ORPH
    sh4      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/a70d32d54569d61f3c41787e47f0658880f1a672 | ORPH
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/ef9df0bb64f23d1d1ddc30c40c277989888f9e65 | ORPH
  powerpc    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/5a2f561bdeb25fde5b97bf25a5e8c1af2a91ec9f | ORPH
  powerpc    |         glorytun-0.2.1         | NOK | http://autobuild.buildroot.net/results/2617bf58146caeaf3c1b17171dbce09217fb7a2d |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/44279c7f7ba1b59cf37a61b03ba399bfed8d1dd4 |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/28dcf9a34b147da1e9219b73fd9b7475d2cd77e5 |     
  powerpc    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/6d5f97773eb638f5ce0820ff3017a78cdc867ce4 | ORPH
   x86_64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/30ecb88360c6a330cdf1153838d92871bccfa72f | ORPH
  sparc64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/765d79e799c2088b80da28f77b44afa435b77a02 | ORPH
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/49479c4107ef2b793d438bdebeb4e70d4a8e8a5e | ORPH
    m68k     |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f880b1a430ebd6f97885103a622f1a4d9ec6de3a |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7629ea8bae3e30594ad1a3ff60ace718eaf5e5d0 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5d864bb19615fdc0f19aac2b0ddc51e871195593 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/01f76fa2bd8fa22ff155a2781b3411abf4eedde6 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/c982c057bab7bafb3fc7de38e2cd15c021cf3fd4 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/3f01800c561334c9647416df6258660b9792a8bc |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/8ba4860553e1be9f93d71e480fc59c2bb27ca778 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/d4da8a82f6c4139d19e75e4b58ed99a84368f83e |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/12b16b10b396327a7bfea9d504e9fc1a84ea6686 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/36d8a23f6e706b04c572cae0767d259c0cd4aa4c |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/aa75bbb0e1b5fa56ea4b6b3a36cd119df7eb2fb1 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/06154149fa85cbd14204099034a977851e06d176 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2ab039dbf5d01ec407966f567f30d5d14d9c1641 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/266e50fb3eaf1edb1fc430eeaa41851b435b48d1 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f7fa9ed320378273a093d163e7b3871c94e65efc |     
    arm      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/919dcd1c19341320353f230e831bcf56d6f92f4e |     
    arm      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/d7231631de8d16c8bd33a209ba2680539abbd596 |     
   x86_64    |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/ec5c390e5b5676fb849fb9d5bd23772eb4e06096 |     
    arm      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/6fd43b9a1598302c0b19820c5fa646e460bb56d2 |     
   x86_64    |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/7479543738701d612e926abbbc1dbed289613000 |     
    arm      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/88cf572e689ba1ea738fc561844b373a7868758d |     
    arm      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/23969b7631faf3954b2a94cf35de23f67b04bc23 |     
    arm      |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/e7743b742631dc0fdf42952c21a2cea43f891398 |     
   mipsel    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/05ebc75598627d2a08e08e194f51cb8464f97b95 |     
    arm      |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/399512b2c5ad4cb157d92a7559577cc663d86ee8 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/eeb2ae29d84e4031de4ad31d3398d632ae2283b7 |     
  mips64el   |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/c8c4d36db92788d2a57d6fcc5824105c63a97c36 |     
  aarch64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/1ab048ad7edc650bbcedfacfd1924032e61be967 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/8fee20e48b927207ff5ff001db1bc33ab161dadc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/68aed1fe69cb76e8b8f834321b32443eb35966a7 |     
microblazeel |             opencv             | TIM | http://autobuild.buildroot.net/results/c1966f03fbfece67ac18bcf43579dd0da53d5ff6 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7a97de31c1916940120bc85ac562a00028bdbcad |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/9b474b80ba767e522597f37869b26fd24998fb20 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/90992653cd376b9fd14b7f30f7709eec9a827058 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6c3a5d5cb4226951112da996f2616c10f36d6ff0 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/018051f2152bc66f6929a2fb094e1aeaa636dc4f |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6845d882daf164eb6b3b908eb0a839e7a6276922 |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5b3ab9d9cd73cc004718c7c8fb7bee8caa113dca |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8afda8ac87479fba1467a2ba963dd4512873a4e6 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8715538ffc753071e8e29a10b7303bc9ed7e054a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5b363ab4ffb9ce0306150356aa30ca067ba62061 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b84e0822b2557348b0da6136efa62554a787d558 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8a39dd64ba17f90ee7a9b0c5570c878dcd7541f2 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7e305b4c5caa77dd4b0d034f30f4e0449e7f7142 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e41353a046b29de38785437efdee735b6027c3c0 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8de0690ef6aa515db82ec1abf4cda713481ecc29 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/86b555e57c8ac35471f37cc4d26d5643ff88126c |     
    mips     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d41c1954a26e67f5542f22c6367f0b6294544a80 |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/556b2dbd6cc4b35c2e42211c17ce345e23668f08 |     
  riscv32    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a7a4453e72f1c1e8262c0c97667b76390adb4623 |     
 powerpc64   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/71dc8c8ed5c2b1c535b7a327e8311f8ac9b84658 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a115b7c12e6eaad96bc88dae776c5201e089df92 |     
   mipsel    |           tekui-1.12           | NOK | http://autobuild.buildroot.net/results/a00c015727dc1ac0efec2cc5f03a198b42e27b3b |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/97bfa8b47e90c9a2fa34dcfc06297dd55b0364e6 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/8d4433fccb953a5ae856734326da6d212ba9052f |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/8833a283c97a40a788b1e07670363f0fd94ea2ea |     
  sparc64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/bcdac2e0eccd3d720a5d5a49cb401f6b71ab138a |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/064252f85dcdfa1b57651e01c5b2fdea9fcd7082 | ORPH
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/777fce595c3b2cae93fe4fe16d0a1fe21b556518 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/70db530be56b5141ddf2fde0b22522114f912aff |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/fe7320bd31d7eebfb8c1c5046fe9ccd6e4a92878 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.8.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/b3d2087b7b37da4f11f1750ac6a29dc8cc583e23 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 2 
           host-harfbuzz-2.5.3 | 1 
                suricata-4.1.3 | 1 
                    vtun-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/8f8614229f5c8e2ba7b84ed1e1bc7c097f844754 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a0d71b189bd80ca169a6f6583b757c39ca1daf84 |     
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/59fb954656e6be90c310f4a318b9f09fca540c74 | ORPH
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/3359f6d0b479e4eb1117aba8e185d6e4798b0497 |     
   sparc     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/908707cdd16c5b89197c226a3e259f8943a5474e | ORPH



-- 
http://autobuild.buildroot.net
