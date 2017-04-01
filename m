From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Apr 2017 08:28:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-31
Message-ID: <20170401062844.29E1320807@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-31
================================

      successes : 181
       failures : 65 
       timeouts : 0  
          TOTAL : 246

Classification of failures by reason
====================================

                 lvm2-2.02.169 | 22
                 dc3dd-7.2.641 | 20
                 xenomai-3.0.3 | 7 
                libepoxy-1.4.1 | 2 
         synergy-v1.8.5-stable | 2 
             fxload-2008_10_13 | 1 
          janus-gateway-v0.2.2 | 1 
                 lensfun-0.3.2 | 1 
                 mplayer-1.3.0 | 1 
       opentyrian-9c9f0ec3532b | 1 
                poppler-0.53.0 | 1 
                    qemu-2.8.0 | 1 
               sdl_sound-1.0.3 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2017.03 | 1 
uhttpd-a8bf9c00842224edb394... | 1 
vpnc-b1243d29e0c00312ead038... | 1 


Detail of failures
===================

         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/e71569bcc1de575edc69d75f7bf4bc8fd287814d |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/b5b307e8500c41f03c6fb0ee20ba009c85aa553a |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/b05cc98e5441df194eb84f05a6f30b5c3518f601 |     
        mips |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/2895675969073651d5820ef5dfad8339a832403b |     
      x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/ba0e7b1255f770c616bf3a15419d40cee833500d |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/695c9f357cff946abbb0dfa0cd53bd1da506e976 |     
         arc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/1d76ca315be64477e0c6e9d85f18068675a360e0 |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/ca9bc4b01efc1ac615857b33412a8fd35283b9b2 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/9de649139f4ef91c77f5df69e03f6414a3ff52f1 |     
 powerpc64le |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/eb7176194b8024b9cecb42e2cedc5ddc22baa27c |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/aca8c337a0c5b8f33b0f8266fe949f0dd1806fa5 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/413816b7bc3b8c9d22459df61fdd352e656800cd |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/de54595aace7ab2fe77714ecfc0b991d183f75bd |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/053083ab38a82106def32e4a773989bb77a51797 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/198e8427f0683ef665b7a92e1035942337e16150 |     
     powerpc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/458ffe0807d3c826607fc74e054a127aea3da017 |     
        sh4a |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/5a6d73fa77fb20eabe1e5edaa04a11e5a69329e1 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/4fd95c845e8de32fda602bcef9cdb91ec505b877 |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/56f0164bed2eef6b0b2c1efb017392cac7e7faf8 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/1903a870cd33d86911f1c6cc0102504870ca4de7 |     
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/2f151ee0ff9e012bf0b423e9aa66166bcc07b317 |     
       sparc |           janus-gateway-v0.2.2 | NOK | http://autobuild.buildroot.net/results/4e89134b9ebf74c35aeaf73afb74c2a2aa547138 |     
      xtensa |                  lensfun-0.3.2 | NOK | http://autobuild.buildroot.net/results/63e7700a242c7c28ede0fe0b6a63db288e73e974 |     
       nios2 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/f3f3b2da21ea45f1821b7d00d79db3f6d11f950d |     
   powerpc64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/5ed27b6dd94ea3069d52293c46f7fd7af25dc07d |     
      xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/12a3503be7f0390711fb4e0fb22a5631a3fbb585 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/c303a59a2470fbc0cf5e329808e9e179289dd5f5 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/0286b183ceffd853f4e3b8a7ca5ba7edcf2a9dc3 | ORPH
microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/8c395bb6c991833a170edcb80e3ac4ec77ca2126 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/5c8a1108995624fa795b81166bee228d1ca3ba45 | ORPH
       sparc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/fc69520903b00d8493739484ad9ad350609d47cf | ORPH
      xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/cb06860df85600f0d1078e015b3f19e08b43588f | ORPH
         sh4 |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/58027c95431fdcb48be9d83d77e6cacbd9c57f40 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/fd77fa549bd6faf25c05d8a3fb920c72cb581eb3 | ORPH
microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/e3f1c0d0484540728f1c102af7c888015671ab31 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/35dc7a433843222509bc2d2d42e907967103d9eb | ORPH
      mipsel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/1d041f3cf173b176947d6f06e6c6b6cdac1cf2db | ORPH
      mipsel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/30b7bd722288bd7653b5df81aa69c9488b75708b | ORPH
        or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/4194fc93e0e5e0bfa0b59dcaa2b4071ba28191a2 | ORPH
        or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/280abecbedfc87c589d8a5d2ea7aebc74271a5d5 | ORPH
        or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/ce9828eb00787bb2b54848dff012f608912dc6dd | ORPH
      mipsel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/98a10cab608b53885cd398b22c207ca3af252757 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/fc952ebb04aabbdb7556bfc5394d38581751e8f8 | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/11c27dcdd69d3d150cd5e521e267f45febf0aedb | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/a2db71c11021029380288f07aa8d266dcf4ff051 | ORPH
microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/b488c091a3ffeecfd40b103387784c191bf9958c | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/85b875dfb887a523d38e792c608669f0185bf942 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/03066dd8937ef4c75d62f237fd195df92b247ee2 |     
      xtensa |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522 |     
      xtensa |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/4cacf1a42415dc793547ebe95b734457627d0634 |     
      mipsel |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/996b0daa792d9a63b1fe55af766fb4f9781657e4 |     
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/de11b9446dc9dfe464363202c15a0844222755a3 | ORPH
       sparc |          synergy-v1.8.5-stable | NOK | http://autobuild.buildroot.net/results/dc40671874aac9ad491bd4c7aa57eb1c53484492 |     
       nios2 |          synergy-v1.8.5-stable | NOK | http://autobuild.buildroot.net/results/a37905b0c93aa0dc891a85be1701e51cf2988cbe |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b407bb9f684d4fae906c58a6ed6172cf6dbc32dd | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/415d0b446dcebc26a53716cebcf401c7cc626e70 | ORPH
        sh4a | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/3899abf493f56b7334386baffd1e825c927b61c3 |     
    mips64el | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/c0a1083a0625a3e946622131d66018f9664a1e40 | ORPH
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/dcf88808bed7436c5bb6e0994d83e1c1c8a256d1 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/430c5cbb25a3c23c4526d77cada4b2ff89c8479d |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/14ecfd41810e4588cfb2dad2e11080dcec0efadf |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/c1aedb927d6dd87ed085094f14d597e1e384589e |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/7623410a81b1587b33b4f4b9cf1572c872b8a6e9 |     
         sh4 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/a8125847367de5fd27156e5cba9ec7315c2ccd5d |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/555d9cb9cb59fad6353516bed206e1117974e8cd |     

-- 
http://autobuild.buildroot.net
