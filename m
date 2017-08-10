From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Aug 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-09
Message-ID: <20170810063058.53F362096A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-09
================================

      successes : 113
       failures : 16 
       timeouts : 0  
          TOTAL : 129

Classification of failures by reason
====================================

              swupdate-2017.07 | 5 
                       unknown | 4 
                      qt-4.8.7 | 2 
                dbus-cpp-0.9.0 | 1 
gmrender-resurrect-33600ab6... | 1 
                     nvme-v1.3 | 1 
             transmission-2.92 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/35811796e176d5a4bd20fb6e22000b716fcb856f |     
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/ac477d5b5658be7d32dc97ac393e3a9017f80f54 |     
         arm |                      nvme-v1.3 | NOK | http://autobuild.buildroot.net/results/52e06d8e3c0ed560fc6cb1f06f46818197efe104 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c9f05ab74e7b62207280e7930e4c736e514903df | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bee58bc178fa9ce02a7e659206872252df0ac1f4 | ORPH
        i686 |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/d21aac5018419c75af81fc140916abfd8bc2fc56 |     
    mips64el |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/0a8d016d4a5950d5cfd88220c6a95163be240de9 |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/f401f3c1f846692a2acb0ba851ab99715c36aacf |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/59caabe92ce480f56348683fa48f04c37507a744 |     
      mipsel |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/39b4e5e70851f23135b6a883f50971e6e60d1d2c |     
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d210711ae09d3fb4c6b597c77a457458451a819a |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/87a52aeaeb9752eefc341f2716cef5afaa7d2abf |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/41c53ec2ebbbf117566fcedce74797622bde436d |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/504f16e82ae549f88a18fdedf6a9c559af112cac |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/d5122f83d600eab6e0f13bfa44000397cefb65bc |     
      xtensa |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/9321a656a8440d66b14cf1f632ad4bee653ad717 |     

-- 
http://autobuild.buildroot.net
