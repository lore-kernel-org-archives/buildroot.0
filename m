From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 08:00:51 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-25
Message-ID: <20181126070051.E6F2920D29@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.08.x |  21 |   1 |   0 |  22 |
      master | 213 |   5 |   0 | 218 |
        next |  30 |   7 |   0 |  37 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   audit-2.8.2 | 1 


Detail of failures
------------------

        i686 |                    audit-2.8.2 | NOK | http://autobuild.buildroot.net/results/8de651c8b390ba443cc3b0584c0095409d31e71f |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/964e1356e17677de7eedf959fc005c1a594e1314 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                libmpeg2-0.5.1 | 1 
                 msgpack-2.1.5 | 1 
           uboot-tools-2018.07 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e37e61bae1d81a7956e2843be70fea84b0bbb64b |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8e4d25e2d91409833a92cafdc688b55d4c91b5c8 | ORPH
     aarch64 |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/7d7aa9723f02f9bc78dbf6248674be4d402199bf |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/0729a7739a7dc8dee46b63e81045b7d6bce34d09 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/418443386731f12686cabc2e719ef667ad7b9338 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-2.0.3 | 3 
                  mender-1.4.0 | 2 
                   qemu-2.12.1 | 1 
                 setools-4.1.1 | 1 


Detail of failures
------------------

      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/c933f3398126f12091cc6be68ebcc7de47e8ee41 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/475b41fe938bec3e2515e9a0389a23aa89d952b4 |     
      mipsel |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/c255e0e6a9054a3e11416e950d1459ccb8572413 |     
 powerpc64le |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/e214e1a539cdac07028fb58c3822f89886d86f1f |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e6c0f41d9ec427391f783c287003cdfa455768d0 |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4cac7998ade80a7a9bfa3af2c0a9b71f5ff885e0 |     
     powerpc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b7c4e1b81293f19fac518e2dbe771552a7275576 |     


-- 
http://autobuild.buildroot.net
