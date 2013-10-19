From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-18
Message-ID: <20131019063007.933C152C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-18
===============================

        success : 111
       failures : 70 
       timeouts : 0  
          TOTAL : 181

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 8 
                    nano-2.3.2 | 4 
                 qt5base-5.0.2 | 3 
             alsa-utils-1.0.26 | 2 
                  zeromq-3.2.4 | 2 
                 binutils-2.21 | 2 
                 mplayer-1.1.1 | 2 
               alsa-lib-1.0.26 | 2 
                  libnl-3.2.21 | 2 
               libglib2-2.36.3 | 2 
                 libffi-3.0.13 | 2 
                 dropwatch-1.4 | 2 
               audiofile-0.3.6 | 2 
                  connman-1.12 | 2 
                directfb-1.6.3 | 2 
                  boost-1.54.0 | 2 
                libiscsi-1.6.0 | 1 
                 libevas-1.7.7 | 1 
                aiccu-20070115 | 1 
                     apr-1.4.8 | 1 
              buildroot-config | 1 
                 webkit-1.11.5 | 1 
               libcap-ng-0.7.3 | 1 
                     rpm-5.2.0 | 1 
                     gmp-5.1.3 | 1 
                  poco-1.4.6p1 | 1 
                      qt-4.8.5 | 1 
                    systemd-44 | 1 
                    php-5.3.27 | 1 
                   squid-3.3.9 | 1 
                 libnspr-4.9.6 | 1 
                  nettle-2.7.1 | 1 
/bin/sh /data/scratch/peko/... | 1 
               uclibc-0.9.33.2 | 1 
                  tstools-1_11 | 1 
                  cppcms-1.0.4 | 1 
                      icu-51.2 | 1 
                     lxc-0.9.0 | 1 
                 iftop-1.0pre2 | 1 
            mtdev2tuio-e1e7378 | 1 
                 binutils-2.22 | 1 
                 libvpx-v1.2.0 | 1 
                 cairo-1.12.10 | 1 
                 zmqpp-31220ca | 1 
     xlib_libpthread-stubs-0.3 | 1 

Detail of failures
===================

   powerpc | /bin/sh /data/scratch/peko/... | NOK | http://autobuild.buildroot.net/results/5b1e5f2882b887bdc655f87f69ae84bfd2b04f05/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d2d5e07bdcfa5e25c225e93a20d34e95b3fe442b/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1a7f0a8736751423532758ade8a1095761ac2ff3/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/01ad4309acf0fef34b8e112f5cd5b3a9b2863c32/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/433e677acc0d6923e05f770b4db456653e0242ca/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/7aa30513b05fe40f6d1819556d5f5bff7503895f/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/1a0e29cecd95bc724c341fe7d3f30e2fd164fb27/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6f50a0941a074b4ac7ab13c95ab3f13c83ea7a19/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/1b7cc05eacf04dec060a30c29a9983a678cbe746/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/1db7ac363a5594802aade616288c089e38d1a538/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/0e100991e633916c6fef6639c07fae3ea3f1842c/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/63a8f4d34ef97a7ac1ec0fce4d6425827f4de5fd/
   aarch64 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/deeb22cee9af6912d054b258c6bdf1e9b2155780/
    xtensa |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/ea9ef7e8f106bf5fe171b74539ec302f139b6c10/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/937ebc1bc44d9d6d9b66639b285f6a87e675c1fd/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7b89c0fba93565cdca42830aab08a7309f5dce00/
    x86_64 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/4f3d4fc7ffbc59479ffe88e7c94b1bca3b1c2655/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/735b228869d7eebc8b1cae04de618399055a6950/
      sh4a |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/fb807719da4bbde9885a336a34a752fefa7a8caa/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/42bb31a0fd4c9edce794ff81568f4989d24ae5fa/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fb4f927c95d646ff97eee21396e2041596d000cc/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/2310c6dbb3b262e460307e43b291ecf5182ea992/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e1ecca2b6a4439a83ac0c64238bf9437aef8559c/
       arm |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/470040d85204c530ac8b12db1de2ce227824361c/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/87263861feba4abc795469c59708baca42999ec7/
    x86_64 |                  iftop-1.0pre2 | NOK | http://autobuild.buildroot.net/results/97a77d2f70597cf47e2b7a5605bb6f097ab3a1d3/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/05f73cb74ee7bfb1c337100312726de034366a7d/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ad2b53ee583f71a47519da33097e5a7058cf4776/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/488e1c11691eb9d53b3375e1e501a7f51a4c5d78/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6086737ee839c774618bd93175b4f4c84f1f1274/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ecc47c45c34a3e57c247b9bc3a8bf248767b9c3e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/98fac58256fcdfdffae53b4b3e32c65290325e27/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/4b3739c87c3806169231cd93ea6ff6d1723d49a3/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/82d340fc443f1dfc612627d4ad905341e08fc5a2/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/e44e3d6e925ff0dac1a9ba7b4c180c6b2d1edce5/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4b404b1227b8ab2ccc7a46d29333be98f55234da/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/ad5fee82d92c9a6a0c50fbe9a191308473df4530/
      bfin |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/60289dae59650847e6d32c7ab3be7973a86a25c7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/2fe291161174ef9a23de29bdbf7674f4545f2a1e/
    x86_64 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/fd785f5d1d771bb033255b54533fc97ca8014658/
   powerpc |             mtdev2tuio-e1e7378 | NOK | http://autobuild.buildroot.net/results/0856a595e03560fbaecfb6e0d49e09f9d0849b52/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/5e83d21732f19776cc1416356ea59692a02117ed/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/a67cc9f50acb1026fed459d973beb1b9e63afe2c/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/690a497447a31f0c8410ecdac8dcdeef9ddc64d5/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/56e11944838a138cbefc2de0871604f36c15ca24/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a88175239eca92abf646d137ffc6449182ce894c/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/9f110f0aabf773915a6597c7c57744aca03bc5a5/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/47196ddbcc39672ed7e8aa77d1719818e14e196f/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/def5f9292084309f102538bcf8cb9ef20ef297a0/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/75a758cf4901e7525081cb7a0978b4908b406ad8/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c1194ef761dba5c2b0c9f77bc530143fbce1ff3f/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/257e4ecf6cf4ad879677372be1098408745df869/
      mips |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/60e08998080e34d3593f571e7604124869a8eda8/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/a34fadb11e22cb67f3ba2bf47e79dff47e8e0d3e/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/0ac7939164fae857369089b7647053c641b6ae2f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/257ba4ca3ae0564d5560819d53aa874ca40e3b45/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6b5de9ec9a8e69f94b915108fb59e88bb1e04cda/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d5dc75ce5ccafbed612bc5dc360e3f3f1b91df15/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fde033891fab7a537a20f06f53654e9351e11883/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/577dcd1a233ca85e51fae5b8edf52c3b06e903ed/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/089171ec9cb5e010d42113b174866ffac822ecfe/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a62fdaa6592f632cd1ad525c97eef7186b3452b2/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c874bd000fd785d127d6d123237847bd05b10cb1/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/89c1f95cb3a515f2b874ef25b89984724b667795/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/edb72825f025219a63425bd9e6ada934d0073f63/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7d633b02604a3d19744677076a43d1430acaad76/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/e762f6f623ef5c7136d809675d81d160fe4d71c7/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c071add690d33a8dd1c4cfdc345bb28d4c89cc8e/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e9126faa3af0a35184b1161dbcf12e2e8e69f94a/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/3f2f04669fbe9d019b82134120507835a2a12964/


-- 
http://autobuild.buildroot.net
