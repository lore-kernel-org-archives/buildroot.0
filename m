From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Nov 2020 08:08:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-27
Message-ID: <20201128080825.636A387A5F@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  1  |  0  | 16  |
  2020.08.x  | 11  |  0  |  0  | 11  |
    master   | 84  | 28  |  2  | 114 |
     next    | 18  | 15  |  0  | 33  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                  boost-1.74.0 | 2 
                        bustle | 2 
                  ndisc6-1.0.4 | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
docker-proxy-55685ba49593e6... | 1 
                     efivar-37 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                       kmod-27 | 1 
                     mc-4.8.25 | 1 
                 mesa3d-20.2.2 | 1 
                    mpv-0.32.0 | 1 
                opencv3-3.4.12 | 1 
                rocksdb-6.10.1 | 1 
                    rpm-4.16.0 | 1 
             s390-tools-2.15.1 | 1 
         s6-linux-init-1.0.3.1 | 1 
                  uhd-3.15.0.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/57c2dce63db1408b13e32c5eb25e2681bbba028d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e50698a07c06e144cba88b14bd4c6aeeb47ddd1d |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/71978ae0e3433918d1619a88e915b3495180148b |     
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/f7857451fa68769fa1a0bbfde981a55160b7c2f3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/87c1ca4b0a8f3cd98d903463563fd63582477f2c |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/2a299cc8ada753a80f1b9f2d53866050db292e5e | ORPH
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/4879721a4ba7a02a7a26b92512dc4cbd70751185 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/9660acbd532bbe3136dbc8a6ebff2edc40d6a404 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/174a6bcdad2e821dea657fdbbca16a8bb0a77402 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2d5ef848ece066d955cfc4bae7e7aa9bb24188c8 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/38f6b970dbdfd855d8fcd0f46ff2fad99e50a2b8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d34a710b9637d08e1002e8bb71b2efdce93d4ca |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a955d52834fe2ca18e388e699bf10ed2cf8ffcf2 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e390f0580752b56c7b98a4cdd218e421196ff80 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bb4a34ed48df6f31446be84ff849965850dda4cb |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e191eb12a8002fd6727e5780ae4be894bab6b431 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb614e5eb01f6351b61be48eaa548fe0cc37f143 |     
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/0c968495f146996e10e9a2e81566a7ad183acce0 |     
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/792e69eefc87d28b92972c452d5e230d86d9e114 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/6bb7d9218923262eef5c2a09891401592739cee0 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/a1db0e32d777b21b945ea205b19712c4059dcfbc |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a2727696440d72ca3b729f8ad4a8fd7603f26149 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/72e35f429c8b299864fd57772d2ef997db6fe482 | ORPH
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/b3effcf50915a052c07a017558a947764981ddeb |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/d5d879c081f7d2c09091b936fdceb3f1842e7bae |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/afa1942ed8baa1f0f854ebb6e3ceb8375d55882b |     
   s390x     |       s390-tools-2.15.1        | NOK | http://autobuild.buildroot.net/results/00796f2ebd5fb0e08ac7a05a9ee566f2bc4bd1c3 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/63747519f0267ed0069079ef3096beeeb26a4ccd |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/201e08cddd101c334fbc838e2abc0c21b299436e |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/727fa95bad3d5935e1e6afcebe16254dbb4e9f8c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/21a5d7b3ea68dc8a275d3b2728abd7f64ce65846 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 6 
            resiprocate-1.12.0 | 3 
              libeXosip2-5.1.1 | 2 
        host-sentry-cli-1.57.0 | 1 
                       kmod-27 | 1 
                opencv3-3.4.12 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1fd4d9abc70caa7e70a7c932fa10925d3bef8cf5 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/630bf1545d3a13013208091af0ed15d768bb62a2 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/09fa385c790cb7d78ff01cf39d459b9fe2d3b15d | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/73938a3a92345fc25d3e5838c169487fc387515d | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d4a78ba204d42a068777545e3c76a6eae634fc41 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5eedcfd0f95750fb4f6d5963ae2dd384cbccbc33 | ORPH
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4df0eeaa976e5f3c2715d0f3f2a195a7d485191f |     
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/8716f82edc8108bbb9204be7645e6aabed688411 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/592d4538e15f9ac880bf4173a76d6e2c791d37da |     
  riscv64    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/5ecbd01535c6db894d45980663707ca83468b36e |     
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/e3065c485d32632ecdf0b1225005a974b75cbf64 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/b4a417bab9177b796c47c477a00c450546a93c24 |     
  mips64el   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/290b9447e6470035d17a3c7725637f7d0e6403f7 |     
    mips     |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/a762ec0b1d0a11396cc0d09784ffccb7a5cbcb0d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b96ef3162b6c0a4f187998a6d1874fa136e3b7e1 |     


Gitlab CI results for 2020-11-27
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/873587303  |      



-- 
http://autobuild.buildroot.net
