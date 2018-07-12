From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Jul 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-11
Message-ID: <20180712060022.D185820731@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.05.x |  28 |   1 |   0 |  29 |
      master | 103 |  36 |   0 | 139 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              procps-ng-3.3.15 | 1 


Detail of failures
------------------

         arm |               procps-ng-3.3.15 | NOK | http://autobuild.buildroot.net/results/d1a4700b62e7bd44655b372e2e52a93e8f1da727 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 


Detail of failures
------------------

microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/47db0984663db1417aa87bcf16154edc60577862 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 11
                   wampcc-v1.6 | 5 
                  boost-1.67.0 | 4 
           cups-filters-1.20.3 | 3 
                    brltty-5.5 | 2 
             gnuradio-3.7.13.3 | 2 
               mono-5.12.0.226 | 2 
               aircrack-ng-1.2 | 1 
                    host-rustc | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.15 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/33f660de72d8164a221caf264b28b576a5fe9e78 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5a7db292f1365f27e32695527701d5b827f60092 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3515c897ed2f2507fb94e3e07ee4de5d65e0221d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5db03bb36de914cf8ebdd46401ba46c13c5826c7 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d165700b8fab79a5db227a4b3291216144077d9c |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f1ee2d1f94fb2506c07870688b6172d7cb732337 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/ff401150f51eec779437e4a06d4ed3ec46998079 |     
    mips64el |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/eef4541eb9603b4d84058e1a16e2a8a91d00934b |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/7e86e3d72ca0ef980affdf91536f6eb4dee30fbc |     
    mips64el |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/35cae3a9e672a8c42d209f33cb4ea47fe32f8247 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/78892d0c61b5d8f7400e8768d0ccaa4a6c05fcc6 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6b23d04770ebf892afa1bcf7f47718e2a7d675d5 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/7be291262682856cd578117826a8e3c84f189ef6 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/fecdd69fa5f7b97aa6f972c83cdb8f6994207a15 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/bde69ced08ea0af308fed451d122b7b579f966c8 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/ff8676f0574cdb6bf8f68d9ea7797cf0338cfd5d |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/7278c5b102951e4203fd262fd169a0dae4a444c3 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/373c9b5920500667789972bb19df8d233b26575d | ORPH
         sh4 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/3fec61d6f096a9d1f8bb7d6e0698be3e23d0894f | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8b43ea2e26c367ee72d87f1e47ae4c24e68d6f65 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/b408f6ab4ad7912e7611ab20841fffd32b00ea2a | ORPH
        i686 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/66d74cbac2936136c18609a859d256d15a0b9efa | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e80a61acb96e823f18ad835923f089cdca43e265 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/01c3bb9f36068ab4f1f28fcef33300b2edbf16fa | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/86835fcea8be5d9d8a569c20a20dabacb3389e3b | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/948737590ba648f7dbade1661c0e2e8d9db6522b | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/83d8fb0fc25205d6fb8c96a9877e5901275c6766 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8ff3b420d0e210f9f503253513a2b3f732401c2f | ORPH
        m68k |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e5803f87bef4999ddf8ecea39971b413180bf980 | ORPH
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/3c82b65d8f0239a2ff2863777365f7e3c8f20d87 |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/fab9480e7456807b20e762f7bf1e4ff919208cd7 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/47914262be8de52cf3ba73b174522258127343cb |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/47f5f2d1ee7407f66ab082687abe9a743209b14d |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/312d503e408a54766c802c0622997fceee230f81 |     
      x86_64 |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/b2c77b9f83b0b5ba2385a6196a7937c2816900fc | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/52390ae6eba459f1ff139ed3858314838dff3836 |     


-- 
http://autobuild.buildroot.net
