From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Mar 2021 09:40:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-30
Message-ID: <20210331094046.1C8AB40141@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  2  |  0  | 10  |
  2020.11.x  |  3  |  1  |  0  |  4  |
  2021.02.x  | 22  |  4  |  0  | 26  |
    master   | 126 | 36  |  0  | 162 |

Classification of failures by reason for master
-----------------------------------------------

            qpid-proton-0.33.0 | 5 
                 samba4-4.14.2 | 5 
                       unknown | 3 
  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
                rocksdb-6.13.3 | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
             kismet-2020-12-R3 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.14 | 1 
                  monkey-1.6.9 | 1 
                  nginx-1.18.0 | 1 
                 pcmanfm-1.3.2 | 1 
           python-pybind-2.6.1 | 1 
               qt5webkit-5.9.1 | 1 
             s390-tools-2.16.0 | 1 
          sane-backends-1.0.32 | 1 
                   sdl2-2.0.14 | 1 
                   strace-5.11 | 1 
                      tio-1.32 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c16b723a9ab21e5ae0a2f99a699b72d2a9edbf5b |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/9c17be5c3c2028bce032be7ba5d30a5175c6c49d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6e13091385db0c43a77e341eadef6687a146f186 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/01ff1d6cba3880797d2ad3f73b7aaa76dc5b8c9b | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1ee47dbe3b9383da6db80afad9fd31bdebb1374e | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/87eccdd3266463e76830313b6a117ae89d3b2526 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fc8329d546ad8d48984d486f9459922af3c9dfa6 |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/2dacf4671d8483e164fe56687c418e9c3267e7eb | ORPH
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/0f21b04f40e0c9df2e9c2b1d63cf5785914d1cd6 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/15d3bfd819b8776f2179d9b458b66e45ea09ce92 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/20fce82ee4aa2634218b712cdb60941f485a2b3b | ORPH
  riscv32    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/3a9e2c4997d2a18422f9274ac4b51d5a0d8ffb3a |     
   s390x     |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/75515a66f04337a287693973dcfa0961e14af3ce |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a2853ddb8c5665d9720673c3d2a62da0a88dfd2d |     
microblazeel |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/7d2af3fae35827914d1ae471806a69f12b9d2ab3 |     
microblazeel |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/5d00e85540332047b8c25bf7152d9ec1517cedc5 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/05f344151100219c159ca4d466a453df96bf07fa |     
microblazeel |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/3c898b98226a3e286a7d5bcb99723b5209d6a6b7 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/ec34da16a11f0600ecfbbbc4039e8210aea0498c |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/9a46e7cf8dd6253d65e5699a4460d00bb6818fa8 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3f0625f7280f3b9d6549a920a461e07d68793720 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/920e732482ca98665c8d56c650057565bf163906 |     
   s390x     |       s390-tools-2.16.0        | NOK | http://autobuild.buildroot.net/results/980992c42d7fbb7d3f619bfcc109774bed3c98b3 |     
  mips64el   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/c558dfc08a23d5caec574ea69816f0ed5f0b231e |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/0fcf622b0c7792f74a35dc029e1b0c7b693bc459 |     
 powerpc64   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/c168ac0acf2f4388fe12faff32a574941f44b648 |     
    m68k     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/14539dda9a9da1b78441e212c25cc7e0b7594977 |     
 aarch64_be  |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/5facdb2f0290c0a2630c4af438f1d2e294c17105 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c9b0e41d66211bcab231b5db78c6eebe4b1d78ba |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/dcbf10b53b0b3e7b06cf3a0088b3a227b110f6e1 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/054edcf946d2c7d0d8f52a57d4ac442a8ec3bce3 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0d1599aed854f1b57951c1678c5b412e92788fb1 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/295473502b3ad7564ea57b879482d2c2633be112 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/35bc231649967570f1a465e77190b7cb25676f46 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c81a22c06f988da89c9a3a7c7dbd09d8520b547 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/37bc6e9e9d64031bf9da8eafb9eb66b4ab811d05 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               libtheora-1.1.1 | 1 
                upmpdcli-1.4.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f93c16bf8cec6c79612f707e30a0cd62b66132bd | ORPH
    arm      |         upmpdcli-1.4.6         | NOK | http://autobuild.buildroot.net/results/27a8877464c1d8ad74023e39f458b31bdb032f4b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/344411c2420614fd8c3ac7152d843c3dd76f6def |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 pixman-0.40.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bcfd88253defb2fe27ad9f67464fe2569d42744d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a190826df5e610f99d1e701187c1f28f8894c799 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1ca72ff2c1808809cd1fe8d98a75f0aff0c6023a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6442956f33644b0a429fda66f7c1b6f7f4dd9253 |     



-- 
http://autobuild.buildroot.net
