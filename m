From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Jul 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-12
Message-ID: <20180713060010.5114420737@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   0 |   0 |  17 |
   2018.05.x |  18 |   0 |   0 |  18 |
      master | 121 |  48 |   0 | 169 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 11
                    host-rustc | 6 
                   wampcc-v1.6 | 6 
                  boost-1.67.0 | 5 
           cups-filters-1.20.3 | 4 
                      x265-2.8 | 3 
             gnuradio-3.7.13.3 | 2 
                   libnss-3.38 | 2 
                qt5base-5.11.1 | 2 
                    brltty-5.5 | 1 
linuxptp-303b08cbf55096aba5... | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
                 opencv3-3.3.0 | 1 
              python-pyqt5-5.7 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f2bed12e693e9860055871241ff2c054638517a6 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2e45b2bd621cd26e7f0920314761c5c4d39ab6e8 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a7eb4cbcdbd9412c344f45336dec58c82e84dab9 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/413dff87f5329d3c5180167a8711cdedea5dec67 |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0b93d13abbfa2ea3e14bd41cefae6e453d714956 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1b33079cbd88718a35a48000f3bedff1fe6d7bc4 |     
       nios2 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/76256aefa225beedeb2b254d6595a50963e69695 |     
     sparc64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/6252454e5d8a5f56e4f8b1de891b83ae17bedcdd |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/85dbbff6920927c4069cd67e79a429275e2e24e3 |     
      x86_64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/2e57749ffcc83a2687f64455d30d9d36c0c0e440 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/333441aac32d9d5e6c104abe0ef9b1b25a10dacd |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/61dcb074610d256302a8d54715339ca3469beefc |     
      x86_64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/595e89f5ef80214e2407c2480c7fd4ac49cb4f84 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/0fae7b4c226625d5e101aac2df9c5ebbce63567a |     
microblazeel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/a0720cfe66b95ad0e2a5f0634f3fefa4128a3016 |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/a980df2573ce8d0db097db058a03e1a9eca69ab5 |     
      x86_64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/8b3aad3755055fa2e3341f45cd7fcc462337564e |     
        m68k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/b73b712dd26c1952f3a970999043d4af2f3b403d |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/6cea7ffcd77a07f607c9af4ffe8ced7610de9f0c |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/b8550c3c6638c864016f2baf3c8b7d18aea4a5cf |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/8005539686e60c5dcfe03958ca918ec60c155d15 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/f3853685595bf76fccc0cb0966b2d78467b52c47 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/e0f48a77d5001e4f721264f25d36913a9def9104 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/b816d01484fcfbd422fea53e6fed5812f9901f21 |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/92a9a8882f753ada4c07ac739e3083f9262fd2e7 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/cafba5f0009fccf52e87faf2bcc3e46ae40145c0 |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/8ce7a4b5ce821cbab4d009444fd8e71fb44ed1de |     
         sh4 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/c9533026c89f69e921219cc05433c5bbb3a29712 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/d956506667b46af0bd167095828fdb62f96633c5 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/0198767056747a63f59a5bdbf2a88b082d2c2504 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/accba12882b21ca8726434c21421084b2710212a | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5e6adcd72e75da1897b51f6594b00004f7c25539 | ORPH
      xtensa |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/4281eacfed01f60bfa09444a2432a0df28c01d63 | ORPH
        or1k |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e11d955dbd1b8b9b9b61e4f62007237b08f7e38f | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5cf2719b79e05d0f9f014e2916480f83fceef403 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e763aeec8430dd3baf0bb2f322575a265cae7e05 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/56815e234c76558ae53a918a10af61680b24d00f | ORPH
microblazeel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/7ae8e002354fea340b0145014108f392dc54b817 | ORPH
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/de558c8184489f2902b187e0f2a5240d4f1d69c6 |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/977c33b1afd8a554768b78ee58eed5705de96e63 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/2f02e278aff678bafab34ca262163bb126b50bdf |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/a4e62dfed87d4e11d18cb87dd5415332d2c9accc |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/7bf0cf465617526b113a0a1b83e4c1ba266ca48e |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4a5f1be55baa276a4b818e6d1fe0b868c656c007 |     
microblazeel |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/210269a84ecf2940981b25a785316f157ae8f319 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/c2883aece93b71c9e86263019c7e0027875235ed |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/24b18c5ebadd50d7ff4d078d2848cc21f89e7b3b |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/7a49060ca6ba8748f784bb9cdccb8163d2c849e8 |     


-- 
http://autobuild.buildroot.net
