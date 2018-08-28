From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-27
Message-ID: <20180828060015.9D757207EB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.05.x |  20 |   0 |   0 |  20 |
      master | 220 |  15 |   1 | 236 |
        next |  29 |  26 |   0 |  55 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

linuxptp-303b08cbf55096aba5... | 1 


Detail of failures
------------------

        or1k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/932a6718d2f62bb22c8ee28e06d976b1305654ea |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 6 
                  boost-1.67.0 | 2 
                 mbedtls-2.7.5 | 2 
                cutelyst-2.5.2 | 1 
     docker-engine-v17.05.0-ce | 1 
               domoticz-4.9700 | 1 
                host-libsodium | 1 
                  mender-1.4.0 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2163706e22c994c2e1fb6f73db3697703ebefe3e |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/70cb1966e5d50a9490c5c10812f95fcd63994dab |     
     powerpc |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/2963bd55cd7c33ded3e5a75fc86079acfae844c1 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/bca5beb45c66d4c0556701f458370c79ec636e8e |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/8e072a91ded61a3c2ae1f740f098d3ada274d52b |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5eb5d0caa09129524195fdf285dfc3cc5e7658d6 |     
        i686 |                  mbedtls-2.7.5 | NOK | http://autobuild.buildroot.net/results/d6dc9a640aa1f6650a3e7b9397f2fe2ae3433f4d |     
        i686 |                  mbedtls-2.7.5 | NOK | http://autobuild.buildroot.net/results/ab5a58ea7845f9f378454ee1aa7e872448618ba9 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/f222b4389f9308363c386da25ec22a0919bc29fb |     
      xtensa |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/e723b3914462b0f03d3995d1dda93a111f0ce8a8 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6e48413e34180936263eba6f0a50f4f789d8d3cc | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/5ab83fda8f002a317047c4223aac0e07a8d95f56 | ORPH
      xtensa |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/e3e0c0d4a7ec42ca94f6a512dc84d3f4fe297ccb | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/048bd44f74e435e5db5cac861ab9699b85212d5f | ORPH
microblazeel |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/04c6cc738d62baa5ba59566b2f0cf5cd5780eee6 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d68f0b4801c8dac1a19bd4251de2cc5e8e1d5395 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                rtorrent-0.9.6 | 4 
            python-pyyaml-3.12 | 3 
                blktrace-1.1.0 | 2 
                  boost-1.68.0 | 2 
                   botan-2.7.0 | 2 
              glibc-glibc-2.28 | 2 
        host-python-lxml-4.0.0 | 2 
              ptpd2-ptpd-2.3.1 | 2 
         host-e2fsprogs-1.44.2 | 1 
                  libssh-0.8.1 | 1 
 Makefile:708: target-finalize | 1 
                   netsnmp-5.8 | 1 
             python-lxml-4.0.0 | 1 
           python-pyzmq-16.0.2 | 1 
               target-finalize | 1 


Detail of failures
------------------

         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2eccb78be11451e1dfddb5174e2c055ac128620d | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3b008d189fe1d7da69ed660f65f2a52ede90fb03 | ORPH
 powerpc64le |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/cd6a7a81330a25dea72af247127205206c22e744 |     
     sparc64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/dcd746698084898d91553838434bedbda43a9f91 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/6b91617616c3caad235e5a15fc169d2fc68a7ef4 |     
       sparc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/e9ac791964ef1eb065eaf7404c001fcbe4c1226c |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/dc7c8cd548409864ab0055e196c0280457a5fb5f | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/58347b94884eee2db28740486eda280e8c08e22f | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/0bc8ac1adf684a43204784e6399866db74788aa7 | ORPH
         arm |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/262484555dd01b708b7f9700ec27a98541c03c02 |     
      mipsel |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/8fc352e9687261acc1fdd3dba9a0e8e9edf8aa03 |     
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/c59c9af73354ef2a209dadf722e1b2dfcaee9809 |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/26a8c35a138bc81c72a3534565540d30c6a32619 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ed4c27bdffccc4374ab7f951c30baba8171d30e1 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/47b99a6de256bfc0f5a8ae1484bb34e93b407237 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/08365fc559dda74640b9750358c82e84600a68ea | ORPH
        i586 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/bf84ba2f9cc5572a1ce7ff4368647c66754ef24f |     
    mips64el |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/5d512ec9c7c28ca2fbcfcf6335ea7c3825fb7c87 |     
      x86_64 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/80ec43642cb50547ab687fc68063adc6357b0f5c |     
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/3b2af906b7f62d9c7367aa0ab756b26238eaa5ee |     
     aarch64 |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/423e5b81c89c7faf3e5af71ddfdabc60483f0805 |     
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/adacd219a1ed1ed73bf0ce6a6e1efbd9dbd7b838 | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/8c6ee934bbdae8de82cd6afd72ee232b5c993e90 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9d96b7376e2a0eabcca6b32690246f10d015ca72 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/83a0aef2581e8ae91d49e0637e0ed2e7f8ec3714 | ORPH
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/75c8fde60d04f64ce07558e4e1805a34eb4cbda6 |     


-- 
http://autobuild.buildroot.net
