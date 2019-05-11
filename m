From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 May 2019 06:00:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-10
Message-ID: <20190511060140.EED6A23724@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  19 |   0 |   1 |  20 |
      master | 176 |  16 |   2 | 194 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                cracklib-2.9.7 | 2 
                   netsurf-3.8 | 2 
                suricata-4.1.3 | 2 
                     gdb-8.1.1 | 1 
                gnuchess-6.2.5 | 1 
                      gzip-1.9 | 1 
                host-libsodium | 1 
                   mimic-1.1.0 | 1 
                          opus | 1 
                 python3-3.7.3 | 1 
              qt5enginio-1.6.3 | 1 
      qt5webkit-examples-5.9.1 | 1 
                  samba4-4.9.7 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/bd6efac187ce84306a6a5348e0591c4c7728ae39 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/d642e4343a0480d409a90d69934801e5b9df3433 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/f350d2538e2c393a9f74fefc7c61ffdbd8c1ba6e | ORPH
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/ea90051f4c8d614b20011f499bc508604fe829c3 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/1bdf32e0d0dfa50c55c55c8c87b588b27758c169 | ORPH
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b827089f7fafc404e9d8e4079dbc5c1d19367d7d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/7849014c963ab4f6125e9f813066c3996e1f780e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/180e36e636e8797f55dcdc7c1e3192c993f5b79e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e2a2fbbf0e91dbd4a557f0db1c765fc72d9204eb |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/4f0665a3fb200d17120e398532cc98539550e88b |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/6434ab448f46b3886ccdfd4a39317975f8b21a43 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/969d38b9ff1db51959e68343cf6e932dc8645688 |     
     aarch64 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/387f5840fac9d0ee5217f5f963e598eb1c212a48 |     
    mips64el |                   samba4-4.9.7 | NOK | http://autobuild.buildroot.net/results/bae0508e84c905dc23ad7cf1153cd1e9d8e4d734 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/19d694b6672ff2ef1c95cf2d4f628ef65dccce29 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/fc1ea8a96281ea25298d310dd07654b46d214ad3 |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/b58d2a0e322e54e8a280be07d5f1287c3a8de216 |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/d7e1a33d41f305e35012287e21cd68e42798866d | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 1 


Detail of failures
------------------

        i686 |                        netsurf | TIM | http://autobuild.buildroot.net/results/d09e12c44e6d6081be947cee942da216f0a91182 |     


-- 
http://autobuild.buildroot.net
