From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 02 May 2019 06:00:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-01
Message-ID: <20190502060033.E6E9186479@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  29 |   7 |   0 |  36 |
      master | 253 |  44 |   4 | 301 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 12
                cracklib-2.9.7 | 4 
                  brotli-1.0.7 | 3 
                   netsurf-3.8 | 3 
                     vlc-3.0.6 | 3 
            liburiparser-0.9.3 | 2 
              qt5enginio-1.6.3 | 2 
                    strace-5.0 | 2 
                   bullet-2.88 | 1 
                chocolate-doom | 1 
                        glibmm | 1 
      gst1-plugins-good-1.14.4 | 1 
                      gzip-1.9 | 1 
                        jasper | 1 
             keepalived-2.0.15 | 1 
          libcdaudio-0.99.12p2 | 1 
               libupnp18-1.8.4 | 1 
                mono-5.20.1.27 | 1 
                   mpd-0.20.23 | 1 
                       netsurf | 1 
                 python3-3.7.3 | 1 
                   systemd-241 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/c0467e6d71bda9bedc205c64f1453442b978fbf0 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/9ee5929eee5d677440b9a27acbf3eb0ef44f9e58 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/2ed04395b595bdaba1b21d7dc3c4d56761a12edf |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/88fcf22d285b2ce4fc877a5e153fea5c17903624 |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/0163aec5a80c31f584d5440bea7f46f513b160e2 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/c5d500737bffe0a64b9a17b65f0aed2b7b14d089 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/4da25041246dc3d38a226f18330470cc1325861e |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/403b9c8f84f9bcd5b7bf4db0295304595094795c |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/2e05ccf4e7cb7d34e312465cdb4c377375f5e48b |     
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a5a3d3a93247521b51b95be1e2873f56f85416b4 | ORPH
        m68k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a65a44cae01fbc7edb9d9b8cc5a4afdbae79badb | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/76c1c207af0ffb9ff99b4736a7287128a26aefb3 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/200e596d31e6cc040f4667329d74eda3672b7e89 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d50e757c7a569f39cfd55a10efc62cd758766c88 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fe90b113842784765fe9651286ab29ee658e1ab1 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0abe8f58b283a18d30eaf2d45b0fc3192c1f6f9f | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b7f325e564cd639d7e3c549f37abf2549c178241 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/59223ca063ac1aa408970176a90959f9f2f96bbb | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b71df8e46c4372f6e243b09ab1a2908ea8322b65 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4ee69bf67d4b44fbe732b8493ea8202176b10deb | ORPH
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/656443c6f4673d04eff9d7cd1716c8a4ee8ec9f4 | ORPH
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/51082ce6207e0f3f2e6e8b62b6dc0540c27acdb1 |     
    mips64el |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/03788682c0c9314926b9e6b67841182fac6af394 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/5e464be89096f8949dcbbd9441472ea8df172467 | ORPH
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/261f5cdbaca1a7c8a37e1362adefe86b81c15eee |     
     nds32le |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/007d4c9fd5d47f2ca6aed01484fffc51a0e4fa85 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/b4c57f8ad98b3ede410437beaac9bbcc8f98549f | ORPH
         arm |                libupnp18-1.8.4 | NOK | http://autobuild.buildroot.net/results/6d734e45ec923dfa7549e0480b3d8913fc29fddd |     
         arm |             liburiparser-0.9.3 | NOK | http://autobuild.buildroot.net/results/83368ba18582418438410300e12d66f74a223416 |     
         arm |             liburiparser-0.9.3 | NOK | http://autobuild.buildroot.net/results/1e191676f28905a81de6282e07978aa5d4f02039 |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/5fc922340fed8fd19b918ab7bd82250dd1f6ea7a |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/57b3b0a00c321c012040e8110a34dc2db148e934 |     
   powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/62620e02e30211133f4b83e3e03be3496efcfe66 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a86d31f23271ff14353d8620ef341084c0e1e197 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d5fbbdf58fe6e741134b0c392aead30833406081 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9df044352ac1c71cdd7226bff1acf11478e7163e |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/9253121bbde9d2dca4c6c0c45de36ccac3be7610 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/8247f61a5da7f5192cc1cacd24455ec20973da96 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/7c3330d7c6384049c0ef4893fe2a233dbdd7c328 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/ee50a138799b29a17960b306d5cf3892dc53116f |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/0d6f2329e396a6107eadca2ff066e997d0bdbe7f |     
 powerpc64le |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/0514b52a9c13a4a603b1f79b5151e81eb49df1b8 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/2beb39b29422ce8b585ee06c249cae634f8c9d23 |     
     aarch64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/0a9fcb2c1d1ed0b76859951806ee0d606201e18f |     
      xtensa |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/792b07de33cac2ee0bd1e4cb9b584fc1f2f19b6d |     
     sparc64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/21bb63b9d916158c953154ac1ef75ff9c62083ed |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/ad33302564a13261db144ac26c9d2fffb397a2f2 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/2f51d2ee23c87e14d2bf5bf36d7f1bed46defed6 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 6 
                   glm-0.9.8.4 | 1 


Detail of failures
------------------

      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/520400fffadcdd71be0ec2066a8c765305b9faba | ORPH
     riscv32 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/6f5157068de3e813e34d3c69ae3fb2b1e5a58c9d | ORPH
      mipsel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/66ab9d77784757847539aaae7456b926237e65fd | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/7cb01cc712ed915d9c66c1bcde2e11ebb8987d31 | ORPH
      mipsel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/a2995a6a3bd9d840eae8bc973c7d6585ee12816d | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/38439c1f7ce44ca92a15d008a02791254addc21e | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/e654195ecfe92821ec477d1fcaf3977901d3916b | ORPH


-- 
http://autobuild.buildroot.net
