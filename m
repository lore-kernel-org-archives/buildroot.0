From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-13
Message-ID: <20140114073009.D944B10264B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-13
===============================

        success : 91 
       failures : 55 
       timeouts : 1  
          TOTAL : 147

Classification of failures by reason
====================================

              libnfc-llcp-1103 | 10
                  ffmpeg-1.2.4 | 7 
                 sysprof-1.1.8 | 5 
        ltp-testsuite-20130904 | 4 
                aiccu-20070115 | 3 
               alsa-lib-1.0.26 | 3 
               tcpreplay-4.0.0 | 2 
                       kmod-16 | 2 
            gst-ffmpeg-0.10.13 | 2 
                     gdb-7.5.1 | 2 
                 pixman-0.30.0 | 1 
                  dhcpcd-6.1.0 | 1 
                sdl_ttf-2.0.11 | 1 
                 qt5base-5.2.0 | 1 
               w_scan-20130331 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                 libevas-1.7.7 | 1 
         qt5connectivity-5.2.0 | 1 
                     vlc-2.1.2 | 1 
  toolchain-external-undefined | 1 
             util-linux-2.23.2 | 1 
                    sdl-1.2.15 | 1 
          enlightenment-0.17.3 | 1 
                latencytop-0.5 | 1 
               for i in usr/bi | 1 
              pcsc-lite-1.8.10 | 1 

Detail of failures
===================

       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8e63ad4609c3bf2c1dcfd76a8e7c3b2d49cd0e83/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/b1232c7c5630ac8682bafece84fc627d707e3302/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c1182b00f9d968e587acba15af4af905b92227f5/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/07692df5f6a1a64f516be6cfd4b273c7b8c95fa2/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/bf340b7a67928838c0ffbe440af55e73445f4197/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a91eed00224c5c306672d9d6fd5c16dbd9b689cc/
      bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/2247166e6812a5ec48e25237bcf7cc289b6bb4ae/
    xtensa |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/c77483101cb6dfbad157989114804506487e3280/
       arm |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/eb3ee5d8c2eb6b19610a56abcb1a52434675bd39/
    mipsel |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/0de6090c0062f13c8a86baac66b5dbd293d3d0c5/
  mips64el |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/aa5cb447342af9995d8f198eb0a151fe6e3d5c19/
      i686 |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/b2aefd25431bab3d0f4fcf4c3e6de1ff6fc54ffa/
    mipsel |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/7522ae6d5c7af9b122d1eb519a0d244cd61a6c6f/
microblaze |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/ed6129d584229ebe4a0b291bc6a1dd0be23cc92a/
      mips |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/355f56f6b466521e2c4c71f69b06a0ca2a56949b/
       arm |                for i in usr/bi | TIM | http://autobuild.buildroot.net/results/e82bdd870cbe74c3817dcf4cacd434925c24f858/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/4cf049e4f45f91d157fbcc028e64b6b89c330fa4/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/eb6997cc4020d75608a5d2ccc249f59c1b013392/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6eb041109f13659ff2a4509f231ad3cd59a44318/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/3cd2a39bba732a625117aa2941923c200ec55f51/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/fadf08fc677181a3e18c5e3399585d6857cfb436/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/0f7cfdfabaae98d054681ded5447a57c950fead7/
       arm |                 latencytop-0.5 | NOK | http://autobuild.buildroot.net/results/f20f3ca9e39fbfff89f79879892f94441a31dce2/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/e5a85da187605fa9128091e4a798e23af78c86f9/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/ceb038d7002954d5796d5f5e95dab8926193d33b/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/eefbac63704fe775d98077e02e669773520b5850/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/746229a17b6fe443b0559498dc948104463f2de2/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/097564ec70fe0013d4b07e16e091d9f464d8f93c/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/3fa090712f2ecbacc6b4c740df98db4c2485696a/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/89214ad7226a9bdf0fb57558030e76847bf67467/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/ae47ec15c8c91c2504544c03e0920a932752c01b/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/47321a80542146f8c5c7c8077f26e992069242bb/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/5b9abd395eaab980f6a8f247ffc57006031c237e/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/d2ad3028758c25adacb8b215738a99fdfd6e3e0a/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/a894d070ba00e061efe0e69cb680f49362153aea/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/61c9f1ae0aa29a9e3ec6ae3e42e6e7e621ec4886/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/88c6e5d771103083d7cf5ba7a2024bd5383228e2/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/a6f48a4bba106539c3d3377a31ed215a7d7be188/
     avr32 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/adb8468f9f4d3af3987060012b66d6cbd97f9ccd/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/e69ffb0d9e0e2fc7e2afda33a6bccd4400b6c74e/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/0daf2b96fa3c98fb5c3dd0c03eb5d2671ace22f3/
      i686 |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/8f92c2b3c5d304ee38a46e51f522321ccb56763b/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/45c3d1f3ad96ba942cd4e874672b044098ac202f/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/f028d8c1aac161e57909ed258f731f05d7883222/
      i686 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/7a93a7cc66a61b2e151bf1e72a56336e937e66a8/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/b56eba118ef5a31cf16acb5f595acd1d10f19c3f/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/954a6f966f803fa3b98f52a7a8602dc56486aab5/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/c43a41f800649d142e52b4d3cf4a3084a50e0756/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/dddeb28c4032a9e6f7363f245eceebc3b1c7590f/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/54b739bd3713de87113cbed35e05b9074282b30d/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a54cb9d79fd69ed09974d3626e684c7c39e123b4/
    xtensa | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/e77a6f9f760484ccd23364451d888f5f4bd89623/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/e4a2dcc709bfc13496af03c098e64a2ddcacc12e/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/831a094b28e2e3caa80142b324a527b8cb166b82/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/4b661be6cde52fb20deb435c78ea6e1d2584adfc/


-- 
http://autobuild.buildroot.net
