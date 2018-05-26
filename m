From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 May 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-25
Message-ID: <20180526060017.CC58020741@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   7 |   0 |  25 |
      master | 177 |  18 |   3 | 198 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   exim-4.89.1 | 3 
                  autofs-5.1.4 | 1 
          host-faketime-v0.9.6 | 1 
                libcoap-v4.1.2 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

     aarch64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c8d194ff745437c0a753ff78a3ad5aedebce0dc9 |     
    mips64el |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/f8020e0f35eb09123abd44709cb8452c227a7b32 |     
    mips64el |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/3a803fd6dba8c733d0e5b10520f0d1f3949e67de |     
      x86_64 |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/fede4e66c5af950f4636076cb30e173af2355331 |     
     powerpc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/914b352b037998ff2ee6b9fea7f71c64db88220b | ORPH
microblazeel |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/d9840a22ae5eb6572b6641b93f8beadc27d2abb5 |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/14b8677308e7862c1400b7cd798f55d42d3190eb |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 6 
                    quota-4.01 | 5 
                  samba4-4.8.1 | 5 
                         boost | 2 
                host-libsodium | 1 
                libcoap-v4.1.2 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c5cad100df59258f8ef66befc486e6ae45a7f5b2 |     
microblazeel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6f296592d8f23fdb375cd2ee10336d004c644bc1 |     
      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/f2e04614526fddb5a1e86dc4fea1173241cac140 |     
         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/65a9de72b25fd3c4ea7ae4d1b2406e92f750d1ce |     
   powerpc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/00a8788681d5114cf4e2a1283dcfccfe5693397e |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/1114fb8c5ed2df09eddd6d3950bbab6518dc8aef |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/598e19772543839113cfd1c651c9757491153e1d |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/9ef934414c01a934259b2c4fcc7cddfbec821fbb |     
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4d6d32bf3fd2522ec81964d6eef569e79d62aed0 |     
        m68k |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/746c6dcbf3f941c7baa5b382bd264d830d839be1 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/eb8a011f688c802845ba46d1c8572b4cce9dcd59 | ORPH
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e044156bcbbc9901131fb50fced83b2b91b3ed03 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8dc8ed652d206e096728db47a61eaafb8ac0d2d5 |     
        mips |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cbcc4244cf37eb800e1f97fa4f59340c54b22bcb |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c20e1d682a1887a17e94812bd122ef49f9bbfe1c |     
       nios2 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/5ef9281db80f3b578967eeb1ffb60223f4f9fd19 |     
        i686 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/d8eb0db3e51f7865a1ede31f623e2e16120ac978 |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/e414e245d2d7c0bd509b3b1d49eb4580d7458ae3 |     
   powerpc64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/dab6f379b2f03b2572c9994cc5fc1760025b28ea |     
   powerpc64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/3b071924dde15ebb9e03f6494686728fe3b78b94 |     
         sh4 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/1c8192e505da7e3c425024a0ef3bbdb711237615 |     


-- 
http://autobuild.buildroot.net
