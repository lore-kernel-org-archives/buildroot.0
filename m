From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-29
Message-ID: <20171230070007.AC28220503@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-29
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 152 |  26 |   2 | 180 |
   2017.11.x |  19 |   0 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              syslog-ng-3.10.1 | 9 
                    brltty-5.5 | 3 
                   json-c-0.13 | 2 
             qt5location-5.9.3 | 2 
                       unknown | 2 
                  boost-1.65.1 | 1 
                  ffmpeg-3.4.1 | 1 
              ghostscript-9.22 | 1 
                    mpv-0.27.0 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                   pcre2-10.30 | 1 
                    php-7.1.12 | 1 
                 rings-1.3.0-1 | 1 
          shairport-sync-3.1.6 | 1 
    xserver_xorg-server-1.19.6 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/b3e1b1e570be3efbca21f9ec332581e8e1e4c262 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/2419741c43dea0f91859c19167c8d65cb54e1470 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/4b83e53c718520661dc99cde2121f69ce3fd08d7 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f5e2446b7e4a918f3081ab404be5c5ececb82fb8 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/c7e0afdf17dd803e86cf9d50c3aa95032b4c7e2d |     
microblazeel |               ghostscript-9.22 | NOK | http://autobuild.buildroot.net/results/6252348ee21b9719f09eadb18544cf6247cbe883 |     
         arm |                    json-c-0.13 | NOK | http://autobuild.buildroot.net/results/969faba96d94c1bda7e06b005d8f3a3f7175a0a2 | ORPH
         arm |                    json-c-0.13 | NOK | http://autobuild.buildroot.net/results/60683141f2ef320a28820c4cd65d2b951123b147 | ORPH
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/c6acf39acc87a97ede58eacebe611cc1af819516 | ORPH
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/a421d0b91414b07b8a4be43eb12ec007aab67c47 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/290f4061d0b6cd18cc57219f955f20ce24d72471 | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/9ca65764619c168e5f798b2ea43510094a1610d0 | ORPH
         sh4 |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/7ca3383e6521ccda278d439081ff0901dda36826 |     
    mips64el |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/99a27fbe51c738086b0c1a21e85c09eb917c13b5 |     
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/d17f0370ac3563ae26c1ee6ee2ae9f1841423f66 | ORPH
     powerpc |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/0ce992415fc931e63160d20264aec3e2782d0a74 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/7d33a5672124eec9a95bf9c5f96e914951a92f99 |     
        mips |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/7446ebd51b01733a83a3a1bd45372a0a051166bb |     
         arc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/0d0f74fceb8a3828ec40067cf475269fa6c3dfae |     
    mips64el |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/fded7640791d5d6c6f97aa1063faf6cff1f4385e |     
        i686 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/cf66bd9d53acc4dc80c81efd92111de50885e1d3 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/33316b93b2eb95bfd6c6f90611205b1c5d5ebf35 |     
        i686 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/19bb85cdb4f4eab336a04d5efc40511ad05af70e |     
      mipsel |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/addef06684fe8741fac07783b5cdec27faff763d |     
     aarch64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/6c89daa5640efd91fd1e422d842f3b832fd24226 |     
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/ee729fd294288d91b171dced4a9567edfd735b21 |     
        i586 |                        unknown | TIM | http://autobuild.buildroot.net/results/709c67ddb591eee610cf51af1845628d8bbfcb1d |     
        i686 |     xserver_xorg-server-1.19.6 | NOK | http://autobuild.buildroot.net/results/44e29c2fb5d236a66e0466698fbc9201a37dbc63 |     


-- 
http://autobuild.buildroot.net
