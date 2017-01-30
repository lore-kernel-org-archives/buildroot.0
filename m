From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2017 08:29:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-29
Message-ID: <20170130072925.E0B0B20CD6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-29
================================

      successes : 135
       failures : 43 
       timeouts : 0  
          TOTAL : 178

Classification of failures by reason
====================================

                    ruby-2.4.0 | 11
                 sngrep-v1.4.2 | 4 
                 openocd-0.9.0 | 3 
             berkeleydb-5.3.28 | 2 
                  fbterm-1.7.0 | 2 
                  lcdapi-v0.10 | 2 
                    mpd-0.20.3 | 2 
               openswan-2.6.46 | 2 
            host-heimdal-7.1.0 | 1 
                ipmiutil-2.9.9 | 1 
          janus-gateway-v0.2.1 | 1 
                 libnss-3.27.2 | 1 
               librsvg-2.40.16 | 1 
             lttng-tools-2.9.3 | 1 
                   ncftp-3.2.6 | 1 
                 opencv-2.4.13 | 1 
                   ortp-0.27.0 | 1 
               pulseview-0.3.0 | 1 
               tcpreplay-4.1.2 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
                 wavpack-5.1.0 | 1 
                      x265-2.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a7a5d92551e7367c6113d9f59f077fad7a67f3c4
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/392bd447793a9e841f6a2a7dac938aa271a308b9
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/1e443b6f78fe327e19090853f8f803145ca12780
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/e584f1bb3edc63b346212a03d5da1f6025f8ad96
        m68k |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/e2176cb5adacdad14371d4828f13a1c23f0e18d5
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/ff62e76ada3b3db909d68ab13e24c6979f0a1e34
       sparc |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/ecfdeb4df2e0c4010da29ab7377bc8d282e3e2d0
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/4f9662bffc807816bd77a21e17ac34bcf2cd70f0
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/c7831e187b8e943f50d08a43afff365d38a97923
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/66fa21cb25240be97aac66ca572b6c8a0ade1a20
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/862cb84de704558341d3b9b2481158ec42063fbf
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/57c8da0f05c6bbf07b4788b3ca03150b5b2e33d1
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/ad806e94eb6bcac594982cf71959de60cadc9e46
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/70095eab00ed3cdd0fe7a4da933c6a59e26de78e
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/66adfbf6fe35b828466bac0f12265f23f606f6e2
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/088c567e2c2c2dc5827bed88812af9eeb7b070f4
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/41128ee78841fb7935b7c8e6f8fd9f3270370610
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/87c0a4eab510fa2135b067e899449849c4e01245
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/d43974658e974a78a632cf81d25ac983c91e5ef0
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f8a9aa82cead93e5093f3162d54733cbce19bd36
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/772feae6b247a821bd90d36f392b44e49db1a223
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/1fca7b83ba30e004bba8a85a48fbefb82380d95a
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/c1ef386a0f487a6331bd5b8300907b28e0670a8c
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/06b140c0a696341ca455971f7b66753600490000
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/e05dbf9e28a6626c14125056025345b27b1691e5
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/19489da272041c5fd373e7c14f5842b422672018
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a1ae2ef495ec466d3aa834c52e86f8b649cfc625
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/54babfac1527aefebfbf412db13ae454ef178496
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/2382ee4cfc91df65a89ba2bbeab36c156b839265
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/77e0c2fda3ae453204592fe5ff8842af1322eacb
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/56007a790aac1bdc5eb23ae974e77e77bc2a5549
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/7404268ea0a4604213041b6e04a3541de074e2ba
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f5557950262984b4617841fe0afc5f2a351e16ba
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ef19e085cbc79157f12478592bfafe0b7cc35246
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/daa1d2e2b51014ddd0d63cfa6a033352eafa8d21
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/2e0da014e6657c18b6e33792d989b00fd58c56c3
        bfin |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b205e00a2802dc35d6a9ed4c45dd09ede08d3ec5
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/815c99edb68c5a887eedec8de9404789933751c8
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/dde54ccefa32af1f46a4af5b6caed822c3209dfc
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/404e2a53e2eaae11410a70c0d90141383ba86766
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f8437ba3514aff6b9f1abe1cb4362857e4b6bf1b
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/37e4c163d00872eed7482d9b8bf585462e07fc1e
         arm |                       x265-2.2 | NOK | http://autobuild.buildroot.net/results/9f7a253801181b91461e2bedd811a392018392cb

-- 
http://autobuild.buildroot.net
