From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jul 2017 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-27
Message-ID: <20170728063047.8666621D7F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-27
================================

      successes : 166
       failures : 22 
       timeouts : 1  
          TOTAL : 189

Classification of failures by reason
====================================

python-libconfig-b271c3d9da... | 8 
                     gpsd-3.16 | 3 
         libspatialindex-1.8.5 | 2 
                 libssh2-1.8.0 | 2 
                 libv4l-1.12.5 | 2 
             qt5location-5.6.2 | 2 
                  cc-tool-0.26 | 1 
                librsync-0.9.7 | 1 
                    norm-1.5r6 | 1 
                 qt5base-5.9.1 | 1 


Detail of failures
===================

       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d09fb728217eecb35b8bed55560add60d1f0c4ea |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6cdbcfdd361f29ee85d32fd63841c2c195567569 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/311668904a29f0905c8b79ddc30be6b60e6868f8 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7010e2e1fc5a7a4cd715e1a8fd6712c004034494 |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/1adb95fb6b8e4a31b4cdd5d14c7ef3a632ab7e5a | ORPH
microblazeel |          libspatialindex-1.8.5 | TIM | http://autobuild.buildroot.net/results/90cbade9758c8251938f8251245b3d7a99287f55 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/7ad6344c3b85cdbe822dd1b3947e0a3483ae9cec |     
     powerpc |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/b4e39890e003e9e590a5bf17c9300c653020d88c | ORPH
      mipsel |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/45a9b3559ceea4e1399794f9612f717f7c57a4a3 | ORPH
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/188d3afa76d89a79b49f92ed43d081ca68ebab88 | ORPH
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/a05b9553b5d60029538c6c5a6384d386a63534b8 | ORPH
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/33017e33389910dacfa8e576aed8a4987ca8b7c0 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/1b0708e2cbf4867b1f1e7d81bd297a83131128ac |     
        i686 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7b24e03497fbd691036029dc16e7f745d153feb0 |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/460965d6feb1b9869a0f2621d28099a086725be0 |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0359cd752326dfc7b2e8003604417b797f99213e |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/5b090f1ac476f95bae0ff6bf7b4f02a66e7b2ea9 |     
 powerpc64le | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/9d3144426f58b60b4f92caa5638c15e8af2de032 |     
         arc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f82640274613939d25bc18c9bd4424e9fa471365 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/9cd662008a681013c6e48279243c1c9e4800eff9 |     
      x86_64 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/0f703ebdd8818ed019dcff912431591ae8810cf4 |     
     sparc64 |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/429be757bf3c9d54f80deea13a0a53e708d7c912 |     
         arc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d |     

-- 
http://autobuild.buildroot.net
