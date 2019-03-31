From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-30
Message-ID: <20190331060042.91FCB8600D@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  29 |   1 |   0 |  30 |
      master | 277 |  62 |   3 | 342 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                busybox-1.30.1 | 18
      host-uboot-tools-2019.01 | 9 
                  ffmpeg-4.1.2 | 5 
           uboot-tools-2019.01 | 5 
                host-go-1.12.1 | 3 
lua-gd-e60b13b7977bb3424d70... | 3 
                  linuxptp-2.0 | 2 
                   netsnmp-5.8 | 2 
                       netsurf | 2 
                   netsurf-3.8 | 2 
             openjdk-jdk-12+33 | 2 
                qt5base-5.12.2 | 2 
          wpebackend-fdo-1.0.1 | 2 
                cutelyst-2.7.0 | 1 
                      ddrescue | 1 
                      gzip-1.9 | 1 
                   mimic-1.1.0 | 1 
omxplayer-2ee17b22a6149a043... | 1 
               pulseview-0.4.1 | 1 
               wireshark-2.6.7 | 1 
                 xenomai-3.0.8 | 1 


Detail of failures
------------------

        mips |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/38a50375b29a795399cd5359c04ab53fe3613ac4 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/e3e0ceab24afd6239b23038d1a90625e69407b09 |     
        m68k |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/415d5c6be37f47de83f3e5f38d218ce3339af572 |     
    mips64el |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/de0b63495eb8dd3fa6f82e22d82caafaad48f930 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6f0a6b10dfd55d01aa1b74d8b0466297d686734e |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/bc342ea721f6340259910bdfb5ca261ec0f936d8 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/0539b3765eaa99029c4185ae89db6adb9e867078 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/f7d6dfcdc040e45d245ca0992f88a118c192df9e |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/95345acdefb21f06b0e1d0b54545de1ae1bc56b8 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/70f982a3e215035efd37c6dad740f83304ef6263 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4d817b4c0317c2783bfd350377dda3e4b74cfbc4 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/04a5f13932e4169418f1c51517bee46dd1dbb874 |     
         sh4 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/ed84b210d897d42f33bf14dd7ef1fb0bb94ccf53 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/edda97771dcec2d7c71dbe9fa3f7e26ca3f3187e |     
         sh4 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/55780cd3b200e9d6b951a9c550ce3606d18cedc2 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/43b8d742a86ce49bdc99f42549c23fa14c2c1f2f |     
        m68k |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/57199ce40ca9bf478b50c725d5b339c1202f3cd0 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/13dec2a2e18460a092070a72076335ea5275ec7d |     
     aarch64 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/9799c363fa0a5aefd01a67b08d4b0a66aec5b3eb |     
microblazeel |                       ddrescue | TIM | http://autobuild.buildroot.net/results/8adcafa46a14e00488858ed6daefdace7aef3cd0 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/a3a702002d124288dbac3c9f12b7802b3de4b92b |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/b5d6778a1cd74e08b89394e0126619ab0e045d35 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/d55eea3c69b8073e60ad49e01d1d25ca447f3b28 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/f5125bde6d3604af3342a205a8445947aff95d5a |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/c30b7f957df3e6055142de91f702005f798e7401 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/a8bf70bb5757811d9448b4544c156e838a9023de | ORPH
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/f728e16a2dce13082c92d6bf1f6a567d15dc6600 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/a44c8a7aadf7f601df22a3c9f27356057514f8b7 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/5de71cb90538e7dbf512b26280619ab699d3c101 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ee71fd555cfd037c629f5178ef4ca950874aa3d3 |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/238a4b861d72a8f04f59f5aa11c7b95db2b19312 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9af44b100d6d7ecf4f236b0cdfc7cb379b1780f1 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7000cbf55355ba74ed1c9d6eaf7b037002cfd506 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e143690be142026aa63cd8563da6263f6856a28a |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/66b6b3a52909922019e86388176a21ff98348a89 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5b5e42f97ffad41793f98b399f4f0d9fa606a081 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/77e2c06571d8fc4e7852e5b6e772515a9d251d0e |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5cc55f5eabd5005e071ad4eabab8202604ac7b66 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c9cfe8a30b0d6adfd5714823d2ee7d66e06c8f26 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c83147b24ede4213fc082bfa4a1a21e717fc03e1 |     
      mipsel | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/9ed47cca2f63342e8a9ab79bdbfc2e462633a145 |     
      x86_64 | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/756c20a09e3c1bd5295416894e4fbe0ca0db5328 |     
         arc | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/c71d4721e0516751fa00fd307f29c94c323b320f |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/0b5894169d923d2be16d7a34b4a09a36ced88bb1 |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8bbbe0f881d59b67783b4c8a066fbd97d1c5ca32 | ORPH
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c777a277ca52d63f7844623fe0ebbdcc149f378d | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/1bfc07b8a7ab538ca6a839a0c8d112290f960c35 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/4bb187a349db41d5d9a1f1fc617b2a8defbd8ee3 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9cb511c1bb008439627aff93979bda8433d0e9bb |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c771fda7f0e8275861dfa92d2514a683a2a97b1d |     
         arm | omxplayer-2ee17b22a6149a043... | NOK | http://autobuild.buildroot.net/results/aa6aba5b36b379b8a006a2e470ef17ee6e0797c6 |     
 powerpc64le |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/f39efe483412bff9ccf332b43ed823e97651008a |     
 powerpc64le |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/a91a0e912f6dd41162f19859c17ba0d8c41b9993 |     
microblazeel |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/ec65d74cada7f1579e1aa8c2959cb69b8d53df2d |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/296226c67ba4457ae2e5ba86123219fdf13bf176 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/a4ead73fb9c914ccc34737f80608aca1bdbb78f9 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3206dc8267dd7ead3139538718e025f8436a3c84 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3610ccce1fee3824f8b7f67ba52817754bb1db47 |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/558086ebd1fbacb9e2539d58cb399c496da02c7e |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/be10a012ec9e62251a88a82d5706db1a2a73d142 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/52815963ab8ed83f01e7297b5e44a32c681e35f2 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/26baac0bfe9835932fb7ba1a3b290b8a342fd736 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/0453674a09f37f6e562efe334c9aab97b2c199ac |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/922962b68cec29253563d9e594c6a6f054093ed5 |     
         arc |                  xenomai-3.0.8 | NOK | http://autobuild.buildroot.net/results/beac5f07c3b56596a6d9d5a1bcf29eb2837c4829 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   qjson-0.9.0 | 1 


Detail of failures
------------------

         arm |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/8cb6291117412752713fe985856c0a31691a75e5 |     


-- 
http://autobuild.buildroot.net
