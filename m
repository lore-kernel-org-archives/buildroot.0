From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 08:31:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-23
Message-ID: <20170524063115.3596E20835@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-23
================================

      successes : 270
       failures : 10 
       timeouts : 4  
          TOTAL : 284

Classification of failures by reason
====================================

                  ffmpeg-3.3.1 | 3 
       host-erlang-rebar-2.6.4 | 1 
                  libcec-4.0.2 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
make[1]: *** wait: No child... | 1 
 make[2]: *** [all] Terminated | 1 
                    mpd-0.20.6 | 1 
                 mplayer-1.3.0 | 1 
                     php-7.1.5 | 1 
                 qt5base-5.8.0 | 1 
                   taskd-1.1.0 | 1 
                     xen-4.8.1 | 1 


Detail of failures
===================

         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/94f725b25e27ca56a58a632c371fdf176cf15c79 |     
        m68k |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/91c1dbc4648803ae4dab9053a4615fae6ad8b8be |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/8926d319d6d1cd1ee72239ad7d9ca869d2355628 |     
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/3f2c265fa35074bf893afb69ff3301334cf55745 |     
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/7165e5dc3e5f3aa3d5f36b335ae2411d526acaf9 |     
         sh4 | libsvgtiny-ea9d99fc8b231c22... | TIM | http://autobuild.buildroot.net/results/18e0ddfe06d6ccb62c7f50368a4b433bbf7f7fc3 |     
      mipsel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/22dcaadc1415eff2ae189a13ca65a40599de5481 |     
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/32b929966e8843ec4947cea0941f14d977742467 |     
        i686 |                     mpd-0.20.6 | NOK | http://autobuild.buildroot.net/results/ced22540ce3ea739f1dd8dc6701d8b87ddb3f295 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3f40fbb5589530221850ede794f50184f11627d2 |     
         arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/a6ce47b57c882f3fe30f15983f79a6cb9024c43b | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/6f509497427846f9539da7a1e63a7e67c398b306 |     
      x86_64 |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/c2dd5c1c9dc87d2943c15e58ee56e67d7375368c |     
         arm |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/552e66d764885341b2fe208a0e4382b5fe05ea9d |     

-- 
http://autobuild.buildroot.net
