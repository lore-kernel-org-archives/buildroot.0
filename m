From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-10
Message-ID: <20160211073021.A70B8102B71@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-10
===============================

        success : 181
       failures : 112
       timeouts : 1  
          TOTAL : 294

Classification of failures by reason
====================================

                     kbd-2.0.3 | 30
                  boost-1.60.0 | 11
                pulseaudio-8.0 | 7 
iputils-c8ff6feaf0442f8efd9... | 5 
                    cups-2.1.2 | 3 
                   fio-fio-2.6 | 3 
                 libraw-0.17.1 | 3 
          libpam-tacplus-1.3.9 | 3 
                numactl-2.0.11 | 3 
                  lshw-B.02.17 | 3 
        ltp-testsuite-20150903 | 2 
                      qt-4.8.7 | 2 
        lttng-babeltrace-1.2.4 | 2 
                  prboom-2.5.0 | 2 
                 libcue-v1.4.0 | 2 
                  trinity-v1.6 | 2 
               libgtk2-2.24.29 | 1 
                  connman-1.31 | 1 
 netcat-openbsd-debian_1.105-7 | 1 
                 setools-3.3.8 | 1 
                  cairo-1.14.4 | 1 
                  squid-3.5.13 | 1 
              macchanger-1.6.0 | 1 
                   erlang-17.5 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
tvheadend-1aa0073be39119f5d... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
               pax-utils-1.1.4 | 1 
                  samba4-4.3.4 | 1 
                 opencv3-3.0.0 | 1 
          chocolate-doom-2.2.1 | 1 
                 libdrm-2.4.66 | 1 
               valgrind-3.11.0 | 1 
                   redis-3.0.7 | 1 
                  libssh-0.7.2 | 1 
               iptraf-ng-1.1.4 | 1 
                     vlc-2.2.1 | 1 
             util-linux-2.27.1 | 1 
                 mesa3d-11.1.1 | 1 
                mono-4.2.1.102 | 1 
flann-04b4a56533faf8c8228d0... | 1 
              libraw1394-2.1.1 | 1 
                    sox-14.4.2 | 1 
             netbsd-queue-1.70 | 1 
              gst1-libav-1.6.3 | 1 
make[8]: *** [do-all] Termi... | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/96ab00ec8e5fa7df9fb1096e7df675f3e17f06ae/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eaf5935ccf846afde210530b79a8a1aa38c0f0d8/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8dbfe3d4aea7b1157f4a9d49e22543e0162f27cd/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/014c9d18540b2df45e7121ec1d4f8065e9ec384d/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c0103ed71317b75076b7d6fcd38f043e23b65492/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/460de26a604cb86f565e9010b9f8aec792dc666a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/951b15319ce3af32ba20a83040212648b012bfad/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/03cef641b8d21120a3492d651c718933f24de736/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6242d4c82093d160c116b69722b5d644925db8ed/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d5bfb34690962711e270be18f14d1417297b8bda/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/53fba7aa1ec2f66dc549d352712523730159d8a4/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/a08a75eb366f13e687321cdcb4e79f0ae44c8800/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/b51c31eab423a8d3a67544f768bb11153010dab7/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/21d21719c385e6e6d2eaf921a1bc17fb1c450cf8/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1b0cf0e4f0d47f469ed19633114955c691c3ffef/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/3ffcfff35ae9467c385011ec9351d4b2c1c15faf/
        i686 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b02b3752d8ef3ca875ce3032f1d7fa41c42f4b95/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/07c814e5d5925cd3037fccabe05be359f0fbdc29/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/f7eb1578f24d212ba85b52f310133ec2540eb5d7/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/819752ecdac62e6fe905cb937b389e206c694923/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/dae9f6b151356d9c082689c08bc94583bce1c919/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/83092e936d1b8cfb176ab62e301dec82ddc99498/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/2cbd62d368bf5c9634ecd1ffa088eef7d9b91f47/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6ea37d2d96cb9ce11b5700dbdcc9551ceb90ceff/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b781ff09e2f68fbd101583aa730368258e40baa0/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/4725a75ba7999b1ef2374e478302299c3d34e6ee/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/bfc0927f1184868ead482008220d1609dd91e794/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/937039edd4bc329b6840be535085d467bac1da22/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/9a957449a17bcca6d960819e4d1a9f73552320da/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/a9732890e4426793b0da2415d8ac5fe704d12570/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/0892c82657f1de1f041094493b1042b5ef415512/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/bcf3a3bc4f69ca97f434fac9bb50485c8bd7b52a/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b36e2d04b0c521dd61a46060bbf58104a021923b/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/6f292bd410a05f56d1535e74fd4387aa33f4c926/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e369d3758714cacbb2d69306da04282f69bcdeaf/
       sparc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/766895a41a1428bea9d96e182300875b36e4db17/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4cf947db08ba562e2873225c22737aee0d9d6e1f/
         arc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/dc3f3864c027afb512260831a5fd513ef3c1cb5b/
     sparc64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/59412b008977f08de60bded9c27888bff186c277/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/229a4e2752c244f291d03effcc9b056c8193d514/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3540a41b75e44f4741b5ad218d3a4db939ef8196/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0102a42cede531960911d1481db34828bb6fdef9/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3190c3745ff3f4723c63f5b6cd6f453433acea52/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/96e63f1a2748f11fdff96577d997da526a23617d/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/d6ec44efb7dce0f22fd961a89857d2dce37d539f/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/46dd907b7968df5c07b33e5bfda997a1976b7110/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/481a57eeb76ee3399e7e70a8086bd976caa73af5/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/83de9d2275bd27e2d59c3e629ca9396eb7bd6332/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/5edd829fecee2d158d1a142d46bfbd82ff6a100c/
         arc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ac49d7dd0157802a51369a4a1266fdd5eae5c887/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7511d92982d1e9d816ba0c36314d609c92e474ff/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/985de9d90b8681161ad9c31aea355b2ec72a88b8/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e2c86cb29354b113be24249fa10cf3b864fc942f/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/66271a27b20a9d37eed2c8425e4467f6400b49b4/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/29f4ee1687048a721b4b3c1b13500afa51678241/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/a968db4d177d82e2e42177a89e179362b0106629/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/d1cfce173bce87c32fbab3dd7b0fe1deb0612226/
       sparc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7fa5ec234ea06cd791b4cfd386eb6d74b8f86cc6/
      mipsel |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/01f2b9336cb0da4b84f787ce40074ac2e71b06c6/
       sparc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/63022a0510e062834051c43b07521dd7408c6136/
       nios2 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8d67ebc35d46de37ab8e4f87ca02c285df5ff8e8/
        bfin |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/975663820e3d4e78e52c11ac3c0535d5537a134a/
         arm |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/e2b4907c3089b6d555e0de090bc46089865a5529/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/b79d84cde543c3ec889f8badb532d46774181659/
      mipsel |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/109f24a3451cfa0a00057def71244ba6eee8df01/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/a0a9695b91a7bc16a33917b7a358dac199e01041/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/256e7b1f2fcbb7f94990a560044767127a6dd5a1/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/394448b2e948ed955ec2ad27e6af20927dd015a5/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/70e612bb019e8a11716f5f261b6ddcce6235c311/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/16e27cacff70eaf60804a0815a8e227b946e71a7/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/344ac44897ed3a34d2c3b909463c96b52d519259/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/7e52d61348f7a1472de2f776da47254584e21255/
         arm |                   libssh-0.7.2 | NOK | http://autobuild.buildroot.net/results/7034d6ff037293c29b6fc0fa00c63bd0234518e1/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/596daf3b735082d6c8343aab9ca062fb4cdc4367/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/7844f07a32a5bde9554b0750fbece9db28fbd5b1/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/8b34c2174b5c6f548a8dfb7cd4671f75f2f0a1f6/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/0867d6809a215c15e183df80ab2707648afddaa3/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4e0f336b430983447a4f8bb9805fa186d4d8c95e/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/ecc270cb4d7418ec20d310e825c40a11ef86537a/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/19e5a7f3a474c30387099387e7594e5e91ca2226/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/555c35c86af32a5900a45967bfc0417460b1339b/
      x86_64 | make[8]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/ee4e49a77bd520bd6e40de0b37bf80a579c95017/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/3ec9f2ba98e7c4fcd9b29b829a4096eab1c306f7/
      x86_64 |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/06faa0af07b453f2f25bcf63b7234b456a8d3be0/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/38fded81533988adc4e6f16d26016e19bb7c7a9f/
        i686 |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/7267c0b206e86815bfc5060db2a4019646aad496/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/7ecdd9d9af11c028b2dc1beaadb3e451753a68bd/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/6ebb17b19ccfd725994c261d492c141119906756/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ab93b58cef7b46e24e01d1c20aed3e617de9bfda/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/939e440500f1badb6082d1a32b0b773468a18fa3/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/34e3f70e535001b33488443863e2e6eeb8d29a21/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/12f5d56116fc2be6c1c264a355f187302f2f1963/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/1bff53a272f4cb7ad6fff1a8a9403f83e23963dd/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/4f62e8f87d7bdfd0b518c535386d2f525d6c85c6/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/8e1904169eb1bb3a34cc7bfb044a29de9cf1d446/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/77cd66f3d4afdb06f9af7a14a72381c31f1b6e20/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/ab32c38c692f02aefc5aa330b0739efc0f4a677c/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/b6dfd1cc531fb49135ea323f5958cf495d070a8a/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/924b794ff2286d4c94f2b3326d1c894ab5816932/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/57d1ef3d9d12f43f577654855efe271cafca6f1e/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/775fd9773df48602292da0b5a3777c55154daced/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c4525aefb1f28080a82d28ad39381626100eb881/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/e2582d900fe33189ef98d2265eb884167ef889bb/
      x86_64 |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/37dd7e9134b4f1af4dc5c702dfcd254ec39c09c4/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f6e4e3c38bb44a4d6c1024edb0b3b8a77d0189dc/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/fa44e46e9d2a5bbc7e2dbeb183ef377a119f4056/
         arm |                   squid-3.5.13 | NOK | http://autobuild.buildroot.net/results/884a0e0a11cf5b4c5538f6c4979b42296b3f6be1/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/209166b20b61cd4e11b6d96c1397262bd8568b27/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/de7230048b92fb97c934969534c2f3a44726ac41/
       sparc | tvheadend-1aa0073be39119f5d... | NOK | http://autobuild.buildroot.net/results/0cfd9237509a8193bbd0d6b9b8d9337c3fc99389/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/4b10111d5351022d821013caa35153f55b559c37/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/01665d8fe3bdfa6dfbe09a0e838919225d33b7a3/
    mips64el |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/6f8c3dbcef11fc8ada9deda09ea353f08d80c633/


-- 
http://autobuild.buildroot.net
