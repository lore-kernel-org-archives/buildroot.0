From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-13
Message-ID: <20150114073013.B78E1100B35@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-13
===============================

        success : 294
       failures : 26 
       timeouts : 2  
          TOTAL : 322

Classification of failures by reason
====================================

              host-erlang-17.4 | 4 
               host-qemu-2.1.2 | 3 
               lightning-2.0.5 | 3 
                      qt-4.8.6 | 2 
             libselinux-2.1.13 | 2 
     start-stop-daemon-1.16.15 | 1 
           heirloom-mailx-12.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                libsrtp-v1.5.0 | 1 
                      make-4.1 | 1 
       directfb-examples-1.6.0 | 1 
                  zeromq-4.0.5 | 1 
                 qt5base-5.3.2 | 1 
                 openocd-0.8.0 | 1 
               iptables-1.4.21 | 1 
                       unknown | 1 
          usb_modeswitch-2.2.0 | 1 
                    fltk-1.3.2 | 1 
                poppler-0.24.5 | 1 

Detail of failures
===================

        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/6b8100756033d8d51b422d07607eb17cf9909698/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fe37651f3b8a87fd3a48df47735edfed214dbc44/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/658545e854b4ccd3ec60ee49777a28586e8d6cdc/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3dbacd4f5bb0594ead950a78f7e2a99d55c19433/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/92f84c004c4d0bef64cc5b59dcb24d24c5f45968/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/102477f8e2c36f97248aa6f677026067f8a3c611/
        i486 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d4fa128c822e68ea4f37bd245641ea71f6e39c1d/
     powerpc |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/23733f4b0aaffdf9d9cdd3177ef0df1d75c971df/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/71a12879a557d395ebd3c981acdbefb2b63e15ed/
       nios2 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/da5dfe2c40de8cdd6375f1036446ac51894a735a/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/b45df862a5c7e0a45017d6be33a818c98489b663/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/92bd748fcc39142e960f4037f9e7e8479510939b/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e6e1401f6b8a3915ed2df2e949282aa91ec05863/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/ef4e214be59d8be4361d6446be42deb98f8ba4ed/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/e453d18a4cc4081ed8aa0a8a86accda4078d99e8/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/b86a6672d75783028f90831074a4fafb82901dbe/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/f481b5c601dd05417bd2c303a030f6ccf2ce544a/
        i686 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/40e12dac5c95d989e49be2ae18b4a595d8321da4/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/3fb148c58d38ee285f58d6c7ce999cb0a603d54d/
    mips64el |                 poppler-0.24.5 | NOK | http://autobuild.buildroot.net/results/47dee003b29f156496492757cbaa4208b002ab65/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/93bca43808ddbc769bf3ef941ffaaf4c1c62f4be/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2c3948c84955e64e470615ebeab67734bcc561a6/
      x86_64 |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/2bebe990deeaed1b00a44fabc69cd40eafa2820a/
    mips64el |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/24e37550749dc15ed7223fd515fa4628803f341e/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/8196b81dddf03e3666273d8b327a908e21d2a2c3/
         arc |           usb_modeswitch-2.2.0 | NOK | http://autobuild.buildroot.net/results/f2722b359d30cb1187b9674706d119c638ee3424/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/efb1bdc00c1fabece91075573489f5960760b917/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/1fd4de2b98727b3ba1845e1b8b80510d0592a892/


-- 
http://autobuild.buildroot.net
