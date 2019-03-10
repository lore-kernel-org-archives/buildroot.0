From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Mar 2019 07:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-09
Message-ID: <20190310070043.9A91E86A0C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   2 |   1 |  24 |
   2018.11.x |  25 |   0 |   0 |  25 |
      master | 220 |  83 |   4 | 307 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
       host-libunistring-0.9.7 | 1 
                       unknown | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/368a0fae96f6ce248a7a46247d1d8e98c0a98260 |     
    mips64el |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/cabec7f4a32cc2fefdf4f2967cf8afcbe390c969 |     
        or1k |                        unknown | TIM | http://autobuild.buildroot.net/results/c72c3a92c4182b56dc5673504f7b6bcb8e35de66 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 29
      host-uboot-tools-2019.01 | 11
            optee-client-3.4.0 | 8 
                   netsnmp-5.8 | 6 
                mongodb-r4.0.6 | 5 
                qt5base-5.12.1 | 5 
                      gzip-1.9 | 3 
           uboot-tools-2019.01 | 3 
                   glm-0.9.8.4 | 2 
              qt5enginio-1.6.3 | 2 
          wpebackend-fdo-1.0.1 | 2 
                        glibmm | 1 
                  libssh-0.8.7 | 1 
                  linuxptp-2.0 | 1 
                       mongodb | 1 
               mono-5.14.0.177 | 1 
                    ncmpc-0.33 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.46 | 1 
                          opus | 1 
              sqlcipher-v4.0.1 | 1 


Detail of failures
------------------

microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/4f5b7593e2a0b73d1bec2d6019ea2fd5bac7cdf3 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/304ed7eddd9a5aa10f16be3be422b2317f853bd1 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/53dfc5d2a09a6b118243a9837c9fd730e292d005 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/6d7eba8419df176930298c03fc5e253be46fb1f5 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/9d357a6389202b0fffec2c810f66bb9ac9625b7d | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/62c1a4d8f91cf5c3acbccb28c37255db72284add | ORPH
        i586 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ec07c2e9048e94ea23b0e4aae7b7778a80ce7e30 |     
  aarch64_be |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/713fc274367eaa85c8221da77ddcf5dde74d2663 |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/719eafb08c2a04031b733e361d00d7767912b520 |     
        i586 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/55a90ee4a234933169acb245c0860787cf8f2afa |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e92f2842acc4790ede05ffc31459504d140c625a |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e6b19867604dd4b4addbd9e815c8c4f10ca6fde5 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/307d93c420c4bb29d00ff384640bd1ac958af45b |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/da560a155ace19e8dce3a12c139e628b7c008fd4 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/62f3f3dc3d71cbab558b99a22af2a4593a542ad8 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/56e6b6d4df6cdedbb28c6b39f4e39954f18f8b9c |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d23ca4f845cb2504fe97b411d853bf505503f5d9 |     
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ea24791f8f7ea77aa139443f8db7145ef73496e2 | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/421e9db41e2e266aa56e345e9e522d391fbd3ecb | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7f89dc91d7bfa933c78c54ce7d9196fd31b1812e | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a6492c41952ad0537ed5aca1122eddbe35418d22 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a9de0cb54b2ea3f2792b6d7b9f660ffbf7ccf004 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9ecdf2580c034a94eea40ea21aeded9e7fbefa8a | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ce428db0e3046744c14cb6f77833569eaceecd69 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6911ecca9e317f1787ac3d7a6df261ed20f598f6 | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/50cb92b9703c0e49345e81f495311a4084b32ce3 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ede04cd626a0bf33b56fa267e7d8a5df70eddafc | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b2e2ba6ce5cd85613382e217e5e5c84409aaac67 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5031dd296565d7a81bb64b14737cc5fea072c48e | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/812048ca8124402637668edd4a4b55772a168329 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b6b6de603c809c7c875cb4741aeee23bd4633741 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/168b63b78ae4600e2e0b25baa448cd5c62d36a2e | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c632cd139bd5683317ac172d78f1b9b283ad557f | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c333fe7e31b6c97fc01b019ee27afe7bf45a85ff | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/89d9fe108a91f2869e97604ac58c15768cfd4b45 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7b051114350e538b51e32d151f24f0654dd5cef8 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/78b5401cbcd31412ccbee8c0a93c67602bd64082 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/f7be30ffa28b7f367fb5343a7d69dc8bc7c3a170 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/85b1d27786ae0579a5f4be762498ad3e3d7c1ea9 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1ad718fd59c552802eca18a5db3dd18558dab576 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2a2979bb3f22572504b190f5a4ef1fa1a1dae0b4 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1c7c99c2b71e7be48ff9f836bed46491019b0d5a | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/f7105a00566b11fe798dfacc7b4abdb1409019c4 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c60c56a555f15f44c84bea4703d48123ec655ef4 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2440136d3bbf5a4f6dc34f407cc1eb71c67c90b1 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0af10b5e97c17d60c6223daa5c95dec340a9c418 | ORPH
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/752a5e864a3c4300c442685c6d9e84b7f70639cb |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/81e83b4aaccab7c45055d4241d84c4926c124d17 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/08b24b352c006bb0dd0b5cbb5a329ed97686edde |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/673293c0ee0969e2bd71873298afd9b9ea4618c1 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/162198617979a83b66f70ed6013251942ed04d67 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/bb2188bea19dadde7190302a8a78f4822a7dcf8c |     
      x86_64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/f50ad6538609c08f7bdeca9670f6df8fab4bf2e9 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/9543abf8043e72643a428cd7eed053f51e9e2485 |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/9cc015b3bcfc06616896eeb1fb014f97dac9d3ab |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/4b6fe232673828f2c98d0a10776c3b14e730f589 |     
        m68k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/6b87a0918cde73e791c65e950d5e200a4be237ca | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8023c25aa9b8c46d67ce68b17e7bde93fbd24366 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/237d77e197833ee96b4e1912b77d9dcad734e7ad | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/db30a158239ce559afaaf143694063b9979d0047 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e71f0fc1240a0ee659e1c924c13130765f975d76 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/5cc1a7f50f4aad378eb6f5499ee462e79bfd1d79 | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/4560e727310a5f2ed53f914f1cb042e5a9c1bf0e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/61b615a5c6e3fb37525d17ff9bd252428708d59c |     
     powerpc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/655deadb13a991383d4e5585b13a740981fc6970 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4080511ff690e5aa2f0fdf1ce511888a9673495d |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c6281dbaec5b9569a739ab07f9b8e0a61d33f9f5 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ed9da132de7372075059d06aef841052b815063a |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d316fefdfc013e81b88205856720f809633647d2 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/932faa33d33f56bd058610328d291b622174b62f |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a3c87993b3995f1d126db17f2da7e4e50d4473cb |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ad153feb0964398f0f3e498be0eb1ef8ad35cb8b |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4f0cf373e6e03f6f7b9ac13a7b9285372c336166 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/776ab32cb6d49a12d3af28ab7751e122894ed758 |     
     powerpc |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/ad0c2dfd75be020ddfa792f145390fca14742471 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/7aa72b2eca778f5336ba7d5812358b5920627813 |     
      x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/fee306674cbf8b231368565f3b6f15dadea5be36 |     
         arm |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/c2f20723aae8644f100a3d2fbca1862d3f4b7ce4 |     
      x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/5b7a69ac5460e34527cf6cff073955c39f2f652b |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/60678cab68ec9aa17184b8417b64b3b79adf428a |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/13bd3a5f39bbf5ed2fb5290893cb5abcf7038274 |     
        m68k |               sqlcipher-v4.0.1 | NOK | http://autobuild.buildroot.net/results/ebd8678a56a7dd8679fd4ec3ca1385c04866cc88 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/30f33c65408d58740c71ff1ec46a9cada8d0fe40 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b93cd52fc46e4b5ab0f7e4ca299d57161c43f0ab |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1b5bbd505c2be252e5e507e25f11cac9a56fc3ef |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/19b70f004c73221c4c44a7d8089e6c6b3bf69e45 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/81c61c7233fbf4811287178e2bad18af19e13780 |     


-- 
http://autobuild.buildroot.net
