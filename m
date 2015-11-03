From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-02
Message-ID: <20151103073020.CD5B21011D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-02
===============================

        success : 133
       failures : 54 
       timeouts : 0  
          TOTAL : 187

Classification of failures by reason
====================================

                   mplayer-1.2 | 8 
              host-perl-5.22.0 | 4 
               lighttpd-1.4.37 | 4 
                directfb-1.7.7 | 3 
                  ffmpeg-2.8.1 | 3 
                 libpcap-1.7.4 | 3 
                    ruby-2.2.3 | 2 
                      x265-1.8 | 2 
                    sdl-1.2.15 | 1 
              strongswan-5.3.3 | 1 
     openvmtools-stable-9.10.2 | 1 
              swupdate-2015.07 | 1 
                      qt-4.8.7 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                iproute2-4.2.0 | 1 
                elfutils-0.161 | 1 
           libfreeimage-3.17.0 | 1 
                 dropwatch-1.4 | 1 
       openpgm-release-5-2-122 | 1 
                  ltris-1.0.19 | 1 
       poco-poco-1.6.1-release | 1 
                 python3-3.4.3 | 1 
                busybox-1.24.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
liquid-dsp-df5a459fa05dba41... | 1 
             host-nodejs-4.1.2 | 1 
               dvbsnoop-1.4.50 | 1 
                pulseaudio-7.1 | 1 
                  boost-1.58.0 | 1 
             bluez5_utils-5.27 | 1 
             lttng-tools-2.6.0 | 1 
                 lvm2-2.02.132 | 1 
rpi-userland-b864a841e5a459... | 1 

Detail of failures
===================

       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/a13a271c97972252657a6825ef2642ece5877775/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0cad0a6eddc153098bb6d1501afd1cf4a57a82d1/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/0cbe6fe65dad091eb3162064151a90fd933375a3/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/64ea2678839eb11c2b1773a04ff2b6cd27231cae/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/4855290cfa23dd7afc4e1dfd4a5f1537a8100287/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a17cab2b62a680d276ac7abf2c221c863d01a23b/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7c970148c3677d9d4a5846544d8382b98c3b8c22/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/b26888b3015573bf86ff63d86bd6102e2acc489c/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/06d88ef30e273fe51771f1a31e1ccfcd7dd076a5/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a0a59585e045f8ac88569742252488a41fe631cf/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b241c1b92cca1cea063580e61521324af1a69816/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0b3bd91315f0fdb35efe791225f82a67cdab1a20/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/a9aa8e7f7c8aaa1a9e35278ce24a9da2c92bd32c/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d6f964a131acf799ec5d458d22c9ffa8d9b3588b/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/ab7002bf13607ea8dacaa4b91f91db979cd764c4/
      x86_64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/b2e5206d9e536cd4271fc6f9df6cd0c816bc89a7/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/236009527598c3e54a18440e12f2dbc1f1337f45/
         arm |                 iproute2-4.2.0 | NOK | http://autobuild.buildroot.net/results/43af695a9ea8d0357294cbf3ac0c604aee7fbe22/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/9fded888e69283e3741c8865b265ac552a4767f1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/73161feb33a0869ed185364ae524b683d6618fcc/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/298314d21bb83cf4db387890faa8f160b824b138/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/e79353496aa91848c76f15c561efdd84476c20ac/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/a859ecb153838837e9a73b47ed7e1105d6be55ac/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/f2ce1899a1144bec23fb25f4ce36dc78d768f8a8/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/f9587484272b17ff3a1b602f11ae67f61acbba0d/
         arm |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/d387c0b2344ff887f197484f61a39692d856dd90/
         arc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/465a4700b83b1e9a30fcd4d8a235e7e8e4dc0f61/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/47be923bc9bf53c6ce0dd48ee6ae35e120a32221/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/10e3179241621b636c87b9484718d27757f8e788/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/828bc130e5f147bb9b32a4d339959fd10681403b/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/8308ad181c2533f7d9117a7fbbaf6ef7ac0b9873/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/73e58f01e4c422c91619c443f9d042b42b79e678/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/97894a1c8d60f2647ee661a84339309526021a98/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/66e75ed90454f4933bab751993b055d2c6591948/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fa78976f9dc137cc4d9d5be1251a3c0511a79d92/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4b462f3a5e544dbc730850ea8c2853f7e7daa661/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0f659a8b238eb5e2f49043638b024bc1462ae933/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/544eefe4412c018ab198cbfb51834ffb8173050d/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8589efee63b55de4d1b6b13280ea9b672a5a0510/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/46adb61264c31dfd5b180873f6bb478fbc3d6130/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/88a33fb3f62e3ebfd4e73bf418f8bd25f26738c3/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/4c0048df5f0a95ab3743517132b82a6e4e7137af/
         arm |        poco-poco-1.6.1-release | NOK | http://autobuild.buildroot.net/results/16dc0dea9a7aa120714bb3c7d43c1a6ecf5c8292/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/3acec6abf6d02b5cbfc9e8e0d59b47670e55a3ce/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/e79b95b16fe42c89f4be63db927a2794416e1f33/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/164c21040c4280870abc7a8b758e3fd67d9cf835/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/e1d8227a21ff138190dc392be7518147c39eacb8/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/9952ed620ec94a32385682bbfa976f10210eb4fe/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/9a3e7ec6ba7d675c772e01d304f19b1c3652857e/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/2f31c69264dcfa58dcdaac7afb41cb5aa9b5d734/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/4c1c0df3c2db55ae48219527b87333abcff153a0/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/599f28fb5383daec122a9f6972a5cadaf204cc29/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/1c3efaf7370184701dae66ef1abdab6ca6bb139f/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/614b10d7e957e8cd8bbb6924086c0084e8afdf2c/


-- 
http://autobuild.buildroot.net
