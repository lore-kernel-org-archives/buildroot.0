From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-15
Message-ID: <20140116073009.385D0101528@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-15
===============================

        success : 66 
       failures : 74 
       timeouts : 1  
          TOTAL : 141

Classification of failures by reason
====================================

            luasocket-3.0rc1-1 | 18
               tcpreplay-4.0.0 | 8 
            gst-ffmpeg-0.10.13 | 5 
                 rt-tests-0.83 | 3 
               alsa-lib-1.0.26 | 3 
             lua-cjson-2.1.0-1 | 2 
                    mpd-0.18.7 | 2 
               w_scan-20130331 | 2 
                 sysprof-1.1.8 | 2 
                 cairo-1.12.10 | 2 
                 libxml2-2.9.1 | 2 
                aiccu-20070115 | 2 
         host-elf2flt-20130904 | 1 
                     nut-2.6.5 | 1 
                 qt5base-5.2.0 | 1 
             iputils-s20121011 | 1 
            live555-2014.01.11 | 1 
                  iozone-3_414 | 1 
                  bcusdk-0.0.5 | 1 
            lbase64-20120820-1 | 1 
         dvb-apps-be76da69f250 | 1 
                 mplayer-1.1.1 | 1 
                       unknown | 1 
                 dropwatch-1.4 | 1 
                     vlc-2.1.2 | 1 
                 libfcgi-2.4.0 | 1 
              wireshark-1.10.5 | 1 
        ltp-testsuite-20130904 | 1 
           imagemagick-6.8.8-2 | 1 
                  ffmpeg-1.2.4 | 1 
                  zeromq-3.2.4 | 1 
             bluez_utils-4.101 | 1 
            libvncserver-0.9.9 | 1 
  toolchain-external-undefined | 1 
                    sdl-1.2.15 | 1 
                      icu-51.2 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/403fb1ef304a49fabc918681f02670a3378af7e8/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/234572e418771b49464d254d08c4d3eed6435301/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ddf73d14ac8ca5fcd94d2121a300321f610d53cc/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b2f364878323b4567eee550c4e44eb5c8cf8101d/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/27073fad926115a5ae3a9bff24dc4978a2d03fb1/
    x86_64 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/b281d9f48b1d64f4ac6f675cf46d34525890da23/
      i686 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/856672f7af76ad702c49ffe9f7170c56b960bb26/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/58cdc714182066d9432014d82272af8f838f5d20/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/28cfbcb70986b4ff5b0ba5d12c037ad23393732d/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a7d7758aaefac5fb3bc52aefc04b0ba71de709ad/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/f3be7c9f0c9920983b06135651c0ce7e9f78aed2/
       arc |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/058b6ecd5072fc9a5d44e13bbf16e2cd3e034efa/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/46fc12a8cd5ef0b54d8780527235d39064043d46/
       arm |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/f0a420015a92ebb8868c41c0dbf82cf27b2bdd0f/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/ab8ec4904020ceb848a1e50f1865f594f46b8295/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/c639bdae10d824cd1a98310c03acd4be5f3e6cb7/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6417e2f622dd671195cccee4fa3222d70b64388b/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/3e9b014d32128f2eb86f4d010b2aa79a5daa00fd/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b8fd28a68be4d9d3752863a02ad1ce4b87493504/
   powerpc |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/31c2282a5ddc915c96e7a04ddc82cc754bfd5f71/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/9d3f5ed4b86b536ad69ad15f549b4b312a3c7eb9/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/d9c13cb3e61940c50e2eb6d76b43b05a8d17ce0f/
    x86_64 |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/37093da33c998821423a17fd089a887b37e84fd6/
      bfin |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/93a7f816b5c70a247491063ca733b537ee7aec65/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/55c71a79c8af833d9c97522f9d6ac29e2f2d0494/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/b2f509ff2ef3503fe2f34e807ef6ea4d5706b925/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/4912230065182865d94cc6501891fe1e6ba5b3c1/
   powerpc |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/9e1c705522f12cc4ca17367a611e17d1f5fde863/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/4f99b688a52d3975887db916c00d8e3a80fd1929/
    x86_64 |              lua-cjson-2.1.0-1 | NOK | http://autobuild.buildroot.net/results/803be1702a44cebecc36958ee531b7683fc72480/
    x86_64 |              lua-cjson-2.1.0-1 | NOK | http://autobuild.buildroot.net/results/e59fa9583ca0791188aecbcea88dcc0963284ba5/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/279b6e86920f47212561992f076ec63391e587f6/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/ef0f602e3a7cbe6b144a104423a443dfa872b815/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/9dac74dd478134d3bc246911bc6b0b24c7806db4/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/d1d60c2fd6cdfe11aef3f34d754abb1cac78a798/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/d1778f9e1361fa526417570a63996edb774e22eb/
   powerpc |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/df44b3e55378166ddb2747548a9df47d5da163c8/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a36e06b04ab02e09b94a623a7f22506ab0f7c607/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/48ffc3839b01cbf8770bed34b7f9441f0315ab5d/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/f38405ecc560e320db28959509901ed353553da2/
    x86_64 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/8df60a47f10c73aec095b22774d9718c7e1d3974/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/d34f6493df86acb66b64b55accf338a793aff0c3/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/2ffe8b98726a3e72c8e86e96438cfd7545f4ce82/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/d6380a05a4aa82ceaafd5ad611dcc56139563f56/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/dc93d27e1b395d0f5ee984e52809e89678ecb026/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/53fb223456fb39ae407d8bfa752db93c845ca437/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/b51b018a563f5929da00b241c6e49215af9226c5/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/aaf505fe7ac9acb42309a2e1184c37dab1182072/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/ffc881f191a1143bc06608c0c581b3ef7a76145e/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/9cd641f28c462f408a914b6345c4f70091b27224/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/be0aff9814ded4ba74999283530b805af01992da/
     nios2 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/addd63f5154d74a3c8c7662490b2f06ac4fbb590/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/89be829df1f479d8833785ae10c545a1534475e6/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/c48e574cbccdf5b3ef03e884a9b034bb4c44e266/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/af3586eed9318bf34a8b5ec357749bead262ac3d/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/7a5487bb015ce4e883091f0395bdd5960d04ea2f/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e39c490441139204576a03e4d36e28ec99ec2d25/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/8db81661f5b8a8b4fd4eb3a54e7f1a56987a77b1/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/aba9d67e52bda15937701d9483feddbdfe08f7ac/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/20ed41036f2a12da87af3ec0cd03c404569bec0d/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/7616f895cea272eae51b11a4513712baeaac7cd7/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/21193da894c57d8047130e052e69d1fa16cd52fb/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/982fcb50a857d4db3dec1771be7f0c82c66ada7c/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f0ba732df391f7b495517b997effd9b900a85c5f/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/0ed4ddb1611607b1930ae9e3767aacba2b9cece0/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/1f1aa8e1cda158833ff863ab9fac24b89b24983d/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/24c413a14c00bfde6d6c27bc168c2f9323a1f5f6/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/194519d7e555e3e1450109dcf32288c7ec27ad98/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/200215f74e29df515bbd803921f2c1670fbab7e4/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/9d61a7ef94da70ffcaec8fccca3f64e1ce1ae001/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/dd546fe8d01243b527e495d9fee36de68106f754/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/f3a7ffa7515752feee93da52e94b53fc15a5ac86/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/1a9cb06be50ddc7fe5f3718a9d1065816803a5e9/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/efadb1ec3133194430598f2f9d978b18fa909b20/
    mipsel |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/733c9fcb30f9055f8807ca16e01ba6f08e306eb5/


-- 
http://autobuild.buildroot.net
