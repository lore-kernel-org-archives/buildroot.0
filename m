From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-14
Message-ID: <20160415063021.B9938101CCF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-14
===============================

        success : 128
       failures : 49 
       timeouts : 1  
          TOTAL : 178

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 10
                  connman-1.31 | 5 
                   erlang-18.3 | 3 
                 jack2-v1.9.10 | 2 
                moarvm-2016.01 | 2 
               opencv-2.4.12.3 | 2 
                    mosh-1.2.5 | 2 
                collectd-5.5.1 | 2 
                 libgee-0.18.0 | 2 
                    yajl-2.1.0 | 2 
                  ffmpeg-2.8.6 | 2 
                    ruby-2.3.0 | 2 
                   mplayer-1.2 | 1 
              host-ncurses-5.9 | 1 
                     vlc-2.2.2 | 1 
             lirc-tools-0.9.3a | 1 
                blktrace-1.1.0 | 1 
                     gdb-7.9.1 | 1 
                sg3_utils-1.42 | 1 
                 mesa3d-11.2.0 | 1 
                     nut-2.7.2 | 1 
                oprofile-1.1.0 | 1 
 make[1]: *** [all] Terminated | 1 
                grantlee-0.5.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
glmark2-499aa81a68fb4c8aac1... | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9239539084dd28de68f24adb8665d8994784224c/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3b274f57c7eb5ce6ab212fb2209a4d7553e61bd8/
microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7719bd408919ca0df865b95216467dab5b5d02ae/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/fd9eb54ab988349b273d586307af86baf65d60f1/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a313fd6db202ee051cdf306534a7f74877799232/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/48e6f34a7940f52d987db47784c0d9e82f39de7c/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0747ae1949fd9a5df4ab072894c9a8e9c1d66fb3/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c59db244742222b63fb9e5794852f0ea501e72b9/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/bfe249bf8b445a2fd19c510b59d3c5e9062a3ba1/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/a4112b4118e4bf3b09598edb290941d4ae20b9f9/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/60c079bc394ef05319eed321901552af34ef4315/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/8d947cb3ebc9bf08d14018180d846898bd834a50/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f45f2ff07e2061a87a0dabeed32c422030ecf828/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/1c33c0dcfee7a32cfdcb0001fbf04b29eec63fb8/
      x86_64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0c9b2b5d4ff878c94028e27ecace9e9d201f982c/
     aarch64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/35be72c5844d4fc607799006d4cf0d9e77afb55e/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/bbfebf5c606e77b4c797b3312f1ea88f3b96004f/
    mips64el |               host-ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/b526d960fbf52b7105aeb0d71e01e730533d86d7/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/adf6d0b7f660a29256535b4bdc08aa84015ba7f5/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/449ed1b94ecd6dcd7d16ea94c5c515a4173f3b5d/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/03c6b6cb3f4c0a4a7ea63dddf1436adaee47ef07/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/f16d19d7b3c602015f770442e37cd43f2a19e3d4/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ddf5cfe2295ea891fd497802435a44b9ab985589/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/c71f5f2242a708058a4e6d6558e88aa6e6d94362/
         arc |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/274b28377dffde7d003cede24e2dcef6788bca4c/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/24c4579a11bb1b807447c88e6b70dd4bec0240d2/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/a45910b03263e54c21ebb9f9f3c1bae713d68541/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/dd520b3947571a577008e1c21e9bb930cf15865e/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ac0bf26731a35e276000136fb3b7eb8878085589/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c059c01b564ab9f875ddf8ded56e2de3940d2196/
      xtensa |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/cd1e97db02b409f15d6e44e836ca94fe5aa986d5/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/8f10f76a8bd35259e54749017b7082f7ef9b62a9/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/659cb0be63de5450ac4b730592cf23c2a75742ce/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/6aedf2b1a84beeaa665759451b45e76b383a5637/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fa0c8ad94d1e18debb5e8cbf4aa8f888de31f0cf/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c8678711484ba7c192a9e19a13647233140174de/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/271dd26998b4dba46ec535f3dd7eb3acb894c63d/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9a1da19785462f82551ee4e6f749d6a158a50b12/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/3fb3bcf6612836a4a00710798142c87a3bb29bcb/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b75b1c594bd529dbcab918aacfdb203e7b584b19/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/22d0fabee382d87a520f821043e78176ea8b1d22/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b778b68dc287746eab050c52b4dc07c83003217f/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/279c0cdf6ef8f3e186b670c57e85c5f288d52aaf/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/728b9b39185ae90866aabf291292a4f9c88447fa/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/fb7cbfb3617f41aff6514e25d7f1b741bfe61bd4/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/81461307cbe11317aa23c5612d49dd5f17c77ce3/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a2ee4c8ecb1804bf693217c5accae12bca4d9848/
      xtensa |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/d7046ee77afca9a1c881aefc6201f18324d17b14/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f7767367e2b705296a54245f45955e8683b6c756/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/7b3d35b2c7f03fb129b458c5339dfbc400095507/


-- 
http://autobuild.buildroot.net
