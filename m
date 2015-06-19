From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-18
Message-ID: <20150619063016.B32C5100CB2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-18
===============================

        success : 190
       failures : 40 
       timeouts : 0  
          TOTAL : 230

Classification of failures by reason
====================================

                 setools-3.3.8 | 12
make: *** [openvmtools-lega... | 4 
pulseview-198f9bc74d6c955a7... | 3 
          enlightenment-0.17.6 | 2 
                libtirpc-0.3.1 | 2 
                pulseaudio-5.0 | 2 
                   glog-v0.3.4 | 2 
               upmpdcli-0.11.0 | 2 
                    webp-0.4.3 | 1 
                 qt5base-5.4.1 | 1 
                      atf-0.21 | 1 
            gst-ffmpeg-0.10.13 | 1 
               libsigsegv-2.10 | 1 
             libxmlrpc-1.25.30 | 1 
                 empty-0.6.19b | 1 
                keyutils-1.5.9 | 1 
                 netsnmp-5.7.3 | 1 
                  libsoc-0.6.4 | 1 
           aircrack-ng-1.2-rc1 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/b7ab2775ff1ae4cfb5791badd8474460748ef511/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/09528ce4c966e8970baefb177d6fa4a542d6ab14/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/c55fedab734aa6e8f01d0fe3bc1dfbecd1f396cc/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/fff947f9e791d324b8c2b086ccbb210e48dcab1c/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/b1544b6c6cf7594388e73137035f9f1f3a23e3a8/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/db589c7b409d96ce3fad41b58a91f38f1e9ec133/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ac821c103f5fd3c51d80a26c56f8d4406d57c691/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6b1df0091a0e1355a83b63817cbd7ce0e8cf8fe3/
         arm |                 keyutils-1.5.9 | NOK | http://autobuild.buildroot.net/results/f83a67202d707b5d162f1500e1f9a5b037761fc3/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/24e3dafca8d7c78f0ccce2c77d23992436e255e1/
      x86_64 |                   libsoc-0.6.4 | NOK | http://autobuild.buildroot.net/results/9aaf71a68cd2c541d84013b42c26fe2bbad2bc05/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/12c908c81527f816c14b16839b534c6246c9a7f8/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/8e6ccbaf7e34bff23a98a20e91b128454ed38e34/
      xtensa |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/af4473de1a1663287370e0b3ed7684de6736cc22/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/750790da96012fe14f962f3619d277d0022a6c36/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/de2164cc144151f509b15d15ef1cbed9f512f239/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/284ba984accbab07ba569e49ad1755729d09e888/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/e1a5ccbd912f157b644a21a33a599682a482ecf8/
         arc |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/2b7d72167339e53a8e48f2d0b2950b2d8ae011f3/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/dc5038da1adc30319488bf1e44b6b79ce233775b/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5573f90e6d2711b76cd903ed02c25af4510a1ac9/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/368792ad78b4d7764f8d8441a7c79bfc3b05f994/
         sh4 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/64f2611399fb7b01d0d91eeacb9fb49ed01d1597/
      x86_64 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/f3cd516866133c40ed9dda647135944f3e4c00b9/
    mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/c12be2d820b064fd945baff07a77c5741565a4d9/
    mips64el |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c68f2dcde8199197add084b5e80671956158c324/
         arc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/dd9c36cd6c50fc7977024d23bf58605ee5920fdd/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5523066ebe4869c61e9ae6dd9ac6b563df6ddd73/
     aarch64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/de42cc576e3c4adfd4f1a2d595e42a802ea0f7d3/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/71115cbafd89c9a16454ff132bfc5773dc6a173c/
         arc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c3b86c37653421537434835f81b48f9892f09fab/
    mips64el |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/1fcbb1dfd0e393767f70f627ab613a42c76e24a1/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/9fb68b88fce38de27d08737f48b0e5764ae416a4/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6521ac3e10247bf9bae6317c86f9a129289afceb/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3ebc7f49ac983a4c7b563335a15ad5e2b2f69b3b/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/589c47eed538fd91f3a95eea9b8b4f6e98529675/
        mips |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c3c8d241bf6b962b314c9256174b584e90d262aa/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f2a70a74878cfd7f6113397594afac2b6c51b774/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/67855cd300e65ca9d6ced283c86c868dec5fcdcf/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/cafcc34d6f42c872dc7d5316970e929f23f3f046/


-- 
http://autobuild.buildroot.net
