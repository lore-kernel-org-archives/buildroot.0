From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-17
Message-ID: <20140118073008.C59881015D6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-17
===============================

        success : 75 
       failures : 48 
       timeouts : 0  
          TOTAL : 123

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 13
            luasocket-3.0rc1-1 | 9 
            live555-2014.01.11 | 2 
            libvncserver-0.9.9 | 2 
                 cairo-1.12.10 | 2 
              wireshark-1.10.5 | 2 
                 webkit-1.11.5 | 1 
                 libssh2-1.4.3 | 1 
           imagemagick-6.8.8-2 | 1 
              e2fsprogs-1.42.9 | 1 
                  zeromq-3.2.4 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
  toolchain-external-undefined | 1 
                minidlna-1.1.1 | 1 
                  msmtp-1.4.31 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                sdl_ttf-2.0.11 | 1 
             alsa-utils-1.0.26 | 1 
                  thrift-0.9.1 | 1 
                    mpd-0.18.7 | 1 
                  libv4l-0.8.9 | 1 
                  dhcpcd-6.1.0 | 1 
      libnetfilter_queue-1.0.2 | 1 
               audiofile-0.3.6 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/95c8862cb0c4b8bc512d518ef5f0216f7a14b792/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/c54bdf88eff6d60c7001cb0e2cb6792cc75178db/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0f0953e76967c147d51c0a4db6126f726a8ceccd/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f4628a323ecda1e62c11eadf381d06416ac6d87a/
      bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/70722a50d51c775111d9f87001e440023d7e662c/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/c138f7570c06426214a4b222fff58bc8c0f01e6f/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/65ba213abae9bb918ebcc53b39aba0c0c8d319e3/
   powerpc |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/c0889be10bc6cf49365899da0f2b356d87ad3a07/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/792fcecab0c7a6adadad0c38be3847de8b420f88/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5a6c46c397ed13f668bfc8af960441b3e34d1df7/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/33a119b149ede7ee553ba1125aaa2cf7b95f2047/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3c61360810ab6a44bc054dc682216553351920a6/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/7d802038473fdc9a214069346023f448db343f08/
      i686 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/80517751f9cc14f8fb7122fe7030bcb9fc5481f8/
    x86_64 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/3e6d6c9c1aabe860688ca357e209a91623fd687c/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/3a6b969290400e5ba8fdffd1d6633c7ed737cf9f/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/aa98b5e8e29c5ea883abee5e1312aec35dffb55b/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/42b0c6e5b5dde55f1939ec41f6e617447933251f/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/f5df9dec5940c9d34997abaac50476cd327a4b86/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/88f5506f0dcab38a43653c506ba62b38fea100ff/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/15c3b39959b7ac3dcfaed99ba02e3b91065fb88e/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/85cff5ccd4a07a318777eba1ceb8f2ca1ca1c77e/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/ed08d24dd878fd80f2e842366cdc44a5270cee2a/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/0208c82d7c8d697f68637885e92e608bd987e8c4/
     nios2 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/c663a518f65e786895d9ad8866193f70cbd6e96d/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/626e639678952524a24d988d472895357df6af17/
      sh4a |                   msmtp-1.4.31 | NOK | http://autobuild.buildroot.net/results/5526e40ea9a0b50ebd9feba1642708225182df50/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/342cb532ae4a31322ede3d228cbed66554e4a16a/
    mipsel |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c24d1a24eb5ed5aa617219b40505814d2349d999/
      sh4a |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/5bb04590cae135599d85f23f9abf6cf707382cd5/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/9f61e6a53afa0aad5aedcbe13b87ca2899700da8/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/adaa4a7bf330246d6f960b6aa750ffe6e1e5a665/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c7eedc3c78206b12319f0a04619e736ab5ed60c5/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/3d546023edfc86883c2ee79d59b980261645c632/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4095f41ee7f3239a9513648823b16de8b4667401/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/eeeb4a0c703b77faa42b1c000d1a64441158b4ed/
   aarch64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/a57e9c12eced033c84d3d022214f6b70050db562/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/799f9a990ebc39f0eb8a03ce3f756ff559bd006a/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4de07b421316f53a256081fa453922cdeec67a93/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/024fe8d34833a2e9f45fbf6f53b2cfa111535ef6/
      sh4a |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2d65e6a6b6218cff3a00fe1f2ee39f32ce03cef0/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/36b0d601ae2447833f2868366d23f7ce24a48022/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/11a4c1373b2da7fc3baf95b6ca0960bfc6a80f9b/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/255dca716c476f135afe0c21774edd2e6a9b459a/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/39b9eb7944ec720bfa4c2edb70a13ac53d11b872/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/5d0ab78e2451627acc043cddf94847e436d4dad1/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/dc1d7e40da0e070b5869e11f43ad91644f76f7b3/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1d3aa383343f77993ab5de449d5684cf5ccb79ac/


-- 
http://autobuild.buildroot.net
