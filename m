From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 08:31:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-30
Message-ID: <20170531063122.6EA0220F0D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-30
================================

      successes : 234
       failures : 6  
       timeouts : 2  
          TOTAL : 242

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 2 
                  ffmpeg-3.3.1 | 1 
       host-erlang-rebar-2.6.4 | 1 
 make[2]: *** [all] Terminated | 1 
                    mpv-0.25.0 | 1 
                     php-7.1.5 | 1 
               qt5webkit-5.8.0 | 1 


Detail of failures
===================

      x86_64 |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/7ba485532fcab74928246a8f95dba7e5eea9d4a5 |     
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/e0561d1f5888593e2378caa1fc5cb8dc2d069768 |     
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/d07e88bf9f2c01953a95e60aaee1bb6fb492b2bf |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cd83a0d4706e4920984d6b071eadf5ff9bccc254 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5bad003f1582a0fc0c93be2be6a942ea2f9f00c4 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/e0252930525768f5002e06a200387fbb139348ac |     
        or1k |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/d98702ec6ef83c0b3bfa39cd64d2403677e0fd7d | ORPH
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/62aee38cda0ea877f84ea54413d969427bac2111 |     

-- 
http://autobuild.buildroot.net
