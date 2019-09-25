From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 06:17:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-24
Message-ID: <20190925061728.00E2B84E10@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  1  |  0  | 22  |
  2019.05.x  | 11  |  2  |  0  | 13  |
  2019.08.x  | 32  |  0  |  0  | 32  |
    master   | 199 | 36  |  0  | 235 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     apr-1.7.0 | 4 
                  cmocka-1.1.5 | 2 
domoticz-0f411f781ae4fb4a82... | 2 
                    flac-1.3.3 | 2 
                glorytun-0.2.0 | 2 
                 mesa3d-19.1.7 | 2 
                    bird-2.0.6 | 1 
           cups-filters-1.25.4 | 1 
                  ffmpeg-4.2.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.0.5 | 1 
           host-nodejs-10.16.3 | 1 
                      icu-64-2 | 1 
                libcurl-7.66.0 | 1 
                 libdrm-2.4.99 | 1 
               libupnpp-0.17.1 | 1 
                   libva-2.5.0 | 1 
               log4cplus-2.0.4 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.12.4 | 1 
                snort-2.9.14.1 | 1 
                suricata-4.1.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.3 | 1 
                  xxhash-0.7.1 | 1 
                 ytree-1.99pl1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e5cc613c020f81cdd8c1e2d549ac1fa2db3ed0e3 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d8e5f8414c6ff11633d344f0787327e7548d107b |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/30472829a21905150ad0a65f0f9f3ff44c961801 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/23ae8290e5ec525516049461caeebc5ded297a45 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/edac9c5981c102f5536ba631c16ac7fe28ad4976 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/370156631d034a8a25dfe3fa1a5930b22d6ced9b |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/6713c822fb7b8d159cae17d53dfd10ec58ead1fd |     
    arm      |      cups-filters-1.25.4       | NOK | http://autobuild.buildroot.net/results/edb39cb49a5191ae6942fecb540dd43fdcb23529 |     
  aarch64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/41da7df6397972d4502a197c2887a858e71a62b3 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/1f905b1291e9871596296b668243b513f50af668 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/a8cef1ef6148df86298740db06402a465b556fb2 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/03c105ebfa9e01d18e7cf0d6270665f73f686e98 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/5d801c1ccb7cf6dac2021bf39aec7f21a6000426 |     
  riscv64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/78d8b611290fc63cf5acbe9a46d73d4b7507f4c2 |     
    arm      |         glorytun-0.2.0         | NOK | http://autobuild.buildroot.net/results/b1fb19c4aa1c9beaa80372ba5d6786a991e83949 |     
    arm      |         glorytun-0.2.0         | NOK | http://autobuild.buildroot.net/results/f03b0ec68e14e4562df13ce484da34115b113c02 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7d7bc5a3ab54817d00232c37d280c2eb607f8a1b |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/ca8a3a9c5e9fdd14e7e251b97cb6761588cefe8f |     
   x86_64    |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/9a3ecae17c6f8cba693af9b0859d352f14caa756 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/08fec1b1ef8ec68756b7bc347b73c8bb5285fd6b | ORPH
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/aa0a9348afa068fc2a0ea54a84694b0ecc45e0b0 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4f154ef63a2b661d1382430756c98f57b32a02ba |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a83a31787ab5dc54f418aeb4168ab8d606c86164 |     
  riscv64    |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/dca4a7245f534583897153d040906f632e194e14 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/0a0566fab689dac8ac5152969f617a228b41b54b |     
    arm      |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/b0097826043ec7fdd633b4e751c0fb03b9b97d0f |     
  mips64el   |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/965e7b370ed3c96927a453af55b52666d385c4eb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ff5438e18302c2e9a22a94fa483756be3053a691 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/fca71f888bad9df2e78353153bfe15222c93167b |     
    arm      |       qt5location-5.12.4       | NOK | http://autobuild.buildroot.net/results/3e5380c4e6b1312bc78df4d942a8e0d0135ee98f |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a4fa350dee4b17f3ada709c8f06fa50213ecdab5 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/6d3825b0337eeef1b9857855b1134d6246f5681d |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/4816bddc8d6345b921858675c8f71821230e7683 |     
    arm      |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/25899643be8dbfe1b7f5d7f5d5524097c52eedac | ORPH
 powerpc64   |          xxhash-0.7.1          | NOK | http://autobuild.buildroot.net/results/b431b05b9fd9b06da041162bf258189eebd12050 | ORPH
    arm      |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/b1a1392636467f8c07504fa6cfb17962764820ae |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/13b375a58318281447d5aa6b320c4cb874c2bb5e |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                iptables-1.8.3 | 1 
           python-numpy-1.16.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/740a93780304d38a93b9bdb6859d6d6ecd787c45 | ORPH
    arc      |      python-numpy-1.16.3       | NOK | http://autobuild.buildroot.net/results/ad249d7e444210f581b6893bbc514a47bab55238 |     



-- 
http://autobuild.buildroot.net
