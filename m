From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 06:00:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-13
Message-ID: <20190414060032.76421878CE@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  26 |   1 |   1 |  28 |
      master | 197 |  29 |   3 | 229 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               host-llvm-8.0.0 | 11
                host-go-1.12.1 | 2 
                       netsurf | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                   dvblast-3.4 | 1 
                        glibmm | 1 
                  grpc-v1.18.0 | 1 
                      gzip-1.9 | 1 
          host-mono-5.14.0.177 | 1 
                   lldpd-1.0.3 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.20.23 | 1 
                   netsnmp-5.8 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
           qt5serialbus-5.12.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
              spandsp-20180108 | 1 
         systemd-bootchart-233 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/0062ef1956b89eb6094e256770e007eef1ee74df |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/78bc48387848b50e04e300b53e237b439f02b798 |     
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/5dc33fdd0b3cc913629c07feb5dd78df3c100488 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/3e5739438fbb38691fe7bc230cbd4201f87064e8 | ORPH
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/7e891ff19e237354fc82a943f9fa9ee8cfd09526 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/38036a179cd48ff78aafbdff9a9a5c5e742f0741 |     
      x86_64 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/94fabd0e928d8a8065c1bad1a6171da8b85994f0 |     
        i586 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/5bed06f27dc5eb964b55d714f0a0f9c917064597 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/569f56154c0a1b2fcd9f6e311e0950dcc3378641 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/db8f73164bc96f66750efda3ebdd08e67779ced8 |     
      x86_64 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/04ec26ae26d50bb96ac6005d251e63d13770d62b |     
     aarch64 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/5b75c955f16bcdbced1454532c422bd8652eb89d |     
     aarch64 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/336e8512de5811c008ce60dd7bbf1d368e484ae2 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/6259b65ad229970cc0e4c7675c9b712a344c32b3 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/0f681481188d48657b5604c98aaac4e712dc7334 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/90003db9c25fa830ff3935179b10de255118ada4 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/fa016bebdac8c0dfcb7059b0e10118cc18751434 |     
         arm |           host-mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/a0ed7dff2f8bf5963ddccd992323c3ac5dc84472 |     
     aarch64 |                    lldpd-1.0.3 | NOK | http://autobuild.buildroot.net/results/64201ce8804b9041c52ca6692b6c2f0556882c7a |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/38b0dad720ec74d73ea89bf541ed619454c40144 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/4e97c88554bb4d757938db9ee273ae5592762275 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/104145f60f44e461093a11b414ed989620d62f48 | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/5552aba2869447d18d0b3dea2dd9b3ddc21296e3 |     
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/2a65d170ffc7a4c5ab07be7f35248fbd027f9c48 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/0c3a8c13ea0580645bf93e61f8c6069d2618a00f |     
         arm |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/70f4a3059d75b9fb9a99fb66035d2d1ee7205601 |     
microblazeel |            qt5serialbus-5.12.2 | NOK | http://autobuild.buildroot.net/results/3789f576d83f596824657489c77593627405caba |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/d582b18c4a2e6a8bd9efd3b539d63708bade5ed3 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/b34c3a2d29f27023aaa000522f97de7d31c10f73 |     
         arc |          systemd-bootchart-233 | NOK | http://autobuild.buildroot.net/results/84fb51212abf99faa2b7a46b8c44c42a3ca1201c |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/69066d2d6c5cb8b3bf15a5aa0e1ab81e04bf750d |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0c75147747fd5c72a26d634d7656705f82b2a13b |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 
                          opus | 1 


Detail of failures
------------------

         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/6b3a063cf3a6e5590d7aba09b6108365a4f624ab | ORPH
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/01e06d811ed611dac08b725caa3468ae148e7cb0 |     


-- 
http://autobuild.buildroot.net
