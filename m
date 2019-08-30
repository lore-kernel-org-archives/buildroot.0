From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Aug 2019 06:15:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-29
Message-ID: <20190830061555.7EFC620360@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  4  |  0  | 18  |
  2019.05.x  | 17  |  1  |  0  | 18  |
    master   | 163 | 31  |  0  | 194 |
     next    | 12  | 10  |  0  | 22  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/44ca8cf7379be39a622d0ca758e9392e999ab885 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                cutelyst-2.7.0 | 1 
           host-mfgtools-v0.02 | 1 
             qt5location-5.6.3 | 1 
                     vlc-3.0.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         cutelyst-2.7.0         | NOK | http://autobuild.buildroot.net/results/efb9e7ec8dd50e841de27ab216fcb1f50d8a0df6 |     
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/feaa448f46be7a65a2da383153f373b9c547e9d8 |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/bd894d6e1255adca3619269de268c8f204fcee9c |     
   mipsel    |           vlc-3.0.7            | NOK | http://autobuild.buildroot.net/results/e9acb796dd062d7829db9754e209bf349bf459ea |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 6 
            host-mfgtools-0.02 | 3 
                      icu-64-2 | 3 
                    ffmpeg-4.2 | 2 
                 host-icu-64-2 | 2 
               libupnpp-0.17.1 | 2 
               log4cplus-2.0.4 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  cmocka-1.1.5 | 1 
                    dhcp-4.4.1 | 1 
                host-go-1.12.9 | 1 
              host-ninja-1.9.0 | 1 
                    mpv-0.29.1 | 1 
           python-numpy-1.16.4 | 1 
          qt5multimedia-5.12.4 | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f097dc48370c6eb2db1ad81fdd5802f88366ad66 |     
   xtensa    |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/1e2d5a4d0d0136b21a1c618bdfdc5214a7d1908d | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/6b2c288deec7f2542d9f7017fe4c32ed434d1f02 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/2f306c2b08a361ad1b1e67763e4bd5cbeb642d1e |     
    arm      |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/51741e668a31518cc571c8c22a08289d12d5f48b |     
 powerpc64   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/9ca3675ebb7100aa7588bb89d8afa74c9ce292fd | ORPH
  mips64el   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/abf630561d444a6956e3070cdf89dbee872b706e | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/412addd1510b05be6bb184b462a2527df4628d52 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/8d829fd9df45f05342c55d833ba53696c60898c4 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/844304ae1dc5882e9b589f2a835df893f38676cb |     
    arm      |        host-ninja-1.9.0        | NOK | http://autobuild.buildroot.net/results/c506d39490cd81659dbc0632016194662ee2bb1e |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3021dae43c6ccc1b124a69cf17cecd84c0d185bc | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d1ca5934287fdbc8bdede62df64eff2f048258db | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2b414b1048794336c42f7cc4241dbd99745bbe4b | ORPH
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ee3f1fd7fad1030eaa56b571544001f21ab9bc2b |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/03d82e43837a724a218472c9655b7e0d6f53f1c3 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/302744ddb42f6c79045bc8a157ed9d202715e3bd |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/8f5d63bef647a2dd24317c11f2f50f4752ba6318 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6b1970755f5c5d214bd43a0ec8e6e551a1a8a78f |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e450cbb4d8397faf23283b4a9370cf8334cf123c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/e45f745f4f4c9ccf4895f80097cf5c12fa683af6 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/b3e568ab8e7baa88d707ae82f1ae0df57394931f |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/79a264bb2db98dd9d0747066aa4495c85474fb7a |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/cca71776579135422da0a7895cd021829979b2d3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/aa6085bff4533a2e570e187e805166d7ddbf7c9f |     
    i686     |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/c72be38795f3572ac98b945b1d696038afcbec5f |     
  mips64el   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/7379cdf4ae8a4825a1874a257973317abb9b7262 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/60aa6692e17f043c58781464d44f269b37505ee1 |     
  sparc64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/6416512912750b7c816de51b34d814b240eb4eb5 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/ff0b3e09d461213335f94eee6089258847d7eb2d |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/30957676e335b8eb42adeaaf6d5a627fd9e9688f | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    flac-1.3.3 | 2 
          host-capnproto-0.7.0 | 2 
                harfbuzz-2.5.3 | 1 
                libgdiplus-5.6 | 1 
                log4cxx-0.10.0 | 1 
                  luv-1.30.1-0 | 1 
          qt5multimedia-5.12.4 | 1 
            wpa_supplicant-2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/a9ad2d5ffc0c7d62cb4a2ba8ec0d193a77759443 | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/9466a1e301b3c41900ece76cf66486061371bc97 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/1726ec8420081d8846b91a60c6d0cedc04616f45 | ORPH
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/c283e52f9d68e7d3349a20a4b57fccc95bab191f |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d031fd9509a520030814f6e4b59a5be8b3aaf5e2 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/3acd4db5f01fb74f7baa0948ce6f6e5d210f49df |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/6dffc61d6bbf9eb76be1a8510e1377af88dbf555 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/d81cb4d5d0db9389f5e31ff7e914f68d35847957 |     
   mipsel    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/5f298734012760de9257848a541ed2595dca3bd3 |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0013e5116a9f3860a82c29e7eff2da91ff9295df |     



-- 
http://autobuild.buildroot.net
