From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 May 2017 08:30:55 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-19
Message-ID: <20170520063055.DD74E207EB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-19
================================

      successes : 258
       failures : 20 
       timeouts : 1  
          TOTAL : 279

Classification of failures by reason
====================================

                  ffmpeg-3.3.1 | 5 
                 mplayer-1.3.0 | 4 
                libepoxy-1.4.1 | 2 
                openocd-0.10.0 | 2 
                      icu-58.2 | 1 
 make[2]: *** [all] Terminated | 1 
                    mpd-0.20.6 | 1 
                 qt5base-5.8.0 | 1 
                 sngrep-v1.4.2 | 1 
                   taskd-1.1.0 | 1 
               upmpdcli-1.2.12 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/ac891286a493b4f78d04834951e1526c35375dc4 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/4075ea2edf9451406f237dd11e6c3eb174492c9a |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/e39639f0e52476891ef3de154f88deede8ad28a2 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/d1ca2c75227435e450055c72af0756451a2c6c09 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/5c863764ade2009b44b035be3c364b9746e78df8 |     
        bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/4c6d144957f789041006cac50c420767def1f5b4 | ORPH
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/7f949f1371c8ad8175f57509c68ebb3dec760122 |     
 powerpc64le |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/80fd9c012c314d9aa6e44e00768b6bc0ec831d04 |     
     aarch64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ad335187f34510f026bca9bb1fe74fa3b55dea2c |     
microblazeel |                     mpd-0.20.6 | NOK | http://autobuild.buildroot.net/results/f0020911e8e06b4dd077747d8ceb3d04421513c1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/00442a96602ffa5182a63432a148dd82b5891c9c |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4a010f1c01d7ff52abb4f5c9a77dbcf88cb095b9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d563739b47b20ce83c5f675a8af767cc172aa5a8 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ff635118810a225a285367486dbd8d1ea0794bee |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/4ec479167a83e8e947621c37b774880ae6846313 | ORPH
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/2bbac16327a581df9508899ff0cc191317d4dbb9 | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/2e0c137e571878747635fbce591a755ec224f79c |     
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f7fb42d3742f6f01000a0d181e0c785640284405 |     
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/0dbe59da53ecdc24ecb5336ee268bb68762a5dc2 |     
        m68k |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/37e7542bc929ac6c834905cd0245da5ce2006537 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/8c887caff96337d8c94ef7f01ffca7b711b681bd |     

-- 
http://autobuild.buildroot.net
