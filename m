From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Nov 2016 08:30:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-05
Message-ID: <20161106073024.E75F820798@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-05
================================

      successes : 197
       failures : 62 
       timeouts : 1  
          TOTAL : 260

Classification of failures by reason
====================================

net-tools-3f170bff115303e92... | 14
kvm-unit-tests-5731572b2ac2... | 5 
tvheadend-50a370707aedf5c12... | 5 
                    mpv-0.20.0 | 4 
                     vlc-2.2.4 | 4 
                privoxy-3.0.26 | 3 
python-libconfig-b271c3d9da... | 2 
                    qemu-2.7.0 | 2 
               sdl2_ttf-2.0.14 | 2 
                      x265-2.1 | 2 
          chocolate-doom-2.2.1 | 1 
                  cppcms-1.0.5 | 1 
      docker-containerd-v0.2.4 | 1 
                    fltk-1.3.3 | 1 
                  gauche-0.9.4 | 1 
                      icu-57.1 | 1 
                ipmiutil-2.9.9 | 1 
                   jamvm-2.0.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
               libcap-ng-0.7.8 | 1 
                 libnss-3.27.1 | 1 
                 libv4l-1.10.1 | 1 
make[1]: *** [libavfilter/s... | 1 
                 mesa3d-13.0.0 | 1 
                 mpg123-1.23.8 | 1 
                  openjpeg-2.1 | 1 
                    php-7.0.12 | 1 
                   ser2net-3.0 | 1 
                xfsprogs-4.7.0 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/70659eead71faa82ccfd0016d04caed134707c24
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d76ce1a3c863a72a420887e801a6b11757f88f7d
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/eb2722d0d771e828697a4a7eb3e64663e1b19fb6
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/fee300664d4d76186e4e2378e397ae3054dc6549
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4417992db8cfc44c8fddec30fc9bb1fb66fdd63d
        bfin |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/9e84fb1a9188ee21917617ba328cabdf699138fa
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/6ec458f5d2903ef36c4db5217a352352f985d9db
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/325a50d15e1836b31df4e84ba83b296abfb73041
        i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/52c02c68be6c0b3e907f7ed645bd2d18476ec4f3
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/16836c02f4d1ab5df6b2e21a4fcdbbf4a7542f22
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/59bf37066fa6433039f957c2dd328215f661328e
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/96bbc04db65be1d67cc2cc13566f69f5b475305e
        i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/28334ebccee943b78bab5f7f0c2a71a8e86e43d4
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/bae83d495b46efeec45c8008949c811b6241adaa
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/a5c040512a3534b3f988888c2c5da3ae6601c10d
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/47e611036be12844ebca093ddd8fe95c326c6056
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/4013d8a6f0222189bb6bb632a797c98fa4c5fd52
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/bac8aef2c50871cd0e4310f4c172f7f8c905175b
      mipsel |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/d25fee7f1ff1b56cc4a627a7e4b3ca005c6671e5
 powerpc64le |                  mpg123-1.23.8 | NOK | http://autobuild.buildroot.net/results/6f4e373fdf3c08433ab0ac18c7db500974acf11f
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1f18175bbf8c182256420257ddf8eac91d9d8e6e
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/771d7686fa1d575011c26bdb48cfe5e4a05054d5
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b9b39289fef069664a9f202b3f1aeaf28ee43916
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0085ca6f7ba43d43c81865ef9ac79ab956ea14bd
     sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a1b2ff0385701fba85edfacf663896d8dbc8de09
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3746f6438bc6df349b709fe0ea6e6bbe72e40c96
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ce7bc29a60dadefa9a1e76588b6cd117b9b438d3
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b0ae167ed73731a500b3a689369ecee569280f3d
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/72cc7172fad6f886aef307b353775689784feca3
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3ee0f8d998507086dc94cc06b66dc7aaea51199a
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/e7b07b8f84431664ab1c327b42d4ec508f377bd9
        bfin | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/df8500280736379c054585cf62980fb4dfeb66d2
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6c1efbfb8bdc6b68b4e2ac3cc58d736125ae0dbb
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/404690a4f8b42f773c50eea834181bae0185c550
     sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d2e66e873fc242f87882f944abdc31a0e5243488
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/5a8d3f0e540e6123c30b4dac8832a74808e4c1e7
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d8803422d86908b24731fff613a05ea0d40f9269
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/8e9fb71362f81fec605328bc32c4ded1376de5d4
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/d0d22727311d6300e0e400728126170407bfd699
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/8326f24511d3b109d22a76660adc017bbcaca197
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/671f4be5343de56185088e84e0878746e8092eca
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/fbb01a3a9afb8ab40cf54024b81b1fbcc811573e
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/fae7a41d110ed6c4d62c77873229d069d8b65986
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4eeb4702707366ad3d7b37249121bbeb3ba9b7a4
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/383ea3cbbb295614c2bd9ce1622b0cf787130878
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3db1ba5a4735b2cd2eb545cb0ba48fbf8eee2342
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b277e668d9e22b624416bf46f6ccba802acd257e
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1ae000dbaa7b6a508be716d2cde85fc8b62b16d0
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bd9b007493b54d67e6553a128d371e72dee9c752
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/7f152e2255f8d2cf9378812998fe9a239319c116
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/386000654c683622af0f719f913798260cb0a905
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e890597c7f2f9640bbfac4ff411e00df60bf9137
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6a6da51114c7735a3174d01af270effda94f18e2
        i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/ac5804458093842d7fb1b22ca3b666ef288aff53
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e8c3e52f6bf85cf1d2d7474a1531ca30d1ec6aef
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/589616dd9dcf85b5e37bca7fbea6e6f4db82fea0
    mips64el |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/21bbc3fe31264b719b69b8cdd7f638a01dbab07b
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1a056b227747720233953647c81b6b690342b435
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/cb1f817055c2c40b5c528198697515357c8b1261
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/6ec75cc176e05bfc6287dc54fa1a53e0ffc0521d
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/86c15acd9a1bc112e4f6566e2e41ca90ed2eb61c
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/42a7967593cbd00a88700c1f8e800ed2c4ac2192
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/02f9fc5884d3a7d460b96937183362d6c3fc6fde

-- 
http://autobuild.buildroot.net
