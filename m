From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-19
Message-ID: <20131220073010.173F3100DE5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-19
===============================

        success : 72 
       failures : 64 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

zyre-378b8b5cf76d10f5e41b33... | 10
           python-pycrypto-2.6 | 10
                     mdadm-3.3 | 8 
make: *** [python-pycrypto-... | 4 
              python-pyasn-1.2 | 3 
                  thrift-0.9.1 | 3 
                    ola-0.8.32 | 3 
               w_scan-20130331 | 2 
                     m4-1.4.17 | 2 
               libsigsegv-2.10 | 2 
                  libv4l-0.8.9 | 1 
                  boost-1.54.0 | 1 
                 libevas-1.7.7 | 1 
                      qt-4.8.5 | 1 
                     nut-2.6.5 | 1 
               qt5webkit-5.2.0 | 1 
                     php-5.5.7 | 1 
                  bcusdk-0.0.5 | 1 
                 cairo-1.12.10 | 1 
                      icu-51.2 | 1 
                    systemd-44 | 1 
         dvb-apps-be76da69f250 | 1 
             alsa-utils-1.0.26 | 1 
host-gcc-final-b93bb009e021... | 1 
                 rt-tests-0.83 | 1 
           python-pyzmq-13.1.0 | 1 
gpsd-a496a59c81173881900d97... | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/fc6487ec210949a0a6bb48c927f1876d7bce28af/
     avr32 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/042b044b3b025481012d0d967d48f1c59a0b5f01/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/0051f57f058e458c1aea66f66cab2871626d9cf6/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/81ae93018ca6d7a61460e0c78d5a60e6a5531dbc/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/58876dbbd627586422979c3cc12fc38877240a9c/
microblaze | gpsd-a496a59c81173881900d97... | NOK | http://autobuild.buildroot.net/results/d904fc122fed2a9467b188eb78f56f52f13a4738/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/824d2cbce5e4f9b86526a245252872cbcf38fddc/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/5176edb446d04871fb1f4644770d259b523b4ece/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/f3c4d18e5f8a1fc2f45000ac9d9e3388777329cc/
microblaze |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/db48622f6c3a998ecec84ec51f21b4a031ab0fb5/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4df5eb367b655a3cac983d0a6d124f84d787851c/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/b99e4f3d5235a2886d4901e92733c7af3be5a836/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/5f75c3d88fef8b38347dd651cd2a496e23231d95/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ebf731271dc74d8b17304df3de8eb34220ce371e/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/40e41766b4e8d2e51916c4ddebcc157e3bb56830/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/dbd7030f9a04d6aaf19b60ae04a2359228dda926/
   powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/848b116a4ef2c9aec17f84bc435ccc8b014c89e7/
      mips | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/5ffde1477b36fe1892c8fc9de95881d96dbb1dfd/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/a837a91b545e1776f5d1b60687f926f651548fc5/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/7d19a262b24914d4527cfc45c878430612c827b6/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/6a9b78aad128a5ad23f67bf61b0aa87c6cba5444/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/e35d3af49a4c1522380f27f734f040e33c0c4d1c/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/f40a2d18ef92644093616234f285695a771497f2/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/7e36bcad93cfc5aaabc5b26190414a4577ee50aa/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/85cd6646d550fd54f18c9def1b1a2115567a3915/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/da86af57917f2ca41d10e9421693ec61743e1215/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/04d3254fd576874deefe3066e799bf56771be3ee/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/4f298330df66f4f8ea15ceac469ed9f0967d3de7/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/3fd2aff98c82768396571310caf23114a12fc586/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c33a883d769b6e4bb1d52b1482bb966e8295bb9d/
   powerpc |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/e40205435cb26771e48c5479a10e3010bfa31aca/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/cc7feb8f4f3822a9004f4368107a9e8884dce204/
      i686 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/23c775b67801a796e09eb1a3e062c992076d1621/
   powerpc |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/17ef287e14b74a4373a57b034a5a8ae3126608ce/
   aarch64 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/4f92a121c43b4f0cc19efc5f44a9eeb219d216ef/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/fdbc5e9f3992ac0c683b5a84874b583921e94442/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/0a9b5d01983d2427c4c6678ecd6df7d8462cae47/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/cec5182fd0b3a458cc9623801a2f0a5622c3bc1a/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/2afd79fec4f5afcf7cd625ac2d3d3420b360905a/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/54d39e00b247cf6241e521b52b1af77c5083a53f/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/7630f4e46d80f257d51657f418b0160350d00d35/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/c67d168360b0328d7e58283ff280dfdeb0be12b0/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/1b42667d12705859aad390840a81373091468af7/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/2d810b44d6529be8f84d6e85a5ace22e26ad7d34/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/24e30e826322f4197b15fd48b3559da780adb6cd/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/65be0f0a2b5dfb2c4804d51c2496d9027ca5e967/
       arm |                qt5webkit-5.2.0 | NOK | http://autobuild.buildroot.net/results/4fb3ee3e06e375f915f7618bcb8d9cf800bd212d/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/03542997aa05e55690fbc55746ca9835d3ff6510/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/f9b15c744f6c2f17359061c0705e44b8123893c7/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d952d33ac1e67cf1f7fdefe0ac6930851b912d28/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f3e597625c551cd068c353500d1d77b90cb80ad9/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d2092e28a9ccb069eda911d21a650fb61ed867e0/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/15d5f454e2c9b0eb33dd28d74adda144ebc9f50a/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/2d7fb2e10611cccf629ad7aebb3260aeab99b910/
    x86_64 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/ab8148f89c886c8011596d575f80598f778037a5/
      i686 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/5b0470a356501acee4c642d13490fedd0df84076/
       arm | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/fec585eeff595abcb1e9acc5ed5c0c9542422a72/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/523f04e243525ccb8948f11898cd82ade367dcaa/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/c82451aecbcffaee5f5f5a28c49c43a918a80a43/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/d40600a2de147758475558a992c61e4987184fe3/
       sh4 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/ce0c6d513ed838d7df2504500088c75ca89d74ba/
      sh4a | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/0efbbcc7e94cdb184c5d032469e03b2b7da3d054/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/685f8e2dadc93bef35ec66495bf0ede4ec6d34ae/
      sh4a | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/b99baea09f3e0e8bea0f781b99692af804b1e61d/


-- 
http://autobuild.buildroot.net
