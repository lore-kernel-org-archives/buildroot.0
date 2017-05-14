From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 08:30:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-13
Message-ID: <20170514063046.C79A9220A8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-13
================================

      successes : 250
       failures : 17 
       timeouts : 1  
          TOTAL : 268

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 2 
                protobuf-3.2.0 | 2 
      binutils-arc-2017.03-rc1 | 1 
             bluez_utils-4.101 | 1 
                cifs-utils-6.6 | 1 
                    ffmpeg-3.3 | 1 
                 libv4l-1.12.2 | 1 
make[2]: *** wait: No child... | 1 
                  ntp-4.2.8p10 | 1 
openblas-f04af36ad0e85b64f1... | 1 
               opencv-2.4.13.2 | 1 
                 opencv3-3.2.0 | 1 
                     php-7.1.4 | 1 
             rabbitmq-c-v0.8.0 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
               upmpdcli-1.2.12 | 1 


Detail of failures
===================

         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/5962afffac3a2041d089811cf5a73c3b4a671c60 | ORPH
        i586 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/06c930d9c5299b79500d018ac3fb2861ce834c7c |     
      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/91f7c6954c337b03f5ac141050d9b1bee1623376 |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/b3eaaf6d73cd49f5919143aeaa5cbb4d15a7ccc3 |     
        sh4a |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/5dff0ec19205e02f6ee373d34cb79f39ac25b609 | ORPH
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/595bf9f2084c254f05fd544022a0a29e1a12c8be |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9f5a497c6242860fb67a5aa2996c3509f49a4564 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b43978f11c62239a2b8089a4ff60a19af53634d9 |     
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/866b1d28595efd8b6becf83d0a64b596538d58b0 | ORPH
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/805087e87b8bb7d11adb49d9eca3959a37aca3a2 |     
        i686 |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/4e7e3641c20b85465678d4a6d5a97ef53e793330 |     
         arm |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/4bae12b9a4e9744f561a79cb243e01bf3e6ea212 |     
         arm |                      php-7.1.4 | NOK | http://autobuild.buildroot.net/results/234985fcaf6012d4ac7fbc2b2a7a4375cb7cd552 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cc5946f24438b90151b440b65ae178c452e7c876 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b8a40663222f8930aad247657674c06156024c65 | ORPH
        or1k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fd45d560ef4a682991bcaf984308f19c9d618d1e |     
       nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/11d8a1d71e9fd76e745680dbd442f22121217bb6 |     
     sparc64 |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/c2f6f477dc510484ea126742508ff8e526f43b40 |     

-- 
http://autobuild.buildroot.net
