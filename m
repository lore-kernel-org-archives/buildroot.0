From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Sep 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-31
Message-ID: <20160901063028.D9C16101E53@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-31
================================

      successes : 213
       failures : 32 
       timeouts : 0  
          TOTAL : 245

Classification of failures by reason
====================================

        b43-firmware-5.100.138 | 2 
               binutils-2.25.1 | 2 
                coreutils-8.25 | 2 
           libvncserver-0.9.10 | 2 
                   ntp-4.2.8p8 | 2 
                      qt-4.8.7 | 2 
                collectd-5.5.2 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
                  ffmpeg-2.8.7 | 1 
filemq-e59951489045825d6fc5... | 1 
                   fwup-v0.8.2 | 1 
                     gpsd-3.16 | 1 
                 ibrdtnd-1.0.1 | 1 
                 jack2-v1.9.10 | 1 
                libmad-0.15.1b | 1 
                 lvm2-2.02.162 | 1 
                 mono-4.4.2.11 | 1 
                 mplayer-1.3.0 | 1 
                  nginx-1.10.1 | 1 
                oprofile-1.1.0 | 1 
                poppler-0.32.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  squid-3.5.20 | 1 
                xfsprogs-4.7.0 | 1 
             xscreensaver-5.32 | 1 


Detail of failures
===================

    mips64el |         b43-firmware-5.100.138 | NOK | http://autobuild.buildroot.net/results/99efdf1692a27d48848bde8bc2c3adc957fc6f25
         arm |         b43-firmware-5.100.138 | NOK | http://autobuild.buildroot.net/results/6b6142ae59a7ac57075a6a37f68494227a70c0d3
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/66c5ac9bfd8e6b996d542f5b17376008253ca0f0
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/4124b1760c73495ad800a7793fcaabe49df88991
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/27e88e7146d9405b0c7ee2dead0db8afa9a0815f
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/82fc3c764d96b051fdfbf26cb8dea065711ebf78
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/96d5787a7365b2f39639e1a6e58669c340cf523c
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/1a7e9571fc419f8b6b67226e6d59e24cf573f12b
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/1123a7ab304b9ea5b0f01df2a216f1244b51f736
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/fbf1dbb41006d331bacc726fa247780237b5a827
       nios2 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/94ff95b4338d1bfc2a1f325487d9a009a3800782
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/b377ac4775e66595c574e016353e714b33ded8da
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/932d4ccf09963db7a9dcf5c6904cf83cb299be29
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/95ab9067fe4d26e4c40ed187cfe177d651e6fd1b
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/49be8a526e495b6ed42e96ee644cf9cf8abd3812
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/50dbd14b561a6c1c18004f20ce1e27eb3766e91e
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e9819db79e521f87afdf0c396560173d9ca535ac
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/bc50150c1e491d722917c15a961b91c9ff52b558
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/8c4053a55e86f0bccedc0ceb6b64aea41be07a23
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/21fa6122243e7ab7f72218934a9511250cd7cba8
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/66bc6623f61e136af0ecf1d0ed15f8718c82ada9
         arm |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/9c7bad6831b09251af81e2bbfc595a241df87c70
         arm |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/1e7b10ebccd243a727097741378039ff39683c21
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/6300ecfe7c2c106e171ab5b9b375430472da48d0
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d1ba84418b436bdd8937048a62cef1f77c806202
         arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/7027d5e2d2b72dc8a5c897ad7aee621c66f39a3f
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f2fe2e115fdda032273046d97436f6c823896363
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6de5121ce818e6c36032868855ed20fe3c421cda
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4cb372018917fa086d198248cf652ecde017415a
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/1579278d585804687ee2c9da4db7d428b0705cef
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/a19841d09c079106def5838a447f8fb4f6bef5e1
      mipsel |              xscreensaver-5.32 | NOK | http://autobuild.buildroot.net/results/fa31c009441e594d59836a7728f3af7be203ecfe

-- 
http://autobuild.buildroot.net
