From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Feb 2017 08:29:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-24
Message-ID: <20170225072908.E590E20E2C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-24
================================

      successes : 171
       failures : 23 
       timeouts : 1  
          TOTAL : 195

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 3 
                 opencv-2.4.13 | 2 
               polarssl-1.2.19 | 2 
                     vlc-2.2.4 | 2 
                    htop-2.0.2 | 1 
                  libcec-4.0.2 | 1 
               libepoxy-v1.3.1 | 1 
             libsidplay2-2.1.1 | 1 
            lttng-libust-2.9.0 | 1 
 make[2]: *** [all] Terminated | 1 
                 mplayer-1.3.0 | 1 
                  nodejs-6.9.4 | 1 
           oracle-mysql-5.1.73 | 1 
                poppler-0.51.0 | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.8.0 | 1 
               sdl_sound-1.0.3 | 1 
              strongswan-5.4.0 | 1 
             util-linux-2.29.2 | 1 


Detail of failures
===================

         arc |                     htop-2.0.2 | NOK | http://autobuild.buildroot.net/results/cdea351fad7a0f61ddec3e6a141da8da0523a902
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/dfb708172afa7dbe785ef1f5d177f745939e18e7
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/851e2f9501bcaf0d98849ce1c94f36ce44c76423
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/5fe12ca5688c561aa7a807b287c847af394134dd
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8cf32f39f7d1a3adbe705013af25ddb467cacf1a
microblazeel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/015ca35b3a7659438d3534e124482095c75c571d
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ae4639897a9400ed8a3bd705439f6c2e6802527a
         arm |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/c49e38dbe9e28f1b34dfc4f588dbffe70d8d0a48
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2a69ab5a7d409a329efc2822ed8836beef52fed1
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/0f82d6d0faba156c2b0f079f450b9fa79446a85a
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0110c38718012b554cdc44366ae043c7ad9f25a2
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/4b7eb4e17c7d201e2bbee410f857748c37fb1d2d
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/83e042a13d96c0f7e59e5a8ab77525a60a9e58a7
     powerpc |                 poppler-0.51.0 | NOK | http://autobuild.buildroot.net/results/24150c26a7ad05598d7551341d986ef6086c2af6
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/59d18f79297521ef75fe3b3f69e08af69909f59f
        i686 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/7693217148e7540645f0e1971b086d1f4e4a9b87
     powerpc |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/92f2c69b87ca3e521277b99fb1087dd7ef4e40cd
      mipsel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/d9b2c5f4efc39d3d4fdf65fe27ce225e13b729a9
         arc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/a22d649b95a9e761f226e8fa92c510fbe6f2c195
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f06b684c2230933499a46a1033e441b5f62adbcd
      x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/ae956ab1708a1b62c90f21103941a8f710084ac3
         sh4 |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/309127a532eed00e406bbaf0b1a51b7241a10505
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b1e761e0a0163ded4514dfe6461abbb8b20b693d
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8acca2272d0378674363129eac19068552a333ea

-- 
http://autobuild.buildroot.net
