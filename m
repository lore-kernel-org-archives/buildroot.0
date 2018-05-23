From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 08:00:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-22
Message-ID: <20180523060052.64A80207AC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   4 |   0 |  23 |
      master | 245 |  17 |   2 | 264 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
                   libnss-3.33 | 1 
                    quota-4.01 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/a02e4d52cebbc51489ec7c93636c548cbc2475bc |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/adba0c388a9fb1d6ded157cd28ebdb5d03115ff6 |     
microblazeel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ccc66b7c050aed0f66c4756219560e46d7313199 |     
         arc |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/b8345b53e785ba0c5bb668a43270f97c7703de09 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    quota-4.01 | 6 
                  autofs-5.1.4 | 5 
                  samba4-4.8.1 | 3 
                         boost | 1 
                    links-2.14 | 1 
               log4cplus-2.0.0 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                       unknown | 1 


Detail of failures
------------------

        i686 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/56c166477d687518626fa8444356ca22357e3337 |     
        mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/48bf25567f96b739a58c47e6cf5e46ece04accfc |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b965ebcb0c47e2a308c11f213a7995e23ae931c8 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/858af9824ed0a32c09b893bfd7ef6fbb6ae7c8ef |     
         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/7340cd1c6c6dfd0befa2e0f94280886a7463d853 |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/504601ef42b1b8a65688dda7d96034c8b9386b3e |     
         arm |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/d194c1c69a0aaa56b728d5479d74c67113926120 | ORPH
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/c9bf454de24a0c120cc82849333c2d0d8445f595 |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/fb8802a1dfa978b204a16c01669c23b4a58bedbe |     
       nios2 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e3d775199cf5ba4dd9bb07f622ed8d7479972237 |     
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1d6298a066ae161dad0c20b4bbc881629973c84d |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6da7ee7ddc9629f9d4ced702d98994481b13d208 |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d993c5ed08c319d79b5eb5fc47496d41ea03351a |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cfd6e6b5c4713fa06f1bdfd498e839579431b9c2 |     
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9eeef04a0afe75f6698930e78f0813d0a8b3abb0 |     
      xtensa |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/8254b734aa195be3743831c84a2ceabd1a67b350 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/bc942d1e005ea2100bde227430d68cfd966d638f |     
      x86_64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/63467a616c65d96dbf26085784702d2ee73514ad |     
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/4069fb52ec03a733a57a81428189b27a5435e040 |     


-- 
http://autobuild.buildroot.net
