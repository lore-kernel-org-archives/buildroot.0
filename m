From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 08:31:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-22
Message-ID: <20170523063148.BE93A20857@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-22
================================

      successes : 231
       failures : 8  
       timeouts : 3  
          TOTAL : 242

Classification of failures by reason
====================================

       host-erlang-rebar-2.6.4 | 2 
                   taskd-1.1.0 | 2 
                  ffmpeg-3.3.1 | 1 
                 libv4l-1.12.2 | 1 
 make[2]: *** [all] Terminated | 1 
                openocd-0.10.0 | 1 
                 qt5base-5.8.0 | 1 
                   redis-3.2.8 | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/bb575f6dfef376070aff9447a6f7264956acf6dd |     
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6503e59f67466170df51ff88b58158434a7e42c1 |     
        i586 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/e76217fa73082e787366d39835e7879b7d006ce2 |     
       sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/967e7b7b6960ff49afc5c845832abd49d93ed676 | ORPH
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/b4685dee77a2b121e63be249633c8f3878324621 |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/dbffc53ecc9da8d584fd22b82b129529d5483a61 | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/5c17441a45b6da610e3f3de1dbcc1bac8cec623f |     
       sparc |                    redis-3.2.8 | NOK | http://autobuild.buildroot.net/results/7f1ecccbfdb6bd95824d9c884f1577e71e0e1e09 |     
        or1k |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3e0582c728765250d44b088b6e5b4e731c2c98a4 |     
     powerpc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/46c5b8abed5518bcb668b93cbb0bc7aa81da5c6e |     
       sparc |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/3b8b319b069206052a0050ad8d779ca8e0cbae5e |     

-- 
http://autobuild.buildroot.net
