From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Feb 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-03
Message-ID: <20150204073018.9282A100B9D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-03
===============================

        success : 275
       failures : 79 
       timeouts : 2  
          TOTAL : 356

Classification of failures by reason
====================================

                   dbus-1.8.14 | 26
              mjpegtools-2.1.0 | 7 
              host-erlang-17.4 | 5 
                libvips-7.42.1 | 5 
                   mono-3.12.0 | 4 
               dvdauthor-0.7.1 | 3 
                    strace-4.9 | 3 
                  thrift-0.9.2 | 2 
             alsa-utils-1.0.28 | 2 
                  hiawatha-9.2 | 2 
                 bind-9.9.6-P1 | 2 
                  avahi-0.6.31 | 2 
             libselinux-2.1.13 | 2 
                 webkit-1.11.5 | 1 
                 qt5base-5.4.0 | 1 
                  fbterm-1.7.0 | 1 
                     vlc-2.1.5 | 1 
              xlib_libXt-1.1.4 | 1 
                collectd-5.4.1 | 1 
               openswan-2.6.42 | 1 
                   sdparm-1.09 | 1 
               libcap-ng-0.7.4 | 1 
                      qt-4.8.6 | 1 
odhcp6c-c42e34111e19bd435dc... | 1 
                     rpm-5.2.0 | 1 
freerdp-440916eae2e07463912... | 1 
            vorbis-tools-1.4.0 | 1 
           python-pyzmq-14.3.1 | 1 
          libmicrohttpd-0.9.38 | 1 

Detail of failures
===================

         arm |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/b20e3efcb0be3032781d7b2f0ef4c351834da0ce/
      x86_64 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/e505b272a2f5688e3ba2c71582e2de1ac0e519af/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/22fd084e6959b9fb01d9cf96c033ff910e903451/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/3f4cceda7d2a5d7644c1292ad44fed77654c46dc/
         arm |                  bind-9.9.6-P1 | NOK | http://autobuild.buildroot.net/results/4b6397f87c269a50a27960e447d3e3f16799c3bf/
         arm |                  bind-9.9.6-P1 | NOK | http://autobuild.buildroot.net/results/b0bc1a3620bd12c5e22283d5dd603c9412724ab7/
        i686 |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/d54010c6b0c6c97ca2da4b0721cf9e8ff9a07f0e/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/cf2680a2863b7068d866e554c55b7ae137b904d9/
     powerpc |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/911ee8210f6b03752e8710e5213e3105c61a50a6/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/1fb2dd882acd78a40e6b443312d691e3f54b48ed/
      mipsel |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/9621ee89376e88e6bedace34faefe5dcd61d63d3/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/3485fe75936c6acfb7b78dd9e34f5e10069de449/
        sh4a |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/18879a62541dcb7905557c5186eb04232e58b9e3/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/198fe82c7f906264227b19cc1224ff2c602016d5/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/c4390ad50ff59389fc8137c8bbd78298f8e1d6dd/
      xtensa |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/f7734f0ebfc4c9cce9fa0a286e6b549b214394a3/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/d0f3e795b03da05c4d83d5e354387b8a5259234c/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/5d8aa40dc0d72268487e64181a7729a033c93803/
        i686 |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/645ee944a46e70a7245dab708230a5b65f657a6f/
    mips64el |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/ace59353bdbba29f649292dc0a7e517eff842608/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/10377029b0b3258d331884cdbb64bc2637cfa4f4/
    mips64el |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/d124733e8c03d52dd9324ff65f984015b99a0abe/
         arc |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/5637b2300a33efb33370357f237ee8ec7ee9ec1f/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/1876cd66db428a9b8cb8d460136845411abf11ae/
     aarch64 |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/9a1b6049bff3dd5cc75bbb09b18031d9c3666c47/
microblazeel |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/4d83d713bac50061606d0855f1bd9275cc554cf4/
     aarch64 |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/2872d0e561581952677d62642fd739f66bcfe845/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/1b907dc5e456ce8c0b52983e191eed695636a842/
      x86_64 |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/15f939b8d19721c3de963d99fb5a671f9cb24e49/
      x86_64 |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/982b376b2a5169f3581cb670bf106b3f32651984/
      mipsel |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/3ee6d211abe0b2f3182f1dd59a231ec377ec07d7/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/a7bc339fb3c48d0a4a10bc4448c7b4463fdde076/
         arm |                    dbus-1.8.14 | NOK | http://autobuild.buildroot.net/results/e7b94d9db5874c320cfc2ffd256ee950a1cfbb73/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/5b593ad26b69b42ae16e5eaf055c0d6e8b907475/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/cb6ad81dac3924c626e7dc75c4c529c17a2dcd31/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6abd06556200d458aae5bf840cde6a92d6328c48/
      mipsel |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/ed19f69012f332820e5186bb622eea1e7443c39e/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/1855f7424202530e9d512dc4fc88b2c56788dd01/
         arm |                   hiawatha-9.2 | NOK | http://autobuild.buildroot.net/results/3ae780300e754671f45728ea50ac5a88f1c2e4e8/
        i486 |                   hiawatha-9.2 | NOK | http://autobuild.buildroot.net/results/23d395abff955a12fa98abbd53de25e697d0fba9/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e88a3ae8b528dfdb4a29d8e77d70c4d6d6b93223/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c72315e0eaf1f8c2cb8460e548b692e06d39a13c/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/60dbbd92ec701c44f017975f6f9fdaddaa3f9a9f/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a934fb29627370fa103648c03695cf7d965e968e/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2374e9e42109dbf8bbcdeac8c95ae5c7eef3b923/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0f8effab71d01cf2dfd92ca68cb78e42fa7ba91f/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/f5a135647867ca98ce6189bb343a631ce6a47e23/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5426bd09e645bd85d617ee086de309865c9cb51b/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3bee0418239dfeeddd8c63c161368193fe8bdc3f/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/3bf19626e22c541d2821ba3e48336aaa1db1da4a/
     powerpc |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/a1bdf79fe77ea1e206108c502a250722c71839f6/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/6faa9d80bb079ef88a7a776b6e8486656a4f9e82/
     aarch64 |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/73c8ef3a6339068eea1da20557de4abe46843e41/
     aarch64 |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/ffda73bb9a0298fdd5f1e30fce95e3452340727f/
         arm |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/57d246822ef7182b5b256a2796f287fc5e3a3a6e/
         arc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/84ac2c1921615fb380f1ba686e0d114adb5187b9/
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e9637102907795b5179ff97c80b9bc58cd5a62cd/
         arm |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/646a1dea83e047d9066f1306841ec96c5ec9ec66/
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/aaae1a63e4af711be2315b1143e2481b8b13650e/
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/fb267cb318ec001ff66775d2768d66815517687d/
         arm |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e1a44656d7fdb15bc99fd4b76093109172b42235/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/ea43c551542a92a007eec72544543a43bfa9950f/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4b140ede96cbb9f32427182619ddfb01aa386ee7/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/39dfbb776f3b6e6745d57e0634a0ca29a9847057/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9dad98ecf795ffb3fe23b739b4831b2630cd76b1/
        bfin | odhcp6c-c42e34111e19bd435dc... | NOK | http://autobuild.buildroot.net/results/83c99330bc69a042c2f87442a32c2866bbe67a15/
      mipsel |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/31a933365bc82ddf7c66a6f7ea43fe0365982fcf/
         arc |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/6ae84c53985ab52ab1c64dd1e2a16d0bcf9eed1e/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/306cacf8f652530c28b56886224f7b44aa416a4f/
      mipsel |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/7b00f4d3f4d700632ccce9bc83202c4d7ead8acc/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d1343c3be9710d5be3cf6e4369dd5c75102e7b92/
    mips64el |                    sdparm-1.09 | NOK | http://autobuild.buildroot.net/results/ead9c1d354e9beebdcb892ded2d63b8d3bc3eb51/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/0b6d0c39aa51d4201ccf2006ab5abb90c5972d82/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/ff0ccbf0980929857d27821aa3f0844a7186178a/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/e80c0093367f2f628d2004a947e9337b6c642033/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/c4ba6475b41eed186e34ea733e7ed58932542105/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/52ed06d27ebb5105590d8df1bf2baccad0b6d651/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/7b0c8ad077115f30e897542d1092a5a2114acd17/
         arm |             vorbis-tools-1.4.0 | TIM | http://autobuild.buildroot.net/results/3d820ebd3d9d09368c7b3180f760316240ce7738/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/10b835633848a9e1bfa8d1ffadd98b580b84a7f4/
        i686 |               xlib_libXt-1.1.4 | NOK | http://autobuild.buildroot.net/results/d8597fbe756ad549a4aa0d1951362d22d7c5adbd/


-- 
http://autobuild.buildroot.net
