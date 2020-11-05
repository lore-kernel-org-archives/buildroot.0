From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 05 Nov 2020 08:08:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-04
Message-ID: <20201105080904.A395F228F1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  3  |  0  | 15  |
  2020.08.x  | 18  |  1  |  0  | 19  |
    master   | 93  | 35  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 5 
        python-remi-2020.10.30 | 4 
               domoticz-2020.1 | 3 
        host-sentry-cli-1.57.0 | 3 
                  boost-1.74.0 | 2 
        python-m2crypto-0.36.0 | 2 
                    vlc-3.0.11 | 2 
                  zeromq-4.3.3 | 2 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
                  dnsmasq-2.81 | 1 
              gnuradio-3.8.1.0 | 1 
                harfbuzz-2.7.2 | 1 
                  ndisc6-1.0.4 | 1 
                    php-7.4.12 | 1 
                rocksdb-6.10.1 | 1 
                    rpm-4.16.0 | 1 
                  rt-tests-1.9 | 1 
                       unknown | 1 
               wireshark-3.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/167e0586fdf33d8f6122f3750ceb20c94489d246 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/cf6f3e98a4976313a6e0b798bfb0a35691e02b9b |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/43791c0b08fe5642482f641582da3e50abf490e5 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6faa90a0c7f800515c6ab648e062e060931b660b |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1db029974c050a11d28dbf05649784441c3d3c0a |     
    arm      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a65b390eb8a51c9bd0ec29b89dbd7eb68fd127c9 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/738497e581b0059faa6179aca6d3d0e50c28540a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/b4e5c69a8ce9893dc951694c4658c301fe4a2192 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/1643f0cef5a537e73c9b582479027a8b3a4a885d | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/dcfa865dcad564a79530069e30f693fc3de7c201 |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/969f6883c76fd7c8a1178d0d5eb15b4bfc0ba8dd |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/52b36778cbd0bf6807579853f63e69304728759d |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/1a6026247b823c0358cadfa1c2f2c7a5a0f8c69d |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/9e9df5052da866610bd7e19e6631c0a7f814ac58 |     
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/e81daa687d12e2a4db7c77709ba59a89c7454f64 | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d6ec7a426c12b66d6aad89be385de08f3ba54505 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3479c843c8e166433ce28a321949b73d56e0d456 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a0580668cba6312e3c258ded7976f223afb1d2d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1dba748ec344249b01f48e84dbe5e80e4d272ee3 | ORPH
  mips64el   |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/81127a5dd2a7c5d49dc0201a0a217247cf0b9941 | ORPH
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/471344f1ccd9eb510a23c036d83849382ac3d2d8 |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/85b5e0672238e3e66fc522e6d543ad76261a73d7 |     
   xtensa    |     python-remi-2020.10.30     | NOK | http://autobuild.buildroot.net/results/3a62359d0e183d45e50e999fc2c58f7805bda142 |     
   x86_64    |     python-remi-2020.10.30     | NOK | http://autobuild.buildroot.net/results/719f3dfe208a0f76ec96ec6f2a4b7608a59efd3d |     
    arm      |     python-remi-2020.10.30     | NOK | http://autobuild.buildroot.net/results/cdd9de90043d0dcf901d1ac6b8b035bef2212619 |     
   mipsel    |     python-remi-2020.10.30     | NOK | http://autobuild.buildroot.net/results/2e358a916211a9a053403ff46f4a33ffbc6b5f86 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/a9798bb279a668a266c472fb026b68dbccf50431 |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/6136f84b1e768ffaafd3d2225a4f4824090c78d6 |     
  aarch64    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/d07781cc7cdb5ff594a6cfa97f6247128d560046 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8769c2cb86491cbcf1922500445dd8f7244dc07d |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/4e11567125e003185d9c29637f0ecaaa9969c6f5 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/19af18cfce73fe82920761e07df45b022aa03461 |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/18d0275e8b600ea25aba5721f0281d3a3a975f8c | ORPH
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/8158a65f61bfef117e0c8369f61424833763d76f |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6716d0dc6f9baccd1d699b85af1db6d33bd10319 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                   expat-2.2.9 | 1 
           oracle-mysql-5.1.73 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/b7a0a92d9adefded76048c6d37402c3be776908e |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/da6d9e05362cd7066b37a94387ee5d2e3245cf3f | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/ba2fb430ef0530bfdab6d8b0577e19bd2163d6a6 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                 openal-1.20.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c281683083add26750a10454723f9caba37b24f5 |     


Gitlab CI results for 2020-11-04
================================


-- 
http://autobuild.buildroot.net
