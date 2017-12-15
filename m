From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-14
Message-ID: <20171215070036.1F9ED20953@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-14
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 163 |  24 |   3 | 190 |
   2017.08.x |   3 |   0 |   0 |   3 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-2.2.8 | 12
                     gpsd-3.16 | 2 
                   pcre2-10.30 | 2 
                  boost-1.65.1 | 1 
              host-erlang-20.0 | 1 
                 libdrm-2.4.88 | 1 
              lynx-2.8.9dev.16 | 1 
make[1]: *** wait: No child... | 1 
 make[2]: *** [all] Terminated | 1 
make[9]: *** [do-all] Termi... | 1 
                 mplayer-1.3.0 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                      qt-4.8.7 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/3b714d916d5a0c4286d1ba0e8f37d38e04b6d341 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7606e9ba9a8478c8bb4e78290e712935f7eae1fe | ORPH
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/fbb89c0c7b448184e19a58a82498394cc6c05fb6 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/00e99f40b9059b3634a6fbe7a193c781dab79298 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/4d1c9d24f114304de6a6e4492f01f8219c190333 |     
       sparc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/83e304df5c8da44d182a2366991afda3244626e7 |     
    mips64el | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/3d206e25ac76854931d9ee5882087ca23f86a31d |     
         arc |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3aa249bb32f6fbd91e2230faeea25867b35c2e01 |     
         arm | make[9]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/626572980cdd603d8a76b6ee2881d47e48d6046b |     
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6bbee82fe015a2836684ffc77002a9fb352adeb2 |     
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/36dbd304bc30ffdc7812fbcc4153434714cc21b8 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/5f413112747e352cde961e7842a409768c7eeaa9 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/f986868f7ad565df1475c25d534b3cf8e694b684 | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3276ac030ca7dc541254f575a1aa125076d08ff3 | ORPH
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/35882b6c0ec840c58cca295d8271b72f9701fcd0 |     
 powerpc64le |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/f5189b5c4870e7b73c16e0a5f2d1ac683382865d |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/ccc050cd9225eec8eb23b96553d9d492d16f6906 |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/ae23af1acdbfb4763915a92e75b5f9fb38f91fc1 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/3623df2692260edec360761dbfb0bf68b4ee0230 |     
         sh4 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/fe891704bd20ddaba09119b162a8189bcaadef94 |     
   powerpc64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/32c2db00fdbeaac10ff4e573c2361c42e3481b7b |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/7bcbe56b0a60eeedfaec23cacf8656e58b299e56 |     
      x86_64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/0b8d925aa7e24cf523f8a633553c6de39ad97d1a |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/a685cf82ab018f17c01e0733d3e2c3aa12395e03 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/ecd3cfcfd26f7bb5c63d114c49f4ebdfd26d9db1 |     
         sh4 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/73340307571185479806af4300bf85f51a59c185 |     
         arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/bd34ca32c64d5c4144d34cb848072dd6f0c9aec0 |     


-- 
http://autobuild.buildroot.net
