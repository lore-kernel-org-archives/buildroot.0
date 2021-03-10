From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Mar 2021 08:14:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-09
Message-ID: <20210310081500.49FA64314A@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  5  |  0  | 20  |
  2020.11.x  | 14  |  1  |  0  | 15  |
    master   | 99  | 45  |  0  | 144 |
     next    | 27  | 19  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

                  janet-1.15.0 | 7 
        host-sentry-cli-1.57.0 | 6 
                  monkey-1.6.9 | 4 
                 avrdude-r1450 | 3 
                  zeromq-4.3.4 | 3 
                    mpd-0.22.3 | 2 
                 pixman-0.40.0 | 2 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                  boost-1.75.0 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
              libostree-2020.8 | 1 
                 libp11-0.4.10 | 1 
                     mc-4.8.26 | 1 
                mono-6.12.0.90 | 1 
                 openmpi-4.0.0 | 1 
           optee-client-3.12.0 | 1 
               protobuf-3.15.3 | 1 
            qt5location-5.15.2 | 1 
                 ripgrep-0.8.1 | 1 
             s390-tools-2.16.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/14df83a2094ef8eca0b5c8f67243da88a04dfecb |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/552f328d5062a276cf2fcff33b85d73ed1e11331 |     
   nios2     |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/04b8b59c53d5a59aa61eb4b43b84fbd8e21a7157 |     
   nios2     |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/d7723b7bd64b5af0b6db30eee9efa3e54cc1190b |     
    arc      |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/60c1a96adedb9841ab609bb3a9f5fbc1295cb9f5 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/5bfc68e32ba664a36f3558e7f58c6849219104c5 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bfb8dec834a5eaa1827249102c289728b7bd8097 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3d16f255d8f98475897f9c7d120f3bee9af95ac4 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/de3967dfcfec250d3ece0768f0ea5bef4a4086c2 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d998a5215e2d95e985b88c326450606edb73b754 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/296eb114ec5b9c2c99e2224a6a5e6bf1bba6bdbe |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/13a8c258ecaaadb31569b805a4890f37fa55d6f8 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/49da5d0e0e5844129b0d6d4b20581e3408e024f9 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c1cfe100fade49eaada1bd28b945b45c51db862 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ddb22b2393124b5ec5a6d8dc6877fc49b856a095 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ccdeaa134916007cef5f66e76a21b8470ef63f7 |     
  powerpc    |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/72f656e50a93e0dce2d2bce5c45deb6e37b5c677 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/763c1214bcf9722e1d74e45e416e6379cabad7c3 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/47d2d0cf23f473fb263dd877399917d7dae36ce2 |     
    arc      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/d436c2d10817791fd71401bc7b71cd64fb53e7c8 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/767b9aca49750cb2d2f9143e7f06ad2d8a2178af |     
    m68k     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/58a59a45e897d0c3ac2fab973d82833533acbd0b |     
  powerpc    |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/9bb87488c607fc3a724451e8481c9bc485a14c58 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/a783e515d77d3654340b5e04b1bb0c95abb2be3e |     
  riscv32    |         libp11-0.4.10          | NOK | http://autobuild.buildroot.net/results/f3e507f95a8a6564dc2be5bcdbd56a10ba15da1e | ORPH
  riscv64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/73c1477c07dd1d050748e14a3d7d4c8a9d900af9 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/803d661df3179aeb1467503207be9b6920769097 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/3edc03459ef1cde7acf01a6ec0c687b126c8a86b | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/073f6d863399b2f2b1c02e741708f4cf26f98811 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/94bb844c36285d92a0799d8bcd84f257d2e7311c | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ece6caa5af8dc8f66df5703fde94c15d2a55357f |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/051fd1424c3e35c3b0054181020a4441d281ec23 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e5e0fec6b27e8a2913e51b9081f8a8b43002c38e |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/620ba871bdf740e8d1b57bea2ad82bfb7287ab38 | ORPH
  riscv64    |      optee-client-3.12.0       | NOK | http://autobuild.buildroot.net/results/8731c40158d3bf01b82315a72a474af2e65987a7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9f5a700e5b901d70b6a3c9e397a19100283b8b29 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f2724ff1c4ed10f7618c8d54007c878ee69dc422 |     
    or1k     |        protobuf-3.15.3         | NOK | http://autobuild.buildroot.net/results/9329eceb012e7df305ed6618d48c82eaf540df70 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e973fbfc97960d1b7bf464af6c66c5a99b18a21f |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e6b5e5d845eade09e174044edcbcd98af536f163 |     
   s390x     |       s390-tools-2.16.0        | NOK | http://autobuild.buildroot.net/results/372c2e20ba3b67d3c2e992cec45f20f09d78143f |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/15fc7f9638354b473eadaf28f324368bf1abbdee |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/182faa67f4704c8f86b7f1b0e7c17c37c6ec247e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d56aa2199dc41280aa1b3299e5f93c3993c8d862 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/61d6a899a092131cfc96ef277a42c627878acd61 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
                haproxy-2.1.10 | 1 
                qt5base-5.12.8 | 1 
            qt5location-5.12.8 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/8791eedae9a1cd7387af7e0b5a368f465e9669d9 |     
    sh4      |         haproxy-2.1.10         | NOK | http://autobuild.buildroot.net/results/9c63ac127925023dad3a6daccddab5c4e642a13d |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/c0109dba79056f258e4801d32f36c46bb8145f7c |     
   xtensa    |       qt5location-5.12.8       | NOK | http://autobuild.buildroot.net/results/71bbb86317a3b4edf43429103e9e2d85989ca4dc |     
 aarch64_be  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f32e8b91c36de8b3098e30a879a944e494c6a404 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              asterisk-16.14.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/c2613d6e2c4b829c58ec90cb001d1380affc3772 |     


Classification of failures by reason for next
---------------------------------------------

              netopeer2-1.1.53 | 2 
                  perl-gd-2.73 | 2 
                  apitrace-9.0 | 1 
               belle-sip-4.4.8 | 1 
               capnproto-0.8.0 | 1 
                elfutils-0.181 | 1 
  gobject-introspection-1.64.1 | 1 
                  janet-1.15.0 | 1 
             libgpg-error-1.41 | 1 
             libopenssl-1.1.1i | 1 
                     mc-4.8.26 | 1 
                    mpd-0.22.3 | 1 
                 pixman-0.40.0 | 1 
                   strace-5.11 | 1 
             timescaledb-2.1.0 | 1 
                       unknown | 1 
                    vlc-3.0.12 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/c09e000d12285e22d6f4bbd9dc83deedcb93b4bf |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/810d4bee3419912680c8a266f66297b67d5e6ea9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/be5d3f3001d63e507bf1edb5026c8dbeeb7eb7e5 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/93bdd0b3743ebd974707bd145f259bfc036b7ee2 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f85e1595a31b9f106651975609b48039dc669e4b | ORPH
microblazeel |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/8a74cb35b3312043aece1119216607c24ced8f43 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/93f7adad7ee8ac608de9d193d9784eea441894d6 | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/181dca53c525e9383f347b2688f0b2f3470306cb |     
  mips64el   |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/95e016c934e0d063dcf1a088451a62a45740fe74 |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/bc455717db3b42b43d7395f58e0d2ca34e81e696 |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/dfe39e935199f15395aad0598ba401286326520a |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4b87a7ea778f152951f48d064cd9a74696c16a13 |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/ea62320228a316d77c4afdf1e7aa290abcc8fc79 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/d8ceba28b7490def14422eeafe2796929ef8ac1a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/711a808adaa82a0186903b91b3594585f9199f43 |     
    arm      |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/3d506e2f6337327c0783cf3cc12a8b5fb78521e4 |     
  powerpc    |       timescaledb-2.1.0        | NOK | http://autobuild.buildroot.net/results/6f83c4e7666c5059d978cb082b849db640fabe77 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/61da70e787034d2b15a2c6977a572697cf341fd2 |     
   xtensa    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/ac2338eafa91e566ec168271fe9385df1b24d685 |     



-- 
http://autobuild.buildroot.net
