From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Aug 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-04
Message-ID: <20160805063026.BDC93101696@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-04
===============================

        success : 175
       failures : 87 
       timeouts : 0  
          TOTAL : 262

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 6 
             transmission-2.92 | 4 
               host-gdb-7.10.1 | 3 
                  babeld-1.7.1 | 3 
      host-uboot-tools-2016.07 | 3 
               libcap-ng-0.7.7 | 3 
                  libvpx-1.4.0 | 2 
                   dante-1.4.1 | 2 
kmsxx-a706f157b86e906968080... | 2 
                  cairo-1.14.6 | 2 
              squeezelite-v1.8 | 2 
           linux-zigbee-v0.3.1 | 2 
                  trinity-v1.6 | 2 
               qt5base-5.6.1-1 | 2 
                  connman-1.33 | 2 
                oprofile-1.1.0 | 2 
                    owfs-3.1p1 | 2 
                    libiio-0.7 | 2 
                 mplayer-1.3.0 | 1 
                  multicat-2.1 | 1 
                openmpi-1.10.2 | 1 
           argp-standalone-1.3 | 1 
                blktrace-1.1.0 | 1 
                 jack2-v1.9.10 | 1 
                 tcpdump-4.8.0 | 1 
              gettext-0.19.8.1 | 1 
           libmemcached-1.0.18 | 1 
              libdvdread-5.0.3 | 1 
        host-gcc-initial-4.9.3 | 1 
                  lshw-B.02.18 | 1 
                       unknown | 1 
              libarchive-3.2.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
               syslog-ng-3.7.2 | 1 
                  libsepol-2.5 | 1 
                 log4cpp-1.1.1 | 1 
                    qemu-2.6.0 | 1 
   webrtc-audio-processing-0.3 | 1 
                xfsprogs-4.5.0 | 1 
                 libunwind-1.1 | 1 
                pinentry-0.9.4 | 1 
                      qt-4.8.7 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                  fio-fio-2.13 | 1 
                   ncurses-5.9 | 1 
               libdvdnav-5.0.3 | 1 
                 lvm2-2.02.162 | 1 
               tinycbor-v0.3.1 | 1 
                     pound-2.7 | 1 
            lttng-libust-2.7.1 | 1 
               openipmi-2.0.21 | 1 
             shellinabox-v2.19 | 1 
           libvncserver-0.9.10 | 1 
                tinyxml2-3.0.0 | 1 
        ltp-testsuite-20160126 | 1 
              lirc-tools-0.9.4 | 1 
                 weston-1.11.0 | 1 
                     php-7.0.9 | 1 
                     mtd-1.5.2 | 1 

Detail of failures
===================

        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9052712e5310d8859a73285b3e2358a3c854d4a5/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/20ae7ecc73a4fe954bec1800908fcabbee33c373/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/4e9da1d64a1ad17f8f79021cfee41066b3914805/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/70d68ef9c57453f503f49676e603365e4cd87756/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d54e20f92da8dea32d97e1d8c4f75a57456f2b0d/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/b6c8cd529625bbae11604e1b73fbc6bc44aac133/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/2c3543d7357364d1be96621f8e924ba36b5238b6/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e71d7a5905b566d49b23ee89f252d4ab8990b91d/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/cb069a09222908256ca3b0f18b9b1847ef391291/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/a7648145716f1ff213e102feb9373790dbc69235/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/db8801233cfa5c9790dae82853b6420e0137739b/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/348d0e8e264b2240b465c6eca7adf6892ebbce94/
        bfin |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/d52720c25ff67ea2b06c6eb85cb9d2637f9c18f7/
     powerpc |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/1405ee1e555a013dc54d502060c8187548ccf20c/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/546f306eac26a565d3d130d099f1d0581d6a91b8/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/388ebad81d2c14f454afb01aa0d25a6bbcef43e5/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/5cf4071abb24e95983233b3ad86f2f8f1812d738/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/052e11c97a29afd7407d6dc0554c27f77b64be6a/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/a5eae07554580736decf7bc7ea3aa62e71e9b944/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/9fba77f4080bf6bc26e341f3f383cdba26c0e14f/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f1e5b0f069cdf78c9e0621cbcdebeb67bf08469b/
     powerpc | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/82cfb7451f933b222abe30b5d35d23e409a4af79/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/cb2f7008424262a407bbcac93fb4b337197b7d77/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/35a5b7b0916a6abefe317949d070728194ae61c3/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/a26363d4f4cf9fce31e141de5001e0fa0406bcb3/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/80b3eece4e6bc3c143216c1676bc3d150f00388a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/73073a10327b878210b100996c5e4da64937d315/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/8db1ce87e1d7ffa4be1125990e79c60befc94a11/
microblazeel |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/e5fffdd51bdd6962149a836af1e7a6bbc6bae20c/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/2ca85c7eddc27fa033e749240453101d2f9c6a86/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/876df7a8216d0eedd2d05f46aab52f5c846a3807/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d63a97fd39be74cbb3aef339a710dfac3dd15585/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/97f61d5e46a7f479e8de5dd19d49f7a3d84cc86e/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/ca39b5b3ef8d05466d17fd394d4d41072887f6e3/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/81e9a6cdc737321db3e089fddc2780157d84c2db/
        m68k |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/74141fb3f31be4e4c20f969203f0835ad90afb89/
        m68k |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/8a5cefd8edf2be6ba382ce1c1674e09cec1ae47f/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/23abb4de9bcf34ef28be4c173478ed6eb7b89747/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/af73da04d7ee72b91492d6d9717fcdcfa9fb277f/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/1680b65eab580cd5f2323eface980a6c6a785f99/
        bfin |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/2c3f3ca344c276e525b800c1410b41711352bf5f/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/aa1c20866fda025167b0d220b316c7d85a1b9663/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/f058058f4dedc4cdda888db2ce3470ae68e34eb4/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/91e64477864825c39911e3f3d0a2459f2987c209/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/fd4386c7f224119e6566a5e21e8b8f313626a563/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/aa79351d21cf39b6012057c3c6c07d55e2b65555/
        i586 |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/1754861457af520480cc34d7d2d0edff2868ff66/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/c5dd5e567a251908930294e7e2b23b31b1114f7e/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/fe2498b61d66a6c7a18455d4487593c6a5f622a6/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6c0d6fd66462ce479add0667b99cb0e4fea218bb/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/7d00664bcaa26aa9cf241f89708076abcfa3db55/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/9d433ddb31b9fc54c087a5e66e1e8d810663b037/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5b25ea4c6a9775b94c3e87ace7371e9ad98f0b80/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3dc9f2c5ac105ca3fd84bf58b5eb956cfdeecd53/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/07e99c63eb658d8d68c38c57a8c22d87985d29f2/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/5a5372d602079cd5d05e70c4642009e6e2f0016f/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/e3f84bffbe81a35eede701068bc617a6448472d8/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b2a8b5c2ce3d639961e374636079ef0d5d7dd431/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/1cc761d8a5715d0a2c6eaacfde7e44b225da1b36/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/aef7a05ab43aa506241205d57bc1295705095fbf/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3f225a036df996b26bd5a943bad3d5204796025c/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/d2bf30e079cbd468e5b02fa88c3e3b6371c394be/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/b35f4d731b0eae8b9cf8770c3acfb8236ab7e1a5/
         arm |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/66f586aed888418461caf4f1334ff42b5317f177/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/e9448b7c3ce17b62955f932c1ab7d14b6b3de7c2/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ad1301ccabc594333d208a414545ab8763a3d33f/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/3fb6ce8fa8c541f7e7c3f0559e85de1055476684/
        sh4a |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/8b967fbc35291a85828e17549795d6d380c37853/
         arm |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/59dd88e31a5f49231c4131b840fbf1bb76e777e7/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/08496b81ee83a7e812b8742b6617511ca4bb43a4/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/3dd3322c8edf92fa008ba0cc0ca04847cfdccc18/
         arc |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/251967eaf50fc7bf0306d8a52f5dacd48e374dc3/
        m68k |                  tcpdump-4.8.0 | NOK | http://autobuild.buildroot.net/results/76f0ca5d9d9dd859db25752f24d6c597738c74f7/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a81d8b563ae5bd40609e87d0c98469185329dd7f/
        bfin |                 tinyxml2-3.0.0 | NOK | http://autobuild.buildroot.net/results/cf3bc84cb50f873932ddfe3e7416dce5fc82161c/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/02bfbea508f0246b8dccb74dd1164147d5559b9b/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/3559ae773190d5d79de063dca460b1f8ac0d6d21/
      x86_64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/e49f575bb8e29ebaf2c8f5185ede21bb5411c701/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/fb273eb026e311222aa165888500b220347c7a50/
      x86_64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/f9ed4436ec323e258b36b221179954548982bb48/
        i586 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7f5d3dac5fb26340e7925231f014ebbacee15887/
       sparc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/8feb59b50aaf2e1dfbbd139b79596342dca5940f/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/b705d8e823e9d8f9e4f05a990375a1be0502fc4b/
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/321688e16596086d1dad6f489d35edbb7fe7a955/
        i586 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/480f529a53b321344e499f958be8e5d1d0f58646/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/eb3e3b6da5306c9e5d89f7f400c59f2de9b9855a/
      x86_64 |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/21ad9e9c724cc9999ad4fcfe9b725a20a4da7548/


-- 
http://autobuild.buildroot.net
