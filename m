From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-13
Message-ID: <20180214070028.755AA207E2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-13
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 148 |  43 |   1 | 192 |
   2017.11.x |  12 |   3 |   0 |  15 |
        next |  54 |  15 |   0 |  69 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         postgresql-legal-info | 17
                     php-7.2.2 | 8 
                  boost-1.66.0 | 3 
                   systemd-237 | 3 
             bluez5_utils-5.48 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
docker-containerd-9048e5e50... | 1 
                     gpsd-3.17 | 1 
              host-erlang-20.0 | 1 
                     host-mono | 1 
       kompexsqlite-v1.10.12-1 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
                    sdl2-2.0.7 | 1 
                    xen-4.10.0 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/1fea925ec9a3d8e829aeea167d7f6586e115e74f |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/aa8f20b7ae905a8ba5f1d1899e2cc43fae34ce85 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/77da2f9eee88e5c932b7ff2970051daa4d8acf79 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8ff83a750b25b8cc43bb479e835c956696e972d9 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1334bcff47a11b26ff3abbadac2145ba887c605e |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/d16befa9092e75ee23dde319d700027ce98006c2 |     
      x86_64 | docker-containerd-9048e5e50... | NOK | http://autobuild.buildroot.net/results/22999d3c67b1f0608d416ef98ac645ac106fdd61 |     
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/d8200f6a3f4ad56a6d5980492f9fa0e8bd6d31d1 | ORPH
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/259f796fc8f8d56ac7a90a37f4419f75c53fb21b |     
         arm |                      host-mono | TIM | http://autobuild.buildroot.net/results/cda84ae92e9eb4225ea91e714995f3cd3d27a7ed |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/58705be40d55d17bd552668e168f427a2a69adcd | ORPH
    mips64el |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/be9e8d1717968a0ff8f01f7fadfa79825ac88b94 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/63ce302541688ac06c250cb3e1e6f835bf8195be |     
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/7b85badc65d1dc1d66c80594e97678783bb399ab | ORPH
    mips64el |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/05b47949834ba64b95cdd7659ae763c7c59dbbc8 | ORPH
     sparc64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f2d34404dbe9e2c3a98ee1c831b28ea446b3cb72 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4d9ef801ef09acf72b50add49d632544d54d3d6f | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/026bf96e827478b973a69ffb41995745b3f43a63 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/caa3915e62089d69b8170bed63654ad0754b2384 | ORPH
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/6d9f369c27b76545c217d5b2f29ade37bea70785 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d02b95047e8446272d306708b6e94bebc69d5d89 | ORPH
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/e9f2d23e2acca34bd403581c643f63fc0587c22a |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6d882ae0663fb21af57e9c49337f40ad2fad60a2 |     
      xtensa |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/cfa40795dd9693611cf7bf7dd0ef040409ee9c33 |     
      xtensa |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/aab5de56940ffa172546ff34cbe647aa8930e6d3 |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/b102c037863ec7b50964dbc75e66a6cc2a5ba9b7 |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/841059db871457c32b6e9d192ac6489d021a2ae4 |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6dec30c7e1dc4c1c3c7e4031c91e7102bff3723b |     
         arm |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/32e1497e7aa8f5cf362012e9e50fc1ea933806ac |     
       nios2 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/f0a0d28896786f1fc2b0a615d29d14db1507173c |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/2ae148e6a7fa9da046fa38150c5f54aa24a95c02 |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/0394103f73ca9190b054f51eb1c27dcb67c45b56 |     
     aarch64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/b76aac66a433bdf7d3cba97eed04c444eb561d02 |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/97bcdcd12a018873ee562a786e41e9b6f3af2d33 |     
     sparc64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/52c3a1f275f5ccd2566b79e52e0913a7a82cd79f |     
         arc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/0445b2e494e1ae1bc4f19d825c2689c9ca8264ea |     
microblazeel |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/f63d320e41a9e6ea732316cbfcc55d1049c08362 |     
         arm |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/546425d5c1b8c5ab64ae02f46862b29ddc01809b |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/08613ce002a60f35313d280ad1c17c9d3d8b16e2 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/8ee7f1601f8919cff339078d539cd6f9defa7ad5 |     
 powerpc64le |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/bd5ea2357a60a3c4d0ab21568748e662399e6835 |     
      x86_64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/92a069ab2639554350bb5e30a642e32b5a178f26 |     
     aarch64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/02be6fadca910260dd482dde065e67936a06aa0e |     
     aarch64 |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/0abe5a68e28a969eb8593d02a6d496f5b2015975 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 
                 mesa3d-17.2.4 | 1 
                php-amqp-1.9.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/d0dcf3c2c025181e3a284013b0d9349e4b14050b |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/ad4550dfbcc44fb952c65c80e0cc9fdac8488a8a |     
   powerpc64 |                 php-amqp-1.9.0 | NOK | http://autobuild.buildroot.net/results/f184a2569754b2f71ea7d3097ad8a7c542736d9b |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               lightning-2.1.0 | 3 
                    liblo-0.29 | 2 
                     php-7.2.2 | 2 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
json-for-modern-cpp-legal-info | 1 
              keepalived-1.3.5 | 1 
                 mesa3d-17.3.3 | 1 
open-lldp-036e314bd93602f73... | 1 
                   systemd-237 | 1 
            xapp_sessreg-1.1.1 | 1 


Detail of failures
------------------

        or1k |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/7890f07de32511e0a7f58fc9ea75862fafda2fbb |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ba4dbbf98056dd558b9d45076356608bfdbfa58f |     
        m68k | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/d585e6e583346fe254fb34d0359f9b49b20acf87 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/0b42c27b05532e0d8e024fd4f2247cc822f6be3e |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/8db0cd7bc015e47fd8a50f5e52050baccf955292 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9c0ef340938e9e36b879063d766a4e2a1b16b41c | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/0bd8b7299908859a1004ee650ab1d9159040aaa8 |     
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/c8f2306b1c1727348f750b4e845b9b9aed72a337 |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/d8cdff4ed726c3fabb8b01174bdf397204706922 |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/1a99f02bab3189fb519dc50e8970f4ff0b4087fe |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/e14cf712a2b0dc751f0829880c44baadf9c6885c |     
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/06ffcf670c6f95cae80fefe4230caebffbf4f115 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8ec50babd67c13c1a08a2e47cac401d5e90045f7 | ORPH
     aarch64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/d5cf805f3ed7afa13433fa6fcf4bbe4c4a200970 |     
 powerpc64le |             xapp_sessreg-1.1.1 | NOK | http://autobuild.buildroot.net/results/227d434a1c76464a624f87952bd915b28fa391c8 |     


-- 
http://autobuild.buildroot.net
