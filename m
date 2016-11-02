From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Nov 2016 08:39:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-01
Message-ID: <20161102073915.09713102B9E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-01
================================

      successes : 156
       failures : 66 
       timeouts : 5  
          TOTAL : 227

Classification of failures by reason
====================================

                    owfs-3.1p1 | 6 
kvm-unit-tests-5731572b2ac2... | 5 
                   assimp-v3.2 | 4 
tvheadend-50a370707aedf5c12... | 4 
net-tools-3f170bff115303e92... | 3 
                  libffi-3.2.1 | 2 
                 libnss-3.27.1 | 2 
                    ola-0.10.2 | 2 
python-libconfig-b271c3d9da... | 2 
                      qt-4.8.7 | 2 
          sane-backends-1.0.25 | 2 
                     vdr-2.3.1 | 2 
                      x265-2.1 | 2 
                alsa-lib-1.1.2 | 1 
                  boost-1.61.0 | 1 
              bridge-utils-1.6 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                     exim-4.87 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                  lcdapi-v0.10 | 1 
                    lftp-4.7.3 | 1 
               libcap-ng-0.7.8 | 1 
               libepoxy-v1.3.1 | 1 
          libmicrohttpd-0.9.50 | 1 
                   lite-0.8.10 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** [libavfilter/s... | 1 
              mosquitto-1.4.10 | 1 
                    mpv-0.20.0 | 1 
                  openjpeg-2.1 | 1 
                   patch-2.7.5 | 1 
                    php-7.0.12 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   ser2net-3.0 | 1 
                  squid-3.5.22 | 1 
                  stunnel-5.36 | 1 
                   taskd-1.1.0 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
                 weston-1.12.0 | 1 
                     xen-4.7.0 | 1 
                 xenomai-2.6.4 | 1 


Detail of failures
===================

 powerpc64le |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c6272ac900d1a53b976839ac4f50a210b3e6b354
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/eeeaf9e6d357477b61e869b2d88921fcb28fabb1
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2c64ad70985767bfc079c1ef97904031fe4a62dc
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f400aeaaac2322138ae1217307594a9afabfec4a
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/db7b9a4276e2b9ed37d6d7e07c08fcf4ba3b018a
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/35f9ed06fdb2a2a1a59de0743348bfb6e85271c8
         arm |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/b48a70137a4a568b31337f899fd21d05552db5e2
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/641aa22c053b2130d6627cecedfb91ac6a07d11f
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/964326466789f8d6ff8a064327c38cf145409ab0
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6e1d99fc2b2b740236c39468d89e0affd198d096
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/4a738726ffcff7f3f3cf6b90847b92869e4afddc
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c984bfcfb7d3e30d07d28d22c8d23523745857ee
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/67710b54d458b463fbfe87d5c1453ce2ddc3830f
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/2a72bddff57d2b0bd4bed1cbce9b1a9539b73d30
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fb9291e97bb0d5213de157afe6a3b673a4bcdfd5
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/e9972f43d9eb7a48cba84aa1266b3044f782ed5d
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/daaf202a2658830709feea48f5a5e5033f7a76f8
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/e1e597300ed5b9bf12ceffe028d5f2687a6f07cd
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/b1363849145bc42dd9806333d25ef1e056b99d88
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/a000518f5c8c7edd26e2c05bd2990e8da6b04d66
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/533eaf0f8601101e294ab5d00fdb9ecb7794dbef
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4844e325852dd44e44c869439ebe0d633409818b
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/047f259330c0bd82f97141f0c2e3748bb337aa2c
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/286f6e37ef00d2e56652922eb89240bbfe81e276
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/272696146590d3a82afa930d19155e186bde7624
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/7aba6e3579f436dfb647ad8373aec21f3c223f9d
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/8f17f598dc5ebb25f4dbe0a85e96db762fffa712
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/dfe276ff422ed08c698b0c5811d0d88b8135fe05
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/b702fe8625152cdae88bfbca9f8203286ff458cf
microblazeel |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/93f1c4dcaa9a20ec62c547b839cd334ed1b5fbe4
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5b8dda4526dacb4c5918cd2af46126928b798ba4
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/e99f97a60f847b38d67b60a60375a7712d7b29e3
        m68k | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6af0f9333a54ab58eb2ee95b55d2799726dc3e8d
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2007b365b58bb89498e3e99ccafd33626b312284
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/8c3eb4bb0e9d0f11fe49622924f478295475ec13
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/858d7bc8329690faa2305a24f451306f92cf08b4
     powerpc |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/8a40b1d1058afb4f69233e3fcbcc25fa6689e608
      mipsel |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/200846650641494290aa67d28ea6fb2c9351d4dc
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/99c00248dd8b00071bcdbc73336cc276c68a4c16
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/8aa15e00f81702e6ecc77ad223ff7bc95b5d0ab9
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/e45c0121ed982475884e2c8e5010718dd7b250e5
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/dcc4047cea679379a38f445e10b2d459150ed2ab
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/0551bf22344b70dbe4f5a26b0fc58cd8d4bd6d8a
         arc |                    patch-2.7.5 | NOK | http://autobuild.buildroot.net/results/af8a9fd6360cdf63f45a9f3392b1675e90167b0f
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/c97bffac6c232dea70d6ef7c704dcf9ac7be2e62
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/000531635842762faccd03169251dba96846f201
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3958bc51b3c8afaaa9e6410f2c7f8b38ec8201da
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/047530f970092843fd50a7acb0fa42f2a0caae8e
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e876dbda0d0d3058eef1cacd54571fe3f8d1563d
     sparc64 |                       qt-4.8.7 | TIM | http://autobuild.buildroot.net/results/f9dec8ba8712b67c6295624bd514377461ecd596
         arm |                       qt-4.8.7 | TIM | http://autobuild.buildroot.net/results/26864926e427227f6c521fd8a2d8bb06a2b40c61
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4d3463a2f6f62836dab959b642501316a931e336
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/42cef740b2d71b49cb5b5fa07de71b48c9851cf3
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/974b406ef4ca58311d126e86ace52980d60dc8f3
        sh4a |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/26b51f7c5f06b33b94018eee49247ae9d69344bf
      mipsel |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/183ef43c119fc3dc72af6f6c142c157295c451c8
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/ff4b6a48d2e07c7797f354dbe584ee0e818904df
       sparc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/5a1aa5380ef7e331e5a617041fac753042c7461a
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a4eee95e8aa0b2139b169b6bdcc9d8735f14c575
        sh4a | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/accba9faeb592024c11d06abdb868d9104a9b999
        sh4a | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/74b96117801139477f789444081adec4054e02e8
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/75471c193f1dc8e5e3cdc80bec552a38d367608e
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/651532c0b8937859814b67af79e030f3bbf1b18d
      xtensa |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/837ff2986ced7ebf064cf1f5972c8731f353ab7d
         arm |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/c75608f25afd355a71bb712f0af791b7a8458985
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c67138e5130760b085e381ab39fbfcc8a50375c5
         arc |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/6b453899b8b3f9d1d7055ac88c6e80743919eb73
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/86101adb9e5d2c0b90f9e5ecc9e9fbca3917142f
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/cb87b9805e94f3db6a0de05c269125272e6e05a0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/eb2d96ff9b467f17e5dbbf67bb7a39dfbfc4a54f
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/80edc6f7227e53e4e04125e066106706812e4b45

-- 
http://autobuild.buildroot.net
