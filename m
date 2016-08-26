From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-25
Message-ID: <20160826063030.03BFD1038C9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-25
================================

      successes : 165
       failures : 44 
       timeouts : 1  
          TOTAL : 210

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 3 
                 libraw-0.17.1 | 3 
                 jack2-v1.9.10 | 2 
libamcodec-6f9b99182f94be14... | 2 
                  lshw-B.02.18 | 2 
                  openjpeg-2.1 | 2 
                    qemu-2.6.0 | 2 
android-tools-4.2.2+git2013... | 1 
               binutils-2.25.1 | 1 
                  cairo-1.14.6 | 1 
                coreutils-8.25 | 1 
           dmraid-1.0.0.rc16-3 | 1 
     docker-engine-v1.12.0-rc4 | 1 
                   fwup-v0.8.2 | 1 
iputils-55828d1fef3fed7f07a... | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                libaio-0.3.110 | 1 
           libfreeimage-3.17.0 | 1 
                    libiio-0.7 | 1 
                 lvm2-2.02.162 | 1 
                 mesa3d-12.0.1 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.18.1 | 1 
                    ola-0.10.0 | 1 
                 opencv3-3.1.0 | 1 
                oprofile-1.1.0 | 1 
               protobuf-v2.6.1 | 1 
python-libconfig-b271c3d9da... | 1 
             rabbitmq-c-v0.8.0 | 1 
          sane-backends-1.0.25 | 1 
sconeserver-bbb384404575f8a... | 1 
utils/CMakeFiles/testpat.di... | 1 
                     vlc-2.2.4 | 1 
               wvstreams-4.6.1 | 1 
              xapp_xkill-1.0.4 | 1 
              xapp_xload-1.1.2 | 1 


Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce45c995bd6abda6487ae3a11b4f45a7b9b3f8eb
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/a3f81a4e205faa4e9d378340aff53eccd4cda582
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/a757c00136d821826e5930d13178b7dc4b2d2271
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/a46927cca4600d7b0c69d6eba3f2c6796df99dba
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/4a7c70554dd684deefe6458523eed6fcd1c2cb38
      x86_64 |      docker-engine-v1.12.0-rc4 | NOK | http://autobuild.buildroot.net/results/e8ec31ab8dbaff41157ed0a7487e8b239c5917ba
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/1c4493c6a18b7a93a0368420c8f79032f9330891
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/97cbfb53143885116e4507d46b023b8ea7a43186
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/fa7c93c18df9d68b78996babbfe3fa4f11ee9695
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/5e8457f673355d03a7c12dc9db04239282d7305d
        i686 | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/c7dd550e0b4b72734656190e87d8a77c03ee2e58
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/af67abc159c6e79dbaa475f5c666d56df67d940b
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ea7ab1932649ed3d220cfbc3094f3c6bbc3424d4
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/16a38a4277dd1152a5955d62cb92f85447791ef3
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/ebeacc469444cb08056fe600703e860f768b8842
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/f8dc6037f378034172040f7891d814c5aa91dffe
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/1f3b0d483603fb69765c15c7189ff975b72d09c3
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/90c9cb4ffe705b8c91f4fb602e33e2ba9bcdee77
        m68k |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/21c80d3f980266b52efda56dcb6969716edc329a
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/7e950e681a183cdc94fa8d2b38a1b17557926064
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b691006797076c6cfe9424acd0d253808dfddd33
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/82139fdb356d5d010c0f0ad8cc2c88ac70e74421
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/0ba7097ccde992494682cdb710975f1729f0e454
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/14f71954cccc1fa171cc7a64b98dfbe57ba4be89
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/8221abc643876da05e1cf52a78300ee7a5766faf
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/454bc52fa7db80f17f20920c1c1e18f29ef57024
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/eac27356cee6654d03d7b7936cf42ec888511a9a
        m68k |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/3ce4eab9882db3dd0bdc261c7b40c88a4011f9aa
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/4f0fe3d8e69b0e41da11327df962df23fc7a21cd
       sparc |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/2b711a4125b6488bb095ae122e27adc54535bd75
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/e16ad6a065817e1879da81f982fd05bce47afc5c
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/5eeb03cf0d2d46d6d069ad6db69796d728e4c53d
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9c886aec0e17347a5febabd4475d527c942edd5e
        bfin |                protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/2c151e84d7854a810465dc16869023e0ada2d586
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/1885a6baeb08786dac97cc8d44ca1fa7a5b30193
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/75421fced130f6c534f8b9f12c15c46fa45e7bd2
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/46f1163fa55f06231632bc2756da87d464bcc647
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f920dc6063d67ffc4c608cdc04dfd3d7db1243f1
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/e8a30e0faa3e564b1d95bb28cadc27541070ad48
         sh4 | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/b89c7702a9dbc58ca4f532847d98f87e46c14f8e
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/36528dc5849a910fa2efd41fc8a0c912e70447e6
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/aee9423a3d6a9d0f67ea14e2d0c05c969b6e5580
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5c4c3a1468a5c30beebecd0a5eb4169a42e9bd9d
         arm |               xapp_xkill-1.0.4 | NOK | http://autobuild.buildroot.net/results/7e846a03722372dd9e7ac2dd5cd9e23a5ad489a3
      x86_64 |               xapp_xload-1.1.2 | NOK | http://autobuild.buildroot.net/results/69211355dce016533c68f235cff92d747f57245d

-- 
http://autobuild.buildroot.net
