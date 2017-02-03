From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Feb 2017 08:29:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-02
Message-ID: <20170203072907.2CB4120BB6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-02
================================

      successes : 120
       failures : 28 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

                    ruby-2.4.0 | 7 
           imagemagick-7.0.4-6 | 3 
                 libraw-0.17.1 | 3 
                 libnss-3.27.2 | 2 
            lttng-libust-2.9.0 | 2 
               openswan-2.6.46 | 2 
             berkeleydb-5.3.28 | 1 
               cbootimage-v1.7 | 1 
                 mplayer-1.3.0 | 1 
                   ortp-0.27.0 | 1 
               qt5webkit-5.6.2 | 1 
        riemann-c-client-1.9.1 | 1 
                 sngrep-v1.4.2 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/37c81c5bb7296e3fd0d35c0fe5c6705778fc3e5b
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/7e32e38079caf6d7f6d0465a73ed0dd037ccb173
        i686 |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/3414b776c24bd98647a56d8234c69e9fa6cca2b7
      mipsel |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/33f4ad226234095b9021a837f96cd8dd03ec6511
         arm |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/2ee5d620f9287fe1d43091580e6f8014e63dfa4c
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/5f0c0278eebc953e85004f4f3241af41ba5a465d
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/c85ccdb6b8fdfab0afe6cdea9a21b2a3ae1dd979
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/d1f9e7c8455e6345b0ff62594a6cd3a47b4f9768
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/9e06fdc771aaada25e3c16c339db787f445728dc
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/49138aef078f0715642982c8b3c74ef7b4b398b7
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/1f8a5b1138695ade56bd122c347481a5ef12fd39
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/38c33af104972b549cfa00a7694bcf95edaa9085
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/98398a13c54a82f2182cfbdaa36ec095caf7c6e7
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6f3d77af7e0a3f53558907344efc82ac79ed040d
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/730bb0068d65df349baf042fda597793763f2b0c
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/403a29dc91e9352b3b70b996d22d96054d90f284
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/fed4f2f2f735deca3ee1cb4dba17793a0af2d18d
        m68k |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/47368849c3c1e0bdb8c5d059ba442df3d8196e9d
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/13d09bf6dfaa89f5a6daf48f722120174eaaecb0
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/eee4006d1d05fdda347600c66afdda02a76cdcfb
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1f6a16f98c650c8002efed94e6abd4e60d5b53ba
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/155cfb7565c04e090e5b2a589e17d5180ee93f93
microblazeel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/04186c9db3f0df7dfe91da0d8193fd0729bdac58
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c8937949d0684d07c59a95e7361c22693d0dbfb4
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/7f9ddbb8be764e6bfa996d94791decb414864821
      mipsel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b34b91b540765fec208a809499ba1dfebad085f0
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/157ec01ded720c482024512583b2d833ce971da5
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/069517736e10598dd575e419c4bb443bb14dd048

-- 
http://autobuild.buildroot.net
