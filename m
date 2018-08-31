From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-30
Message-ID: <20180831060016.8033420728@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   3 |   0 |  28 |
   2018.05.x |  19 |   1 |   0 |  20 |
      master | 171 |   4 |   0 | 175 |
        next |  15 |  30 |   0 |  45 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                     php-7.2.9 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/1b38089fa44e173fccbee2ae06130ff41160ad86 |     
microblazeel | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/3e08537cef9e250e01660fa3547010ed955bec6f |     
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/f6e16362b13f3e0ef95f989a5dd3958581807e4a | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 1 


Detail of failures
------------------

         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/cee41dc410866f4a409b3feff8f74398f0b38910 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 2 
                   mpd-0.20.20 | 1 
                     php-7.2.9 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a26b1c063d33651646e148a54a7d7382ba902c29 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9bee54f73de2c9641c2ed61a68ae6f4a033d5c0b |     
    mips64el |                    mpd-0.20.20 | NOK | http://autobuild.buildroot.net/results/30d1586481abee6a9bb5f10efcd475d16d4cb018 |     
      x86_64 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/c568edc4b7a41ccc21c40ede901c5a3e67f5e922 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                libsoup-2.62.3 | 7 
              host-expat-2.2.6 | 4 
                   botan-2.7.0 | 3 
                  acpid-2.0.30 | 2 
                rtorrent-0.9.6 | 2 
               target-finalize | 2 
                blktrace-1.1.0 | 1 
                  boost-1.68.0 | 1 
                   expat-2.2.6 | 1 
         host-e2fsprogs-1.44.2 | 1 
                    ncmpc-0.30 | 1 
                   netsnmp-5.8 | 1 
           python-pyzmq-16.0.2 | 1 
                    sox-14.4.2 | 1 
                     squid-4.2 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arm |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/d873a8ec2faa00b66882b342fc5b5f4b956f956b | ORPH
        m68k |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/4edc8e975f66eee8202e3cf3d12cc9ec4f75d76f | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/925384eadc74fae113e0c0a1c53a15e8883a0fbe | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a7280f17a245f1d06d98a01e8f3cc149c7c23921 |     
    mips64el |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/c7fa59eb180cfab2a366d5a4635daebc97ecb30e |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/1b748ef7a8537e18a0e875203ff1ebe795c72485 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/7585bc57f6f2093bb1b43eff2fa3fcf2bfa04951 |     
         arm |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/3a351ddd9b42b090e4a69ac480b7a16397699f6c | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/8dc4d5d51cf68e5f7db0859d96b5f2f25d0fafeb | ORPH
       nios2 |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/41402af8bd102b35083e34c53c5f2e8a266dc63e | ORPH
        m68k |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/166c9cfff259ae17bd946bad953eb12272161ab1 | ORPH
        or1k |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/1e2a6fe9acfcf8c7d823efb9aaa085d5f2449baf | ORPH
  aarch64_be |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/f656e390a5b172fac257e98e1f7bd5ae7a5ce46f | ORPH
        or1k |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/b4e53c0941588d00e5a70dbc414dc5f6f40041bf |     
     sparc64 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/2e16c0b678289f043e687e600ffb5ec4ae3a9658 |     
         sh4 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/d30953da03735326489686f584013437e5193556 |     
     sparc64 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/f401fb2f7e41e8240f5f672bd827bcb7ed96750e |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/30f436cd176b5920dbcc9620a587068e8443417d |     
         arc |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/f25190e513cf2f478e2b4d7c6fd5dd17d2b6bc99 |     
    mips64el |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/101f0191a80ae152af07fcf4dc51e4b4c0294ca7 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/d0eac087bc8222da91edfab9bc10a0c8f7aeec01 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/57b3f4663058d728987ef848e4b346656cae21d4 | ORPH
        i686 |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/ced36c8290cbc3a4f5dbfb76f7b24f7ddbb50921 |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/753b11ebd4a6c8d151cca17d40b2806c52f021bc | ORPH
   powerpc64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/54686a42e1028177905106e75c722ac6cff7bd47 | ORPH
        m68k |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/e9555a6ce34fc735771fed835840e14b0248f0f7 | ORPH
       nios2 |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/273556771e957f109a1fbf446a5193aac49b72af | ORPH
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6685945dd1a9fb485eb119f7e0184f053df92b65 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e75fd276ad2709e3c15abd6c8659f2687584f07f |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/c8e34d661098e96e3f627d7c022fdcf3efa40805 |     


-- 
http://autobuild.buildroot.net
