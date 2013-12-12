From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-11
Message-ID: <20131212073008.770321007F1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-11
===============================

        success : 94 
       failures : 27 
       timeouts : 1  
          TOTAL : 122

Classification of failures by reason
====================================

         matchbox-keyboard-0.1 | 2 
                  iozone-3_414 | 2 
                    php-5.3.27 | 1 
                 libpfm4-4.3.0 | 1 
                 ffmpeg-0.8.15 | 1 
             gstreamer-0.10.36 | 1 
           python-pyzmq-13.1.0 | 1 
                      icu-51.2 | 1 
libwebsockets-v1.22-chrome2... | 1 
         dvb-apps-be76da69f250 | 1 
                  bonnie-1.03e | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                elfutils-0.155 | 1 
               alsa-lib-1.0.26 | 1 
                  nettle-2.7.1 | 1 
             iputils-s20121011 | 1 
             alsa-utils-1.0.26 | 1 
                openssl-1.0.1e | 1 
               libglib2-2.38.2 | 1 
                       unknown | 1 
                 rt-tests-0.83 | 1 
                     m4-1.4.17 | 1 
                 mplayer-1.1.1 | 1 
             ctorrent-dnh3.3.2 | 1 
               qt5webkit-5.1.1 | 1 
                  sawman-1.6.3 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f344c7bedcefcd0087ca649f12684e2a1980e4e0/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/6612f30a190dbf8259f5c596b61b7f884a195d3e/
    x86_64 |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/d9ff3cf6cf706760148becbb86de7082fbc570cd/
    x86_64 |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/1c5bc4d77a3246621bcae7e2e84aef648305560c/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/63d12f88e76c489d74611a0077fb9078768c3d25/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/60731a7a6487361e4d442e9fbe395f8fc52d2420/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/4c246a45f77afa9383531bd4f7c937f5e21f20fa/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/e75f72cae9c441dc81b64c168360882dfcf8edb4/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ada79cea0f0bd903b91b3876ea47eaafd9ba5715/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/77c8b2129f68ae60e37f50564141e09673da0d96/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/fc1029ca04a0f859910b2bc731b09c471ff37f6e/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/65be2bf773205aa0fa3b60b7ff77b3f81f0efbe3/
microblaze |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/35884c45ba6546332566e64d61627729a7467bbb/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/be5fd3d7e33a373ae0a535420e87967c6d4d326c/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/58ff9053f7adb2e891ef0fc1dfd0e9ff3f97a36a/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/eeb5d1de5f2c8e1f578835a2d934e5339750fdc3/
       arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/9ede4e503ef97d79d98a2e9bdf518b68277adde3/
    x86_64 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/7a75d6fe8706a978015bd1043df55faf0099c877/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/0e51e227495d144917bd2418e08187afbf8c7296/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/69e5aa605666291b447b096b253483396c1ee70f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/9d45b0be96f597c33fb3224cb051070fe31e12f2/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/42f53828ac37c6aca61584831b5627c155ec13e1/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/f86dd72c2041245f2664c55f1d1c2667b81e3b36/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/dc214b54aa00df34edb99b95c360ff300c91dae9/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/dd6099b6aed401fbbd9962728bcc0434a34d069b/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/7fad87ee194df9643cf13fc9226ead85e9bf1529/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/48a9ab72f64187fc8c111bbf884bc15d94f272a9/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/929e425be2aa9fbfe60e91aa81ec925ac421e143/


-- 
http://autobuild.buildroot.net
