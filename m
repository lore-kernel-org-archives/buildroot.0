From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 08:15:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-25
Message-ID: <20201226081532.8BB0A2026D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  2  |  0  |  9  |
  2020.08.x  |  9  |  2  |  0  | 11  |
  2020.11.x  |  4  |  2  |  1  |  7  |
    master   | 45  | 30  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                   rhash-1.4.0 | 4 
                  bind-9.11.25 | 2 
            host-libusb-1.0.24 | 2 
        host-sentry-cli-1.57.0 | 2 
            quickjs-2020-11-08 | 2 
             timescaledb-1.7.4 | 2 
                  zeromq-4.3.3 | 2 
                  boost-1.74.0 | 1 
              fetchmail-6.4.14 | 1 
          fuse-overlayfs-1.2.0 | 1 
      gst1-plugins-base-1.18.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                    htop-3.0.3 | 1 
                minizip-2.10.5 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
           python-pycups-2.0.1 | 1 
                rocksdb-6.13.3 | 1 
                  waffle-1.6.1 | 1 
                xenomai-3.0.10 | 1 
         xkeyboard-config-2.31 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/4e3764983f500bbb037e4e28cf7f933bd7c86ae6 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/8b591d0bc5dec7070174389ceded535ef80eb250 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f900295e88b17e22265fa9d27ceb4ccdfe9839b7 |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/f7e0794b02573facc8e6925cef99a28ef9ed4caf |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/ab3c16cb6601f0d7393a662fed5d1bae365f2181 |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/56878c249f92a91144c1aa66e6e5c1a13be89762 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/773f0ec08a849e830a04dfbd17a596d07ff55f34 | ORPH
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/9fc2aa478521aa367da7e2a0ffde0037542c07e5 |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/6ad775d0e9a863564c20abf99ae881c41b4f7da5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/747ca4109324dc74990023e0a18b25b59f20e58c |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/210bf22f13d015aa0194e803676deedada0b2250 |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/d8b7fe557a8a29a6b51a7ff1524d497c04237c20 | ORPH
  nds32le    |         minizip-2.10.5         | NOK | http://autobuild.buildroot.net/results/ae16497bf56df9ce4be97651b5ce65f75bdf909f |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f28aae192e8d34f64a3f00dee2b0477924679dda | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4295760f50cdaaffa7e9c6983f06e385d5bc96fe | ORPH
  riscv64    |      python-pycups-2.0.1       | NOK | http://autobuild.buildroot.net/results/3c8db83a2d1ae094fc718947a508e35e940121ce |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/3714a2b89431f05fb8bf462571d2e52198e1970f |     
  aarch64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/eac9018c18809de53e94b8a3609a8841c669d392 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/0e1cee128e2017c067e95fbbae415930383cb2b0 | ORPH
 powerpc64   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/664fa30433597902e78ef403f5b3ea4e2a6699b7 | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/6c1dce5cfadc027a721d30a2d9c590339d51130c | ORPH
    sh4      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7713611d6b56bfdb6b0ecf1643719f4b08cd67a0 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6eeff5f84031ac39e729c506c0bac92c79e17688 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/e491b3185ae46b9128e1fe1944944854057ec58a |     
  powerpc    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/362dd6cce204fe1572e2c2cd297848b0b4bb20c7 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/cfd40ffe44dd208b2470d6e0d5777495be409a77 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4792d78323fc33072e4c8c94e7204e3e17088508 |     
  nds32le    |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/003384d4e43209e37ee87c7abd5bfc5b5ae3bc51 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/eb90199cfb9389cf7e5e8578f57581b8cf22a9fe |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/d7361b394f160299ecd15bd8407a62ea173b783c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                nodejs-12.19.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e953ac1ae0885e7c49626026c9270a315a6d9e22 | ORPH
    arm      |         nodejs-12.19.1         | NOK | http://autobuild.buildroot.net/results/f0d2ae1cfdf7b1f5f14f91a0c6f4971e5b1f639f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              micropython-1.12 | 1 
                nodejs-12.19.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/77420bfa6967c2876e22edfd57e4b76c490a1963 |     
    arm      |         nodejs-12.19.1         | NOK | http://autobuild.buildroot.net/results/0f6861979355c9ef0c51a0461a348fd635d0fcb3 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                        bustle | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/1912d7d3b28911fb2021243a4231982e6c3e0cc7 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f7d0f68eb09473c61fc1fb21fd8975444af2e89a | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bac0d17da4548d708c304fc92d66dbe91d84740c |     


Gitlab CI results for 2020-12-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/930689957  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/930690165  |      



-- 
http://autobuild.buildroot.net
