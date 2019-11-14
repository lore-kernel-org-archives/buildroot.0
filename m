From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Nov 2019 07:17:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-13
Message-ID: <20191114071730.4127387D7A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  6  |  3  |  0  |  9  |
  2019.08.x  | 14  |  1  |  0  | 15  |
    master   | 79  | 34  |  0  | 113 |
     next    | 12  |  2  |  0  | 14  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 4 
                libselinux-2.9 | 3 
        ltp-testsuite-20190930 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
              host-grpc-1.23.0 | 2 
                libdrm-2.4.100 | 2 
                 acsccid-1.1.7 | 1 
                  cmocka-1.1.5 | 1 
                   dvblast-3.4 | 1 
                  flashrom-1.1 | 1 
                gnuchess-6.2.5 | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-llvm-9.0.0 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
linux-serial-test-5d11b31d9... | 1 
                  ndisc6-1.0.4 | 1 
                oprofile-1.3.0 | 1 
               pulseview-0.4.1 | 1 
               qt5webkit-5.9.1 | 1 
              sigrok-cli-0.7.0 | 1 
              spandsp-20180108 | 1 
toolchain-external-codesour... | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/38f6f52a5f54c598ae492b042914fc509dd44f62 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/2e3417d76119241b70b13a4249ebc8c09cfa35b2 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/bad4202bdcc5a4b625f39dba8a6bf1552414ed3f | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/01134e7a59250715bff5a5a933cecc5f62ce7924 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/a27149b8c8477e4f345f059ed586b5dda8836c9c |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/50a54eeb345b2bddb16a192efe29308099fe6e39 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/e60e3b9614635be889f5ce6e4f819042a42681bc |     
    sh4      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0dc7fe664ec6233619e82906e55c56c462ac8d38 |     
    i586     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/e13bde86437818793aa3d1f9989655c91cd81605 |     
   x86_64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/30177b82203a68657cee9785a4cdabab631715ea |     
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/6d9c2936b2ca0be1d8a2a7a21d51aaceb7c7afee | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a8f29fa58f8ad45c3b6e44d37dc41f14162b78f0 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/bcc7b80f4dd8f0567c3ebcb47b93c5cca1df4af4 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/007979844b8eacfaa1ed36a1727c4b174d06512c |     
  riscv64    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/7bfe4c6114e1e4bc236199c388334150a6e41fcf |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/8e4105bf73452575729c3acfd18fff2a9809a1f3 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/cafe7ffcd6526c97152d372d3845075f6dd32803 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ebf770fecc1f4e4dc4047157cbcf561e53c15fef |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/474dd536d5743d074579494809f2f366884b2ca9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ca86341488d004e73adfae848034f09e66ceb2c5 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b08079c6f03fafb5107e4f0008ab779d027cb76e |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/2225fe1b629e58ac35b388b63c8f1271a4811a37 |     
   sparc     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/94eb46b70bc9819574017594701abb46b0a71d19 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/5a42de5a30f168530f70063986c0ac459adf8402 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/0dbb2b7ee890e88607e59a1fcfb4858e6e725ed7 |     
  powerpc    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/75daba2a97e5123be8e7fcf6b5b26acd5c65e4db |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1cab1e5f7c4250a153fd1ab758f818078833972f | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a24975a901c8e454cb8e126a5bac04c98d284dc6 |     
powerpc64le  |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/09e24fd85aeefcb160dc7f0bab238b945316ec61 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e23300b4c7884f807062f8c7b239ef064eca2f0b |     
    arc      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/452ee8c31aa4f79f2f75eccecfd501bae5d94404 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/086214ad07f934ae38d510b1bf269c4d06e33167 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0804b1bd954672b2e9d28cd12e4341503d005c46 | ORPH
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/6c621cb5e054591d936b64cb0adb845c396aa527 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 
             qt5wayland-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/772f67a1d2a33c68c430508d30732538d22f2eb0 |     
 aarch64_be  |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/6f0faafb82703c21b5908e5579c619d5de441c72 |     
    arm      |       qt5wayland-5.11.3        | NOK | http://autobuild.buildroot.net/results/966e099f588469661e9fff8398c0f8514064322a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/dbedfd8aeccd4e1fb9dfe863d307f65f9f6506ef | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

python-huepy-a9851d5aea10d2... | 1 
                  spice-0.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | python-huepy-a9851d5aea10d2... | NOK | http://autobuild.buildroot.net/results/240c397a6479b98f30b63b5135bfb2e45281de7d |     
    i686     |          spice-0.14.1          | NOK | http://autobuild.buildroot.net/results/96c786f85d35f33508e9c71778043d16b87f72cd |     





-- 
http://autobuild.buildroot.net
