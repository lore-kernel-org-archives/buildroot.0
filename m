From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-28
Message-ID: <20131229073008.BA8E5101B76@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-28
===============================

        success : 100
       failures : 41 
       timeouts : 1  
          TOTAL : 142

Classification of failures by reason
====================================

                  libevdev-0.5 | 4 
                grantlee-0.2.0 | 4 
   host-gcc-intermediate-4.7.3 | 3 
                aiccu-20070115 | 3 
                    ola-0.8.32 | 3 
avrdude-eabe067c4527bc2eedc... | 2 
                elfutils-0.155 | 2 
gpsd-a496a59c81173881900d97... | 2 
              cryptsetup-1.6.3 | 2 
                 libevas-1.7.7 | 1 
                   qjson-0.8.1 | 1 
         matchbox-keyboard-0.1 | 1 
                  bonnie-1.03e | 1 
           imagemagick-6.8.8-0 | 1 
               xenomai-2.6.2.1 | 1 
           heirloom-mailx-12.5 | 1 
         dvb-apps-be76da69f250 | 1 
                      qt-4.8.5 | 1 
                libroxml-2.2.3 | 1 
                 libnspr-4.9.6 | 1 
                  bustle-0.4.3 | 1 
                       unknown | 1 
                  libpng-1.6.8 | 1 
               alsa-lib-1.0.26 | 1 
                      icu-51.2 | 1 
             alsa-utils-1.0.26 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/2f1e741f39db7911d9b45bf007000262178cf7eb/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d2abb6a6b5836d33c2c47e118e92d5de3f8010a4/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/6694d748b9e380e5cb4880be6c24e51c46ae56bd/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f8fba7fb5b324f0343732b11fcb650346ccc4811/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/7854b65d9d043560e08e1377f3d5081dc6b254f4/
    x86_64 | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/495ef80c6df3398acb3c2dd3f7dead9e33f3a0e6/
      i686 | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/9b249f9911cce54ecfb1f3ff58b4dbe94bc7e0d4/
   powerpc |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/925293f065bb4578d0c53ea3c5a572236dec0d64/
    mipsel |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/d0bde0f19c757cd97cb0435bc0f385704c284006/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/d0dbddba3b6dc5b25e9440b7f7d6ff713b4d6d79/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/02f93df9caafe9e0825475bd842af1d15de3c0bb/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/b41ed62d4641501014276dfb38bbc26d99ac00a8/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/c76967703135b9e2bbfe4769af0d45659c04b8a3/
     avr32 | gpsd-a496a59c81173881900d97... | NOK | http://autobuild.buildroot.net/results/1d8d1e1c117075487b8fbe20d0e43f73e9b9e9f1/
microblaze | gpsd-a496a59c81173881900d97... | NOK | http://autobuild.buildroot.net/results/ed87406252421d5b78f4faef78cbd59b6b5a7187/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/592520c4f8e5927dbb6f7a195bc9b7e644c297e1/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/5bcf369f0abb08aba16c7d864c9a92ee5bc00e11/
    x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/ccea935052488e6bf292cb7566e8987d168cb59c/
    x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/499360b9ff41720097973f8c992c28205a0ff0c6/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e606b08fffd2f21b62d08d5c53350f23352d0f4e/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/d8df5feb4d39184e315cfda5603671d8e85c0254/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/6fcd3ef2bb8a17e5819c83b61723f31a9bae699e/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/285f419f115df87de9b17a9662acf1d6863ae083/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c6c466ee336b042eec5a407e57efe8dc2acc11af/
   powerpc |            imagemagick-6.8.8-0 | NOK | http://autobuild.buildroot.net/results/c790e804c83f5e7e8e8a2d7913914b6e84e98e42/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/d30bce0af0a2bf781563b3200b6b650c8bcd0418/
       sh4 |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/755e9542d6317168f66b622fb3ffcf0167a0cefa/
       arm |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/b5393a636513d967fcf9d4093a4a310d0d8eaf7a/
  mips64el |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/acdede0af5a429f9c42fd7f793f8ca6cd3bb1f22/
       arm |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/e55f4f4c1ab56a64c1ddd5c52cdfa659d04acd9a/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/f9e2bed5be3d105c745ca3de81047dfde61da321/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/8ac2b806e65c4d0bb32a961a8e71b215a0c720bf/
      bfin |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/31bb67e7c1bd7498952e5f8b37c15154a12ac79d/
    x86_64 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/42a4df4eab700d57928e0997f9e2abb17f40414b/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/46d010b775a69e8cc523fb591538a45c3e766739/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/d3fac9d96e531a7855691c834b746174c41322be/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/9ebf52f93ddac6a2b2b1224c2f7b7ce209c785f1/
       arm |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/ce154d49f5008ed88428c6b01259ae9596e419be/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/52e9892c396c1c6139a8f53ed787d26920114e2b/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/826d9ebcf80f5d8e41dd20bf0151f79a15a92826/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/372a5899a9aaf01b8c47f18c6bb184a38ff5198a/


-- 
http://autobuild.buildroot.net
