From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-27
Message-ID: <20160528063019.3A8A5101CCB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-27
===============================

        success : 200
       failures : 36 
       timeouts : 1  
          TOTAL : 237

Classification of failures by reason
====================================

                  connman-1.32 | 4 
host-gdb-6be65fb56ea6694a92... | 3 
               libsigsegv-2.10 | 3 
                collectd-5.5.1 | 2 
               linknx-0.0.1.32 | 2 
                 lvm2-2.02.153 | 2 
        lttng-babeltrace-1.2.4 | 2 
                flannel-v0.5.5 | 2 
                    ustr-1.0.4 | 1 
                 omniorb-4.2.1 | 1 
                pinentry-0.9.4 | 1 
                    cups-2.1.2 | 1 
                xfsprogs-4.5.0 | 1 
make[1]: *** [libleveldb.so... | 1 
              micropython-v1.6 | 1 
               libupnpp-0.14.1 | 1 
                     tftpd-5.2 | 1 
                 mesa3d-11.2.2 | 1 
                 igmpproxy-0.1 | 1 
                 libdrm-2.4.68 | 1 
                  ffmpeg-2.8.7 | 1 
                wayland-1.10.0 | 1 
                    norm-1.5r6 | 1 
               iptraf-ng-1.1.4 | 1 
                   mplayer-1.2 | 1 

Detail of failures
===================

         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/6bc9c17ed0f0d054c95fc42fd9d46d0c0b6e155c/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3d321ad0f50137612149ec728ba7433ecfe55312/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/b75e03c6410905bdc961694f50caa977dd2901b4/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/74163bb73fe526cc3939f7ec99477486e9a20e48/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e72ac27d2a3aa79ca88786a141d45fe37e645621/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/3630a15fcca5a960ba031b38801964bd025d19dc/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/62d78836e5567738546fe5d17e176997905176e2/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/e5e1f67a503cf2b559a19784baea1895b25f232a/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/4876a2ab76f6f29cfb86c9ef3c28d477dfccbb0c/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e28c78b4d1933f67b681dc5163a7b47a7b0ddad6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0569d44e870808c692926b959b71bc4570341f97/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/eb5bbaa5a487bcc4b6510f2c233152b1b220cb5e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4fee103ffc31e29b06aa3e7a3fae7e6811f21585/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/ba8c78c9b50306cc6526e52e5b03616ae2aa3b6d/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/2b377d1906dff5e4179464c3a7f4d0722bc0d8f5/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/366c026d42ca2553f1cb0873ccabbc70a36fae61/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f1aa74992a77da325b3c6d74f9f88624bad094e9/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/69bf0dbb0be3d4e4783ee332b3e95ca31f18d3bf/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f5bc9921c1b9f839e5536c19348efebd6826123d/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/e1f9c83f7d5bed9dec99143657023619a8929fa0/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3ec74ae68d3bf471d58b888a405329ac6cbdc92d/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/1267a26c0bdf3c585ef009fd5ec628562ed044be/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/b0c36d1a3df1dc4bc322c68acdba37ed77584059/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/5f2144a73a6bc18fbd8fbc08b2f131903086ecd3/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/3d41f03ff159929206290e6492f7c41540a2fc59/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/bdf015df0c06fa04ab054841def7bbdad239fad1/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/a9f92878ab532becdcfecfc884434eff4c1f05ac/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/c21a3e7befc0b26b4378b0a83907bd0fb5301e6f/
         arm |               micropython-v1.6 | NOK | http://autobuild.buildroot.net/results/c164e2d70da21faa1290f554d3239f77d63c82f7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f85c32eb89aac48ae8da892d9800bd13274cd3e/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/bcf53dee29c473640143c11ec4a1a019983de76d/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/1a573bf12295fdb802d026a3203d055efee780d5/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/92a400702dc5fb3151c0f811a84486a85df71856/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/3708f9227e47ae22e82b4dd8f48caa2e5c3a4edd/
       nios2 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/95627835ada52dfb2ba3f5ea4f1a36ab1d8ea2d9/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/964a91cb88439511193fef893c491da8f3ed50c7/
         arm |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/d30ef62aaab4478cbac035a5c57774b0a51963f2/


-- 
http://autobuild.buildroot.net
