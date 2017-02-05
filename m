From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Feb 2017 08:29:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-04
Message-ID: <20170205072906.B718820DA9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-04
================================

      successes : 93 
       failures : 34 
       timeouts : 1  
          TOTAL : 128

Classification of failures by reason
====================================

                    ruby-2.4.0 | 3 
               bctoolbox-0.4.0 | 2 
             berkeleydb-5.3.28 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
         libevent-2.1.8-stable | 2 
                    mpd-0.20.3 | 2 
                    qemu-2.7.0 | 2 
                 sngrep-v1.4.2 | 2 
                 wavpack-5.1.0 | 2 
                  boost-1.61.0 | 1 
               cbootimage-v1.7 | 1 
               domoticz-3.5877 | 1 
                 glibmm-2.50.0 | 1 
                    mpv-0.23.0 | 1 
                   ncftp-3.2.6 | 1 
               openswan-2.6.46 | 1 
                   ortp-0.27.0 | 1 
             protobuf-c-v1.1.1 | 1 
        riemann-c-client-1.9.1 | 1 
                  samba4-4.5.5 | 1 
                 synergy-1.3.1 | 1 
               tcpreplay-4.1.2 | 1 
                      tmux-2.3 | 1 
               trousers-0.3.13 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/6952d132c48439f9bfc7571de126dec766aa1d72
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/63e7ae1ccfa3b71862dbc64cc424a923a8386f45
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5aa106a9aa018e9968e3334928d75b0125b0f49d
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d893b82c1945ba339f55ae0b8779c6a9a733a417
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/02bbcb3c99be74518dd02765e87d75bf533e5378
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/1b43323ad6f595f1c1d7ad2901b7db957c0aeb1c
        i686 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/3fcc279e368bac835ae6f2deafdb0c99e989632d
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/313c04da15305d402eb02086ff046c2fb6a6a563
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/a973ba14293b68ebc6e467d3090384ccba11a4ed
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/c82df31738cf130b0024d67e6c1f7cdd2d013a6d
      xtensa |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/b726c56f1812bb2d3e22562810165498bc5130d8
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/9b78ad22de2f540e6f5126c2d943024c9042597f
       sparc |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/4d384950b6dba21163bdcd7721ddad133beeb72b
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/842e992315dd78765938e6b629386a18fa9bb00c
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/05efbf10a46d778cbe9c1c886a8a536b792342fb
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/714dab88e928325b756c06745a87f956cae84e87
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/38cb7bb0d2fd6a9fdb059d5965ec13c9cc8cf9bb
       sparc |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/21e89b9bef4a72e9d531a5bbcf6e60ef31fe7cb6
       nios2 |              protobuf-c-v1.1.1 | TIM | http://autobuild.buildroot.net/results/bd8cf81c54647e023971be271ab8951acde3acdf
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/9205f9c59f57d6937fd93537fdf99afd43822e94
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3b01c93a6a607cf809c4277b1287d71199fcaf96
      x86_64 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/ee08d0dbf43a75010ec3b9a668fc0239a9c352a4
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/13fbc7519c3972a3b40f180a31881841852e7d7c
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/965939050ec94e13e88857dcc010a3923064c069
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d6fe22cdfb2bc4253a8fe5675f14811459476bd1
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/b0b77c76a4602d04b4d141502d2ed61d6f562965
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/350f8dc71027a7f3f997436fc4c957281d4a12ed
     aarch64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/91f5b1072ab6a457141cd96ce3bb08756f713c1d
      x86_64 |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/bea06f63324ef234483f0331c0e8a6effe4bcd79
        i586 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/65ea37b2884496ccbf0d090f85afddf551b74256
     powerpc |                       tmux-2.3 | NOK | http://autobuild.buildroot.net/results/31d37c95b40d297b90a6181ec79c42ee1e2e5090
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/cfe517fa8a0a2d1c44fac9f28663676f56cfb9b6
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/4fd14e29836ffa108df04d7799525b9832f590d5
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/bbaf04b3af26430b0516219d0259b1418ee89df3
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/aebba8e2eb3a721a7d39d345fedf4dc2009649d9

-- 
http://autobuild.buildroot.net
