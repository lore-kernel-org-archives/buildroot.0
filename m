From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 06:17:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-17
Message-ID: <20190818061742.888288592F@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  1  |  0  | 19  |
  2019.05.x  | 16  |  1  |  0  | 17  |
    master   | 192 | 45  |  2  | 239 |
     next    | 16  |  6  |  0  | 22  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/a33e0a3b81e830f341b3158e606253283bd77dc5 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/36c42ac375f782497cdde44188bcd4bec57d2d56 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 4 
       python-matplotlib-3.0.3 | 4 
                host-go-1.12.8 | 3 
                      icu-64-2 | 3 
                 libdrm-2.4.99 | 3 
               log4cplus-2.0.4 | 3 
          qt5multimedia-5.12.4 | 3 
                     host-llvm | 2 
                   mpd-0.21.11 | 2 
                  cmocka-1.1.5 | 1 
              ghostscript-9.27 | 1 
       gst1-rtsp-server-1.16.0 | 1 
                     gzip-1.10 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
             libgphoto2-2.5.17 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.6 | 1 
                 opencv3-3.4.6 | 1 
           python-numpy-1.16.4 | 1 
                qt5base-5.12.4 | 1 
            qt5serialbus-5.6.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 
                  weston-6.0.1 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/7eb87ae2fda2b0dfb4ba5f3f3f7f78075a5a53c4 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/96674b80503c4087c83cb90321cf7f2da6ed217e |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/6fe373e2e6c78974ac7ddada2b8b8d51c1d8a5c6 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/348ab3f990b18901519810bfc87e003a3bdd522d |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/bd474cd9267da6f4bc2b3fe7e4654aae7597f8fe |     
microblazeel |        ghostscript-9.27        | NOK | http://autobuild.buildroot.net/results/45a94a494eb2b719ac338d2e734753b11a4a0144 |     
   x86_64    |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/7d59056f39c8b4a5324bb485807085e8c56f32b5 | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/21755b9d75f11c2a07b214979bc24364813584f0 | ORPH
  aarch64    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/b009b4c6555ecaf31ed2efee96c30ecaf0d1c676 |     
   x86_64    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/1dd6f0bbdba099f436c77a370addde732af5a567 |     
  aarch64    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/ed9cfaacdb1124a7576a4b8fea7b2c68a799f7a2 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/1a1a047866699162d9baca019312076ba1f344f4 |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/19bcb23e9f0092467613d64bf6df24e4f7b50e7c |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/10455cca4b0813686079a308b77f36954612d867 |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/ed546cd75d7b6102194c56fd4bba239e3168ffdb |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/4086a7c70647c96c62044c1eded265c7922df265 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f5162a95e92943b8707910d34409c9b8db3b94c7 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/adf80d33700b2d442dcd5444ac1c60aa9930f100 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4eed914c3994adbea65a4207fbe864fdecd75650 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/094fbbd4f0b087ff6171748fd98d944a5897a22e |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/810f6126959c36fc361f0b593ca741987d95127b |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/6dbfbe45f8c7409188ea2bd19c85ee5f03468e70 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/38392120ea4067ac6eb23d53f0031a915a25977e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/26b80d9eaa0c0d74f837992b3008e4901acbcd36 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/39d5e2dd1c362e5ae9cdae709a77c2d55021cd56 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/1fca10c426d333b88d30123efad7f6c19512a523 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/9edcd0c7f99d8e084c144b502e6bad9f4a68f54f |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/b3eb5555ee147bf069267ec09a4aa9b4464818c0 |     
   sparc     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/8d757c4390facade75dd6cef808ea6ead9798c12 |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/7a9fdb7e323892fb6ed85a2441054303e889c089 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/de6417cc0b241174df255748326778036e5b9abb |     
   x86_64    |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/e6c7bd8152e775ba109fca7d3f0631f7efac739b | ORPH
   xtensa    |         opencv3-3.4.6          | NOK | http://autobuild.buildroot.net/results/4f86b13f9a780d57c1d1465acd029799f103bcba |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/65cff6dc915c9d8cbfef9b405d1bd80e2e94748e |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/e5eea360a10fea9b1efc94b1bdb940ef882d94eb |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/53e8ceec4a0f9db26622d49a532a060c8f7ed93a |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/74db4f4c2f06ca6802031b459d6b154db35cf9e0 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/10c042d15b4795af3be82d6b993adb7095e7a72a |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/a69fb6bb735c4cd4f94d97ed24bcc514ae6787ec |     
  mips64el   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/7c11fc4b12629f83a51f64db12d387defdd2cf3c |     
    i686     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/3b40f80011d83eb948357b15e451cb63776e720f |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/46c35835d47e41149d7369aa220db39b826f3428 |     
   xtensa    |       qt5serialbus-5.6.3       | NOK | http://autobuild.buildroot.net/results/3963c28d2884ed57a555905e89d4c20eec123644 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/71bac99fdc2375847e7650e2bafe127addb3bde5 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/d118dbc5fa665977fc663bea3eca741c547b0c0b |     
  mips64el   |          weston-6.0.1          | NOK | http://autobuild.buildroot.net/results/bba598272ae195b6717804256e8541ab070b22e0 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/daf46754dfacc30228d89910be231c4d27a10146 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   evtest-1.34 | 2 
                collectd-5.9.0 | 1 
           host-harfbuzz-2.5.3 | 1 
              qt5enginio-1.6.3 | 1 
                  rygel-0.36.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/6ce34f23033b4d3d6b399e154b10f89b422452c0 | ORPH
  riscv64    |          evtest-1.34           | NOK | http://autobuild.buildroot.net/results/b09a6b340f0a96081a55764b5dad0c2c31240cef | ORPH
    arm      |          evtest-1.34           | NOK | http://autobuild.buildroot.net/results/90c7a092a5492699406d3f46e0039d253146b6b7 | ORPH
    sh4      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/39ce4b975739521fbd869390e98baebb2494b797 | ORPH
    i586     |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/90d8ce6c7338c81113506e23b6991530b6bcfba1 |     
microblazeel |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/e275a5b37bed2c339d9e847a2c1813673eba135a |     



-- 
http://autobuild.buildroot.net
