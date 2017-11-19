From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Nov 2017 08:00:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-18
Message-ID: <20171119070013.B25EB203AD@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  11 |   2 |   0 |  13 |
      master | 191 |  21 |   0 | 212 |
        next |  35 |  14 |   0 |  49 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

          qt5declarative-5.9.1 | 1 
             qt5location-5.9.1 | 1 


Detail of failures
------------------

      mipsel |           qt5declarative-5.9.1 | NOK | http://autobuild.buildroot.net/results/cef4abbe043f3aaad03c73e07cfab9d24c3d0fc9 |     
         arm |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/5203869bd580fdac6059c0f9657fbbd91c3088c4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

kvm-unit-tests-5731572b2ac2... | 3 
google-breakpad-7515ab13768... | 2 
                       unknown | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
                      feh-2.21 | 1 
host-google-breakpad-7515ab... | 1 
           host-mono-5.4.0.201 | 1 
                 libdrm-2.4.88 | 1 
                   libiio-0.10 | 1 
        ltp-testsuite-20170929 | 1 
           oracle-mysql-5.1.73 | 1 
pdbg-77158819158d1d7053a737... | 1 
                    php-7.1.11 | 1 
                   qemu-2.10.1 | 1 
                      qt-4.8.7 | 1 
         systemd-bootchart-231 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/144bcad479ebf9b8f3e0d5c064b990bf2f25a120 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d00226b74015651f60cf0c33b9d4745b6cda56db |     
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/61f05982a3c5156ec3e08026e1c5b30f25dcd4ff |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/026160b3dc344a3b5d0ff2dea0c1989035e45bf5 |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/d407214a05da9e950015cb69c48f98b5b11edb5b |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/bdec4829be83e2f175ca183f535d0aad23f953ff |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/ff520f9d3478f6657d1353c532677f09e1107047 |     
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/80825b492abf61313637b109d6a0944b38d5f739 |     
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/078a047cdadbcfbba46e35c4d175d62711551b8c |     
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3dfcc948555a5b4736a390087eb6b132e50db2ca |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/cb9ab4383eae25314ad89800b0639901cfa4cfb6 |     
         arm |                    libiio-0.10 | NOK | http://autobuild.buildroot.net/results/eb5a8872e98daadbe01c02b89a4f87494dfe4808 |     
         arc |         ltp-testsuite-20170929 | NOK | http://autobuild.buildroot.net/results/29d141f3c467690a884062547fde288aa11ab1da |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3eb7e165074bc9fbb79e748b12c3bd78b8d12e97 | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/fe30b6d014b5076865a2f03786ed97192b746358 |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/77f059121c4e6f097706df5349105f0071ee6061 | ORPH
        i686 |                    qemu-2.10.1 | NOK | http://autobuild.buildroot.net/results/c3c5ef9e14467a5d5feb1c5b97e5ecc7c1b18528 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9e38841214f0b9ade1a01f4ef5f0c0056f69d1c8 | ORPH
         arm |          systemd-bootchart-231 | NOK | http://autobuild.buildroot.net/results/7f7af0d41120626edbbca839c9fdbb5c6bd259c2 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/5a770c598b934c7dab2fa66b481bf80e033215e1 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/8734d2d65732bfc4c234b28ec6caec219ee127a0 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  libogg-1.3.3 | 9 
              pcsc-lite-1.8.22 | 3 
dvb-apps-3d43b280298c39a67d... | 1 
           oracle-mysql-5.1.73 | 1 


Detail of failures
------------------

         arc | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/6e161926577355ced82426536227ddd2ba130f06 |     
       nios2 |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/75b154de9499383667c0f4f591eeca8869dfe37c |     
      xtensa |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/7988fcf42742727d7e16b043a9d3f155d255199b |     
         arm |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/f0f4b4da6808e8dd8a97f3f968c6eddadb420c71 |     
    mips64el |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/bd1733fc7364a869a3ae755236a6206b2c6f0ec0 |     
        mips |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/0e3b374b86dea6d0099beeb75c3db14abb64850e |     
     powerpc |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/3db9a1857f50962ebcb11922bb286c7ac34bb4a1 |     
         arm |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/8727df98ec543351342c9d5b799c1fbae0570d86 |     
      x86_64 |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/fe4834130efa6e5db19a04d480dcc2b4da33363e |     
         arm |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/e1120c83c2addd8ae02e1ad52cc2064e1704e627 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b8033a5a3f5eb9ccddbe36658e5c513800e9d4bb | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/5f7df672af255d55105f71930e8f624db1595897 | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/90b0dac085b1e27c3cc5b71821c7689391ea9761 | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/425a29c60d0a59e93dfe586bfb9b6ec49e40e316 | ORPH


-- 
http://autobuild.buildroot.net
