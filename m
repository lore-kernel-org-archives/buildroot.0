From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-17
Message-ID: <20150618063015.D9FB0100C2B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-17
===============================

        success : 179
       failures : 29 
       timeouts : 0  
          TOTAL : 208

Classification of failures by reason
====================================

make: *** [openvmtools-lega... | 4 
     openvmtools-stable-9.10.0 | 4 
               upmpdcli-0.11.0 | 3 
                libtirpc-0.3.1 | 2 
                   glog-v0.3.4 | 2 
  toolchain-external-undefined | 2 
           qt5multimedia-5.4.1 | 1 
             berkeleydb-5.3.28 | 1 
           aircrack-ng-1.2-rc1 | 1 
                   ntp-4.2.8p2 | 1 
                pulseaudio-5.0 | 1 
               sdl_sound-1.0.3 | 1 
               libupnpp-0.11.0 | 1 
                 iperf3-3.0.10 | 1 
      host-gdb-arc-2014.12-gdb | 1 
             libxmlrpc-1.25.30 | 1 
            gst-ffmpeg-0.10.13 | 1 
          enlightenment-0.17.6 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/39b80c8d9edf7ac08a0e9d56a2fab53d3cbfd7f0/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/930c915b30ec7b979b6bcf3c251d34bb907e6b05/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/30fa1a95da45e11393732a81dd3398076b9214e7/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c704c70ae2f066f85dd6a5fa6a73789bc358d368/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/75d17ceb764c2c1136047c089a0c554770ca98a4/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/5d65abee1c09dd55b6db88542757d72c0f8841e2/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/062758bbf97180392bd4e0d529fdde559eb31cab/
         arm |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/6ca32e46069034da98eb065fb4ea240ac5d35d28/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/0ba92fe46f8527978f062b1040074bdb221e48dd/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9338c190c01e48c3733fec792cf3f399e60181c7/
     powerpc |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/f07e5956a04d2bedb564b1d465e385f149e45d23/
     powerpc |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/c8aa363287fff9ae2d783fb2cd7145418ca21b6c/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/49cd8d931506357db08e8292532e759516d86ea0/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/20d67e8b28db417b78f950017db8d69daf83911c/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/bd032767c052fb858e1668b5c651f775aa8d5310/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/cfdd9e243377a6605a402f4852997398a91d7e60/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/bb05db518854cf09e06dae2f2259537aeae2a7a1/
      x86_64 |      openvmtools-stable-9.10.0 | NOK | http://autobuild.buildroot.net/results/600b646bf371960b5e7f1cabaffd3d5967292c17/
      x86_64 |      openvmtools-stable-9.10.0 | NOK | http://autobuild.buildroot.net/results/a1d9b37ca67b08b3c6023e506f591bd66b5b20bd/
        i686 |      openvmtools-stable-9.10.0 | NOK | http://autobuild.buildroot.net/results/4c2b73708a4ebf30a16a2c15d50f32f86fea6726/
      x86_64 |      openvmtools-stable-9.10.0 | NOK | http://autobuild.buildroot.net/results/d1d6037dbeea8818fab2a8324fec370ef7cb1df1/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/a2f84cacdf534bfe5755d06a5e9f82abb1ec3e60/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/a1512dfb1cebba3310d15b299ea14f3ad295438e/
         sh4 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/78793787643c3615aad2358f116994586f29a926/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a41fdb5a3c2f203a17a65232fdb7a8a01db707b1/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/df43866f8ca68ee9c2ab6eb9b1f660f24214e1f4/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/10335e915e77c688eb6616f8f74623079dd3bb8f/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/2d639d35144e1ba8f90b3f1cf35db0110cda2c45/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/bbcaf56cd1c1d66c3b6ccd2059ab164ddaa45823/


-- 
http://autobuild.buildroot.net
