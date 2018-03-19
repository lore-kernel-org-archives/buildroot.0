From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Mar 2018 08:00:46 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-18
Message-ID: <20180319070046.B067120893@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  32 |   7 |   0 |  39 |
      master | 218 |  57 |   3 | 278 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              sdl_mixer-1.2.12 | 4 
               asterisk-14.7.6 | 1 
      gst1-plugins-base-1.12.4 | 1 
               libtheora-1.1.1 | 1 


Detail of failures
------------------

      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/69cc520dae12e386a94e9e9a1396c08cf27cef05 |     
    mips64el |       gst1-plugins-base-1.12.4 | NOK | http://autobuild.buildroot.net/results/8831997112eecf41fe1c640b959f4b20ee81ce94 |     
 powerpc64le |                libtheora-1.1.1 | NOK | http://autobuild.buildroot.net/results/f20ecae358c3f5e2e8577c53b68e75be6bce51f2 | ORPH
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/d42c473bb2ef61b894fccc9553fdde8cd147e8ef | ORPH
 powerpc64le |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/aee8f07a898e8be5071134949f47f57066ce3361 | ORPH
      mipsel |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/98a481b30e351a7006a2013113992734ffb63098 | ORPH
       nios2 |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/aa572829d773df0224b560c62e841a6d8599d46e | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 15
                    htop-2.1.0 | 9 
                    liblo-0.29 | 7 
              keepalived-1.4.1 | 6 
                  udftools-2.0 | 5 
                     php-7.2.3 | 3 
             bluez5_utils-5.49 | 2 
                  host-go-1.10 | 2 
                 mplayer-1.3.0 | 2 
                   exim-4.89.1 | 1 
                    gst-ffmpeg | 1 
                host-libsodium | 1 
           libfreeimage-3.17.0 | 1 
             libmpdclient-2.14 | 1 
                 mesa3d-17.3.6 | 1 
                       mongodb | 1 
                   qemu-2.10.2 | 1 
                wolfssl-3.13.0 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e38a61cfa5a6fdb1ad3d429baa890a22dae949c7 |     
       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/626dc81dc447c288469fd977e03127bd67250e93 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/ff006725120112eb4c24130beab1e1418f198bad |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/41c983f345a3965a88b9ac3677d2893fc1411e0f |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5b1275db046ae5bd42de6267714eb84c8dc70be7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/50490adde90121f4ee4f4a5509f33ca1ffd273e4 | ORPH
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5e8a09462e77208e5e84803e2b4107fc1e23f9da |     
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/55814bb2876d00726d4ae78d2637253d97aae232 | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a699a219ede5fa70468d3d9dd34f74c22c5b3bd0 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a36b1daf31e1f58a273d21914c6503854e5eb48a | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/c3faf51f180672942a5ee02f86d79b002dbe8c3a | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5a6a2eed3a15df530568616ff96c25af6a694b7e | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/37a2e88f5d32ca5113867a344491a68d84e95983 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/9ce2ef5ef694253b9759016c9702c5c6be7849a1 | ORPH
   powerpc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/13966bfa77e7e9b04f7cbd798b5a4d1abbd154e3 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d79f3c78e4052b5d3e44f60a8ee15fe2e9ecf855 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/85130de75e93ee984f4973502a6b7da488fcfe6b |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4969de0fecd497aea1c55c8857000e26ccb3d1d9 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/26e03bb03b7ced27ef2230e28feb01ce7b58270b |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f5d366f6a6d0af2568dff1cb67783f4e2fe7e8b1 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7306b93d9c9affc4be536d296e728e36f7921516 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4fd9ad8d6a083cc1a62536d2e80e7546c955fc3e |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/89c5808f4f5f1cba98c1cd2c2f08e039ed8bd054 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/92579aff50ca4e7af78bd357d664a58baf5ca9c4 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/44bfd32f7cdb215f11e09372bc29e0ba9d75e3dd | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/98ba2df413f2489cb4f3da061892f7688bd8a172 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1bf5561d97d4e9b75e00797c033839075911cfcd | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/3cd06c3e61962d1cd1568ef359cdf72165a102df | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/2b39fdd0c5d4ec83aeaeddd94a78ee7dda0b46c9 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/2eec7a59f78c6aae094ddb5471bf569886c900a0 | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5b8db95ef272f53860df67f514d3452e93d4f1a0 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/b9bfcfbb4dc0ef612ce3dccd44a9079cef3c546a |     
         arm |                        mongodb | TIM | http://autobuild.buildroot.net/results/7a98f1103c88cf628c4bc4fbe5412dd3d0eddb3e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1d6de5e569ba61cbeb75b1bfc00233ae22a803cf |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/629fb06ecb87960fcf6bb37b22d557f28d19c73a |     
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/379e2ef908b9c10c699f0e872275d67706460c8e | ORPH
      x86_64 |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/3fe966c904a12e186629623828dbf60f9b0fbeff | ORPH
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/c93b4ef9c54ac6d36a9799e663b95046ffbc315f | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/9aa3853d23c0dc72bf3632b4d66ae39f597f5250 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/0b7668bd7824503666a8bf3b87f2e5f52eaae933 |     
microblazeel |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/360d7bff60d7c35bdbfa8aa1898070851f4ce339 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/0ae90f58849449e4427f122410a67d3f58bde8b6 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/fdf54c8b5db26bb10321d2f78126505095004649 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d0c97f6c3bdb32917feaf503e8cd1dc72fd2050e |     
         arm |                 wolfssl-3.13.0 | NOK | http://autobuild.buildroot.net/results/fbf9926d107a878258e6a469433cc4946da3c494 |     
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/b0e9bd2c42f4c25e5c74ecc7fe0712be19af1e61 | ORPH
     aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/bc0ea6da0c9dcc0046071ace1bbc3cfdf484cc6c | ORPH
         sh4 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/19c55c1db5594fa735df916711d71e933c791778 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/300c1d49de6cb3dc11824c9025f02bd22b7d51f8 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/fb26c6e9f9abcf20dd1cccfa4c4df89c3dbc75b4 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a79c0b010fc13bb0c36e384ec2bc68aea0ad7b96 | ORPH
      mipsel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/31696c22aae51f93d122b70e4958cbeeecda4012 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/275976122aa05e969327e6a2fe610f1e35b82ed4 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/783631c4f0d040706780b7a23e9b7eca4507f586 | ORPH
      mipsel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/932db841f4d6ac486c9b32d3b0e753599d43a1db | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7b7526e2ff1c04895a613b3003dbe91c7b62f92d | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/09d8e45c001b0ce1377b006af546b2869b32e22e | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/4166fe81ff25c19f22866e1881f63e5000341867 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ff954bf2526d85c6917ced6bfba11fc8f8df0524 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/145be37fa913e9e7c0a2c6ab4d331829900741cf | ORPH


-- 
http://autobuild.buildroot.net
