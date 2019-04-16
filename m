From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-15
Message-ID: <20190416060047.6838786EF6@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  25 |   0 |   0 |  25 |
      master | 167 |  50 |   0 | 217 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-go-1.12.1 | 6 
               madplay-0.15.2b | 6 
                    git-2.16.5 | 5 
              host-clang-8.0.0 | 5 
              ghostscript-9.27 | 2 
libcamera-d5ca33f6c7b0cd1ca... | 2 
              qt5enginio-1.6.3 | 2 
               wireshark-2.6.7 | 2 
                  brotli-1.0.7 | 1 
                   clang-8.0.0 | 1 
                cracklib-2.9.7 | 1 
                  davfs2-1.5.4 | 1 
                    efl-1.22.0 | 1 
              freeswitch-1.8.5 | 1 
               host-efl-1.22.0 | 1 
                  libssh-0.8.7 | 1 
                   mimic-1.1.0 | 1 
minicom-19ab49422f3431102c3... | 1 
                   netsurf-3.8 | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
                 qt5base-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
              swupdate-2018.11 | 1 
           uboot-tools-2019.01 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
          wpebackend-fdo-1.0.1 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/be70b9f5bba28d168679bc3a3dfa1155e57ebf3d |     
         arm |                    clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/fb5ff51cac2f87691b42ba7e728c30b07e08dafd |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ad27ed7fdd08eeb6164db34401fb225f47c707e9 |     
        m68k |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/548b4c7f81963a1dc10a28d3febbd163a05fe70c |     
         arm |                     efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/e2f7b4d25a343e3a2d81bf2e5f2002d833dfa3ce |     
      x86_64 |               freeswitch-1.8.5 | NOK | http://autobuild.buildroot.net/results/a4c58a41e8cced42331876be226e584278f77f4d |     
      x86_64 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/9ec2d89bba9357d42dbf2e6bed99dd174878240c |     
    mips64el |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/11a4fe21c79e4f9b8d4f90a8d91837a15742f198 |     
         arm |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/091b790ca6f5b46d5d29211dc1cb3ff05b62a965 |     
      mipsel |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/a69b58b35b270fdd2df9b076e7030bb594520197 |     
        m68k |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/f104c4e6ff41b1dd175f2d27f3b4ea7c9b61f7c5 |     
         arm |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/ee12bdba398a139995de5f6f6718be6a493541d9 |     
        i686 |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/74fa6b2bfbb1301e35c9dd1bbc04856c1cbf25f2 |     
     aarch64 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/e1635b10ce3ffcd176c44285b8adfda648ca0fe8 |     
         arm |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/3934b8b2a823366e5e99605393cc71a524a8e5aa |     
         arm |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/155f81a809580511bd755c7abef8373822aa0c73 |     
        i586 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/544574707e291e9ed1323c2a7a01e682919e8f57 |     
     aarch64 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/9fc8358bbcb91a566d2f6417b529c19e218db4c2 |     
      x86_64 |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/64ab825048fac1654b0d0698740ddf857fcc0afa |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/3a45c4dd6a50c02dda688552246c8a9ddaf874f8 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/a8ca8ca360e70ad9edfb00418b73b6aaada547fb |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/1e8297158a9d142289b04602105e4c65232e561b |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/3b872e646e93e326be5078789b31f771b863c648 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/2fcd7bb9f04f09c81c904e1d93d78db0d86fe7f6 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/32619562b43bf4d275c99a057cc33d8cea873c81 |     
microblazeel | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/08b1991762082379583e3224e0cd712b07d0843a |     
       sparc | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/196624d8a5aafbd4a45cd1a2d75eb39563903317 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/c79abf1bf671714adc1ffb13cda2facf4a1a3562 |     
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/f597bd9d82071d02605e75f9c43ebb7d9fbc0228 | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/0af9c1288db078425b740894b0551de77ac99b4e | ORPH
     powerpc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/7447c03426556f787f20f7ab2d36f0cacc4af1bd | ORPH
    mips64el |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/52773bbe01fe0d8f937f5406c72043eba5a6e18e | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/aac315cb6ea9df979ffe0aa5faba6077a90241a6 | ORPH
       nios2 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/2439cb60080450d9549c0d97bc69165e139618d7 | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/71681a4677f6fb078738e70f600de7db83b9f85f |     
       sparc | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/16b1bddf7588ed8241f08d1b678335a06dbe635e |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6c6503f9c8a4308a34f8f0da6767f74216dd98e7 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/78a53267d73787c161e3fafeb305f95aea62b2d0 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/7c0b14a0be269bd493469df337256362fa088c95 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/88efae52874438492359bd32393030c1fc4aac16 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b3cbf5f09b1d9e83359e6e65b74d2f8335d06270 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b57c39699d6b149b255bd0d7fc6419b56982c665 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/08e47b9ad16f2f9a6ca85d27a2c3cff8319f607b |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/df26705e56062f270f8919e8398c0886ca80144b |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3fde97f7e1c791b87350effe75a93c98df2eff16 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/5cf2a92ec73e41ec8eea0629a8b5bab71c834927 |     
     riscv64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/62c4c1f3f6bfd57894ef8d03da048daf922f8e1a | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/61cc92d2ee58177db3e6f6d96f211fc521f7d197 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/b77c6dad19a1fccd0931c34782396d4cb4c7337e |     
      mipsel |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/f3d7dee791e8453b1c1f73e8666d63475aee2fe3 |     


-- 
http://autobuild.buildroot.net
