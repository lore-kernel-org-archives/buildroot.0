From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jun 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-10
Message-ID: <20180611060018.1E5CF207AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   2 |   1 |  40 |
   2018.05.x |  29 |   1 |   0 |  30 |
      master | 228 |  55 |   0 | 283 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 
                     php-7.2.5 | 1 
                       unknown | 1 


Detail of failures
------------------

         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/619dc43860c068cd867b4f752bccff7fbc4a3f60 | ORPH
    mips64el |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/ce375b3f81380194a539d07b38635bdbb949aa96 | ORPH
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/dd2c1b94d776ac906cf2859bb5b8b5bbd4619ed3 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 


Detail of failures
------------------

        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/44fd639d234d906bc09c683db9ed15c9476617ac |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.6.20 | 13
                linphone-3.6.1 | 7 
                libtirpc-1.0.3 | 5 
               asterisk-14.7.6 | 4 
                      x265-2.8 | 4 
                qt5base-5.10.1 | 3 
            host-flatcc-v0.5.1 | 2 
               mono-5.12.0.226 | 2 
                 opencv3-3.3.0 | 2 
                protobuf-3.5.1 | 2 
               aircrack-ng-1.2 | 1 
          host-rust-bin-1.25.0 | 1 
                    host-rustc | 1 
                   libnss-3.37 | 1 
              lm-sensors-3.4.0 | 1 
          mediastreamer-2.14.0 | 1 
                poppler-0.59.0 | 1 
                      qt-4.8.7 | 1 
           uboot-tools-2018.05 | 1 
                yaml-cpp-0.6.2 | 1 
                     znc-1.7.0 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/8114799b96670ad0c34e0d9dda1c00dc9a0989da |     
     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/9f61192382ea4b57b0f0548626968752363bb13f |     
         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/87c91a05a5c99f99ca1f14cb27381d7bd0878774 |     
        i686 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/00b85b9d5c1040ec413507b50a45efff1dcf30c7 |     
     sparc64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/c28b02753f9c0772508d8b256805c44b1093f054 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ab707e50a4a7f0261ba1a2bc41559d8eee37a8a0 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9a6ee0e93d1ada974d5ce9de4ec7fc3c0aad5be8 |     
     aarch64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/cd654518ab5604705a84dbc70012505d1e27581a |     
        or1k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5bb087a141ea6f6b2ec865b2a60b9ab77ad20c11 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d7429e59d1f9f29bbb284ce086d062207de650d2 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/fa465edc2622235163b3783ee5fe482f42e62da6 |     
   powerpc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/a3f9845681025fad93a4f867bb667822e87a08ea |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/2ab8e02877616b0b5ca4b9be40f6d2033b289d74 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d25ea63b7bc70ff593a1508291595d8a13567a24 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/29f2e82a40fe166aa7f64c6b60f16b3149a0d415 |     
microblazeel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5f276b15db8c015d70c41bfa614078eb084936c8 |     
     sparc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/67f599967635ddcc7bb31a79e5f50636ce7e0cac |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/31b2f7a8f13c48023f247838e080d1a949f01ab4 |     
        i686 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/d2c03bc253bdf135b0f31f3d1e6fd33f7d37d64b |     
      x86_64 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/0e3a959855fad5899db184f7d2c960c89df03672 |     
         arm |           host-rust-bin-1.25.0 | NOK | http://autobuild.buildroot.net/results/60dafd8831872f8c4d5434ef662723fcda1c50cd |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/75c21557412dfe477582bbead303ae1c40138898 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/adaa2f79b202cb01ae57fa0cdb0eac9c07b22ea2 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1eab5068078f7e26f02b0360aca9bc724be72ff7 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/df82f2d47089eb34423ff4371107a1738de4ed64 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d6b5182bd1828ecaffcf3527638bdd3d309cd130 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/e3f04258c080dbbef0d2cf120174f06bda920dc4 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/dbc07e383605a84eb19a2fd1899668612212518a |     
microblazeel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b3788fb3311e3f34720ccd2ac21ee1986024f9d8 | ORPH
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/8a6c8dae05d4d4e8869fa65c1a54bd3617268c6a | ORPH
       nios2 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/fb5df310b1ee8f948cccb1c54545dd20c68c7f40 | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/956b8cffa0a35a417763ad72bb7c8e8a8b2fe6b0 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ca33434afd2d3a564fdcf5b0eebdf86e9deacebd | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/bcbd6610840e0a0667a080c6dae0f7a0d906aab2 | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b215300f2f48c68d9852bd71bb141569d9c88dcc | ORPH
         arm |               lm-sensors-3.4.0 | NOK | http://autobuild.buildroot.net/results/c6fcb47fa772b01dd5251bb2097b7e3403dde71c | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/594ea96cd7b6726052268a3c0b094e00e7b8f12f | ORPH
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/26f3a3fe299ea2e6ab5f621da1fb77476f2b5625 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/6f2d8e9762a386e780b400aa0783765fe9874c63 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/a1f81b69b3903c79393bbca3fdbf17f7505ca0cb |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/1a18a3d0303c768f82aee5c67045bdbc6c7a7859 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/37178a187498ad898c3d3bc522eb7738a8a63491 |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/29d1c72a5218b312b07c8294f917f44628904b7e |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/9dae75974bed55ede702ac4fa8806dae66be8cb3 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4bcf01bb378ff3c6868980fd380c85d3d0a9effb | ORPH
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/f7c20517f4fda2f5d72f4109275e9a1d6695b092 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/74c22867eb5e4e70ff139c18c56cfccaa298d763 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/7e38f0c6cfb01f711e168b81290ec736a9d9b792 |     
      xtensa |            uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/49f242c94266320f458cde742b3dd9eea1e35538 |     
     powerpc |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/741d8bacbe12e2f40047e30f7765039a88d1ce8f |     
    mips64el |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/caaaa5dc428c12ce7137194589153313911b000f |     
      mipsel |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/5737e85d7af603d436703fc549f609e2a890a767 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/2c3f5b18efe5f42e1ab5269e106b9200690330af |     
         arm |                 yaml-cpp-0.6.2 | NOK | http://autobuild.buildroot.net/results/3cb7c4d93e466c6eef69aacd0e561a9fb569e69b |     
    mips64el |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/4c3d9f6f5214052b7eda4c7bbfabe5b463080b12 |     


-- 
http://autobuild.buildroot.net
