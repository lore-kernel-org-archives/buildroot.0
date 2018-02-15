From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 08:00:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-14
Message-ID: <20180215070039.30E972081E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-14
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 180 |  21 |   2 | 203 |
   2017.11.x |  21 |   1 |   0 |  22 |
        next |  46 |   7 |   0 |  53 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 4 
                  boost-1.66.0 | 3 
           cups-filters-1.17.9 | 3 
                  dash-0.5.9.1 | 2 
              host-erlang-20.0 | 2 
             bluez5_utils-5.48 | 1 
                  cc-tool-0.26 | 1 
                     gpsd-3.17 | 1 
                    gst-ffmpeg | 1 
                     host-mono | 1 
                   jamvm-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                  samba4-4.7.4 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/696a7e8e2bc6d603119c3f14033a20514a314508 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ffdfec5a383ca6a0e53a791c8f8dd6211d34bfbf |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d9e825362e46ed5649f068927b4d0a84c2de6496 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a389047c2c55340b050936c66415a83b2c01bdc9 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/19059cc7e6d29dc14191b937655ea77891b61ce3 |     
      x86_64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/0350043698e1917d441ef8a2c2afcaf91bc25d5e |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/c3c6478699d5bd841ce0a18915ad7d0f90f93dc4 |     
       nios2 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/efa7f05469e8127bb31c2bce9301494095c26318 |     
     powerpc |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/aa7cc7315d778c15c5165ca6423257a84b957482 | ORPH
      x86_64 |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/58a1e4f6a529d3f7f5624e368fc8dd0b7633d2a3 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/88870f5bf4aff557d8eac4e1cc5d3e397e607af0 | ORPH
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/ac6079ca20e922e635df00d3fdb472616bb702e2 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/36b6a81d86c95cd2ca8d9c8886436c49f73e3671 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/b1b382eac52223c45e91cdc0c1cf4a4537f061ec |     
         arm |                      host-mono | TIM | http://autobuild.buildroot.net/results/00b98df10be21a1134f67d60a8465c8f81fe557b |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/c3e25a28aa5f9d11bf8931b23a272a639deb451c | ORPH
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5032aedd19cbf7979491dc695c0623a51e5bb309 |     
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4b498d0b605307eaaa434ff922d1c3f914e62545 | ORPH
        bfin |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/408fe86c2f47c0d99337a0fe0e6a7da701dee9cb | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f12349862c05afd18f8501e54dd5556239bc5bce | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4ac7a3fd45abd818f65829fe0d48afd68bba6722 | ORPH
      xtensa |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/ad34e66c961e0b299b4b67334892637dbe628807 |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/5093dd1caa6c570d4372b6f49e08879c3134838a |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                   mpd-0.20.11 | 1 


Detail of failures
------------------

      xtensa |                    mpd-0.20.11 | NOK | http://autobuild.buildroot.net/results/cc66cca30c7887395644821e48326441679d8339 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
             bluez5_utils-5.48 | 1 
         libcpprestsdk-v2.10.1 | 1 
               lightning-2.1.0 | 1 
                    make-4.2.1 | 1 
open-lldp-036e314bd93602f73... | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/8ab0645342e443ecefd5f00e7b4bc6b584a2cc12 |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/66c328767d89d27cff5e8aef8cbcae0eb234118e |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/ce4afad257131da9e9acd343f506e69f4a0f59ea |     
       sparc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/2e334d5ee7bde656cad5b825563d3a502a122d4c |     
         arm |                     make-4.2.1 | NOK | http://autobuild.buildroot.net/results/846f8646cea1dc6dd8979291a2079ec70095353a | ORPH
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/643277252ccbafff772a7febe3981cbfd4aebc55 |     
      xtensa |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/518209b06ad9e385e3cb503c3e72ae05d8b84404 | ORPH


-- 
http://autobuild.buildroot.net
