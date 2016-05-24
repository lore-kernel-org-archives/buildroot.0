From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-23
Message-ID: <20160524063023.4C8B610173F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-23
===============================

        success : 153
       failures : 31 
       timeouts : 1  
          TOTAL : 185

Classification of failures by reason
====================================

                  connman-1.32 | 4 
                     vlc-2.2.3 | 3 
                  ffmpeg-2.8.7 | 3 
                collectd-5.5.1 | 2 
             lirc-tools-0.9.3a | 1 
               valgrind-3.11.0 | 1 
                 hplip-3.15.11 | 1 
                 jack2-v1.9.10 | 1 
                blktrace-1.1.0 | 1 
                libcurl-7.49.0 | 1 
               pulseview-0.3.0 | 1 
                 libdrm-2.4.68 | 1 
                pinentry-0.9.4 | 1 
                    ustr-1.0.4 | 1 
                flannel-v0.5.5 | 1 
                   lzlib-0.4.3 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 xorriso-1.4.2 | 1 
                oprofile-1.1.0 | 1 
                      qt-4.8.7 | 1 
                 lvm2-2.02.153 | 1 
               iptraf-ng-1.1.4 | 1 
                 igmpproxy-0.1 | 1 
                 mesa3d-11.2.2 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/47dc536f613f958c52f3879411ba6fb3b861d6b4/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/24a35b63921cb9d747052f3bbfc3549ed20e18d7/
    mips64el |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/af1eec00e472349c7dca76dcc8dd5cd37d82f5c3/
       nios2 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/af3743bc0840cecf13664c081d6d205e5a8c9eca/
    mips64el |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/6593e1ca94f98e3c2a5fd90401f709cf2f7b1743/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5937a416c1f320a581b54a7bc61cbb69075e9e43/
      mipsel |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5ff215f7c91411fef335890d8a86a3482dfdac3b/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/fd8989978723d1046c01021d22d57d6d6ed3b84f/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/b71dc90217e52a99e187d38106b666d7088373cc/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4676f1a966d305d5f7af5125e02b83ce2fe9c75b/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/75e3b6b2a9b72965787d6a731893a5de75e448db/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9f3a493e1863c90bf317f0cdb1d5828d58f8b855/
     powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/c5277c42344d194e004dcd0a5af71bc6110da97e/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/01ce94baec5fd6202795fa9089e874bd8ce22cd6/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/4cedd4dbaafca76e839f45cc0a4bb8c2c181920d/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1ee48356d8da5e0ebf3e5b61b02fed81704a01dd/
    mips64el |                 libcurl-7.49.0 | NOK | http://autobuild.buildroot.net/results/ee89393b87333e12ae001a5c69dd92532112f5b5/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/311c4c56b82a8d65a2f8e6621363bf60e46f6252/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/8820f2cdbf2ac4bc926cb3072639b74c2f756ae2/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/b4e021b3c4fa02589b236d3b7290f7df2df92801/
       nios2 |                    lzlib-0.4.3 | TIM | http://autobuild.buildroot.net/results/6dfb133b3ba59e8ee094493afc13e94a2bf6a3a2/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/d16ef6abf2adeb55c67fc62d7f1473d5ce2bddb0/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/72494289e1ed8c5ce867444968331e63a00026d3/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5195b934dd2ec8f2c76b188133c358dc38edca24/
       sparc |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/1e3101261252d5f30fdf842cc99604e4f4c25eef/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0dc6e3e76040cf18a19f66ea7b32352b19a4a9a5/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a416001516d98d58849f1d1f8f49f49d3d28f3a2/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/79916f095e1b371e5fd6694e8f74416b6bbd5d33/
      x86_64 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/7fe7208df551cb39355835a61fd663e912c0190b/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/e45769f078c30901c769b3ac54cdc39a4e5b6a48/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/967f032a509c4e3cf059a1ac5ceb53269fd8419f/
      x86_64 |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/82014874f5b97de8504d8409b286889b582a7454/


-- 
http://autobuild.buildroot.net
