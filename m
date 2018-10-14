From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-13
Message-ID: <20181014060011.31BE1208B7@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.08.x |  22 |   1 |   0 |  23 |
      master | 211 |  25 |   0 | 236 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/34dd6641fdfd3724e220b40b5b203d768035f065 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 7 
                  xerces-3.2.2 | 4 
                     vlc-3.0.4 | 3 
                   luvi-v2.8.0 | 2 
                 dc3dd-7.2.641 | 1 
     docker-engine-v17.05.0-ce | 1 
                   gvfs-1.30.3 | 1 
                haproxy-1.8.14 | 1 
 Makefile:709: target-finalize | 1 
mjpg-streamer-f387bb44e6c08... | 1 
                      qt-4.8.7 | 1 
                    sox-14.4.2 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/7d9acdc34349cb89b77017a8e0c228f393efb8b7 | ORPH
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/89a330483f2c6c85af5bb09c707e4d03d89d5899 |     
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/8fa614cbefd6df926d368498d943e65e94490928 | ORPH
       sparc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/7d4461cb2e762d1c2e7064754db4b9ca5ed48ec3 |     
        i686 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/fdaa384e21386e18282386444e6d6b3c93329416 |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/c3df431454341c84d5420f605490fe00748f3110 |     
     powerpc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/61d27a8c24b245d053aacd9ab6bd8a3599ff6fb5 |     
         arm | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/1da75a9d9b6e4d04d39117d2915c1d195dcae002 |     
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/190a9d2f8fd7430d69bdd23971a89e5c40be7f88 | ORPH
         arm |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/b3fc62e7f372fe595966e84091c11ccdb4cfa77c | ORPH
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1ac91a26146d0f8f48f88e17354fe3ccae7b38e0 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/f99eaa301dd160202f4d3bfae9d10665d52db398 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8a3c94ea6c7deb0cf3f38c2ae3a5a0e4c19a8373 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ac248786400669299b0bff5a23abbb2247ea56d9 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/c5dceca73491500530c48d85690e6a48eaccdf19 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/9e69c10681001f1f69d9fc612cf1979152434c8f |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/79afd5d7de7b9dc6ad8879af429729f6337e70dc |     
       nios2 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/b3a2a4579dd246d3c3f2c0d49825fe670d524e71 |     
microblazeel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/2bcf5f8bea8b1fbe68345e0fc53859f72c62d187 |     
     sparc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/766af5a0b8355dcea3e395f44ec4c4cb66a32873 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/1318ba8ccb8b14c8b57fc6e8f6aa5798c384e668 |     
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/17c7fd6cd7ae57cc0364487222cc9111b2fa50e4 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/71584f5d31888e2ea63be2d331589acea4616e8d | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/3187d4e7eb5a28493a4e1a103961517f82d642b3 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/0ef892d4d67c7fb2a68524236a4e5b168754cf13 | ORPH


-- 
http://autobuild.buildroot.net
