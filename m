From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Nov 2020 08:09:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-28
Message-ID: <20201129081002.C82F985F90@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  1  |  0  | 16  |
  2020.08.x  |  9  |  2  |  0  | 11  |
    master   | 106 | 28  |  1  | 135 |
     next    | 15  | 16  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                       unknown | 4 
                  boost-1.74.0 | 2 
                        bustle | 1 
               collectd-5.12.0 | 1 
                 dc3dd-7.2.641 | 1 
      gst1-plugins-good-1.18.1 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
              micropython-1.13 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                    php-7.4.13 | 1 
                rocksdb-6.10.1 | 1 
                   slang-2.3.2 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                  uhd-3.15.0.0 | 1 
                xenomai-3.0.10 | 1 
                xfsprogs-5.8.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d46d45a7672246d22186f8dc1ddd1383f937a87e |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6c9bfb9af369bf7aff489c5079d104699aa7bd21 |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/d1fb233bea8fd9e1d1ff1fff226636c9f83faaae |     
  powerpc    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/ac8c406a1f5910469d1bbb521a660b24ea36b9a1 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2f08961055e8f8d1c41e0df442201ab8fa6c5910 | ORPH
    arm      |    gst1-plugins-good-1.18.1    | NOK | http://autobuild.buildroot.net/results/e1537ebac7cd70b6d868a8b7f0205ce3d8593508 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a65c06f110ee1acf5d493ab6aec039a9b0712e61 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/db92e67b9165f36824aeae7de5b4cab102282b09 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfc7fdba78ab9341f944ebced60ccde22f57a8c4 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dfd33cc5003ad0d8a8a8310467cf4a25e961a322 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e67a7dce74426f582dd3b6d9d055d9c44d163756 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c6d7d977f1124daffbb463a4f4718c0a756a4e2f |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a7ebfed150e862370e1b42d7b63680d798c9de73 |     
    arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/53a5f023ae40db18f45ebe7578962914c2d22a44 | ORPH
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/568aa812d9329329933b9f0e3bbf83c6147c8527 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/315912107107a6b08ecca4cd496cb2fe6ac66709 | ORPH
    arm      |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/1ce571ded9f91cf4312adc468643c600a4b2f5e0 | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/cb83bc06d067b3dd54a3ba3423a24b3d07c95776 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/5e8fe731adfc05b0c1614f78c3d3fa50d2e38231 |     
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f0c6c78d8c8e1d59fdc2acdb86ae6d0249fc1ebe | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/f411fcc25e767d9a482464f3c78a697199bd43c4 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/5ffd1436226da2f2c073f8aab7c75c479fffedba |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1ccecc74755155664cd17c8d33721c804a37b25 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/7c4b282700d34ed6d1e3a545c3ee73c4b52edfa5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a46f1384e08b42b6884990c7b37abbbb8278db6d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0ff528c47d36c09e9dce48686ff55df7a10e7a6 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3d381b4496d812e13721c8aa5fdf52f68af4b011 |     
    arc      |         xfsprogs-5.8.0         | NOK | http://autobuild.buildroot.net/results/0b3f5856ea96dd54ac26aa4813a411e22ef7ccc4 | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/0c2af120bccb0a0594ef693554280a4a3ab744b7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/04ebc866df322a62d36db60fccadb8d8ad7af28f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  zeromq-4.3.3 | 2 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/2347874daadb8ba2f4575500b1fabfbd1937d1b2 |     
    m68k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/9abca206cda270a0d2eb8eef1131abb2c98159f2 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
              libeXosip2-5.1.1 | 3 
                   rhash-1.4.0 | 2 
                  boost-1.74.0 | 1 
          fuse-overlayfs-1.2.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  monkey-1.6.9 | 1 
                    quazip-1.1 | 1 
            resiprocate-1.12.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/08d9c329b047b77d16584a9cf9fef882f999fd82 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/816c008e71add9e3a6acb995588500121d2ef81c | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/01302e87682ec6f6c7a2752b5f0e4fb3669f723d | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bbdcd4db70e6d75592bb55169c2142f4acce21ae | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bda186443b4d23e2db0a440fcfe28c2690878219 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/8e5db8e810b58a205fc67121dadce04919f7650d |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/16d22d78bd4ad043adc9e8ee963cca64a1e23e7e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6eb18a73d4562aa54d87202836690ec28a51390c |     
    i586     |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/6b378f910aeb87e45336b86b8bde52dcdd48bcae |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/d9757f4364a441d57a1177bd2ba6c0b33e1e80fc |     
  powerpc    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/2de9ea18d26d8daa42b4aff93a02ede01898db93 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/51168a3de16e988244f7c9b64719c7a2eaf4a0b1 | ORPH
  aarch64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/0667357aa1fee133a805222018401869646386c6 |     
  mips64el   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/6649a7323e656e877f8831e512a5459093f26ed4 |     
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3879d292f28d4dcc487f4f37803f4a9b2d40a1f0 | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/35acdcbc05572ec0efd3ec3a793a7de8ec4589c0 | ORPH


Gitlab CI results for 2020-11-28
================================


-- 
http://autobuild.buildroot.net
