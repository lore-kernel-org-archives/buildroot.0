From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Jun 2017 08:31:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-05
Message-ID: <20170606063119.BBACB21D14@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-05
================================

      successes : 222
       failures : 91 
       timeouts : 0  
          TOTAL : 313

Classification of failures by reason
====================================

             ipsec-tools-0.8.2 | 17
                     gdbm-1.13 | 13
                    exiv2-0.26 | 7 
                 host-icu-59.1 | 7 
       libhdhomerun-legal-info | 6 
            python-pyicu-1.9.5 | 6 
                ejabberd-16.01 | 4 
               gnuradio-3.7.11 | 4 
          host-doxygen-1.8.9.1 | 4 
                 lcdproc-0.5.7 | 4 
               libupnpp-0.15.2 | 4 
                  cppcms-1.0.5 | 2 
                beecrypt-4.2.1 | 1 
exiv2-910f3507795e1930ae216... | 1 
                  ffmpeg-3.3.1 | 1 
                   flann-1.9.1 | 1 
                 gnuplot-5.0.6 | 1 
                 hiawatha-10.6 | 1 
           host-doxygen-1.8.13 | 1 
            libpwquality-1.3.0 | 1 
                     php-7.1.5 | 1 
               qt5webkit-5.8.0 | 1 
              swupdate-2017.04 | 1 
x264-97eaef2ab82a46d13ea5e0... | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9bf83314cbaa96f748c903f856883f9205df6f78 | ORPH
     sparc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5cee36ab749478b5ec79740cfd8038914975f304 | ORPH
       nios2 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a81ef7fc945e393179fef7539e01550830b71d22 | ORPH
         arm |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/80812a3372967455449a94a5cbae3a72d0dc5be8 |     
     aarch64 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/b7dbc79bea33b2c061ec9f42c3378681d5ab9c42 |     
         arm |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/a089c8e88f0d819caead9c7a2d26e316b7c7b08f |     
         arm |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/89935d104afce79e57a41f6593fec1c44b45a846 |     
       nios2 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/a4b51e4941e179893230815fa0ae7d04b7b51086 |     
         arc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c6eaa151d90cfe43d21177c2f0d1cd88fb724ec5 |     
      mipsel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/413ddbb6785f1e996034888f5eae56ebb236f671 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/d99052e0ac5bd0a26a58925361d3b2c71f19f30e |     
      x86_64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c81628bd878af88f4bf7fe41c85746db3ae8a06c |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c42fa9d8b31d5f9f9636c9633dc79a2a6384d684 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5ab44cbf7ef5d8ce9374f8d82b4c095f2f59d422 |     
      x86_64 | exiv2-910f3507795e1930ae216... | NOK | http://autobuild.buildroot.net/results/28334a8a0b23c7c8260023b9a3aa15e8dd7613d0 |     
      xtensa |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/cdf1a68d51c2f241b0fe04401f4f691682f9001a |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b13377f03acccedc0441fb1e37e93f8e0b60da5e |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/59278fb8681d474883e6551df5173edd806b16fa |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/0a59bf3323b450582463c1bcec8be2cfb168e70a |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/31c49066ace2507990fd57b008ddaf3d93459adf |     
        or1k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/3998ec946daf775d93148bae4c883eba8bb9b4ba |     
     powerpc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/6f8b3778142552f8f7a1a030188e1196c11ed326 |     
     powerpc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c5ff66ae6c47119d9eaaf29ba8bcab372571b37f |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c1aaee263fd04f7a0948159bdffc41a59c02b022 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/6008452cfb93e52ebae204e2235aec9c48ea4b2f |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/916ce53014a5aacd3fe3e366bdb2e134c7d7a0da |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/df3efca163fd7e88cbd0cf5dc9f0ad1b02768abd |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/f9b71c9c4d2097359870183728a99cac0fd46e9d |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/216693f48452acdf5f0ed41a704a8f254c8ff0af |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/aab5da361629abcf825fef4c81718e37ea6744d3 |     
      x86_64 |                  gnuplot-5.0.6 | NOK | http://autobuild.buildroot.net/results/619b1d847ed4043d4dd2b66e77051cf2a2e731c1 |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/9895e0c7e0c2649a35ca2876ae5b70408d62d69b |     
        i686 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/524f92f0dcce3a0decc9b78ada17d6f6f60fee99 |     
    mips64el |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/d71278032c083c2c4b1bf20b81629225f8965c6e |     
      mipsel |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/2c8c3b45f78d1b69221e697ba97fc6d6ace8a2cc |     
microblazeel |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/c04ff29b83c020573add597c355c57a6d9c9761d |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/57b7126ad6eb1c29efff319c252a5abccce40eae |     
         arc |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/fe46e426fa6d3ddabc50afdaf7cf418e578526b3 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/601db5e17ce4d3f6ba1233f5cfc863ee591da0a0 |     
       nios2 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/4425e9506d3090775703406d5c9ec163cf95d3e5 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/66f9167e3d301fe30fbdcf063c032f0ae2b92711 |     
     aarch64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/665a086be752b6a29104814b906e5d754b0834bf | ORPH
    mips64el |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/d6b8079158bdb597bd4d78d4030ef9e2501c46b3 | ORPH
        or1k |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/452ae8b61cd8c186152441db24e55e8b0eff9443 | ORPH
      x86_64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/b6023c35bb9a0b79acf74caf3af2c97cff106975 | ORPH
        m68k |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/c3393bc0a86f5a70b85d36dbc02bf919972df72b | ORPH
      mipsel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/2b3a9be1780857db8827ea70df9d8699116a5df7 | ORPH
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/5871ceb1e698936f1f3e8dfc3795bf43047e27ce | ORPH
         sh4 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2bae2bbfe73eef23846909f53a4ef83ac4bb8298 | ORPH
 powerpc64le |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/13a2ee1a578d47cc58e049824189d08422bf971b | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/cfb0ddfc109984d4b2f95c1980dc55f6ccc5f40e | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0aa0c7239ec460b91843f7450edb75bf56247784 | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/6490d32fe9ed0e23e1c5f6a6f11aaf33fe7e42c8 | ORPH
     sparc64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2bdd51be7d809e035e3afa942b794d9d7d66c3fb | ORPH
 powerpc64le |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c43585e2662f1d3ed68f05118b6e894fad9b07f6 | ORPH
        i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/76683b46eb40a5320ce47d37346132861c01dc5f | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ece49ca25c075c16e74de13453027fe491d817b3 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ee4159da4d91bc8b0921dc4aefe4a7522f209941 | ORPH
 powerpc64le |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9287c31d637129985e600483d0d636bba456ffb8 | ORPH
       nios2 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/7c3156ef8f0a60b8080c51fa53efdbcbf5ff9153 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4d2e32a7b87515ca1697fbfa8ea99bda0d98ce13 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/db02c95faf37e09a0bacda4cda9ba7424a3009fd | ORPH
       nios2 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0bdc715018782bdc09b59fc04c1a6f1638cbda8e | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/169e5a1576e7e3dac342cfa3271ff0273766eeee | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fb002bc74336c0458697b9221b8c1727f30d1f4e | ORPH
        m68k |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d78654818de703a8672b8fb4c23c52cbce5e1f6b | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/573e0454789f66674932cbddfcd732e19be42459 | ORPH
      xtensa |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c7c52cd56b985fd73434d5997e9a6ab3f7d7e71e | ORPH
       nios2 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b68f54404a7d412d639ebb6d052412eea6ee3bf1 | ORPH
      mipsel |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/1adbfa358844070be939be3474b6bf361933edbf |     
      x86_64 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/126ac978959badbc3fd9a03d51b16746ad0ced59 |     
         arc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/7ee05ade265c284f94b968cd3aa60f11e148c8a6 |     
         arc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/327e13ef29f2a1b2a068d09b241027f5b8e225b4 |     
     aarch64 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/8eaa8c4027bca26d5a21da83f67358a43627f1b2 |     
        bfin |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/0ada0e5537409da9fcc68bed36c9025d1f667af3 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/13b0eecd936a0204bd31618f128aa418bd491f41 |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/b6d7437e1cf8cf0b3726395401ac4ebd9af2833b |     
     powerpc |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/0bf84f61a72a65a75c5fd0a787680f483cfead26 |     
     powerpc |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/2569d7b5049d0bd1da8316d8ac5997d4e68c08ae |     
     powerpc |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/ff512f5532011a513b5551428152e600b04a007d |     
         sh4 |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/238d0e4bb205c0e7288903c6498e6c1787d86a1b | ORPH
        i586 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/0bc17ee333efa88ef46d910df506f6e54cdf0b5c |     
         arm |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/460b324b54165cf517d36724a94bf489a720be4b |     
      x86_64 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/19380989c5bed6a760b99b22661b58420647ea55 |     
      xtensa |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/18300a93e1b0d1fbc12049e00213a8dcbf0b3162 |     
         arc |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/d32b7c98323e2a25a378143795583716bd5b74a9 |     
         arc |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/6f171f068396677411d1fe5b46c14cdcbed3b643 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/e70ce7ead2ba796054d8839f02a01127d18ac70d |     
        i686 |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/0345814c0b0023e124992974c0600bdda0824dbf |     
         arm | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/36abb5b8f3aab57fb7b63056b216b4a58143ee3e |     
       sparc |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/8e5c33cc85b976b7efa12220af0492bddcab554c |     

-- 
http://autobuild.buildroot.net
