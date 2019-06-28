From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Jun 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-27
Message-ID: <20190628060045.4C23685C4C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   0 |   0 |  20 |
   2019.05.x |  15 |   2 |   0 |  17 |
      master | 138 |  51 |   0 | 189 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
            qt5location-5.12.2 | 1 


Detail of failures
------------------

     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/0c71c1400c2379d7ade7b0a81122370a2d189897 |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/244da61e4624d1243d1eb4a625ce867b0c63dc7d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 9 
                       unknown | 7 
              libsodium-1.0.17 | 4 
                 hiawatha-10.9 | 3 
               libcap-ng-0.7.9 | 3 
                 python3-3.7.3 | 3 
             xlib_libX11-1.6.8 | 3 
              iputils-20190515 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
           dialog-1.3-20170509 | 1 
              domoticz-4.10717 | 1 
                gnuchess-6.2.5 | 1 
                harfbuzz-2.5.2 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
               libsigsegv-2.12 | 1 
           libvncserver-0.9.12 | 1 
                    proj-5.0.1 | 1 
            qt5location-5.12.2 | 1 
           qt5serialbus-5.12.2 | 1 
rtmpdump-c5f04a58fc2aeea629... | 1 
                suricata-4.1.3 | 1 
           udpxy-1.0.23-9-prod | 1 
                  weston-6.0.1 | 1 


Detail of failures
------------------

      x86_64 |            dialog-1.3-20170509 | NOK | http://autobuild.buildroot.net/results/9287ffbb86a7dc09cda5f99f87445fa884e77625 | ORPH
   powerpc64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/02e3a42082c4a5d5f829857c40894c02c46e054a |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/0d2b474fa91e3b37455e62c9b73716fa13d1c9fe | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/534417527616c3e3df85bb85ba1ab18df66bca98 | ORPH
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/4cb01849b5e43f2c5d13f7a732a878706e51d93d |     
     powerpc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/7c09c80a376cf0c4c23a3cf48314806de9251544 |     
     riscv64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/8aaaf2323333a6338916b55da13563ce85306c24 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/56a59f4c9a17f11f50647f91ce49031187af8a5e |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/8f2c1caba695b836406d794984574a916f87780d |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/45aa9002e5561f4a0f8e1d3f0705dc1787bf3984 |     
    mips64el |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/2f41476efc2b92eac1996b2323f645437473be47 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/95cae8124571f84b36225548dd03135f4d859dfe |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/a1f80b0f5a8571e6662fa12c357528e0eb3b09af |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/deeeede156a5eec5d8dc4ac09c99cba5828f34be |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/3395572237c174817dfef8d9d0667d408f14649b |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/93242501ee7abb71dc3726622dcc0bc2bb049ba0 |     
        i686 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/7007ecd8389e6db3cc41b1e7af73c4faad9bcd37 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/6c210596a2b3d0469ab7183e2d2fa81cb3945798 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/073c87fe77b595fb1e930c469085167a1061137f |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/f8864625fe6d686374a9eb47a6ae34d3724cd323 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/85846254772d6cc31a3c3a95bd45b88e224aa7cf |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/65de97fc193cb2f0079c10a69ba12f09ca835444 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/31572aa6c130be66160d4c966ffaabb755a2c598 |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/c1d06cc23c35a00c2f9b99b5395fc66eae42870d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/9491ea38414d751fdb9af1c0ab019cb353114d92 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/4744b2eb51459773c7289f16abd2a9c85f9821a6 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f9a7e27618c1d5823050fda05ada68dc663e1dfa |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/bc0102fce2e2e7da0c89ac21d3da9414d5909048 |     
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/7befa7e57de7e54f2e6bc8b34bd2240e0a673045 | ORPH
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/b0f74f38268bb92578a13e920bc48c5a8dd14d0e |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/0bf3392979b68537eea2938281399b7922d5a964 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/379dc943b91a1c05c3421ab12fb298a08b018cb0 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/93abf0d535f38f66b08ce2815d7293d7026f396d |     
         arm |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/b77bbdbdc21ba756c1dddf6839ab5cf60a3655ec |     
microblazeel |            qt5serialbus-5.12.2 | NOK | http://autobuild.buildroot.net/results/8760a046e139200c6b2f9d9f243afe2d3e1aef3f |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/4ed198659680b9206a322d5914662677d953a31d |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/23ad04afbb7c57c2468e140462ba044cf6c424b5 |     
        or1k |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/3713bf0cd7e403d661a5ee397b752f7a4dae00dc |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/a8fb51cdb24fc55f4134eabaabea2a568a179915 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/1125f73fd51947634349e86568e57f65fad831d0 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9df77e96242f64d84eb6734205f681806cadd970 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/e2cb604752b7303bf1671c851cdc8e7d4f71bec5 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/358f5b1ace2e58f984fa7a2444f328a4768d9f1c |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/ae64d675201cfdaef1a931c44db3c8e6193749b7 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/dab3122fd054004563e4bc7292807d083bcdcccd |     
     riscv32 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/6178a85df4b058814a193fe28b4d89765f8f2bc4 |     
        mips |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/32b519d31ff0c3adf15e7d2f07098f96d7a0a40a |     
  aarch64_be |                   weston-6.0.1 | NOK | http://autobuild.buildroot.net/results/44b3c021ac65c97a50135d06907de03d139626ce |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/23729d401dfa9b9cec22cf32ed574cd8c465c78d |     
     powerpc |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/8297034df6ccc6983b7a2ca149b165e8585fe218 |     
     powerpc |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/e312473f485ba4fc32a0284113b8bf4604e9b83e |     


-- 
http://autobuild.buildroot.net
