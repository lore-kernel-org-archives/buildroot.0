From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-27
Message-ID: <20180628060020.108D0208B3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   1 |   1 |  22 |
   2018.05.x |  20 |   0 |   1 |  21 |
      master | 156 |  32 |   9 | 197 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    host-cmake | 1 
         libcpprestsdk-v2.10.1 | 1 


Detail of failures
------------------

         arc |                     host-cmake | TIM | http://autobuild.buildroot.net/results/dc9f2f120ecef1cf64813509864a6f2a9b8ebead |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/510312d248476fd7be5e82687d6d2cbc7500459a |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                    host-cmake | 1 


Detail of failures
------------------

         arm |                     host-cmake | TIM | http://autobuild.buildroot.net/results/be7c98cea6233ef04ab6aa88fc0da29f68fa0ca4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

python-libconfig-b271c3d9da... | 8 
                    host-cmake | 7 
                  boost-1.67.0 | 3 
             gnuradio-3.7.13.3 | 3 
               mono-5.12.0.226 | 3 
                  samba4-4.8.2 | 3 
               aircrack-ng-1.2 | 2 
                      host-efl | 2 
                 gnutls-3.5.18 | 1 
                    host-rustc | 1 
                 json-c-0.13.1 | 1 
                 opencv3-3.3.0 | 1 
package/qt5/qt5base/qt5base... | 1 
                      qt-4.8.7 | 1 
                qt5base-5.11.0 | 1 
          qt5charts-legal-info | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/70b9969ea1cc1f943a9a021a62885d22b77198d0 |     
     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/e67763d65f1ca74bec8358a6648776cff7957aba |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6a6ff238bbfe7d7e29e0dd0303cb307e8f993420 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/889e6cd4472dd4901ed2aa2497d6e6d96435bd6c |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0e04b44ea957c748de37ad4d6c09b5f78f6d8c53 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c7dde96775b5dd0dce44f7470e9146a6c9f16988 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b5803b8b598653846c1d01312ce13eff22675d74 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d43497278bcc7689b11409ba15e6bb1c7bd822cf |     
     powerpc |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/7c4bcb839f0ad5bc0496b4115ff391a3b312581a |     
      mipsel |                     host-cmake | TIM | http://autobuild.buildroot.net/results/ca893c721cdb5f1d91c9d1c6d6600cdae5343d03 |     
        m68k |                     host-cmake | TIM | http://autobuild.buildroot.net/results/453921dd85a545ede7a61a8f1f1721e3fa739969 |     
         arm |                     host-cmake | TIM | http://autobuild.buildroot.net/results/c186075e96e4dfedfd0f96f9323f162ce3ca7312 |     
         sh4 |                     host-cmake | TIM | http://autobuild.buildroot.net/results/c5a395f17e939c1020a8b04e91300ba4411583aa |     
 powerpc64le |                     host-cmake | TIM | http://autobuild.buildroot.net/results/997849e4c0cbedbc4b862ae1c898ca82d624b970 |     
       sparc |                     host-cmake | TIM | http://autobuild.buildroot.net/results/a59ffb87b4d37a568a193c2900cdc138f295b9f7 |     
     aarch64 |                     host-cmake | TIM | http://autobuild.buildroot.net/results/feaf189f2f76929735e3cfc4bc56b40027fdb0e0 |     
        i586 |                       host-efl | TIM | http://autobuild.buildroot.net/results/275ab686bedd810a38c04b6f440fa0973f1f4a1c |     
     powerpc |                       host-efl | TIM | http://autobuild.buildroot.net/results/2b78c258db5fbb1af5892424df4cec0a2b802b17 |     
         sh4 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d24e4472f68343714de4836dc8a52fae4ea58147 |     
microblazeel |                  json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/4829425c38c58d9844aa07108532a93d47191d23 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/9934d4312b0aac9b4a0444b40c476c7108867670 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/5ce3470fcbc0dcab9464dd6bbdcd7d6492f65abd |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/97a1d71e024df9e6246f3b2349cac628405e4880 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/ae9570880ddc113ab456e9139df0248881909d58 |     
   powerpc64 | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/bf0cab3984eb3bd37e6f5cbf7ccb5b32c2b21b29 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/37090518d4e19fcdd251e88d4e9461c480fa4fd7 |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/588fe5f1e2b5857ff0a2a91ab12b11730a52c831 |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b640d4e601b4d11c41421f13f94930057838947b |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8d74619d6d190c9639b7b822867bbda5fbfca53c |     
        i686 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8f89c7f39703be6caf1ea6b05a63ae5f552ca39d |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/033f9dfbd7ec47e496cbf86be087d2fdc5a5e3a4 |     
         arc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3fffe0f7323d20f0610981ca5a7b02cfba311075 |     
 powerpc64le | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/18b3f2ddaaec0ecbbeaed52e1a84ce49bfc23e4d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/79e9adce07979aa7b7b5daaa34720be649b2dcf6 | ORPH
microblazeel |                 qt5base-5.11.0 | NOK | http://autobuild.buildroot.net/results/92bfb884c3a8aacbea0794789d6e36b6ce54778f |     
 powerpc64le |           qt5charts-legal-info | NOK | http://autobuild.buildroot.net/results/b6bbd6b571c61973d8404e50061c14cb0a3cd21b |     
      mipsel |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/cc353a57d93b9cdb30bfc1195064548081ae0df4 |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/82d024d727e5391a38c44425f3b3bfa487c0c80d |     
      xtensa |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/4fe66f3dfd801306213216dcf7ff6b5282548279 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/0ba8e5dc940a3e725186dd7358c4d1eaf5b74ac9 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/a51279c72d747f2a7805b32e67d1d7000926fb51 |     


-- 
http://autobuild.buildroot.net
