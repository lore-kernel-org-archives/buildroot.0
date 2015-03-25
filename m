From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-24
Message-ID: <20150325073018.8670F100F03@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-24
===============================

        success : 212
       failures : 86 
       timeouts : 4  
          TOTAL : 302

Classification of failures by reason
====================================

                  powertop-2.7 | 35
                  boost-1.57.0 | 8 
                  dhcpcd-6.7.1 | 7 
                libtirpc-0.2.4 | 7 
freerdp-b21ff842ef3de583751... | 6 
pulseview-19be0af16af83ca10... | 3 
                 openocd-0.8.0 | 2 
                 jsoncpp-1.6.0 | 2 
      host-gdb-arc-2014.12-gdb | 2 
                libevas-1.7.10 | 2 
                host-gdb-7.7.1 | 2 
                     vlc-2.1.6 | 1 
             bluez_utils-4.101 | 1 
            gst-ffmpeg-0.10.13 | 1 
                   systemd-219 | 1 
              libarchive-3.1.2 | 1 
                     at-3.1.13 | 1 
             util-linux-2.26.1 | 1 
                       unknown | 1 
                     monit-5.7 | 1 
                     exim-4.85 | 1 
               linux-pam-1.1.8 | 1 
                nodejs-0.10.36 | 1 
                    php-5.5.23 | 1 
               libecore-1.7.10 | 1 

Detail of failures
===================

         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/9356bdff6c175f51f6b751b04a2c9bc9c62e8bec/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5c859b090253b2e84e0fffeb60ad7742af90d9fe/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/12de2777fb33837aa06e25391b3bf66359fe8014/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/573157d050f14afdf668ca8bb1402436b9f9671e/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/22e2ebf845ef02fba2223f6eb8015eceff3ec88d/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ea26b22e21cb345fc9ce8e7a3cc6ac762bfa5027/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b20ffbca57b2ead4aec88e3eee2c12e543ce6ee5/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8928133c6744773a2d9146d9e033ccba0cfa09a6/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ea40b19cfc89008563ab59b6712b47542bf47cee/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1f2d0bcba5c7354fbb1cc7fb2dfe9883a28913de/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/329042ec45398798793619fc2b8ff09ff8cbf3bb/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/788e7103c7c7c0199f221f42be6c22cc9eac3e0b/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/a88ca776366a4cc3cab3272d18c002f72a0a92d8/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/8ac1da09ce34d3ebcbcc3a78aafd3d2643a79621/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/673d4a0a334c4694cc4dd05ef99069f681f98f0a/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/4bbf9e785eb9cb0f916f0a2bdaf7a6a5f639f7ea/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/5909fe683311d135b273562fdb5d34a245da7766/
         arc |                      exim-4.85 | NOK | http://autobuild.buildroot.net/results/9605bac2972d3e3d3fb91947ae6921e89210247b/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/3965f9472e3ed9eee18aba5b73e5486d15812d3d/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/3da57021d14474f5d4219dcafe296afa305d07de/
         sh4 | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/fbc9345518d55cc45bd44ac523f9e019c8e85121/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/1289c49dee357b25a6e00e196eacd647ff45a9ea/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8b9a5662c6f4688588228ce0b41cce1c0336b7a1/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/61302b78795c903990d32ccc9207c24d61b20b06/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/9bb34648c72d73e39b787eb3aa797d43c791c3ce/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ea5088cb1edce7f2a46ea1c742a9a384a05d90c5/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/2e6215089fd33752b40b1008ed374703d6918b4c/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/6947708d2305db772d37771dd83fe4924336f8f6/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/f9f567d059d1a4c6570850775e262ab2e2ce50b4/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/b390beeb9a6fea12f1a4d9f2ff9a8a483628cad2/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/d18b3e116b680a3897fbea296938e900a1e5e80a/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/c6070b313451747a4a6a917100920d43d8e253b7/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/b523acdb33b1fe71f89c14fc602962f7c661fba5/
      x86_64 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/2cb3002dc1ba1b16c84cb1d96a4a3310caf719c8/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/da03f6925039ec1665ab41295af22235cdb4ab0f/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/4e42a945ba169fd2169a9683aaec10b15b2d102c/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c506ddb554814ae0ddcf9e231f61b31760d519c8/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f21418b1e8e0ec8657b4916b39511a5d5380dbc1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ade8ed83afeb05daed6e049e1cffc39cf1ab8fc5/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/1919c773b8b68b0ce6c8faaec3c82b0cf87299f4/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/92d5a18d6004fbd68f1edf988078b04932ce0088/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b0b7c8f65ee89b61524eb2a210b6430fd836f238/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/39e411c84f0b504d331ffda180be88b02b344e73/
         arc |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/a6704401bd532723ea60abeda71affb372c3c744/
      x86_64 |                 nodejs-0.10.36 | TIM | http://autobuild.buildroot.net/results/c0b3743cb7581e708a40b7ac44b18507d3ec11ae/
         arc |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/8b625bd4b0eb71dfee757ec4ea78c11dc417b23f/
     powerpc |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/d1969e6df56835568fb908b7f252aec0915d9fa4/
     powerpc |                     php-5.5.23 | TIM | http://autobuild.buildroot.net/results/687661093bae4727de5ea3a219052f2c0b76ba10/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/12b70937c32e776fe39f2a7742af5814a84d2be7/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/9865235a99f8cd9dd07fa5fba55b05b7d6ff8d0c/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/90c99efcf74885ca603fcdd7e86328e7ba98d6f8/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/701626fed73c4ebde42d4a32738b9ba73b993154/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bcc2a0c208fe261e0a325d1b35a506b881ce1f00/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/afd001b63cd22cb8c04c6bcfd428580bd7d4b282/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d78ed8475a4f3e0018213599e8cf678abe4db1d9/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/54af3f51a9ef2b875708a5f58d3715ab50b618db/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/26b1ddcf22fb545ec377a46007e89ff0b0b16276/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5f0efc3f723a20bc55627d4236cfebbcc84f5276/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8a3626be308d2436ef63f8f61084a83650b49b94/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/3bfae63d9c449685e5ce7353f195379ce554c7a1/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/710ba7010bdf6be09c7e9c29f97704f78542f22d/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f717055bda6466ed6b5c09a47fbf24a08d4c0889/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/215a6b5a9e3993333262dfea2bd1a38daa4fedb9/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/18644be4a911a5dca470af91bc68fe17fc36389b/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c02a75b39d20a0a3f7a8d74cc44b67cb1086a67b/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5ac3abbb5419d2e276cc67a4a13db33dc23b4ec0/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2c96afa81346315047b3c083141c0eafdc9126b1/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/535a5a53114f0ce9f99e8870d1fbb1232255ba93/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7d3668ab6b5fcbd7efddbd9a72b037e726ab8b39/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4e5a8f49c80c363b5fb35332e34206c9a4fe4120/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2084af2b199c971be6d0e94dce3d8a71fc67ab73/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5d3bf0f092fcd1b9e4c2012c0546fd3958172b27/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8e7d1f039b57400b1a6f9c14755b35528a457031/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7aeee18669b0b5150bbf8efd4144b5a1b8907433/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/23c56f24df5e35dbcb6822ea13e5feafd530cb8f/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d846b812549d51897d9b8357672c9c4b82f75402/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/705f2a6ae247123b2f34a0c63607689d93c2e0ce/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4a4faae451c9e04121fcb45d95c8504d05989e63/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/658e11f5b0bf3347a50a387b6271eb43c45025fb/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cf9cd753b448674d1ad73493996d96d386342869/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/53cbb62b68801ca40b13cb930c40d95e25692dd3/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c0edf0434b20f71ef5b34be69bfad7949496e2e4/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/937e973d607972c6ed3f801c17fe06048d9a4c99/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/fc7ef4d524e996df8b552da92925199f56c122da/
        i686 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/d587d28d2a4329d6485c5d8105d0bff1fb423516/
         sh4 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/b1b75ce5abb92cc9234be524681577cbc137bcc2/
      x86_64 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/278a60a1569eb57773945281b102a0495ff32775/
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/3657b6696cc401674887cf0c3c105f5b04599e47/
         arc |              util-linux-2.26.1 | NOK | http://autobuild.buildroot.net/results/9161d302891225d0137946ad762ee2c7e435f877/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/cc44a4be2b69d1343ff0f00b415ff729829d13ef/


-- 
http://autobuild.buildroot.net
