From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-11
Message-ID: <20160412063023.99284102755@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-11
===============================

        success : 169
       failures : 63 
       timeouts : 2  
          TOTAL : 234

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 7 
                  connman-1.31 | 5 
                  boost-1.60.0 | 5 
                   mplayer-1.2 | 4 
                  ffmpeg-2.8.6 | 4 
               valgrind-3.11.0 | 3 
        host-gutenprint-5.2.11 | 3 
                 jack2-v1.9.10 | 3 
           lksctp-tools-1.0.16 | 2 
                    ustr-1.0.4 | 2 
             lirc-tools-0.9.3a | 2 
               cannelloni-v0.5 | 1 
                     mtr-v0.86 | 1 
             stress-ng-0.04.16 | 1 
      ca-certificates-20160104 | 1 
                 mesa3d-11.2.0 | 1 
                blktrace-1.1.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
                pinentry-0.9.4 | 1 
                   taskd-1.1.0 | 1 
                  stunnel-5.31 | 1 
       openpgm-release-5-2-122 | 1 
            host-python3-3.4.3 | 1 
               openswan-2.6.46 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                  thrift-0.9.2 | 1 
                   tinc-1.0.24 | 1 
             ntfs-3g-2016.2.22 | 1 
                sg3_utils-1.42 | 1 
                 rtptools-1.20 | 1 
                    yajl-2.1.0 | 1 
             ipsec-tools-0.8.2 | 1 
                   libndp-v1.5 | 1 
            webkitgtk24-2.4.10 | 1 
   webrtc-audio-processing-0.1 | 1 
               ipmitool-1.8.16 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/729950765127473fedd72fc42e3589293aa22134/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/76b62ac8eecf510597e70c436e6e17556fc32386/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8e5d811f2344035995006245f867d9de090db942/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9e7e578e8e8ddbf9fbf34e5dc94abfb2616eef3b/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/92ec390e526a825557f03a2e301d5eb417f651cf/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/75fb6709a99f6dcb7ffef87a6ab7eef200bcf1a0/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/0e708c5e8e2170852f0c537b5f01bab39ce0ca75/
        i686 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/5e9b44435522a26ad080b7810536686cc1e47c0f/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/d0b0158889b7bf52b9e67c4a2d3c62bc1c78bc7c/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/86c45eb6a118f0cbf8594c69161f21d923608558/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/86f6d2ad0f83c309bb5d94ceb1a7bf529a09d9d7/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/600ea30166bdb6ae197dd625b935c8f42b71065e/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d6929528d11f36875c5face300efec68ef31b395/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/08d7f97a8cfa4fbfecaefd3bd3c8130c01608b82/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/9836c309892cc3994a4f2af9bbc7e19df244e9ad/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/45f767e37650e5ecae8ce6df42d9f8cb65b50441/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/4f1aa7cd06446cf72e008216684668454a4db8a7/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6643d48bc1e906c4bf693e44426824aa452d8ae5/
microblazeel |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/8ce0c14d92f34245a87758db60c618916be48586/
     powerpc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/294dfc02ee95caaac4be9fd632c399bb2c7d3f83/
    mips64el |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/e98054d567323890cde2397ddac06a33fa4a2d38/
         arc |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/e0ec63e1988ba2e9b6dc15ed394af55ee8b57ed2/
      x86_64 |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/0d4f4981a7faae2420f1059966c8c79b422a45df/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2eb6e7c0ab37eca5f380481605dc1259cc355073/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/fc3eda1dea0d087f5cb37ef3d1d8d1c665c4bf53/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/57ec54c254be10939632915f51ef92b075d4ccf9/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/442a44c96e49a9159a9cb6aeb8cd7057b4169f3c/
         arc |                    libndp-v1.5 | NOK | http://autobuild.buildroot.net/results/dce9fbe010ada9bffb1b2f030c3769b6070a0ebe/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/88a117c229286ed739bd0ef832fa01a99825286a/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/3409a4af78c83ea354d861052521f634347cd69a/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/6709136176d08a90d203085c855b83b490962d4d/
         arc |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/1e59f273e0f31646065a1323a2e231c17babfe59/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/faf7b91298b3331fc18858e401334b139b79dcc4/
         arc |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/4d2786b1f936f0ef272ba02176a1ab1f3eb7d6c3/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69bf88fdb84bb856990c8c6451763e08cd57fbde/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7aaf0d5d7e84aea49b4cbf5d10d9408b4698afe4/
     sparc64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6a34dd2a36a0e2bb32b3c82c1d95afaca000006d/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f035f718b0a6e517647bfc6af69727d9d40e0818/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/5242433224c3e9e274d36f73cd1ff42006000633/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/06ea297edb6c563808a1cd9b56edeb394a2ee46e/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/1a0b2972646b65bae7a1627203f04497f54fcc16/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/8fa0ce3990180660ba4c7bd0d88e0022049ab203/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9c9b773ef61b18a709b0bdbdac3c7997d99ce4c4/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/1cfe3e019a627e7c092dbd94e4b891179e35bedd/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/22c69888badd37fd7977f44629adb9d991e44d70/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/5d03953f09eb3cf6770f7ad872d2da0793d2f340/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/b5d7902ac070c66bb39fa17579628f814d95c11d/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/f57bb1a1fea77c61056c839fdb9f80a1caa3b527/
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/49f9a7eb4c42a2c1c6d4d9f039d2498be8eaade5/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/cecd90d7db15f0620c942d59f2ee860ef49ef42c/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/791eeb3c6ef0398384dab226937f281eb0f4d71a/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/79487c297294c83b75eeb5d7ce6d0486450fc79c/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a932a5a1229c8fd1b3dac93c6b5c2992a556368c/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/cfea1e8efab5597fbbb1d91ff028493677c978d0/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c228f4959220cc291f1cd527f7353b1a5138d0cb/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/4de0124064183c6ae20bfcc866c5f9eb4e014b38/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/cecdf5d43978b51f4e6d2a9e99ffcf5438ea7377/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/6c5d8ed99f00caa4b8fee62ba77284cfcde77763/
        i686 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1980051c05110725bf2f207a279e1bf24faa3140/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0d664825f79e5061026f9393a9f52107d258aa06/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1f619f67b952a482d7ff8b597c5ca2eda296335d/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/51c6b4b6b77442831342f1f244f4eb5e11420432/
        i686 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/540e042f362c32e2f3ddabb6f929a76ae9a27bb3/
      x86_64 |    webrtc-audio-processing-0.1 | NOK | http://autobuild.buildroot.net/results/9d4e85028e18c18a3febed1552861f72ed739194/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/7f8f1d1b229801c79c699697169a7936b9d3c1e3/


-- 
http://autobuild.buildroot.net
