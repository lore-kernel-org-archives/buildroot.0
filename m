From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 08:11:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-24
Message-ID: <20201025081157.25C5A272E3@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  5  |  0  | 26  |
  2020.08.x  | 18  |  5  |  0  | 23  |
    master   | 148 | 65  |  0  | 213 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 14
        host-sentry-cli-1.57.0 | 5 
              asterisk-16.13.0 | 3 
                  boost-1.74.0 | 3 
                rocksdb-6.10.1 | 3 
                   libcap-2.43 | 2 
               libuhttpd-3.4.0 | 2 
        python-m2crypto-0.36.0 | 2 
              sigrok-cli-0.7.0 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
                  uhd-3.15.0.0 | 2 
                clamav-0.103.0 | 1 
                 dmalloc-5.5.2 | 1 
               domoticz-2020.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.7.2 | 1 
                hiawatha-10.11 | 1 
                host-gdb-8.3.1 | 1 
              host-guile-3.0.4 | 1 
             ipsec-tools-0.8.2 | 1 
               libglib2-2.64.4 | 1 
                  luajit-2.1.2 | 1 
              micropython-1.13 | 1 
         mono-gtksharp3-2.99.3 | 1 
         multipath-tools-0.8.4 | 1 
                openblas-0.3.9 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             stress-ng-0.11.17 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 
                    wampcc-1.6 | 1 
                 xinetd-2-3-15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ec80000970435572abaa6f6ed2d0760ead80fd1a |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ce8a4103f87f4828e54d9e19f4645b754f36218f |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/b294b46762dda6f90b852d816bd9100175b6c64d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f754a67aefac64cadf51384208f760eb61eee7c8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/db38bc21223aa2a072da8c85229620f99401dd5b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ce5fc463faffc99991ea084a80e77e991684a7c4 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/36739614c56d4a063bd9c4afa889e35a902133e6 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/fd42b0f328d67b5468c1830c2676deca4f9b7dbe | ORPH
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/8f5c8b8b3fb4af9f1e2dce6fd56b7053f2bfc43c |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/8f4a2786f1d04d50276a05fd1a31b9bf6748aabf |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/edc4d48e46637baa125a02072f4d05ee07a72bbd | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8b03243bf619cee148ec6188bd5e5f0eeeddfd12 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/f0528a2c25dc2e12b82acadb35611e7bc02aa667 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/24a2e533344c0f1fc74bc97b3b92486e8a4f88cb | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/441cc4d1325493adfd3f5c601041355709474eb1 | ORPH
  riscv64    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/e1b694b63cce539527f65d2c6f358394b8e56e11 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2d2531d9c77eae31e266c4c0dafc72c79d87d0ab |     
   nios2     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/0b608f301276f84b13bc62c4cbf1347e872115b0 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/e804ed90a9c48930d60d687eebd96ffe8ec776b8 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7d5bba40cc85eb540064e1c80057454d2c4db603 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/46193768fd775183fd6e0e1178ae1b156b2f8ae1 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/39ec2968f8fa35d9f11da7d7e8d50d066a7733d4 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/3eafd465a417de3f6c76692819445d45ac7e3d2a |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4d05d7807e9b24bb333e886045c56874150faef6 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4c31fb0cb334899ff2269696e32dc61cb8814f3c |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/670d8bff9cce23934f8a12b6e078e6662d87166b |     
    mips     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/72bca4d3d32aab8f23de6f687439d97ed516a2e3 |     
   nios2     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2f8f7b13378b54be6f01a9bdf6d0a2f57e43e1de |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b2b1487c347bd2703a78e7560c8e46117b8dff73 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2b4aa4da1c6c1aed091b7d89abd962adacad56dc |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/fa0d957c03cf073a6dca8ec6c569de3884f18e2b | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/2a420ba40e1bfcb23cfb2758ea397b1b8e7b45a5 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6b6cb54e56b8a8cebdac4ee5d3226ed4e65b7940 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3f13e99c5dccd7a0b7dd7a87fc62f01e668fd1d |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8b68cb35166a9df6a661b5012913ca92181b04c7 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5559510bb44b23b8df1a555febdb379b4cde2cb8 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c17ca16221268ca20496c8241db08a8a94dba5a3 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/12d97627d2a0b49a165e6159dee1222ca7e69555 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/685cb4c0be2399bcacd6fa61cdadb737fee4c89e |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/d48d1487a44fdb45bfef46d1ddee631f98f4b5ce |     
    arm      |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0378436f3554634355c570f51d150c5cb73b23eb |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/01c33b08da8b53f2481d23390490913018bfb185 |     
  riscv64    |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/ab6c533331921b2d8a520912a20b5ad19e7e3c3f |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/315e59a7bdf4696d9e4e862481ef25a913930125 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/95ba4e771c4573bcf8616fdeaf004987e38de2cd |     
    arm      |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/4b163b1ead30206506cdd8a66032851495d66a57 |     
 aarch64_be  |     multipath-tools-0.8.4      | NOK | http://autobuild.buildroot.net/results/4dadc75df812c8e06c88fc0b8c54760dad6f9d21 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/eee93bd54c177f3bf07716d7ad186e4359d26e8e | ORPH
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/66813ac0b53ad13bead93b67782d79bf748cc3ea |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/c47e97f13af11f870bde49ec1e2463cefb8e7652 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/5d9f7e4b6061d956c827bdda5fbb5199c163bfb6 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f9dd6984927c76291bd983ccfd4bc7a4149c1449 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c06910a1b9b3ba543ce8d3732e29d3c084785332 |     
  aarch64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/4b93fc82a6c86d81f86b6ded530e1e461fbf4a7d |     
   xtensa    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/5113cc892830cce0dd7a7923c0c2ce382cc8d915 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/7ac32fb5188e06481742a3b9add64b39f218397b |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/51c4c065b93a6d11f6b4583f80f932481518905a |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/3865915c255c306130d150a9dff121dcb8b0905d |     
   s390x     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/5d607e6cb4bcc3656fe6d14abeaad9e7696c252b |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/5248d9756d168b67afaab302272ccdc67a2c57ce |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1e8a7a72c81ae4cb832f727b09cbcc8e0e4ceee2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/9f2d48511b5a19ec8036213aceb7909ed01f11c8 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/e93de1ac62837c4b5863dbaf564c09baefc90006 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5f59e5dee0d79b48c86506abb804a666760fa3e8 | ORPH
    arc      |         xinetd-2-3-15          | NOK | http://autobuild.buildroot.net/results/58351bac7a4373baf2bd6cfdafcfa91e11d4132e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 2 
              asterisk-16.10.0 | 1 
              host-grpc-1.25.0 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/ff01ee8715bace3511d12979987020195fcf0c5f |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/25b697c54091b361fa4095fa19c1cae10655b40f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/e041dde522e2a774f528d4377f67ca0a8a99461c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f1aaf27662f8ceaaa19706d929b1a03bf978f693 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b2d2bc07796f209b0f17b374409c4db0d8c6b12c |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                    qemu-5.0.0 | 2 
              host-grpc-1.30.2 | 1 
                 openal-1.20.1 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/df89c02e20a17370463b9edaa265b6f2b7dd1f51 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5a803854204a4bbdab4397912e014853f0690850 |     
    arm      |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/cab082dbf939a588746a56321c954b792bfeeb73 | ORPH
   x86_64    |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/08e94c2de170a7b281fb05ee3d7fbc80d139e1ba | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/6e1f9fe47e8b2cfdf5effcb7bbc697189f54ff2c |     



-- 
http://autobuild.buildroot.net
