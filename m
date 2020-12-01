From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Dec 2020 08:13:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-30
Message-ID: <20201201081306.A6D8788195@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  1  |  0  | 15  |
  2020.08.x  | 17  |  5  |  0  | 22  |
    master   | 101 | 30  |  0  | 131 |
     next    | 18  | 11  |  1  | 30  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 8 
      gst1-plugins-base-1.18.1 | 2 
                bitcoin-0.20.1 | 1 
                coreutils-8.32 | 1 
          fuse-overlayfs-1.2.0 | 1 
                 gerbera-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.15.5 | 1 
              libostree-2020.6 | 1 
                lmbench-3.0-a9 | 1 
            lttng-tools-2.12.1 | 1 
                     mc-4.8.25 | 1 
              micropython-1.13 | 1 
                  ndisc6-1.0.4 | 1 
                    php-7.4.13 | 1 
                rocksdb-6.10.1 | 1 
                samba4-4.11.15 | 1 
       shadowsocks-libev-3.3.4 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         bitcoin-0.20.1         | NOK | http://autobuild.buildroot.net/results/9a0c7939bc68f906b18af925b5c7e7a0873c406d |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/3274e9cd13c5cf2086d26d2e8ce61f40cfa66f11 | ORPH
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/b52ba8fda2d367f91057c5f16a359f82984a2fc3 |     
    arm      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/e752c95336b730cecbdd9265a61dc034e327bcd7 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0cae7837f5ac291ddf4d0b433ec7c389829403ea | ORPH
    sh4      |    gst1-plugins-base-1.18.1    | NOK | http://autobuild.buildroot.net/results/0e70d664550dcae0cd15f42b8cc2c36a4c0f1320 | ORPH
    arm      |    gst1-plugins-base-1.18.1    | NOK | http://autobuild.buildroot.net/results/b80ed683253fe811e8c19c62a342165c0870a07f | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a7b8a4194c342ec75a91e41baa58844722269bc6 | ORPH
  mips64el   |         host-go-1.15.5         | NOK | http://autobuild.buildroot.net/results/b71e97255f2cd541aeb2760fc2772698735ae516 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fadec14f6e10d55cd9009320a4c3b96b6bc96f40 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0e5f3d3a2045b399b067ac41e0cff94515d2969 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d84d5f9912e980c6ec3cde7bc3c4f4802f1e76e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dabcca44fc66e601060963fe348cb89d790cae80 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed1de0c76479cde3109988430a5f1a6aff9f1291 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/664797c4ff20a17d561bac05137ff8e7d4338ac1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3107d38803f38babc55f0eea931497895aec07b |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/046366f0c6197fb2e90e474ebc9849a75a1a5db6 |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/f60bf898f9d2e4d6ba4cdc2d06e3c4b00f239e93 |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/f1b63bfbfd70b34f2be2f0df4f0affa9bb8617f3 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/c36b9615969d72af83508bb40fc1c7a67288a8fa |     
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/950c769592b5f81f13185ced0c9537871e27b2b6 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/44f9b71cfcc3938962b4bbae9cf8eecc54f82cc1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/345ee372de6e9b7ce0315a3ca100dfd8ca8585bc | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/ec2fdf89d7779c42b099876e09ba235c01350977 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/9c7e47aa2e2a960ae64f7cabe1ecb14b043fcd5f |     
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/cfd86ca3195e11b6800cde74ae3072316a1e16c7 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/d2bdce7e324e188371919d965518b7a10ba519ba |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/5df43b458ee5f896bc89ecc92ad6371e41507f58 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2ddd82c5cc259752dcb9b68f5a787e72b8c6c4f4 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4c391036571d04e4af83768139b7ed6eeed171f2 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a71d20823ffa6208945a13ff56013b5a0bc8f33b |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  zeromq-4.3.3 | 2 
   gdb-arc-2020.03-release-gdb | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/a74099b606c5ee97f81c8506fcaddd5339035668 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1bc90993928c9cb4473f2047908ba3097c01415d | ORPH
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/e9df8de1155a0a79eb6d4e4d10bd4bf7333bd941 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/192cf7cdc5e33f8f1273dd510c61967072a63fe3 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a00d98fda23e328d214286b24344a5b7f2214ce9 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 4 
                  boost-1.74.0 | 1 
                        bustle | 1 
                clamav-0.103.0 | 1 
              libeXosip2-5.1.1 | 1 
                minidlna-1.2.1 | 1 
            resiprocate-1.12.0 | 1 
                   rhash-1.4.0 | 1 
                    rpm-4.16.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/629c09fa7317e77d33c68145e1ac5a4872514caf | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e207dd68b4403de84397875fd440ead199199909 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e317d602e15805cd7605f4269e167ed087242449 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/70ed8f6440635697f0fba44658e4b6463fc40c2b | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/fc967e609b379687384d8c7dea93983ced35a0c9 |     
    mips     |             bustle             | TIM | http://autobuild.buildroot.net/results/666a3d73e3b9d9a61dc44c6ab5ccde35489a416c |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/f44eec58406b31a55bc3bb27c51a462dcc18212a |     
  mips64el   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/4a3fd3cb61d9c9422d8ceda9e3cdea9bc568de8c |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/dbb141c21e9c68d0b82237e741b2e343803df6d9 |     
    arc      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/5daff502753219fd1ff6c8d8dfa85d806cd8fc65 |     
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7135f598a81e49b986643f0d37288c7b2a9c0e74 | ORPH
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/a5a06b9edd6fac78aa53478c1258f0df834ee812 |     


Gitlab CI results for 2020-11-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...c64lepower8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889273  | ORPH 
...pc64lepower8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889276  | ORPH 
...rpc64power8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889279  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889280  | ORPH 
...erpc64power8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889282  | ORPH 
...300c3GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889283  | ORPH 
...werpce300c3GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889284  | ORPH 
...00c3UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889289  | ORPH 
...erpce300c3UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889290  | ORPH 
...500mcGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889292  | ORPH 
...werpce500mcGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889293  | ORPH 
...owerpce500mcMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889296  | ORPH 
...00mcUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889297  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889301  | ORPH 
...scv64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889302  | ORPH 
...Shsh4GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889305  | ORPH 
...ootlinShsh4GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889306  | ORPH 
...nShsh4MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889308  | ORPH 
...BootlinShsh4MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889309  | ORPH 
...hsh4UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889311  | ORPH 
...otlinShsh4UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889312  | ORPH 
...h4aebGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889314  | ORPH 
...linShsh4aebGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889315  | ORPH 
...tlinShsh4aebMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889318  | ORPH 
...arc64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889320  | ORPH 
...tlinSparc64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889321  | ORPH 
...rcv8UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889323  | ORPH 
...linSparcv8UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889324  | ORPH 
...orei7GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889326  | ORPH 
...X8664corei7GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889328  | ORPH 
...rei7UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889332  | ORPH 
...8664corei7UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889335  | ORPH 
...core2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889336  | ORPH 
...linX86core2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889337  | ORPH 
...6core2MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889339  | ORPH 
...tlinX86core2MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889341  | ORPH 
...ore2UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889342  | ORPH 
...inX86core2UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889343  | ORPH 
...tlinX86i686GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889346  | ORPH 
...86i686MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889348  | ORPH 
...otlinX86i686MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889350  | ORPH 
...i686UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889351  | ORPH 
...linX86i686UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889352  | ORPH 
...Xtensalx60UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/879889356  | ORPH 



-- 
http://autobuild.buildroot.net
