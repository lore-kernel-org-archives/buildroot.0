From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 May 2016 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-20
Message-ID: <20160521063018.DFF7F101E6C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-20
===============================

        success : 139
       failures : 41 
       timeouts : 1  
          TOTAL : 181

Classification of failures by reason
====================================

               valgrind-3.11.0 | 3 
                flannel-v0.5.5 | 3 
hidapi-d17db57b9d4354752e0a... | 3 
                wayland-1.10.0 | 3 
liquid-dsp-df5a459fa05dba41... | 2 
                    cups-2.1.2 | 2 
                   erlang-18.3 | 2 
             ipsec-tools-0.8.2 | 2 
                  ffmpeg-2.8.7 | 1 
                    ruby-2.3.1 | 1 
                   mplayer-1.2 | 1 
                iproute2-4.5.0 | 1 
            host-python3-3.4.3 | 1 
                    norm-1.5r6 | 1 
                  qemu-2.5.1.1 | 1 
                 rpcbind-0.2.3 | 1 
                  qlibc-v2.1.6 | 1 
                 igmpproxy-0.1 | 1 
                    ustr-1.0.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 host-go-1.6.2 | 1 
             stress-ng-0.06.02 | 1 
                    mosh-1.2.5 | 1 
                  connman-1.32 | 1 
                 libdrm-2.4.68 | 1 
                gptfdisk-1.0.0 | 1 
              strongswan-5.4.0 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                     vlc-2.2.3 | 1 
               linknx-0.0.1.32 | 1 

Detail of failures
===================

         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/dc0e5d228da4ad02c3672f301f37ec7cf23c0cb7/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f2dee18554e1191a83731e07a62d2ae1e701935/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/149525cd0fa567494deb2a26310d71e9b536bd9d/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b5909b1a2fc2ef7998a8d36908c64696893849d8/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/fec7873ae3b4f6bcbba73644fc3b47cedda56dfc/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/dbff28e076512861157617532b96c05c5ef932f1/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d182ec102e89a2fc640b1d6fa31e39fbcd6e5d2a/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b20ddc7918aa52d458d6a4490ce738483b00ab1b/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/bbe821fb808e93cf271d17b1bcf2de3227cd04f6/
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/88d462ec3faa893db957f166a57451e8fb271447/
      x86_64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/cd4e04b7f01b082549d3d5ba2175654a1658d700/
microblazeel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/edf8b6967d0c282c97adce7fd817ae18014c9b7e/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9e34e874d7f01a2d79309863593ec0fa3545ce8a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c345a2fda87205224521dedf6be7425b5726acd4/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/c8abba3cfeb9c23eafc0dfb4924eb3c32cb7e3ca/
         arm |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/514e1673cda9403b53aa9b6faf74faf4df99c616/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/71cc982e636527ad1efe74f23abf8e7313dd5721/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/6aff090df6c5e5453d5777c9d2b1f60faf4bc357/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fe8435a29d28292802a48793f142dcca49d62304/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/3002a4327b0a0544d452ca1c047adee83709a98a/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/bfa6d963dc761e189e0963fb3c0b512f0f376b7c/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f9b443983734ac01117aa80be0affe0009ee923c/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/9a06ff90b72d5c459d3c7e2415a732c9d9ba1793/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/f3e9a111d7fd92b7bc7351b3aacb83b7ff0b1b48/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/96b9a040466fa433f39dcf0947943de5bccd74cf/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c0a3e60c8bd07763b819dc8e802337420af91e5d/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/71adf16a86805f7f9d1a1c9fba9cdba450f2ebb7/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/5475a7b60de18c491221df9a3abe84508c032398/
      x86_64 |                   qlibc-v2.1.6 | NOK | http://autobuild.buildroot.net/results/15ce460214875c2e56d5d26372778b43cd7325ad/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/6c742e20ac05378297cdefcef27e4ea2fe5c5ef5/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/7333a6d59cd532a37c24cc0aa07675eddf7b0970/
       nios2 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/bb3b748a14465a6168917bfbed90b2ff84fbdedf/
       sparc |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/8954bf6f330ddd744f75e8757feea12c944835fe/
    mips64el |       trace-cmd-trace-cmd-v2.6 | TIM | http://autobuild.buildroot.net/results/933e80b0af6c2ad9e83a1550566b9b158589c08c/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a93bb43c6ce642af099f721eea88ff44c29fb0a7/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/869fdf18b3755233e6f56de67b30fc0d03d0e433/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/894181aee7be686033c777e506a1479026170bce/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6310863d18992a28b9a662649d54bb2586c85e4d/
    mips64el |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/b96f246b483fcd7e763d3152b752bec6fb2d9c68/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/243085388c3f4c494f8e6a4e459a5b911d522e9a/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/8ee3e3fda6a8f240ee43eb486659d0217924a89c/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/c4a83b3bb85c2ac02ce10aac03aadeb428e23d18/


-- 
http://autobuild.buildroot.net
