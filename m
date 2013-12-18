From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-17
Message-ID: <20131218073008.6219E100A64@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-17
===============================

        success : 68 
       failures : 44 
       timeouts : 0  
          TOTAL : 112

Classification of failures by reason
====================================

           python-pycrypto-2.6 | 8 
              python-pyasn-1.2 | 6 
                     mdadm-3.3 | 4 
make: *** [python-pycrypto-... | 3 
zyre-378b8b5cf76d10f5e41b33... | 3 
             bluez_utils-4.101 | 1 
sconeserver-d58f2de88c68193... | 1 
           imagemagick-6.8.7-9 | 1 
             gstreamer-0.10.36 | 1 
         dvb-apps-be76da69f250 | 1 
                aiccu-20070115 | 1 
                 webkit-1.11.5 | 1 
               libglib2-2.38.2 | 1 
                    ola-0.8.32 | 1 
                     nut-2.6.5 | 1 
                  libv4l-0.8.9 | 1 
                     m4-1.4.17 | 1 
          qt5declarative-5.1.1 | 1 
                coreutils-8.21 | 1 
                      qt-4.8.5 | 1 
                  thrift-0.9.1 | 1 
                 pixman-0.30.0 | 1 
  toolchain-external-undefined | 1 
              e2fsprogs-1.42.8 | 1 
                 netsnmp-5.7.2 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c435b37b486a68a6aed407b10ff7f7d450a03102/
       arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0ea28e13ac39505157325d71dfcc633a2197df5b/
    xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/5147d4962bf486c91c314eda4894140f31ea1b44/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/3a38c8af8f1966f8bddd76e974658f908af62ecc/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/af463591df5e7cfbf963fd489ee7561b82793c8a/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/f6f80ac3f8ed25b8376b225584d73cb0e2a0770b/
   powerpc |            imagemagick-6.8.7-9 | NOK | http://autobuild.buildroot.net/results/bddccf426a4e2115bc5e3afbbaf521382badb0eb/
      bfin |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/48ab28915fa8e99d26e710eda947cfa7ae6f7b24/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/1d4ce15f43e4924376abaa25cd05cd6e7466841c/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/a15dad226fe406c133dd9c6cf68163c1e765c945/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/23c2ed7efb2fe87320364983b1869342769d0a2e/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/989a3c8371de2026eb3500a870439a6a1f1b0ce1/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/e12d1657dfe671568570b253c8bb93b1ba8ab672/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/933d60d58c9dd6f122d2b44218c7be8df8e4b899/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/79e6c5081a5197c4f4647db497fbd1e27f29714d/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/6a8af9aa018da9820cf5daf0739171b05fb854a7/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/2242f8284aa4bdbb0ab959a6a6464f20fa043e2f/
       arc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/0dc056b2a27c3293701c5fb989d901318c39d61a/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/98fe3af8af978a8de22534b42850b9c9cdbffae9/
       sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/a0d083f05bfa0f26e968b41aa68550dc8d6b2f2b/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/e360e979fbafa5add49dba4ae3f6972220966e0d/
      i686 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/e39eb52d977f7d89df30d1fc88732db4442a75cd/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/162ddb1c4bd1cbb19f25b26162fe9490787d6c76/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/9c325751c1720c0e1765172d0a960a79d76d1e96/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/c41f9caca9189511ad73bc44be61dcf3a4844aaf/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/08ab270b7876b86eac6b81eb7fa2833864d50f62/
       sh4 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/254a8b4da87b91a66c2b572d3d2c9669ff55ead4/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/10484ef4eb8dd3d2e6e2cee05f27eb7bc3af54bd/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/1b80b212b443a02f7bd633a0e016d5f0bed34309/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/218beb88ecad3bd6452a53cdfc19b0a0d5be583f/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/9fa21d0d88eb2f14824b1b676ca473af458246dd/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/39ed041c942fc98740a1df6fb2524421fcfcf1ee/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/36adafcc4173abcb76072e237e45ebf689c96ca4/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/c0a1b7b8702e77b8251dfb8980efc8bfd7e5f08c/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/4b6e1a5cc58ed9c974ecc53ea9ec74383dabd40c/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/99462d579c6c7b762b81df660a2601731c95ef65/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/91260dba0b09fb4994bd81846bd345b072f5d131/
       arc | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/b2f01278cab24e51c9da0876c47145079b8e71f2/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ea1b0db9a660c701e53a0623618a78be2b52b87e/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cc994974d90facfabf0c070843703bd67b80c402/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a8681d0f929aab10934a3b355d25deeaa1e3bcbe/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/691368fd2b2d7e8820f1d48e39cc126204f2b2a6/
      i686 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/e601b9f3c840149e047f7268df5a1d9e4a310a1a/
    x86_64 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/27198787d83c9d07b1b8b94e799c5d598cdf3482/


-- 
http://autobuild.buildroot.net
