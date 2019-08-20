From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Aug 2019 06:13:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-19
Message-ID: <20190820061312.CB1D4881E2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  0  |  0  | 13  |
  2019.05.x  | 21  |  1  |  0  | 22  |
    master   | 214 | 40  |  0  | 254 |
     next    | 23  |  7  |  0  | 30  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/a24b7467320c08291c64d153b58baaef249bbd48 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 7 
                  flashrom-1.1 | 4 
                host-go-1.12.8 | 3 
                      icu-64-2 | 3 
                    ffmpeg-4.2 | 2 
   openvmtools-10.3.5-10430147 | 2 
                    wampcc-1.6 | 2 
/home/buildroot/autobuild/i... | 1 
                   clang-8.0.0 | 1 
             freeswitch-1.10.0 | 1 
       gst1-plugins-bad-1.16.0 | 1 
           host-harfbuzz-2.5.3 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
      intel-mediadriver-18.4.0 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                   mimic-1.1.0 | 1 
              python-pyqt5-5.7 | 1 
                 python3-3.7.4 | 1 
          qt5multimedia-5.12.4 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/cdb66589909fd3996186f7db7d1f19a3b03d58a0 |     
    arm      |          clang-8.0.0           | NOK | http://autobuild.buildroot.net/results/3575ca45045501b5fe6506b2e9f359f6be0d4468 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/7a2a2102fd022576a65333c47b12f9cbd0a28922 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/fe05aa1b4f6b33691b0cadf73ea8083673c05408 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/53e8722dd6d02bfcbf0dba31b636f5cc4efca1b8 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9630323a27bcc51f1c835759857b43d1642f147a |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b439104b8b8f2c5a2c175c9f0536a20e579beeea |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/274b99b0c7dfd6cc5c8f993a14c8241d96b2d851 |     
   x86_64    |       freeswitch-1.10.0        | NOK | http://autobuild.buildroot.net/results/4f79d17d1bc97fa5e33871d50ca519b4e9b37a15 |     
  powerpc    |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/be5fe0448edeee519e260d5c434f3b80f9e56c0f |     
    i686     |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/25774e4d5b49fa751412c68febea327e3de07a52 |     
   mipsel    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/e0424da7b6ae61eb0f8977912f411cea6a801bf4 |     
powerpc64le  |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/fecbcc1f7879635fa36101c710ff8da009d426c4 |     
 powerpc64   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/21a5609b2501ae11bf60ca063c81b57a11f638e7 | ORPH
   x86_64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/e1cffdecb5733d08e59af26cfaef06b7c90f3710 |     
   x86_64    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8f62645a9683af77e57b41480417f593853157fc | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/6bf213adf659cb5f405b48a923047d9d2daa2ad3 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f01ef2482809440104ff70ffd09cd341d8b7c621 | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/9e486ff208a78a059a500de6d79d0206d8e26051 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bf2058e15cb1787ac0fa555bb132feac2d12731f |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c85a8f4bed33e12bb619f4b6d85d0aaece1a66b6 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4a7201c0985bac960a2520c38c34d2cde4e8ecdf |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/35693f6f403aa4a499c0903a575bfad52034b043 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9bb308dd714c214dad97a476064ff574b949cc67 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e517abcb4862114f2f83b5e3b48b9a19a448a00c |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e6ff3f6e032058270319eb66f1c79a3bf1a04b93 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/9f893b7fa78ecd7743e163003b164e818768eda0 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/0db264fe79705f1e128a86436aa787f747b079c4 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b41fd4ad5705e6d7dfb1aee42d841fc3eeffa899 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/61aa225dcd616c4f0190e2fef7ecca6061de7c92 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/41ade1b797f28f420b88a5b9ce5a3ad9f353d516 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/98725678aacaf04fce4c67d5391c693b4aa7f88d |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/3d9623e1cf7df6d3904c3f4675a90be37f341573 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/345a197d42630533bf49bd36c37ba2f63b917367 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/823d40ebbd89f952d1b519803f1526c36f5dcef7 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/1edd7eaa792e2c88a360ebdd65143a63bb43b901 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/3329b86d253124a48b288f0a3565a12c8fb46742 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/6f64a8cf95bd9715a79743851f491cdfef71e0fb |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/e934ae91d218ccf04ab16a11bea673356d706dfc |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/d2da31edde260010ca5e98fa813a5b6f8897d590 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     gzip-1.10 | 1 
                 libdrm-2.4.99 | 1 
                  luv-1.30.1-0 | 1 
                  monkey-1.6.9 | 1 
                   mpd-0.21.11 | 1 
              qt5enginio-1.6.3 | 1 
                  rygel-0.36.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/accbca56b751e97629dc21708f3efa032c376dc7 | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1d9585e312887e279438b98030277265170ccafe |     
    arc      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/5aae5ebbed0966ef9554f05e0aab8d152e52ef00 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/9cf05c03afe5273e31dbfa33d4d6c62e701232ed |     
   sparc     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/1a704abaf2cdd0dd4915577e6459e100104c469c |     
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/b0fd25d55319b0f24c0812d3d576f3198dd320fe |     
    arm      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/ea18827ee0962b43df4c1bac64f1557a37ddaf97 |     



-- 
http://autobuild.buildroot.net
