From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 03 Nov 2019 07:16:11 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-02
Message-ID: <20191103071617.28D8A8A8D3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.08.x  |  8  |  3  |  0  | 11  |
    master   | 140 | 57  |  0  | 197 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libv4l-1.18.0 | 5 
              host-grpc-1.23.0 | 4 
      glibc-arc-2019.09-eng002 | 3 
                libdrm-2.4.100 | 3 
                libselinux-2.9 | 3 
          python-web2py-2.17.2 | 3 
              sigrok-cli-0.7.0 | 3 
         uvw-2.2.0_libuv-v1.33 | 3 
                 xvisor-0.2.11 | 3 
                 acsccid-1.1.7 | 2 
                  flashrom-1.1 | 2 
                libgdiplus-5.6 | 2 
               libupnpp-0.17.1 | 2 
           libwebsockets-3.2.0 | 2 
             safeclib-17102019 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                     gzip-1.10 | 1 
                 haproxy-2.0.5 | 1 
              jpeg-turbo-2.0.2 | 1 
                       kmod-26 | 1 
               libsigsegv-2.12 | 1 
                 mesa3d-19.2.2 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 opencv3-3.4.6 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
piglit-ef761094be04d14e258a... | 1 
                 rng-tools-6.7 | 1 
                     squid-4.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/4e201b0da5cbae7ebf6119b87e39f147c61d749d |     
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/a3d4ef915776ff37e59bb9f2182eb9669dc31fac |     
  sparc64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/36eb692d89f02f6028a8ccc19b10e8998a0c3f1b |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b4f68340fc02c6f631a87ea8f8b0a26725116bc4 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/07b66c7dc8b3fb27a6de40034318e8c80fe1c9b0 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/5f561921442a15d45526f3070ce14e0405b851c6 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/e99e4a315aac59d1ed6ff3720b839f8a54c3faac |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/14881423f9d54325176e5ab4413f7a4c442c3056 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/11df7362c0c4756e7a679327b454bb07cc74f750 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/d665f2fb9a5b3f8eaf28d0c47336a51ad8038f81 |     
powerpc64le  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e9b135058dd74b336a2a438f13e9f07ee19bf961 |     
    m68k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/15f847fe65a79ae7c56b574dfbb09df7404f775f |     
    sh4      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/83e59d13b82d015a0b8254d0e0e1a4274f70c08c |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/008f107654cff14b0a7015a21ab860b92eb042d9 |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/6764628f0511c2c913cf1c890a26545218fcaaa7 |     
   x86_64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/3fac33b4174307647a9f983729c41dd906e66435 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/b732dac76e44d12f71bce667d06c68a728edb179 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/5fbf53c92fc0ec8257fa696e76a65c1126c78779 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/7ec13d069215aec315bb4238eece744a7698ea75 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f811fc500978080c6186d09c8290f2622719e19a |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/669f95192a7a991c33394f2308c9628824a2a64f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/06aff303e55e50c377180d88c9d91cbf3eba5cd9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/919a136101df32fe4e55034063f101043267bf7f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ec6a018431de3c0961a41d20808600c95466c438 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/82fa8e38d723d5183f6735cacb56d0f510695be2 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/52abb63e55c8eb936ab023cd3cdc3ed2be8929f0 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/b585d1876b4aa4c3c5a7650064904ac9242bab1f |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/bb3133356e42ba030b95cc2cd23d6e7265e0bc26 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/8c7c54207fce91344f8d750057258451974c5494 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/2507a15e4868c7c21d824331834c29a06d10528a |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/b370d1101dd6adb970f8a30b5f874d5f9fc119d8 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/d50947afc5307ade62e195333a3b2b27eba43196 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/8aac91af2ea940ae96f3b5e3a4641c0e6b563e5f |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/b237b43446e4554dc14e5418b714d10494efa6f2 |     
   mipsel    |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/bbd102d59bbdca35fd1b5401df2790dd197d1e5f |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3054ce44954632e7991a78899eb9a73ce0376b6d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c6d5a0a1a9532a13c1ae95b6522f7b75ee16f8f8 |     
    arc      |         opencv3-3.4.6          | NOK | http://autobuild.buildroot.net/results/c98204a60e6415aef692bb49871c08cfcb8603c5 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e825ae67afb5e8b786c5cc9871b8f9f4cbb21764 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/e28515c456963c3571c418ca84f30c3fe369c132 | ORPH
   mipsel    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/8d782589b6073031626fd769982a0844f3731906 |     
  riscv64    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/a9ecb577fd06a85a3dfd6f3b77fe57e5862b8190 |     
  powerpc    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/5c0e7a5d2e1e7e41eec2580f6f5ec5807ab7ae23 |     
    arm      |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/2d1a9706f5677b689bd367b0829fa7804847a06b |     
    i586     |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/69872fd84a795c27e565656773c9c32fd7c1b48f |     
   x86_64    |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/0e34eb07dd201de51fd0451e619eea5c7afeb2fb |     
   x86_64    |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/7923fe7e609a6b2638492350996cc96582cc9193 |     
   sparc     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/5e776f449aeab1ec46f747bb3f8f783e7999ce9d |     
microblazeel |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/aa9e54b8a63e19a14d5be745024b521c1bb60ab6 |     
   sparc     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/b86f4df2a58c39b585d6f915d02c5ef1c85565a5 |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/989489bbf9fa6834634a87639dfe683887b014a8 | ORPH
 powerpc64   |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/4fc980c6b3809cdc6c57b2e2410965345004715c |     
powerpc64le  |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/33d7d27a91e85f0b57e90389c6b615b8665bc6b8 |     
  aarch64    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/e7dd9773548328d69db8dd6bdad5a18062da4a64 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/5de37d3da17ca5cb17c0113d942ce8c22c0074e0 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/41b00d95ec4eb851abceaa7919aa1c533d4f16e8 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/119e22e8b03991ab9196e428a131f5a8ae2a2b2f |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 2 
                      wine-4.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/1b497c266b3b969c1626a40477a0443996e057ae |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/84eae4181bb43793ca96497c61e6fc1e0aaff4ce |     
    i686     |            wine-4.0            | NOK | http://autobuild.buildroot.net/results/804819802c9a9407a1905145f9f06294e7fab3b1 |     



-- 
http://autobuild.buildroot.net
