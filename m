From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-23
Message-ID: <20140424063010.E7568100E65@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-23
===============================

        success : 57 
       failures : 45 
       timeouts : 1  
          TOTAL : 103

Classification of failures by reason
====================================

           host-freetype-2.5.3 | 20
                  cppcms-1.0.4 | 4 
             lttng-tools-2.4.1 | 3 
ne10-88c18f02199947b2c8b577... | 2 
                  radvd-1.10.0 | 2 
                    gpm-1.20.7 | 1 
              postgresql-9.3.4 | 1 
                  acpid-2.0.22 | 1 
                    php-5.5.11 | 1 
          usb_modeswitch-2.1.1 | 1 
                  dhcpdump-1.8 | 1 
libavutil/aes.c:122:13: not... | 1 
             util-linux-2.24.1 | 1 
jack2-37976441044d69b91d61d... | 1 
                 cairo-1.12.10 | 1 
                    fbgrab-1.2 | 1 
    xserver_xorg-server-1.15.1 | 1 
                elfutils-0.155 | 1 
                   libgc-7.4.0 | 1 
                  zeromq-4.0.4 | 1 

Detail of failures
===================

    x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/6d471942788fa05f324649ab15e6ca382e46df9c/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b66d7125ea7e10313221462097ae6c22ede963e5/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/16fab114c33f8ac87c68e5ef742c7ad6e220809f/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/91d6fb9071971e2f3f116fc2c1c0b3b677b082fc/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/c5874650a91be6b5fb3405ddf02f3ef1558d7461/
     avr32 |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/e1a87609a2c58bc4b3b11f1b25db4c2b8b06eb82/
   powerpc |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/1107c21cdf656763bf7048c6c5c7899369724f5f/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/f765b132cefa52396d491b69c6916669d28b5758/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/b20d39acb41bf4a2284f75ed7745a0832a32aff2/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/77a712d9c9365b2e5939f32d533102eeece7970d/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/6d3152aeb5b8ac5300b60d8329feeb6e23ad9e1e/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/5bbdd210b1d8a3715cefb4e99891ad3af3edc486/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/1c268a73bce4f9d70aeb6493926b8ae150b2be21/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/5c335380c42bdfbb68b3f0929f70a6abacf1acd4/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/a6840d6bb7c31f9e1fa3ccebf5445c3e7676b8eb/
  mips64el |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/7bc006b5de9e2c982e64a290204caa97fd58b6c4/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/72307d59f9ad0074c3717802f1eaf95bb9c4a1d4/
microblazeel |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/65627c4b91928db65e4df707096cb9f029d778fb/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/7923fb9f922655045cd69e59b8ed4d8779982b01/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/93e8e15237014fc0c6675da5b2ac3af621a5a1a0/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/230e367609e0630c9d882634d4a4bcc1a0416d86/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/78d4f929be6c5b2d8aad17439136d965e6f5d7a4/
   aarch64 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/fb8e38bcc73ff60a71df7558a1a4d6cc7cc9157f/
    xtensa |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/ea49675cf6be5424ebd59b5d6edcf5f4a19f7b90/
       sh4 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/59d058ce110e22194dda4b60cf25298e14899b4f/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/bbf05833b27d393ccb97d828f292c508ad52eb4c/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/e9aa1599ee46cbd8aec68d03bf6b371600c5b175/
       arm |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/25e23d873d322b9100634537333a43b6b21df034/
     nios2 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/3ff3f9c073b311c8c6aa0e94fc499f27d0610145/
      i686 |            host-freetype-2.5.3 | NOK | http://autobuild.buildroot.net/results/beb406bf51691988b2b1a35809027e0e28c819a8/
      mips | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/dfc9850a128ef46acc6bbc066656a692da08db04/
microblazeel | libavutil/aes.c:122:13: not... | TIM | http://autobuild.buildroot.net/results/4ebfe070c9252384882fd4b736dcddfc73a605a1/
    x86_64 |                    libgc-7.4.0 | NOK | http://autobuild.buildroot.net/results/8ce608275f4a3bd2e7bc5f8b7ea83b3f3c8a0ade/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/88bf737f47c7002a133776b1ad1461dec71ee2b4/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/029cf1387d9085a24742a9aa9be2b58577476843/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/3a43f9de98781f11de5f220f5af7bb935185f923/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/0ba8766f0aff18e19ce5e1766cc684f1f8bf3105/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/666d232f392923a37340e6eb385246e7fb152da8/
       sh4 |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/f891f84f388c5b5deb1d45daaf4fdad2806447ed/
   powerpc |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/f464aabe2062c1d1e9d01972c5b4ebb582c2d440/
     avr32 |                   radvd-1.10.0 | NOK | http://autobuild.buildroot.net/results/66a01d47dbcba806ae5a096349941c399c73fe10/
     avr32 |                   radvd-1.10.0 | NOK | http://autobuild.buildroot.net/results/5daff949629a843e3926c4cdadde60329048b725/
      bfin |           usb_modeswitch-2.1.1 | NOK | http://autobuild.buildroot.net/results/2165d23822f2df64ce2e1c5ad337894148a0b2de/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/b4c8bb90df95d9adfc0c3ab246b71fec0de724cc/
microblazeel |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/c6a5bbee21b5c4ce84c6a95bd764f294d3791720/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/97fd0bf40010b7549a54156018defeb96121ce70/


-- 
http://autobuild.buildroot.net
