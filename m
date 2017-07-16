From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 08:34:02 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-15
Message-ID: <20170716063402.6FE6320DF3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-15
================================

      successes : 87 
       failures : 24 
       timeouts : 2  
          TOTAL : 113

Classification of failures by reason
====================================

                     gpsd-3.16 | 4 
          mediastreamer-2.14.0 | 3 
     python-cryptography-1.7.2 | 3 
                  cppcms-1.0.5 | 2 
                  lshw-B.02.18 | 2 
make[1]: *** wait: No child... | 2 
      python-coherence-0.6.6.2 | 2 
    azure-iot-sdk-c-2017-06-30 | 1 
                busybox-1.26.2 | 1 
                    git-2.13.0 | 1 
               gnuradio-3.7.11 | 1 
make: *** wait: No child pr... | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.8.0 | 1 
                 sngrep-v1.4.3 | 1 


Detail of failures
===================

         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/3f96a5086ae414be2f4272b130e660f63b03cd39 |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/a81ad71ad0895cea149e1b54f2d20398ff6a6726 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7339b74c4bc88e38cdcb76362637eb52bf84a15e | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/06425e2ed5a66bae3dd18b2b7b9cf005fd5ebc7a | ORPH
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/18feb0b07e40ff1d4e858c8fe0037f6cdbc303c9 | ORPH
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/83ae026f8c801156d5efff9271d384aa1a5105f8 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/8ce610369bf82501ddee170db2a94748442b9b6f |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/dee953ba67ea4779600bb8aa83cc44efb73bdc3c |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/9fcec3bc85c885963bfb3fcec201e24f4c255ac1 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/d39ac7e71b38e6c3af21d5c3ee462cee7a974ded |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/39d8a8ea1c081f2bd8f9654d967524dc2fd4f44f |     
 powerpc64le |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/9b25202e95e6a3a088b3b09ab227b20f652196e2 |     
      xtensa | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/5a2a1b00a05b578c7ae519f03cac78091fe8ada3 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/36d5a4838197bfffcbc8dea84e6cfa5f3a87949d |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7e2bd71b2776f9b8d13812b456ffd3181cd86535 |     
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/fdfbb5437f09a73d5faffc7af253bf6111b25cfd | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/bad82dcb4cc48e0ea341ce982c9f10414e655607 | ORPH
        i586 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/c581f6e4f0ccffd48493d03bf16e598b56938dc6 | ORPH
     powerpc |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/d27f8d160ca8ccb6d1020392130a3c5f7923dfd2 |     
     aarch64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/95cd80af2b217489ac5bec8efa07a45f3c914e5e |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4a60bee83d2efbc4d72d551bda01caee7d87e068 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ec38b247dd0291618c6d1258c5182bf6624b03fd |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1caf5ffa5142a46e66feb088110ee094f3ace688 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/927c61cf436c640bb0f0904754ac7e2467710e13 | ORPH
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/4bb068733a9d1c9a9146a925cb6083f439a63574 |     
     sparc64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/c2e5ba8a854d1b72e5dda974b407004b027f9a17 |     

-- 
http://autobuild.buildroot.net
