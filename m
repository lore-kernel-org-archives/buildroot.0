From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 07:42:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-07-14
Message-ID: <20200715074218.104DA8443F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-07-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  4  |  0  | 20  |
  2020.05.x  | 16  |  8  |  1  | 25  |
    master   | 74  | 73  |  0  | 147 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 agentpp-4.3.1 | 7 
          fuse-overlayfs-1.1.2 | 6 
                   gupnp-1.2.3 | 6 
                  exiv2-0.27.3 | 5 
dvb-apps-3d43b280298c39a67d... | 4 
              keepalived-2.1.4 | 4 
                qt5base-5.15.0 | 4 
libcamera-96fab38e02792a109... | 3 
                  zeromq-4.3.2 | 3 
              bitcoin-0.19.0.1 | 2 
                  boost-1.73.0 | 2 
                   cvs-1.12.13 | 2 
               domoticz-2020.1 | 2 
                 haproxy-2.2.0 | 2 
            live555-2020.06.25 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
               collectd-5.11.0 | 1 
                coreutils-8.32 | 1 
           cups-filters-1.27.5 | 1 
             freeswitch-1.10.3 | 1 
              host-grpc-1.25.0 | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
                moarvm-2020.06 | 1 
       network-manager-1.22.10 | 1 
            optee-client-3.9.0 | 1 
               protobuf-3.12.2 | 1 
               pulseview-0.4.1 | 1 
            qt5location-5.15.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/c19755e9d6ac712f219412e57fd34b25c505cc6f |     
   xtensa    |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/8d85824b7ff9bf6dd725c4d75b1bdfb014870090 |     
    arc      |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/a1f7f0e0029ba18fd07f19f0864fe8594b7e44bd |     
   sparc     |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/f6b4d09fb1f05fb93629f386a9c7aedb9d9ba304 |     
  aarch64    |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/8c66843830188dfaa50e39e3875c3f49e1d5b4f9 |     
   xtensa    |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/0d5c4d6f49c2172a11dbaca860ea08025bb39128 |     
   x86_64    |         agentpp-4.3.1          | NOK | http://autobuild.buildroot.net/results/998e0c14c1edb01136f9d41bf7903a65748e7314 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/72633a7e4044854f6268ec93b0d69b888895f171 |     
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/78378515f6e038a9448c1926d8cc983a515f7c6e |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7b5e56bf511b330b78ec65a6591d62db5bd17ba5 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/57b24a3b597f162dbcb8677c355d4809e37e69e2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b9ccb4e307839fe319513dc26a9d237c19226ef2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/99f29608475ba4c933076d4359c171aa87cdcec9 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/375bbaee36323de3764410f64ad895e8ff2440f1 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/8e22821247a6f3b73cd49791fc38d1d2eca948f0 |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/84bb106d9da81b98cff2cdc47e65e4b56a7b1600 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ffef9cb8c1b0b7785aa5b65eab2d20eff9a9c3fa | ORPH
  riscv64    |      cups-filters-1.27.5       | NOK | http://autobuild.buildroot.net/results/f93122973ec6d14c302dfd1d09267ce2e498dd9f |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c704d088a98335f66f39933b5aea1242eb306be5 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/0b7252467ea66aba9605f54987d1694c01013f5b | ORPH
  riscv32    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/acdb65ff862a16c465eaafaab731fc0ee1f4ead0 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7806578d2624e022f4d6bf71336d055c9ea1bba8 |     
  riscv64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/05f46e53046ec40ed392eca9ac55b2f381a8c4f4 |     
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/065478d009abdb6a75009ec348684b53c7dcdf24 |     
 powerpc64   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/734aafafc7cd2b9fe6a184c4e65aa7a9978d376d |     
   xtensa    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/38d4ae31a18b4a9465efd432572ee4702f1faa63 |     
powerpc64le  |          exiv2-0.27.3          | NOK | http://autobuild.buildroot.net/results/9ebd980a378b8ea20fa103795480e4d5fb52e057 |     
    arc      |          exiv2-0.27.3          | NOK | http://autobuild.buildroot.net/results/e3abf9a7c078995021a660365a7e38e0753d932a |     
    arc      |          exiv2-0.27.3          | NOK | http://autobuild.buildroot.net/results/f94602e6e007271c0b3677d644fbf23575d783d7 |     
    arc      |          exiv2-0.27.3          | NOK | http://autobuild.buildroot.net/results/34365363642ff9336a2ae8ade31996cb0b64749e |     
   mipsel    |          exiv2-0.27.3          | NOK | http://autobuild.buildroot.net/results/a077086fa8b0da08fcd146acbcb727c61dbaa984 |     
   mipsel    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/d5092b8e68970d383c7a94d97b96b7cb1633d454 |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/0981460d7ab96648dc72847784bafae083853a1d |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/fc812e625cdfd6c29c88ac8a88246b10912738af |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/20add88c03b948a0868f03711aa4501f77b3c19a |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4d0cacdc512554fa8fec21985afd13e494ad069b |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/2eeb1493c9b0abfe4ae6c809d1bb4f37db585bdd |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/9511d660b201fc3e0004e622ff97b3416f2e0062 |     
    arc      |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/57f897fbf191acc4b66ae5a28ecab54c85bdeb3f |     
    mips     |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/5435865a35ae5decd20ac0f63df0e2bf575be051 |     
    arm      |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/242afb320eb5cd086d8efa6b665568b84e3e8851 |     
  aarch64    |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/0e1b135f17483bc498ea6bc06d9d8db5eda82a0a |     
    arm      |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/128eaa120b745989bec3215da4d0bc234aea659e |     
    arc      |          gupnp-1.2.3           | NOK | http://autobuild.buildroot.net/results/f2e84d75f77be6e75e873a2cb09861ec8852fe06 |     
 aarch64_be  |         haproxy-2.2.0          | NOK | http://autobuild.buildroot.net/results/cd00e5cfceb8d4435eb0a919eccb699d55c41d48 |     
  nds32le    |         haproxy-2.2.0          | NOK | http://autobuild.buildroot.net/results/7bb76153b7dd8f392b247569c53d0f4cbf408371 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/895aeed3b5907d984891e40e661eb0d47c1e58d2 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/af82a4623fc3f2ffa0c19b52f5930be1a31a3173 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/a1712b2cc3ad878e6876325ec7d4c434d0d9d11b |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/04bd0b31660c8a6dfacd66b55f9432741701daf5 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1d5f333724dc33c55be090210d2cfe919d6c3ead |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/a0a535a756c8d062684e3a50810b9b6b3a2daaf4 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/bdea828c286e72a437d9a0209a2ab55a7e7597ae | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/456df44c01f0997dd39123e6538e14c8cee64336 |     
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/553a405365e8abcf649c5de56fcf76912a807f98 |     
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/bf2e3599dc63031a4077b971ac3c75fa21fa16c3 |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/1130ff03e582569d2896e0e7cc08a06255c603e1 | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/413d171c3909b51f8fb12a27c2cf6a44ffffeb34 | ORPH
    arm      |         moarvm-2020.06         | NOK | http://autobuild.buildroot.net/results/1799769c531f9f26ff191b1adcd5e5b17dc3b244 |     
  aarch64    |    network-manager-1.22.10     | NOK | http://autobuild.buildroot.net/results/d3b1bc2fa7559e66465033c455176761d6e184d1 | ORPH
microblazeel |       optee-client-3.9.0       | NOK | http://autobuild.buildroot.net/results/fe2d0f5a956bf23635e51258f92d9ab2e5af7941 |     
  riscv64    |        protobuf-3.12.2         | NOK | http://autobuild.buildroot.net/results/1e4465c3319272b79ff8dff5630a1b8a407b087a |     
  riscv64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/8c2d7b4dbf2806b751cd58a708e36106f06e2ab5 |     
   nios2     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ce2d5bb97d6e9299e14ed7a05b2e8bdf2aa0a559 |     
   nios2     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/88804662d9d902991f422fd8342544513d913e4e |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7c1fa1ca2a219d41f885593b0bb56a0f41143fed |     
    sh4      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/6fe4bcc60c87c8fa80c5757716000f41890741fe |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/afa55d926a5cf39885576bb6aa276f24b17868a0 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5615542c0a1b3504ae6f6ad2ba0a8751d973eb97 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a7f4aa4c69b70996787138b9a5c5aec2d055d7a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/05f9eafe8ae0b8da42c769c7d5df83f847efb4b9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/dde4e732199052037fcf42538e87142071c45c49 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f732c4f8f6b8a69487511cf2bf3208710d84f48e |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cairo-1.16.0 | 1 
                   mimic-1.1.0 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/4335020eadb8afa60efd1eed52262da19863da0c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8a2aeabb942bd012ac832388dc9bd7685a74c71b |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/6d3a032344fc95be8111fea79b814a21b00a7bf8 |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/80b830046c98eedad1a4f6b69e646bb7453d07a1 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                      tio-1.32 | 2 
               apcupsd-3.14.14 | 1 
                hiawatha-10.10 | 1 
              host-grpc-1.25.0 | 1 
                   mimic-1.1.0 | 1 
                       mongodb | 1 
                 xvisor-0.2.11 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/772242e1dd8247569dc26af3879e73e35437b1f5 |     
  riscv64    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/9de9281955f46266e9e43e6c514fea47c3193fd9 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0edae25185bf9582de38a1de5111c5f3b439066d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/20745a27ff6f5a6f28dc1f7465aa2a4e896f0a5d |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/fe89678fae6d837690bc062a8e0719df6ee09b6f |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/126d1bd60aca1f685f6583f4e6f1e2c9c74c2733 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/e2030ed7ccdf1588369aa20e120c4cac255c8899 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/004e68f589b7b0666a85c5564b774e5cb8887ebb |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/18f379882a9cf8b31dde560155f49c4cfeff812d |     



-- 
http://autobuild.buildroot.net
