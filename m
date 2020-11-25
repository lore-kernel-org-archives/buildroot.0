From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Nov 2020 08:10:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-24
Message-ID: <20201125081101.01F1B86D31@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  5  |  0  | 25  |
  2020.08.x  | 11  |  4  |  0  | 15  |
    master   | 96  | 15  |  1  | 112 |
     next    | 20  | 15  |  0  | 35  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 3 
             kismet-2020-09-R4 | 2 
                  autofs-5.1.6 | 1 
                        bustle | 1 
                clamav-0.103.0 | 1 
                    efl-1.25.0 | 1 
              fstrcmp-0.7.D001 | 1 
                 mesa3d-20.2.2 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.10.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/9ca4d2bfcbc414f8c6d5a94b89e332a8306ed408 |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/628ca3ef99d8e8b07fc1614576f79aeae31903d0 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/34b9f382526755eff805b8ed7b3a8835a6e12302 |     
  aarch64    |           efl-1.25.0           | NOK | http://autobuild.buildroot.net/results/736357e669c35bd56e818c0c7fabd1b455f40a5f |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/7366d1dd84107956113fc263ba1d715d79acd1ae |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a760591f8fa5ce7dfd413f0914e39b28bc043fa2 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/300f592e1b775cef983e14b71c2eac66332a6e5d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d14bc153ff49b8f7326916af35bd4021be9881c8 |     
  riscv64    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/f1c6f9ccac2712dcf95e5284eaf0ecf626168410 | ORPH
   xtensa    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/b859eb3850c0beb23e18010dc2f07cd0f5c14440 | ORPH
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/d058f5bd859564e53bc3716299dc6c4731dbebd4 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/07c870810021f4daf0a4f30765271ed09796f4b2 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/491df6c22847d271a8aba741fb3dbae74abaa257 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f388d459bee3be5cf6b60b62eb036603c2c2200e | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/52b403d25b9e33ae0a63a2d06236f6240360bace |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ea89de894499d785239cbf081640c698f85e5ef |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
               libtheora-1.1.1 | 1 
         qt5declarative-5.12.8 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/d2f0daf9fd76a6eb0974a698d8a7d01a558ff67b |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d63fde4ede72c83aef196c25310dc4b241eae2ac | ORPH
   mipsel    |     qt5declarative-5.12.8      | NOK | http://autobuild.buildroot.net/results/46139efffb4376d2500ad5e647aa849d88bf9a65 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a43fad1dc7e9dc1959b52fc1a9bd926e96fec801 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dc5bff7c5a8fe742eafc50729ebbda2c82c348e4 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                coreutils-8.32 | 1 
             kismet-2016-07-R1 | 1 
       shadowsocks-libev-3.3.4 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/75bb6b551f06fc4105b9d3163d06fb3168dc813f | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/bbd4192065aaa3d4d909cac79b944db1acf0e9db | ORPH
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/ba3bd40b510f8dae0f22942e6412cba43864640f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/293cc8b27defca414b5c17f865cee02db4d572e6 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 3 
              libeXosip2-5.1.1 | 2 
            resiprocate-1.12.0 | 2 
              asterisk-16.14.1 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.32.0 | 1 
           python-pybind-2.6.0 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/683ba0a39499a5c138cbd92d91a97cae1fc5d9d3 |     
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/61353c8cc78168747c967df9d5e06651686390f0 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e70803a3aaa94457b43f72bf414e384383086b0f | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4d913638032c379a2a58aa5cbf19f3e113062111 | ORPH
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/8f0d7b853bbe18dd64ce6f3a7cd170e1d4372245 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/58d0cc97d104ab0781669d67eb9d56a57c2ea46a | ORPH
microblazeel |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/e698571e69f4a431e07ae7bfa26656dd84f0ff5f |     
  mips64el   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/f174992d42159f1d57563fffd8a0fe952e0c47ed |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/dfbdbdd5a86d4ba3daf7994cb0e19f36002f5ebe |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/f95ef15ce37b6d442b2e6ded37aa68b792b0f6d1 |     
    arm      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/bb2f6ff675114b72570e98d324fcf0f7c52cffd6 |     
   mipsel    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/9e4c9b329576ca9e2b26ec13992fdd15e0e4487d |     
    arc      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/29b143aa11af3ff5aba2fa6a630c0db1d0b23d23 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7af89c0a99c403cd78ebbec4e8d16a25c82d1851 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/834f42ee942969e7342e77bc7031352b133d9270 |     



-- 
http://autobuild.buildroot.net
