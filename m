From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-20
Message-ID: <20160421063024.040CF101E8F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-20
===============================

        success : 131
       failures : 47 
       timeouts : 2  
          TOTAL : 180

Classification of failures by reason
====================================

                    yajl-2.1.0 | 9 
              freeswitch-1.6.7 | 3 
                      qt-4.8.7 | 3 
                    php-5.6.20 | 2 
           host-cryptopp-5.6.3 | 2 
               valgrind-3.11.0 | 2 
                    mosh-1.2.5 | 2 
                  ffmpeg-2.8.6 | 2 
                    cups-2.1.2 | 1 
                 weston-1.10.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                wayland-1.10.0 | 1 
                  connman-1.32 | 1 
                    ruby-2.3.0 | 1 
                 raptor-2.0.15 | 1 
make[1]: *** wait: No child... | 1 
            webkitgtk24-2.4.10 | 1 
                 jack2-v1.9.10 | 1 
                oprofile-1.1.0 | 1 
             stress-ng-0.04.16 | 1 
                blktrace-1.1.0 | 1 
gmrender-resurrect-aa3d02cf... | 1 
code/CMakeFiles/assimp.dir/... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   nginx-1.8.1 | 1 
                 rsyslog-8.9.0 | 1 
                  cairo-1.14.6 | 1 
                moarvm-2016.01 | 1 
        ltp-testsuite-20160126 | 1 
               ipmitool-1.8.16 | 1 
                collectd-5.5.1 | 1 
                   assimp-v3.2 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/436f092d4e4b4739a686ddb4d1e7b9438706e108/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b131ec2b465e1682457778bf0d0c19734ce17cc1/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/2626be52b6677ee56f3803e6a38d9f89cfb9d436/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/fb61607e355b1041d667304c01a13005ca8d5b85/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/41b3eb2ea5f45be31069a389cfe0f9c1a1ac237f/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/d7b575eb0ffdaf4d6c658ac96f94c7e36cb38df0/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bfdea24e7f8c1191c95520b23f1ac04c545941e0/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/4510f24d84b5dc0af98808bb23f91d3a3ff7f79f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/db442b69559ad45e6ded0cd34210c47440e50c2a/
    mips64el |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/b4dcc8ee95fafa13061f94d3824035b243caa3ad/
     powerpc |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/8153d5b85a361bfbac9599cbae6790202469c3ce/
         arm |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/ec977df5f98f6df1dcffb3a95a78831cbd6f6871/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/5bdfd471e9248140be51fa32cb21c3d017ba47d1/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/37d6914c4741b9ef3e953e623f2e7e518f81398f/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/d28de06a6fb2484a72c749038e78fc7441ba6710/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/36fb1ec1fe20c50494619a88271781e174b4cb98/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c99f013a0a2d326df4b2fc48b226b72debf61584/
    mips64el |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/f3fa170e9226a829ce3cd78b86179c7d29fc96f9/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a29e50ddecef948a5ddc901a62b21d925158ca62/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/09afb84c7e1dffaae1e48d0f9382af9372ebc970/
        i686 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/897e4b1bcc6796a0bc14effcc1e791b38a211019/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/6d87c94b166041358f0d79eba388b1d101e47b4f/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/540f40b0221534defdcb100898227495c382ba84/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/84a4b617f018de1563a00d31358d840521dbeff7/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/7e3a894c27d11ccaad480d11fbdb88c0de922d5d/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/bfb0891dbf143828f3e7377bf2aab70d9f2b0826/
         arc |                     php-5.6.20 | NOK | http://autobuild.buildroot.net/results/6a55a884bccb7e6a1bc8d1d32103296eba889963/
        bfin |                     php-5.6.20 | NOK | http://autobuild.buildroot.net/results/581c6364025b13ace632ee5e55b370a0a207b637/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3b61c4de3cc5ad19d9bedad9cd4d0e2719d1fec9/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fd0e24ff2f519d13e933505fb03d7846d1b35ca5/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/25432d5f85eb096a133e16f1f6e9332eedd3081e/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/a741bbf2a0b601ce814b7bc8946394ac62844c8d/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/396a848a2bb5be5d9d53c67850d531643dfc6ef5/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d1f8d92208c4789fd70911c1ac87b556811b8f25/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/0052e25f0bcbd634572089e6e9d37ea669c10bcc/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c6d8abf1b1fe678dfe501bbd5d885d3408f7e9c5/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/8bdf1101b39023668940c7d324b8d45719dd7b9c/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/82293712477a69830c69ab4564ecf996318115c7/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/abf63280491df073e8d8fb7e805344ae966b209e/
        i686 |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/52d91fb2ea23d630c10a12703cf10e880dfa36c2/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/136396f183e6ca46e4f68676d2d7433c12e87157/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e656f858832672281d4b4bbca2d185fdd8213b14/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/ad2841a273dd2866973b44ebcf5b376bde112895/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/de1d74308bab34d937b2aa6647257f03eb9fbb52/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/c6c89d1604c53230d5fd518bab00d84b668b6834/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6f783ad4d4f44df50b7bc442d34f54a61e76362a/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/c1f6716b19531fad4ae9ea35e26ceeee354210ef/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/7db796b45830f27c244beacabc4a00f60193048c/


-- 
http://autobuild.buildroot.net
