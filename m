From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Jul 2018 08:00:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-10
Message-ID: <20180711060039.0B99D207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   1 |   0 |  12 |
   2018.05.x |  16 |   0 |   0 |  16 |
      master |  85 |  35 |   0 | 120 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.7.6 | 1 


Detail of failures
------------------

        mips |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/1c6c6fde2c96d7882c37facd44a83cd51b748510 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 13
           cups-filters-1.20.3 | 4 
             gnuradio-3.7.13.3 | 4 
                   wampcc-v1.6 | 4 
linuxptp-303b08cbf55096aba5... | 2 
               aircrack-ng-1.2 | 1 
                busybox-1.29.0 | 1 
                    host-rustc | 1 
               mono-5.12.0.226 | 1 
                 opencv3-3.3.0 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/a47a87b927ce9b84faf20fa158344be79fe50cff |     
     aarch64 |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/f8772dc62f92c4bf51374b26b22d1b091197d1cd |     
         arc |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/c4d85c9e909c40b26e005ac5e154e861c8256794 |     
    mips64el |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/d7b0b9a2bc64ec16e99ab555fba9d6ab831f4525 |     
        or1k |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/f6ebb218a0afd0d40c20b17b776758e4a7597421 |     
      x86_64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/50358c9e512246b6e87bfbf52ca4c071e1bc38d8 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c165678142c2eb7ec271b8d667ed5ae647cc47a6 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9e29009e3674e44fb2ea679c0c2a89ec5069e151 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5113ddcca0d152336b88c5f92343b2a88374937c |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0f95906726de0796899e0ee274644369933fcecf |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/4710fbd36a216b0a25fc0a42f031bd15411d6f7e |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/ecb1e56820950fea6d24acf00acad51eebcdc3c3 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/a3aa7a8ad6b2134623eae5b08a841465a21a4ffd |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/d4a75012392307f3baf2201f2bddc8778a8f7a08 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/ed2a484b65a8d61204a591deece40d4c410da51e |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/0941d7d6b99b2b5aa7d3a063d669b64ff67a8760 |     
  aarch64_be |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/490f528cc90d5888050c6a1882a8949910a04388 |     
        mips |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/3205bf7004f6abffe402dd835ec365727269a842 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/37e3e5aa6f9771cb568f9d7383c2e094d062c103 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/7b287ce59cc5d7d52db7b7a62901dc0aa7fed7b1 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5d1e679f8b8bef0ed077d09dfb9681a5df46d471 | ORPH
        m68k |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8577a8f533ed48797d5fbf904afa5b3f6774f3a1 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/dfb7d28b122993925567b3d333c20c62b53136ad | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/0b0a651274497aa00cc776b1a523af52f8d836ab | ORPH
       sparc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/aab468636c74f2090f24ed105c197fa5b441f67e | ORPH
     sparc64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/fc490d399c0053551ea030cd31ab5723310e4a21 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/97aa726900e15cc17034c3c3e3928d9d8ef59d8d | ORPH
      xtensa |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/dc52803f0a573b49d70296bba5b39df7082594a9 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/9ddbfbf1baf5d4330c71aa5d2e20fd8948c2998c | ORPH
 powerpc64le |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/b548f08cb4ac2db6cfc93ccc9c7fe4dcd4485632 | ORPH
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/2cf8d6fb2e062e94dc1a9d140f671d19878f24fe |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/35e35716f979c0d1d041ef07f6355cf7d263413c |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/af8a28cc80d21ca5ee0ddbae56c50703a1337f7f |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/e3dc05904d0b2768097cc5d7ba57d9160d94b2bf |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/de41f7edc6182c9027e69ed6dfded7a27b71f9cc |     


-- 
http://autobuild.buildroot.net
