From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 09:29:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-27
Message-ID: <20210328092957.9C3E38397A@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 15  |  5  |  0  | 20  |
  2021.02.x  | 39  |  9  |  0  | 48  |
    master   | 112 | 28  |  1  | 141 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                rocksdb-6.13.3 | 3 
                  zeromq-4.3.4 | 3 
                  monkey-1.6.9 | 2 
                   strace-5.11 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.1 | 1 
          fuse-overlayfs-1.4.0 | 1 
             libopenh264-2.1.1 | 1 
                 mesa3d-20.3.4 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
                 openal-1.20.1 | 1 
       python-rpi-ws281x-4.2.6 | 1 
                 python-uvloop | 1 
            qpid-proton-0.33.0 | 1 
            quickjs-2020-11-08 | 1 
                    ruby-3.0.0 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/35bd763a424670c66f9126601432a1f306c9ecae |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f609436bbf2eea8c5d4a10ebc065830272e9dc49 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/25c50c43048872814560a3d5a856eda25a205c28 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/cf490d76b9329e3823cf6e80bda857844bf34661 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7127a3c285cf10948c20167a00bc644f18967ed4 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ba7a85b16717544d5bb4b05339c1065fd86c3fe2 |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/29bc75d5e58e0fe50400859fa2f8eae829e594e2 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/cd2a80b539358f01a9e8640c6596142bf276ea31 |     
  riscv32    |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/2abd0edfc3444108e67a53f5783cd81455eea922 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/011923e995e7a5f4176287b210f21827cf06c5d2 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/73df06ce26552850e5454d33c1b948193671e6b5 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/32e1e214f460877638c8aeff03872a22acdf9dc1 |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/7923b10da238c0243546f2ba8d6ad4ea989332f5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e43400099d39b59d1b5384de0d91b4a03d5ed797 |     
    arm      |    python-rpi-ws281x-4.2.6     | NOK | http://autobuild.buildroot.net/results/db265a8b78ed6052b466729e1e4133b12b9ff9e6 |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/e30a6a51d63b7602a7df15e937cdd8772d50bde3 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/e6c122cabc6a21be0277a25aee2df92d74965385 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/9149c560d4417d8b80dd6474fb90a19c68b7ec35 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/2e3b25b69f525967487ffa8af2544a723cd81a7d |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6a34977bb1a2b11124c1f0c4e1567f57a720bfd6 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1e6a7eaba26950dfe24838dd61dc9db00ddbc0d9 |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/71b75d2252561d3bcfde36837b4c381c0f041d72 |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/a02a120c767ac13b02508b46e75aaf43866741a5 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/9e6235b751ef26d06ff57b544d95499f285e752d |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/161ffd4f6780f7dbde4fd112bdeb82bbc007ed2b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/df9b1d97cde0098565ae16c550b3f27deef674bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/eec513a6956a7238a27260d4ed03f160e7c1685c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f8a1d0be407bd61be77547a665ec8e3af9270108 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2c435966895f877cba70392626685e3bfa9acff2 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              tinydtls-0.9-rc1 | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3d4c5ba128f5b7568006cc1da79c9a80e30c4043 |     
    sh4      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/1a8989a99c564d3dae429508b9b47102d7b5a6d2 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  ndisc6-1.0.4 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/241adeadbea7d1472163f46bf2309b801e02fe98 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/689f902e72758da6ed246aeb5e78e8a7e5ebcb25 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b964e87c22a04bab6c2cdf6572d29f6753faff35 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/edef7f6b2d3ffede8c28b0662f9644f6d0694136 | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/b822d364ab32126c089fe539cb4c30e944c0d9cc |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
            erlang-jiffy-1.0.6 | 1 
        glib-networking-2.66.0 | 1 
              micropython-1.13 | 1 
                    mpd-0.22.3 | 1 
                 openal-1.20.1 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/107bd1b219b0816d839de4ab4961a3062a68f2c1 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/ad2d5acbfff813d474a2b2c18bea8cfb3bf7b570 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/33370fc1a9cb13b54c05510b5dc4cfb3d6ecf2f0 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa7d93efc507c92e4ed7a9f615e4d66c5e870d50 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/93ce419740fc56d2287694c9fbdb4f3d5a9ff88e |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/bf0c5a864f9a6f2b4a8a73ccc04ac3d2363155bd |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/baae83b776fde70d94a43fbe6ceefc7d14aaebeb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7ff1a950a9b8151262e35906aecf230938741931 |     



-- 
http://autobuild.buildroot.net
