From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-24
Message-ID: <20170525063058.AF5A520B91@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-24
================================

      successes : 279
       failures : 10 
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

                  ffmpeg-3.3.1 | 3 
                   taskd-1.1.0 | 3 
                libselinux-2.6 | 1 
        ltp-testsuite-20170116 | 1 
make[6]: *** [libavfilter/a... | 1 
                 qt5base-5.8.0 | 1 
                  quagga-1.1.1 | 1 


Detail of failures
===================

         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/64c5100de12e0589d04909b25f23d144added7d7 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/bce22080b64f5e4725109de7189c8a28980ba13c |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/f7e08d06fb75bf2fbb7b9d68b285ec75e7a124ac |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/507914963c3279657701d98894fbbe3519469f89 |     
         arc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/f51909d886af7077410d97c7dcea7090d29e89ca |     
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/75741cf4cbd6d734ec22e36423d957b0fd2b9e0c |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/732d72df2a050e342162b9ec15270bff5867f7cb |     
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/3c12c4609d4a77ab8ccd3ea94840884d70520efa | ORPH
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/b0130004b0767368ca2e5894134d05990d48e152 |     
        m68k |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d1f96897dd552e616e6b9c2ffe2ebe6cb1a0d0bc |     
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3bb841d4a5d2b6178d8572b987274b55c6b1a200 |     

-- 
http://autobuild.buildroot.net
