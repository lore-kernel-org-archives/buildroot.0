From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 08:29:49 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-25
Message-ID: <20161226072949.57E4D20764@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-25
================================

      successes : 157
       failures : 71 
       timeouts : 0  
          TOTAL : 228

Classification of failures by reason
====================================

                collectd-5.7.0 | 24
                    sdl2-2.0.5 | 11
                busybox-1.26.0 | 8 
               sdl2_ttf-2.0.14 | 4 
             host-nodejs-6.9.2 | 3 
            lttng-libust-2.9.0 | 2 
               qt5webkit-5.6.2 | 2 
                  stunnel-5.36 | 2 
               trousers-0.3.13 | 2 
                    cups-2.1.4 | 1 
               domoticz-3.5877 | 1 
                    gdb-7.11.1 | 1 
                 glibmm-2.50.0 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                 libnss-3.27.1 | 1 
                 libraw-0.17.1 | 1 
                    mosh-1.2.6 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    rpm-4.13.0 | 1 
                  squid-3.5.23 | 1 


Detail of failures
===================

    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/c71ce8b1e970813189cc751bd782b46885a68a41
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/cdd004da01548b883cd4b6c24765307c748df5fb
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/a15179c882549c38f336d72ba5b0cf7ddf2d0754
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/333cbba5cb6930bc8b6a2ad64591de16a889f301
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/dfe5969bd8e31608c5060d5db821177a5d1c7a79
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/c0264ab18024e8fa144cb3baddfb0154942faf09
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/fe60a928e78e164e3b9cfcf3fc3f386f3dcb7d56
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/0fcf00fe76646457c94ad8740faf2eb07b81fb5f
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e54a2e8c8fe3b3b73c5467664db9575d5c02fab3
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ed50b2173fd0bcdf279f35c879c2b47e5ca106bc
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/90641c449b6321b59fbef5bcdde34578f1bd5a86
         arc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5c70dde0993aa10f7398ce13dab9df8a6b056c45
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d377166aaa6afc4e17c701c47e5546073c5aa807
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b2dc013037617a7ba6f17efa9b5bef3d94ba9c48
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4b71eff7621b4b3c56371afac07e552c3920fc2e
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ef2e4299d65adac6a931e41a4e0d0f0ba4428e30
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5ef7ac64b3e59bd3895af58f93b78bbcaffc07b1
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ffe560bcd6c29c698fe4d44f5e67a9f1739fe8d4
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9027dbd7f6126b137a2fc3116ba4419a33aa04e3
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3c1e7012ac4ad55fd0ed7e7b325fc108b9bf1397
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a113cb76cae0b0552dac5534e3b5beb764bc4d20
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3dda7befc2feb4c023d6840e620f26debb77cb07
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/358e2f02f42e08fe362ecd46e636c0048e77c21f
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7044cffd60e3e79fea8b06647189b4fe049319ec
        i586 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8f41c0f565bc357f9a272696c2f0bc572dd2c459
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d2f7e3638698f3de4d3383749c15dc16f12e4418
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a35002b7438a90bd720af179b8ebf73aa930396c
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7fbf696759dffe3457e48b9bca462b47d44e6b3b
      xtensa |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d72967260391f22a0967d0c1db06d41241e89520
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0c25ffc25fc8146f028481a7e6adb0e9ee5af374
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8568988cdaa07ff383777ae3e82594385b000441
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b0e2a371440150a0c571edba8b1651c1f0b99a23
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/1003faacfb30f5d1ba88aefda599c449b29b257a
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/263e0a3955a84fe5b032d6c59c23d72e41198007
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/2d2234b9d1162ccf17f355e3b50a1c14f1103218
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1ea1d0ea9af45db20a5a38ca9d4a9d5dc173f5de
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/b78deeed2b41ce425439a1cf0e245a9c04f3ac41
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/450465051758561cdcd295d5b383469e6e51d98f
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/b7999e791b015a06b98e6181c69621af7528a7ab
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/801a9401ffdbfff9933061bd119c951063e34c98
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b402b24333d32204c5cd277764a2a680937153df
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/203d4cad64364746d47f3da137fa4078b3889777
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/7098aaaf539ab1a301dc1a03ac4264b2c9279c88
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/80366afa7dd8d1f2b60e9cdfb5a560908cf07cb0
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/1ca188b97d78d98630f4e28682bf27dc27a9df72
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8ebaa479c68ed0d09a8199c815a52bfd18bc0541
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/776b18f735bc468510f5435da4b0906835d92210
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/790693076fde68bc5a1ae8941e082dee58357a35
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/dc563d4c8d7f8bf3b60209d719347ed69c3ba659
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/41865225afd97259a2a59dc0de31edf59abb9fd9
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/f4f8d21e70fcd79668847407586db2bf3e56feb5
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/b6ee42580463b2c47b78f186da4ab4979123cb56
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/20abb9ae234c976d112c586e17dc762aba05c88d
        i686 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/dac115b4b6bee9c7e8f25e3f64e81cc330e406f6
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/c3d179a411124804212f6ecd6be56c5864a6c1ea
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/6f9bd214479eeada0f346413f32dca6e9e76e346
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/21d7cc080927f5ba5e6f1efd6b8944c61f6eacf5
      x86_64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/b997c2b6307deb48a42e9b317715a00b65f90149
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/ffd689f1ba34ad43f52c38fe37da393a9d8b9d5e
      mipsel |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/031b718035cb5a404c49ec8099710d505fe4af84
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/552266c81ac743153681c4b27524d4106f035743
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/000efe7704b838cbc87a79542a046308cb0a783c
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/762333f30566d560aecdd67f6aaa962b63961bab
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7dff62e15ad4bc2f056ce8ec5a39cf53999bc43d
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/059b6678cf1a3156a8aa5638ef929df25932237f
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a97ee7c76add54c1c9d0033ddd9c47e9f0492dfe
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/5ad9a401fa0eb19c7bbd7ae123f2fead76af4d77
        i686 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/a8f824e9487b21434a640147c4d5a11943a056d1
       sparc |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/0b3813aace0b2c2271608e4054384c83cfdb6d64
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/fdf419e9302e8c32939525abe0754a41f8ec3fe0
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/daf0e6c709878c94f8db01c6786a102e68efefbf

-- 
http://autobuild.buildroot.net
