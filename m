From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Nov 2013 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-02
Message-ID: <20131103073020.A3E2A52C703@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-02
===============================

        success : 73 
       failures : 66 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 9 
    trace-cmd-trace-cmd-v2.2.1 | 7 
               alsa-lib-1.0.26 | 4 
                 qt5base-5.1.1 | 4 
               libglib2-2.36.3 | 3 
                 zmqpp-31220ca | 3 
                 binutils-2.22 | 3 
                      qt-4.8.5 | 3 
                 libvpx-v1.2.0 | 2 
                 libnspr-4.9.6 | 2 
             alsa-utils-1.0.26 | 2 
libwebsockets-v1.22-chrome2... | 2 
                  connman-1.12 | 2 
             uclibc-0.9.33-arc | 1 
                     m4-1.4.17 | 1 
                  libnl-3.2.21 | 1 
               qt5webkit-5.1.1 | 1 
                sdl_ttf-2.0.11 | 1 
               libsigsegv-2.10 | 1 
          host-protobuf-c-0.15 | 1 
               w_scan-20130331 | 1 
         matchbox-keyboard-0.1 | 1 
                 dropwatch-1.4 | 1 
             tinymembench-v0.2 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                 mplayer-1.1.1 | 1 
              matchbox-lib-1.9 | 1 
                elfutils-0.155 | 1 
                 rt-tests-0.83 | 1 
                   ncftp-3.2.5 | 1 
                 libpfm4-4.3.0 | 1 
                    fltk-1.3.2 | 1 
                  avahi-0.6.31 | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7a60df7dd690494c03141b37bbff3c6a8547757d/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/34202323e1c980d913cf0d6ca9301e2455051b44/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/844f384a082f91a49368c5edb6a625ea84706885/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/13322369ab20e94f181105d43afe6393e1eddbb9/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/049cb60441a1ca5918d3c35c0e7423e27669b087/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d03989b17e4b9c17219c25c037864fe2004f87ae/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/bc8eb0a45cec1b3afa00e8e2b934ac60d772046e/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/d16d73a716ca0f3e6c16fe23ef748707495eb787/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/3939930a693ab7f244ed81d295898fad15f60700/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/32b011100f96d3462d98b365591bf2422f4d3ec3/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/919271389e419aeeb3f8afeb79d86e5947e20469/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/31e425bdc338f15eb94020334394b7a42c75d152/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/cd5e22fb5c9b0fc5d396bc85a5e253a1a65054da/
     nios2 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/cc8b51c3def768969e8f58f6113fc96fff858969/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/1c1227a0873fbfe106288eb7184d88f8351dadb0/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/3356ebc87d397e02ffceaf908ad616e384e3131f/
    mipsel |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f00181032b3edf23afd229f67151101ee0a7a0f3/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e85d7133d5a777fa0bc5ccdf90d87b496da023b7/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b924e98e4a6ae0e2000219d19e460222681e974e/
      mips |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c1c9aa03410bc91ad2ea0e360bee4007b03c66b4/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/b1551e8e8524cea632d5f878f59f95e39250d7b0/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4a0a3d68e7926a7046d72a79701ac243591e6192/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/3c5385d0f17736e311f8852093a7b678aa7c673f/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/b3438a48b1526474877de19e3467cc7f9dbb3002/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/381e0a35fb693c50274ed357c5110d85146258b0/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/20e677fa729183403f6db2fd2a8ebfcd6ddc8017/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/8def7e54e4fecb7df350443824c00b53d1c61c01/
      mips | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/685d7f88468096347eab02f8fd366ed9569724d4/
   powerpc | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/e18f19c5e2f1e71634075e46cdf3c937d1b3f7e2/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/88d5436684beb677e186810bf01b17ae304de159/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/7e95c2ee4d78e62bba60085a02097698bb7f1740/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/409919ee64c7bff4f8425acfdd5d3823ef45e979/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/203b11d42cee26d20ef4c6fbaf2aba7a21f1a73e/
      sh4a | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/87e61e764191f6a88bd7450abb5c1f9f6642f2e8/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2b7d12b3686d7204325d9f1d967ae346b82732b3/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/ff5a03ad2a480ae9a5ceaa0bdc368d2aaeb09b9c/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2dc36559a2333f9d13f980c82dea248968d71624/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/1f84ba081607443c7f9b4187304c98398e58d781/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/d07b0d220ccae2cd35a235949ef31a3395043570/
    x86_64 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/90054e096c8aa3913d1a758c2c326578c007d084/
   powerpc |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/bd0d528b9b38dfcee930935ae8fc092172de3af6/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/845d08453914315ec2109230b1867e512de8e35d/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/74c3a83c57bf7d1d065b9fb1a9161fd8b07ade92/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3670e4f03ff0ce114c90bd7139243d82c427b52a/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/356232e63059eb7e89017392025d3ec8cd907b9a/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/aaeb82753b7654eeca679ded5d0211ceebda3ea2/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/e7e422cfecf34e063e8e3f2c211b1faa47c9ede0/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/8d93fb83c6abec64964858e144f15aecd11c0b7a/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/ac3fe5cb13ff1c15d1ef44c2d6c2f19ccee69bd1/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/247ea01b35ea7a76ee576a61e5b4ff0e4d98df28/
      sh4a |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/9b53124b91a962b36c1c5480a589b30ae4f5e161/
    xtensa |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ef4a7b0b1117de9fb8c7623a046bf2ef93a6f584/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/aa953a1f8555c8c5ae117ad7485d6d42848912f6/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/eb75eea593c62c88fb9eda5cee68c81535acb4f2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/79a773ccfbfe1a7eee0adb2b083653cee09ea201/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e3ad204edfd4bd6ed42bde1485c22c21cc8f33a5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d28d368bdf49b145cbdab7fada859dec9164c8f2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ff16b7f688521674394511e5c383680ee0ee2cce/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3a33d867fbac15e63afb6fbe3cbcdbd782936a85/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/597afab5159599da8e3bd3ed7b5a26d8d1740769/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1483bacdf3ff88b96d6794cbf37d34fde9b55b50/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/ffccffbb69b5069123f38d8a0339295aed8202d4/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/2510a15017675670d1c9e1a8e89b9b4bdac999af/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/5248cdd8a40ec1a6e6a5063b1fec0478f7dd8052/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/a83f45a6c23b6048feb3ceb5c79637b3e24df5a3/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/1b4ecd88116e2e2526fbb8e3e13d810e1de1375c/


-- 
http://autobuild.buildroot.net
