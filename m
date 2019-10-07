From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 07 Oct 2019 06:17:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-06
Message-ID: <20191007061745.32206866CA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 27  |  0  |  0  | 27  |
  2019.05.x  | 21  |  3  |  0  | 24  |
  2019.08.x  | 28  |  5  |  0  | 33  |
    master   | 142 | 127 |  0  | 269 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 28
             subversion-1.9.12 | 14
           libwebsockets-3.2.0 | 11
                suricata-4.1.5 | 11
                    bird-2.0.6 | 9 
               target-finalize | 7 
                 uclibc-1.0.31 | 7 
                  ffmpeg-4.2.1 | 5 
            host-mfgtools-0.02 | 3 
                   hostapd-2.9 | 3 
                 mesa3d-19.2.0 | 3 
                    strace-5.3 | 3 
                collectd-5.9.2 | 2 
                glorytun-0.2.1 | 2 
                   grpc-1.23.0 | 2 
 Makefile:743: target-finalize | 2 
                  exempi-2.5.1 | 1 
                  flashrom-1.1 | 1 
                   gqrx-2.11.4 | 1 
                     gzip-1.10 | 1 
                 haproxy-2.0.5 | 1 
               host-qemu-3.1.1 | 1 
                      icu-64-2 | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                qt5base-5.12.4 | 1 
                snort-2.9.14.1 | 1 
              spandsp-20180108 | 1 
                   systemd-241 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/76320e3d196318ff47577cf4f94134bcc442df4c |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/9a4e8a72c2240cd690bdf34699753b852b2cf772 |     
  sparc64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/84b57337cc5a0ee331608f42ad75ee384469c52d |     
    i586     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c5b756837965862f8570895a1093f831bb8e7d4d |     
    i586     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/92216b0b7cf01172e76f5c311849498115e28112 |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a612af646db5323aa45894023932de70759d032a |     
    m68k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1935bcacdce58554774796c9adf8c1d0cabc1414 |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3523217cd00318b6a3b9ed1f6aa20d86e2f3ae29 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/5ed3ddad57b051b5e40e62f268c570ecc42c30ae |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a59cab91b40608dc07336a8342abf3f365257802 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7bd9ec18b61550f170d8f5d2d9ea15c6f6befff7 |     
  nds32le    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/20ba170e1878bce13c5502a810355528b252ca51 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/25279ba6f382c89a7b50b8ef4d73bf42dc1c13c6 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6e40e34bd9f74b199391be42691f301360ad396b |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e4df08747e69d866c96e84260ad214caa02e4b16 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0e195db255c33e53739e8f107fac1bb0a54a50e9 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/153a4bf8dc9c026955eb9221b089b2e4f11c3a30 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3bd21083166a2417e0829e21bbd3ae98fe090dc8 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f5a57af9f8274f12fa4df9691aa2ef0cdee2d172 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/715a596c7b1c627306be54673eb2a11f8420084f |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/25e200e8bf67a96b8db11d46ca9f3d087c743639 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b3f5da649a65bfc40ab24f867244f00b85905717 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9d7852fab286f82258550eca0ee5914571a59b79 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8fd3121a25b74072d1a925a46fe08b65ed4f8f24 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2fccf80e5618ace2a8608960a94e9308c397610f |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8f761cdd3717eba4f96494b38502c9ceb73b7a5b |     
    mips     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c78ba8198e5369d508b4222111ea43169d8c36fe |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/55d2aede7336501ba0963b1f3aa3920b2c9e040c |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/40486eb50430e2719df08670cec3c52b8cfc93bc |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2ef59d34b3583988c9b3bf03e27606d051241534 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f1148d27cc4c14773bdd070c3667cdcce8101f1a |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/77b7955397d3138b1483cbe3be51c81ac971cff3 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cca272415a4ece3b466343ef12f9056af04fdf5d |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/513a262010b2e6a3bdb6d0e0dbe706380dce74a3 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/347ed49350ac41bebce11d91ee29ba90f00cc524 |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bc049c131cae021464613289116d580b9f6f3976 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6004bfe44b914c03fc96e02401004fcb369c6cad |     
  mips64el   |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/17f6c1c86cbc266098a71fb8ceaa55beb1e9d0e4 |     
    arm      |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/a281447b0a4c28687e2d739b6336ca08eb829663 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/60385358278578e8d67ffc34f15bdeb154667001 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/f1085435091b9c77a156d1b180ae084973131411 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/35208357729de93c2c14c9150f7e5b64b9cbadc0 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/da65c4e0298f197981e9fdad614dfbfb3d407c16 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/ab7ca589c6919ed7b8f579d7ecbfae59897eff92 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/255a335135f5344e7b7d3925321699a94adb5795 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/178b950ce0c49788f87e25272673bf49b09adc6a |     
  powerpc    |         glorytun-0.2.1         | NOK | http://autobuild.buildroot.net/results/c50ea1afbf0b1662c8293dde6693f2192818930a |     
  powerpc    |         glorytun-0.2.1         | NOK | http://autobuild.buildroot.net/results/198a853c05e8536513eae5c423a1045c6b1b5023 |     
    arm      |          gqrx-2.11.4           | NOK | http://autobuild.buildroot.net/results/5c5ccfeb114d4a314f551aa337ac0b0a0c47e680 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/2e5ca2c7c624366a3eb49e61e20b2bced41e104e |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/75112067f2453b773d3351b6d20518a06b8df828 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/750cd527740ab9698d538749ab282aeaa61117a8 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/a49d9af12b4d07a364280de6f3a5cca2ad870359 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/f709d19cb84d1769329bc6187b6f1441195e8c3d |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c7956dbd9b8b073b84931bc35a81fee450eb7403 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4d3ce3556d08a47cbf6443a0e45d31e2fb104127 |     
   sparc     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/88cd1cb403570895bb4356f04d2d1aeb5417c953 | ORPH
microblazeel |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/9f2f6a942cf0e25c64a1297bddf4ef29d8ccea68 |     
  sparc64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/e750e7adcad3dbed06114b8e0fb1dc798348204f |     
  sparc64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/71aa92578622a266b4bed92b66a65438bc32cbd6 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7935a73c2168ab4620ab3ff1330ef85ba04a4e8a | ORPH
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/86410fd4af880bc6e0e0c120bbf56fdccd595480 |     
   sparc     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/2e47698580e129e1132b12e26639b1c54c3418d4 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c82ae32b5fed13e71ae1e11df635cec9366b885a |     
  mips64el   |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/d74a134b7fca0b0a0027975f696a5f0d138ead2e |     
    or1k     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/9f94d200d89155bbde863d578e3f4befcc68a9ae |     
powerpc64le  |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/c09e970f7ea0fc745a7a57d44b6e06740a72a46e |     
  sparc64    |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f |     
  aarch64    |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ee5ef79a39570bcf5c605b1a4b6b48523605d647 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/090c55475e8b17ad93a5e1d954a8156a5a8f8124 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/0b2f4e4916fbe601c0dbd20a5a7a37a0ce610a3c |     
   x86_64    |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/39b3cfc56f378e9011ae64bb8641255cddc3afdb |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/47e2200767356bc55a69a1a0b12271fb0b0ae617 |     
    or1k     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/10314eda5b6a1f0a5fb2bf6702d666ea066eb66e |     
    mips     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/9124e4b7f36c16f56e4018126277f4b075297312 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/d56e6fedbf23dbef86adc2f8e8f7036909b508d5 |     
   nios2     | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/5750936b6b9faff5ceff7ccb197b8c5acc8adc6b |     
  mips64el   | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/45c0543e51406ab6e14263411a7cf18e256a0aa8 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/900f655fa8d1b32417a05936f3df67d7b0d37b7e |     
powerpc64le  |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/7765bc5677f48250c7d7d25f42b11f261efe29d1 |     
  mips64el   |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/4e178d2db1cbc03b89d9d3d5d7fdf5c644e82adc |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/f63d0b68f5808030aa07425d8df223afe7d4ef9b |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2b0fa2ba72fa19ffa831cf9090a2887c9fc276bc |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/96b03db0c0bdbdad2457538956c8c1176e92bfed |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/f44e49e94549af756ba3ebde3646f8419c9e9769 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/b35388edd74f0e746d86a1d997b030d6d93c873c |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/4f1fdb9a4d36b4cd4bbc6c84094c07a8a8cac2cb |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8257bbf2b83213e44b46f0773d60aeba2763581f |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2f931b7cf91f4a4441fdd275c02cde3fbe57cea4 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/055a3c3be6b9a31426b6050759f38fb8732b0038 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/02bb31c4baebe95d70246e4300290811136576cf |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/60fffdfb36eabb46f7143f1743e45c129b1a9101 |     
  nds32le    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/25c30944516aa85beb52684224a611e7b66b6a8b |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/60b1b639a49329473ba319868878df8ec9ba05bd |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ea06cb966ff4a16b916898ceba5a0d6840eb4fa8 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a58523645ae78de313b1b50d61412b681075c454 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/51c9d1b311ea3721082ca801a6b1b7fb484a1060 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/95599eae53598b2fcd6d6932579df36f5f591a42 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/37b2913975f5847ab05d35022be1fd8ecd4a8de3 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/dc0fd4a117b39e9cab98e8049ca7ddb4b44659c1 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b872b9250781eb34cad49051a3d444ab3c81fcb4 |     
  aarch64    |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a21961015160dcca79c485b574b5b2f9835c81d5 |     
    mips     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/261592daebfbc13c642136a6c1abcae8cdd60b0a |     
    i586     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a7a34f760ae5fe0922fdb720b8234dbcd85ed222 |     
   mipsel    |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/74ce4ac55de38bf3c4dec871ac88498e0b4ed49e |     
    arm      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/7615026711c6b8a6e048f3ece3b1ad7a52b650fa |     
    or1k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/6375a7a5f5b19be21ef69f329138387c548f5ded |     
  powerpc    |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/2ccbefbe4903c3e803fa52a0192a33bb0f63e03d |     
  sparc64    |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/9e0c77540b6eb4de12f56bbde9140bf7e9b12e1a |     
    i586     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/40a617c9a311b07155040216ed56a5a4f58b6ccf |     
    arm      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/f4c1d9a42365d35a10a5b75bb401f9720c930af7 |     
    arm      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e3a951fe55ae58f1cf786e1d50329835a447cc55 |     
 powerpc64   |          systemd-241           | NOK | http://autobuild.buildroot.net/results/5d8ee987431cd19716e89c2322b3a9fa1d5736ab |     
microblazeel |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d41eb869ee668fe6421101314ddf2e94369a1aa5 |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/56bf89f1756ce362dae4c0668669867d49145402 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/563bb7135561088520e7bfa763972f594e288fab |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/4ef032b53935e045a845e6c3cdabdeeb8994cad2 |     
   sparc     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b119b9af31e3413c5ef1699916228c741947904f |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/085f9859134d8789f86624138142d3cb9b613e9d |     
microblazeel |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d37255f864fff510b2f034c620970e29c7ccf603 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/16613affb5a21880ad7aa5ea6a78a59c76a7e80c |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/ababae985455ae951169327b708f78cb5b876087 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/c3e986969e8d8915d8770fdf55ead065ac533669 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/2b1f46954f2217909d05d3d48d6e03741cf13b43 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/b3a872e6cf9aee655a9335ea09ea61091f3e313c |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/4bb2587163f364fbf34490f8ce077a8065d39396 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/47e7076e7933f8cb24c898eae40d019bc6378dec |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.21.3 | 1 
   openvmtools-10.3.5-10430147 | 1 
             qt5wayland-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cups-filters-1.21.3       | NOK | http://autobuild.buildroot.net/results/43edd3a4e67ec5aa08c704451bead59102603776 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/509048d0d60781a4b3e1f951f2af336337cefc9e |     
    or1k     |       qt5wayland-5.12.2        | NOK | http://autobuild.buildroot.net/results/4000758cd2e683eb908b4c27f63deea1f97a0e53 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

      intel-mediadriver-18.4.0 | 1 
               libupnpp-0.17.1 | 1 
             openjdk-12.0.2+10 | 1 
                 qt5base-5.6.3 | 1 
               wireshark-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/f637a19f3f70867904c236c5e24e5aabb9644924 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/77b5f1b7cde7d56c243b1658a8299368d6ef5d62 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/6cd4204f5a58e2b72ee3d97ed9ffb726eecc81f4 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/af09edb04010fd70dd7f739b9641cf13d85ce588 |     
    arm      |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/3e802da07632a0a7cd88791a5ce5fefa7167a651 | ORPH


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4e         | 2.4f         | ORPH
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r3    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.700.3      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-09-23   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.4       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.1        | 3.4.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0rc1    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.0        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.39.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.39.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.30       | 1.4.31       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.14.0       | 0.15.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.101.4      | 0.102.0      |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  DISTRO  | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.7.0        | 2.9.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.12       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.0.6        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.3-rc1  |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.3-rc1  |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.14       | 1.8.16       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  DISTRO  | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | v18.32       | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.23         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.2          | 5.3          |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.2.8        | 2.2.9        |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | 1.12.0       | 1.13.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.10       | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.2        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.23.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.62.1       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.9        | 3.0.10       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.9        | 3.6.10       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.12.10      | 1.13.1       |     
                         gperf |  DISTRO  | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.24.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.0       | 0.6.1        |     
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.10.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.42.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.2        | ORPH
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.6        | 1.9.8c       |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.328        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.7       | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-68     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 18.4.1       | 19.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 18.4.0       | 19.2.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 18.4.0       | 19.3.pre5    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190618     | 20190918     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.18         | 0.21         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.13       |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.6.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.8.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                       libbson |  DISTRO  | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.1.2        | 4.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                     libdvbpsi |  DISTRO  | https://release-monitoring.org/project/21684 | 1.3.2        | 1.3.3        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.1       | 2.00.5       | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.5        | 1.0.7        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.7.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/21361 | 1.4.3        | 1.5.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.0       | 2.63.0       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                 libhttpparser |  DISTRO  | https://release-monitoring.org/project/10989 | 2.9.0        | 2.9.2        |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.1       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.18.2       | 1.20.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.46         | 3.46.1       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 1.8.0        | 2.0.0        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libp11 |  DISTRO  | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                       libpcap |  DISTRO  | https://release-monitoring.org/project/01702 | 1.9.0        | 1.9.1        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.22.6       | 1.24.0       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.2       | 0.19.5       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.0        | 2.4.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.1       |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.1        | 1.2.2        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.18.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.1        | 8.8.3        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.4.0        | 1.4.0.1      |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.04      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.1        | 0.2.2        | ORPH
                     lightning |  DISTRO  | https://release-monitoring.org/project/01816 | 2.1.2        | 2.1.3        |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20         | 2.20.2       | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.6.1        | 1.7.0        |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.09.30   | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.7       | 2.10.8       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.30.1-0     | 1.30.1-1     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.8       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.19       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.51.2       | 0.52.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.9.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.10.4       | 1.10.6       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.0        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 6.15         | 6.16         | ORPH
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.14      | 0.21.15      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.4          | 4.5          | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.19         | 3.20         |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191005 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.2       | 1.21.2-dev   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.1       | 1.17.4       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ngrep |  DISTRO  | https://release-monitoring.org/project/02084 | 1_47         | 1.47         |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 10.16.3      | 12.11.1      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.11       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 4.2.3        |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2rc3     | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.6.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.5.0        | 3.6.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.6.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.5.0        | 3.6.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.17       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.40.14      | 1.44.6       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.4       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.57         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.25         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000008     | 2.001001     |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006003     | 2.006006     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.81.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 5.0.1        | 6.2.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.2       | 0.11.3       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | v5.1.0       | 5.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a0      |     
               python-aioredis |  DISTRO  | https://release-monitoring.org/project/21938 | 1.2.0        | 1.3.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.10.0       | 0.15.2       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 0.24.0       | 1.0.1        |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.1.0       | 19.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.8.1       | 19.10.1      |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.5.3        | 4.8.1        |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.2.0        | 2.3.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 5.10.0       | 7.0.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.3.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.10.1      |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.1        | 1.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.29.1       | 0.43.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.0.11       | 4.4.0        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.0.1        | 3.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.4        | 3.0a1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 3.5.1        | 4.1.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.8.r98      | 1.9.2        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.0.2        | 1.1.1        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.11.1       | 0.12.2       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.3        | 3.0.8        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.0        | 2.4.1        |     
                   python-flup |  DISTRO  | https://release-monitoring.org/project/03872 | 1.0.3.dev... | 1.0.3        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.0.1        | 3.1.1        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0b10       | 1.0.1        |     
                python-ibmiotf |  DISTRO  | https://release-monitoring.org/project/21699 | 0.2.8        | 0.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.4.0        | 7.8.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.10.1       | 2.10.3       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.0.2        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.0.6        | 1.1.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.1.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 1.0.2        | 2.0.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.3          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.2       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.3        | 2.3.5        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 10.5         | 12.0.1       |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 6.1.0        | 6.2.0        |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.9        | 2.0.10       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.4        | 0.2.6        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev3   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 1.4.0        | 2.2.0        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.15.0       | 0.26.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.27.1       | 0.46.1       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.2       | 2019.3       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 4.2b4        | 5.1.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.0.2       | 18.1.0       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 1.1          | 2019.9       |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.6.3        | 0.7.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | v0.18        | 0.32         |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 2.3.1        | 3.1.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.7.10       | 0.12.3       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 17.0.0       | 18.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.15.0       | 0.45.2       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 4.19.19      |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.0.2        | 4.3.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.2          | 3.4          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.8        | 1.3.9        |     
           python-subprocess32 |  DISTRO  | https://release-monitoring.org/project/04043 | 3.5.3        | 3.5.4        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.0.5        | 0.9.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.7          | 1.14.1       |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 0.9.1        | 1.6.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.9.3        | 0.11.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.9.3        | 0.10.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.2        | 4.3.3        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 17.8.0       | 18.6.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 19.2.1       | 19.7.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.0.0       | 19.1.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.6.6        | 3.7.4.1      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.0        | 2.5.2        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.12.0       | 0.14.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 1.3.1        | 2.0.1        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40         |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.0a0      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.7.4        | 3.8.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.0.6        | 1.1.0        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1        | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.1        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.0        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0-beta   | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/21744 | 1.20190819   | 1.20190925   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1910.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.8       | 4.11.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        screen |  DISTRO  | https://release-monitoring.org/project/04772 | 4.6.2        | 4.7.0        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.1        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.14         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.07      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 3.1.4        | 4.0.4        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0-rc1    |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 241          | 243          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.90         | 2.96         |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                       tcpdump |  DISTRO  | https://release-monitoring.org/project/04947 | 4.9.2        | 4.9.3        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9          | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0          |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.2       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.1          | 0.2          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.2112     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.58.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.1       | 2.27.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.2        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.17         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.3        | 3.1.0        | ORPH
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191006-... |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 3.9          | 4.0          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
