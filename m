From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Jan 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-03
Message-ID: <20150104073014.A143E100D3F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-03
===============================

        success : 229
       failures : 24 
       timeouts : 5  
          TOTAL : 258

Classification of failures by reason
====================================

janus-gateway-c632c1e9da5ff... | 4 
                   erlang-17.4 | 3 
           libmemcached-1.0.18 | 2 
                 webkit-1.11.5 | 2 
                 python3-3.4.2 | 2 
             subversion-1.7.19 | 1 
               lightning-2.0.5 | 1 
                     tmux-1.9a | 1 
                 openocd-0.8.0 | 1 
           heirloom-mailx-12.5 | 1 
             sofia-sip-1.12.11 | 1 
             libselinux-2.1.13 | 1 
                 x11vnc-0.9.13 | 1 
                      make-4.1 | 1 
                    php-5.5.20 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  zeromq-4.0.5 | 1 
          usb_modeswitch-2.2.0 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                  weston-1.6.0 | 1 
              libarchive-3.1.2 | 1 

Detail of failures
===================

         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e7bfc4893dea6b133f0794ef44d50ad89bcb6662/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a85ca414e5b67af46510abd7b610eb5ae8661de4/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3e9c307f1ec6536482641019dcaa94677f7267a3/
      x86_64 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/8a2e68a0fad844275f166a034244938f7edd44b2/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/07abdf1ccf5fef3b925187f3c2340c35396eb875/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/6d8e15ac5d592a51b6a8d2ceb9fc1ca954428ed7/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/abe25b588bf6de0d76cce0135841d65dc66d5cca/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/e328b3a9953530147ca6a8e8f513bebb1d0b464e/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/faa295a5c821df519375b6645531a79d37ac2d94/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/97c3a1aa913d30fe9706fac5523dc56736d270bd/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/252b7b5e819e75a7f61f470bf5fb0fe0b294eeb1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b51d1b6259a696869554546cbc738e79915d8cd5/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/8055c4ca936a502b612eec238d02910a9cdfaddb/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/2cc9b49c81ea981195704ec48f95a93f79fe9bca/
     powerpc |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/63733e95a72dfae70ea7b1813d43e4bb51622bba/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/f7741112e211a4439adf7069356419d87b809fdc/
     aarch64 |                     php-5.5.20 | NOK | http://autobuild.buildroot.net/results/46a84cb358c776bb1f6f55dc0bb688e3ffb63517/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/c9b6dd19f16a56a16ef441d5b303badab9720bd7/
      mipsel |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/403f3f7d91b976bebe379e3a1ed27108d38707e4/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/0d3e3280e3fc6a7c00c3ee53ffa1c760e3d16110/
     powerpc |              subversion-1.7.19 | TIM | http://autobuild.buildroot.net/results/9378198c7374f5ec63b39137eda2cbab51daaa53/
      x86_64 |                      tmux-1.9a | TIM | http://autobuild.buildroot.net/results/2d7dd9f2d5b8fd8daadb0f904f7cc99e9c1a07b6/
        mips |           usb_modeswitch-2.2.0 | NOK | http://autobuild.buildroot.net/results/da09cdaba9d5d7f88c6ad8e340eb854fde83b41f/
        i686 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/abd5e23ba2e27577d8087135b114f06ea1202898/
      mipsel |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/95d8ea86f95451e4679f84ffa580b5d61dc57e46/
         arm |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/eb9d89b4ac6a60af888aeaf8a889b459981da50f/
     powerpc |                  x11vnc-0.9.13 | TIM | http://autobuild.buildroot.net/results/3e6d9fc505abd01a4b903a3fbf97fad7580b44d6/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/dde54b6e8ff1c3419bff14d711f4d3a95939b2a4/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e8ce8995c7449333ab04924a2cbb07bc8d7e8893/


-- 
http://autobuild.buildroot.net
