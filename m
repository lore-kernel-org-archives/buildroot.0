From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-15
Message-ID: <20150616063016.62F87100D90@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-15
===============================

        success : 192
       failures : 29 
       timeouts : 0  
          TOTAL : 221

Classification of failures by reason
====================================

                   glog-v0.3.4 | 5 
pulseview-198f9bc74d6c955a7... | 3 
                libtirpc-0.2.4 | 2 
                 clapack-3.2.1 | 2 
           aircrack-ng-1.2-rc1 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               libsigsegv-2.10 | 1 
                 mplayer-1.1.1 | 1 
         erlang-p1-tls-53f0478 | 1 
                   ntp-4.2.8p2 | 1 
               libupnpp-0.11.0 | 1 
                host-zic-2015e | 1 
                 qt5base-5.4.1 | 1 
                   bdwgc-7.4.2 | 1 
                 netperf-2.6.0 | 1 
               harfbuzz-0.9.40 | 1 
                    qemu-2.3.0 | 1 
                     gdb-7.8.2 | 1 
                    webp-0.4.3 | 1 
  toolchain-external-undefined | 1 
               upmpdcli-0.11.0 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/abc8dc3bead00abfa1e5a230c2d2b3ecaa911faa/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/21a118043689b3c8a47ddabc7ef4012cd9b0549b/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/05613179367bf647293d549b3212ca7ada390ed1/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/5ce9ae8865314951d2bb56eb5b06374198fa701b/
     powerpc |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/3eb98c73a5c5fc565f021f30db7442c3f3d48974/
         sh4 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/c8b31edc06586966148525123ff4b61172dd5c96/
     powerpc |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/94f251f3c18cd43f220754884fbf2d7b0fe7d16b/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/62cd8401cc45769c2ff55661c9801a1c18d8c7d1/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/e9d48c1dc17fe12c5ed9f83709cd383938287b02/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ef60f1cd282906d0b4b3b9cc90f15c1ad62c197f/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/bb4995ee1a9783b697fc5b5c70b22dc0a60df2cb/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/e1389243ef23bf3eab8562a16f3776fdf43c1a3f/
      xtensa |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/829ded7ddf37ac96012d2b8fcbf9484a73a0380f/
         sh4 |                 host-zic-2015e | NOK | http://autobuild.buildroot.net/results/918c173d8c4cb38b2c536fa7a97db7538ca2e374/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/028b496f2e509a570435ae57aaa2e0ccce20cdfc/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/63ba4c368f60b2129c75743ba557fd9e1363b7a8/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/23644de131066ff9474b169719cf22cb5075d9e9/
    mips64el |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/0edcbd52a692022b01813f340a1ee72df9949f75/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/82b3618d5e314d1235c3e13ad61f97cf32913a35/
     powerpc |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/c000ec9d47b21e2cdcd49305174d2ff0cedf52c4/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/4fa45688df16a834c22cef1088d797b4de86fe5f/
      x86_64 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/c49a4753dfcdf627df773d85eb51f179f093aeec/
      x86_64 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/5d8ef541337286b7a6d92d83b6988d9501d424f3/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/189ae28758f4e8ccd78844c179eae4fb3e70d540/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/d8590343379606e4980ac7e135bcd8535362d443/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/c1777e6742c6ad37972a6f63e02851d2189e76d2/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e8b8dec43930fb398615637148133850d26796d0/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/7333fd3f2359b843a416c578cdc63aac56c4b048/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/d363c0e2ad920357a76dd5900ce992a77ad399d2/


-- 
http://autobuild.buildroot.net
