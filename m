From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-15
Message-ID: <20160416063023.B075B101922@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-15
===============================

        success : 122
       failures : 54 
       timeouts : 0  
          TOTAL : 176

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 9 
                  ffmpeg-2.8.6 | 3 
glmark2-499aa81a68fb4c8aac1... | 3 
hidapi-d17db57b9d4354752e0a... | 2 
                    cups-2.1.2 | 2 
                      qt-4.8.7 | 2 
                  connman-1.31 | 2 
                sg3_utils-1.42 | 2 
                    mosh-1.2.5 | 2 
                 rtptools-1.20 | 1 
              gnuradio-3.7.9.1 | 1 
                wayland-1.10.0 | 1 
               linknx-0.0.1.32 | 1 
                 jack2-v1.9.10 | 1 
        ltp-testsuite-20160126 | 1 
               opencv-2.4.12.3 | 1 
          shared-mime-info-1.6 | 1 
                 rsyslog-8.9.0 | 1 
                    ruby-2.3.0 | 1 
                  boost-1.60.0 | 1 
                   erlang-18.3 | 1 
               valgrind-3.11.0 | 1 
              memcached-1.4.25 | 1 
                     tftpd-5.2 | 1 
             netbsd-queue-1.70 | 1 
               ipmitool-1.8.16 | 1 
                 mesa3d-11.2.0 | 1 
                  ltris-1.0.19 | 1 
                  psmisc-22.21 | 1 
                  stunnel-5.31 | 1 
                 raptor-2.0.15 | 1 
                 lvm2-2.02.150 | 1 
               wireshark-2.0.2 | 1 
        host-gutenprint-5.2.11 | 1 
            gst-ffmpeg-0.10.13 | 1 
        lttng-babeltrace-1.2.4 | 1 

Detail of failures
===================

microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7c51a6f57bda3be2ffe97fc471bd0a2fb09cbe71/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/91a6fced3366ece9360800b6f05091218de1a556/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/75b9bd7bf469f34dbc0989a3f25ef0a5761c8a2c/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bd27992c00c5a368fb1bcb518c6563124355222d/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d4a83f3cb68a42db670a1b06346d56848a8adb99/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/6d0350a57ca008331a4c5bae5bf416556cc5a47a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/32ab32469dd06e15a706602679dadd1bebc61911/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f2d23279c3cc0f7dbe9e62706b6bb6fbcae8cbdc/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/9c321cc833e9a9e9070d4156bd6da8312ade8e15/
        sh4a | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/c31ae7ad070f2b72ba6ddf37065ed643e4840570/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1743ee5a340e5f4b1f8519e0b11eb196caa4f30e/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/896eff2edbbebacc8bdd7977af07ef1b531b2d09/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b171067a31ae75a292caeb25c99751ede5636e9d/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/99118d5cec59a4f7bb770d516b2e59f0b34ae745/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/15afeac1e39e64c2325fa6c4c7d8ca2e78e1ea56/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6310dace38ad6acd0771bae8be2e593c5fd8f29c/
      xtensa |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/9c5555d6c34b8e61586828c470756a28e0267110/
     powerpc |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/9e99aa8aebf68667b8c054b64e49de6dd73dd53d/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/35404c159fce57d6b461f021a7a986cd461f5ebd/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f90d6d77bb551c9c3435302b4554c5b788cb03c7/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/ad24af95893cedb7e469817d9e6716eada2064ef/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/c88f2da2ffe30e47a4fb266901247572384c36d0/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/8917fee449f83592c66a6f9e84139f379b356b84/
      x86_64 |                  lvm2-2.02.150 | NOK | http://autobuild.buildroot.net/results/e348b59952b79c4d4109c3ca532be2f1e36fef9d/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/ee9bdcad1c2d392558812c5ec185e92c20ed5340/
        mips |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/7edf10b9e48c22e54927933a9cd4491ac45c58ea/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/2275de0c15f5336cad7e51f21e54400cbe8ba2e4/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/0d61e1bce738e58d4bc92eb1f5e4a4245a70f7b1/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/e722fce88d037902290367e85ba7a9309be9a775/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/fde1b5ae0f27f176c79b87c9005c6c3b49b6a8b2/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/118dbb06ad667de3915045a1412c80f08df8e8ba/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b3028e2167ddf6d0c6f39681f1c228f354752ea9/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/faa316ff140285e0135bb3b74f98b0952ebeff2a/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/25ffffb86d68f2b0d3e0142de744c8e8d258003b/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/a52a9e310e4cb7b44c64854a1b1c72c88bb29130/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/bea0a90b9a873651f03f4a2e1a6157a44501cefc/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/ebabd4315b685d7ed8c60f3f88acc372a6f01397/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/4c7e06f7705ad189c7b9aded0bd34903e23d1528/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/bceb9e41fc78dae4df21e20bdae6211e686ef949/
microblazeel |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/f93b988335320669e184e0ddc9c1a1feb072d539/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/28a14fe1b24be20694649483d95bd50ff9c41ff7/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/a0f2d176631abfbb582bfeb6050e6c3e0e1426cd/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/4ccfa053f077778065e23d39ef1b58650d7d95e5/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a875b683acca416a7f7fcb14eaf361c07f324b2d/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c115001399fcc3788a297ac03d6602131bed5e82/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c33effa7d2002b6e2ec01fce24701d75a7242f54/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9a156e1513752a4c1007c53a10938e986ce766aa/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/944ea0d1604f1d4f81e4f2fb67c43dbf5ae5e29f/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f3d907b526b4ab0faa4ce473d11c99ed7314c44d/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/7dd87c20948dd8fbd03f4e015545c281b73cd7b5/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a201bcec01eb7be7a2e74720cae1aa17487feafe/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/275f45a0a83b2dc4bad924f3ddc36db5dcfed7b0/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/792a6e050f3429d31835afbb34132ce6e384f30a/
     powerpc |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/8d26809b0773c2629cda44ba088c4bd5391d06fa/


-- 
http://autobuild.buildroot.net
