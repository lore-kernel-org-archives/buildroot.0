From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-21
Message-ID: <20190422060045.06F3A86E6E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   1 |   0 |  22 |
      master | 139 |  36 |   4 | 179 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 4 
               linknx-0.0.1.37 | 4 
                cracklib-2.9.7 | 3 
        libcpprestsdk-v2.10.12 | 3 
                       netsurf | 3 
               host-efl-1.22.0 | 2 
                jemalloc-5.2.0 | 2 
                libkrb5-1.16.2 | 2 
                    ncmpc-0.34 | 2 
              qt5enginio-1.6.3 | 2 
                  brotli-1.0.7 | 1 
                      ddrescue | 1 
                      gzip-1.9 | 1 
        libcpprestsdk-v2.10.10 | 1 
                  libssh-0.8.7 | 1 
               lynx-2.8.9rel.1 | 1 
                   mutt-1.11.4 | 1 
                   netsurf-3.8 | 1 
                qt5base-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.9.6 | 1 
              swupdate-2018.11 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/36069178f7e2b291cd7aadd11617697fb94f2bad |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/77370225a0eb6a462772ea07b5bb1329364f7925 |     
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/0819d53f9080371be4db2e52a52ebc558678d779 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/665c9134800d94f1235f0c5c0a387569a969e8a9 |     
microblazeel |                       ddrescue | TIM | http://autobuild.buildroot.net/results/2af69401acb76be3d3fd427d1c58fed3af33bf9b |     
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/62df959193b7737d436162f93af6b89ea542f8f2 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b8cb056e43e0bbc00bdc0ee52f0acefae59ac0e2 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6cffc4bc289e0b0989421f2015ae010f9c7e1a43 | ORPH
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/5250d34482ac2c32ca8bef4e44c923c9fedfa65a | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/65715e0e2da1c6da84e8c53109e014bc71e5aee4 | ORPH
      x86_64 |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/9f8dd89ed5b8fdbe7015f1429f714910489d0521 |     
         arm |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/782ca4c3d2e5dd7a2eade4380d99c5bec3011d13 |     
        or1k |                 jemalloc-5.2.0 | NOK | http://autobuild.buildroot.net/results/8cb80bef5c60ac1e5f6507fbc68c21c32f4af84a |     
        or1k |                 jemalloc-5.2.0 | NOK | http://autobuild.buildroot.net/results/9148f9b82721d491a2cc643234e6e9962dd01440 |     
microblazeel |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/02d453aa6a53bfc460b08afa358bbf3b6c71be95 |     
     aarch64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/721cd9f0a11ef468b518302650650f3a0185613e |     
        mips |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/2a9c9224b28209534adc32c4128acddb6bb0ee32 |     
      x86_64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/4de9900cfcdc56d172c62bb369004830119de58b |     
       sparc |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/ee18d9b9aadb779527eaa09e6fb111109a2f0ae7 |     
      xtensa |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/35b82b7c4f0a4f5538560d658b96710eb64ace64 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/a065a8e31363d664195294cf55c39e07ac4d5212 |     
        mips |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/32d2a082698319d355d4c82b9fa8baee514a24b1 | ORPH
         arm |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/4b042b7e18425690ec26b4977865516bedcb9edb | ORPH
      x86_64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/13aaebfd038f60bab34023ad75b09ebe5bdb5580 | ORPH
         arc |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/58d81531fab8fc98a1d594d70d374cf30e4c5e97 | ORPH
       sparc |                lynx-2.8.9rel.1 | NOK | http://autobuild.buildroot.net/results/2c28426253014d93e86e3ba6ed578e84317a9f19 |     
         arm |                    mutt-1.11.4 | NOK | http://autobuild.buildroot.net/results/9f3dd4e81ba9e82db0e858f91de13ef23bc2bf14 |     
         arc |                     ncmpc-0.34 | NOK | http://autobuild.buildroot.net/results/d53978fb30d77cb4d10921bf721eff3d066567ce |     
      x86_64 |                     ncmpc-0.34 | NOK | http://autobuild.buildroot.net/results/dd1aa6fd657bab8fa9dba7f2bfb011b8d31355b8 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/a1025ee5fa35feea5840ac78cb6c39348ed41b9d |     
     sparc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/d354a1ba05d3870e340e7bce3be9b423f824952b |     
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/8ee91d9cb73ba6834e2a0c54fa0d3ce27e1a47a1 |     
      mipsel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9ff43426da5e353b1fcc0bc83256e0aba8f6575a |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d676461a2bcc369de6ad0fc82bc2730d23c0f00c |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a593a7898803dc35e582d01292de9e2151bafcef |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/36f88f5476cc4e0431981ef01469476839ca9ef3 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/e5d40c0972a10cd6f3d7c9b226ea103984ecef00 |     
     powerpc |                   samba4-4.9.6 | NOK | http://autobuild.buildroot.net/results/52586a2b8680869fc904ffcac548cf0d683070a6 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/17c33d5a90be506bb23cfd06f7d7d22a38b1a439 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/edc1ddd54fb68b2f4262f61189851d795a99e72d | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                gnuchess-6.2.5 | 1 


Detail of failures
------------------

         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/4fc5671c069da25ceb5c3aaecd6869bd893b5d22 | ORPH


-- 
http://autobuild.buildroot.net
