From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-28
Message-ID: <20180829060025.C4F3020739@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.05.x |  21 |   0 |   0 |  21 |
      master | 221 |  11 |   0 | 232 |
        next |  32 |  31 |   0 |  63 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 1 


Detail of failures
------------------

    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/923adb21a2f2c8b7f92992bfca2646c8d5eed113 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 2 
                 mbedtls-2.7.5 | 2 
             host-boost-1.67.0 | 1 
                 json-c-0.13.1 | 1 
               mono-5.12.0.226 | 1 
            qt5location-5.11.1 | 1 
          shairport-sync-3.2.1 | 1 
                  thrift-0.9.2 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/04d541c658f59d36f8b16bc0ba8a962156871320 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/73efd94421415f29e528a9585abe2f88dddacb21 |     
         arm |              host-boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/567135446b3fd56fb1c44754bb96171eaae765a8 |     
        i686 |                  json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/030fddceda4f5bc6379f7bfcc405e92d2e24184a |     
        i686 |                  mbedtls-2.7.5 | NOK | http://autobuild.buildroot.net/results/9ecfa0cae919af849a2566692d70afb126245dec |     
        i686 |                  mbedtls-2.7.5 | NOK | http://autobuild.buildroot.net/results/ce1aacb0aa53106a92519b514ff0e8761c34ba76 |     
         arm |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/deb5d1e630bcde85cd5c4f6d8b9209f63c6a9b52 |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/3ab6f79a36543fa677555bc9ec3500baa46ab0f8 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/be62cb56c62fe809e8080ec70ded7ea67a372d4e |     
         arm |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/043da3e782f40a003655c16cb44acb8385501fde | ORPH
     aarch64 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/6812d77a40a48ce588ed00472a0be6f469aac082 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.68.0 | 6 
            python-pyyaml-3.12 | 5 
         host-e2fsprogs-1.44.2 | 4 
                rtorrent-0.9.6 | 3 
             util-linux-2.32.1 | 2 
                    atop-2.3.0 | 1 
                blktrace-1.1.0 | 1 
                    brltty-5.5 | 1 
               git-crypt-0.6.0 | 1 
              glibc-glibc-2.28 | 1 
        host-python-lxml-4.0.0 | 1 
              libeXosip2-3.6.0 | 1 
 Makefile:708: target-finalize | 1 
              ptpd2-ptpd-2.3.1 | 1 
             python-lxml-4.0.0 | 1 
               target-finalize | 1 


Detail of failures
------------------

         arm |                     atop-2.3.0 | NOK | http://autobuild.buildroot.net/results/3fc0f18ed94697c404e7ff3751781789170c4fe5 |     
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/230cfaf1960e00c3f627ec7ae7f014752a5b0623 | ORPH
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a0464c486251003729fa53096cbb5416c3d296ca |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/335c5b3f183fbad8363ae3b7a6efeca8e5f81fbf |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/80186529ed520e9944073fb469a484be9c87a219 |     
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/5036ed42683e5ec2f0d73b1156a11390a64501d1 |     
     powerpc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/6f31761b739a2d4b78503861c4c38f989d17fda4 |     
     powerpc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/179039499cb75ce58ad9cfcbd84cb2eafc2fee23 |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/380938082215b67019d296a4810992cc1d406c24 |     
         arm |                git-crypt-0.6.0 | NOK | http://autobuild.buildroot.net/results/2a76ce39bc639b4f17ff33f8447d9094215e68d8 | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/5760ea2635d9aecc9c789494a8b2cc73a1af1ceb | ORPH
    mips64el |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/9856e55361bdd4bdbf4fee339376a941043a0726 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/520257163bacd9e42d7b121d07fd993aa83a20d8 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/6af899049aef2e006df94f1e04fbf8721ff7d3b8 | ORPH
       sparc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/2107ca578c8cdf57b3019b62eae0808e7c688ed8 | ORPH
     sparc64 |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/befefb2ec493ebc15c6389ac6f36bc54800d67fc |     
         arm |               libeXosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/79195c48c98c282ca92f04fa489ba4fb168aa1df | ORPH
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/92a772716dbb1397174babd0b7b42c10e5a7e84e |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0e3702a5a98827dcf0f3940d11d1dc95ea89548b | ORPH
      mipsel |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/176ca63199261698450bbf3c5aa39110b4674dd7 |     
    mips64el |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/8017d236c786dee1cba85d717e174d8e7c9d5493 |     
        or1k |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/080c027a314964e5f9b8c7ac43ce51b74cd52175 |     
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/aa086dc68f5486d0df7c604d7ce5dbb6bfaba5d7 |     
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/f34d588bdb4eb4a65ef34e986900e0042970ee7b |     
       nios2 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/b7e89b57ee137b2fd766f815d013144f0e8f6e03 |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0b59af9f2a30dfe4e01164b768cc4eb53318a2ac | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0027a9184166c6fed3770824ff03a306218b3705 | ORPH
  aarch64_be |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4f999907718f56f37025d0b3f0a08a1fc836ad16 | ORPH
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/6dd7a93bd94ea9ae358696631c5346c2a3ce494c |     
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/36e165f208061e67e660a43201027144daea66ec |     
   powerpc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/5d1bb213180dd5974f084ea5c25db6084e1656de |     


-- 
http://autobuild.buildroot.net
