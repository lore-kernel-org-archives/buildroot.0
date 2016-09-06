From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Sep 2016 08:30:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-05
Message-ID: <20160906063035.87BAB102741@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-05
================================

      successes : 251
       failures : 66 
       timeouts : 5  
          TOTAL : 322

Classification of failures by reason
====================================

                    mpv-0.19.0 | 11
                blktrace-1.1.0 | 5 
                libxslt-1.1.29 | 4 
               binutils-2.25.1 | 3 
       amd-catalyst-legal-info | 2 
                 jack2-v1.9.10 | 2 
                  libcdio-0.93 | 2 
                 lvm2-2.02.163 | 2 
make[1]: *** [libavfilter/s... | 2 
make[2]: *** [libavfilter/s... | 2 
               wvstreams-4.6.1 | 2 
                     xen-4.7.0 | 2 
             core-dependencies | 1 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.43.2 | 1 
                  ffmpeg-3.1.3 | 1 
filemq-e59951489045825d6fc5... | 1 
                  fio-fio-2.13 | 1 
                   glog-v0.3.4 | 1 
                     gpsd-3.16 | 1 
               host-qemu-2.7.0 | 1 
                ipmiutil-2.9.9 | 1 
              libarchive-3.2.1 | 1 
                   libva-1.7.2 | 1 
          libwebsockets-v2.0.2 | 1 
make[2]: *** Waiting for un... | 1 
                 mesa3d-12.0.1 | 1 
            micropython-v1.8.3 | 1 
                    mosh-1.2.6 | 1 
                    mpfr-3.1.4 | 1 
                nodejs-0.10.45 | 1 
                   ntp-4.2.8p8 | 1 
                    ola-0.10.0 | 1 
                   patch-2.7.5 | 1 
               polarssl-1.2.19 | 1 
               qt5base-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                      tar-1.29 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
x264-3b70645597bea052d23980... | 1 
                 xenomai-2.6.4 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

      x86_64 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/f30fec6dc63320c1e879a8e5090c3906de71c64d
        i686 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/4f1e9b4bf43add4712e82d4a58e633abb2a7d2b8
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/bbf1711184eee3a246b9a2a3d863976cf8a9041b
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/4b6ec49260a22177c866f8dfcffc9c0e8920dc7d
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/91155e175f22a7e92d03a0306b845335bb7cb0ac
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2d4f7cd65cc4ed93ee959d801213fb23b23a0822
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/52a60ca5e9ec70a0af4e58d267e754afb585aa04
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/abe098aa3fd68a1df27edd0309c70d41e555942e
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/32c72dcf9a9471f7a6dc7f00ff6fe1de9246b58b
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7830664975b1a84df4ce00ef90c5fd380f4d7938
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/196404bbb6df7201900f4fad08d2256c0a502270
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/964125d4182dfb32f98b200591283105db150052
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/0eda232017bcc10da182cd5782173cd6aa647117
         arm |               e2fsprogs-1.43.2 | NOK | http://autobuild.buildroot.net/results/83301bc1b4be4130336ca101ed80a5cc20925f38
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/22a9769d83d2a398bb6b264d342b2077c41c9cc5
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/1310c9d2ded5a39f4472779875617052757e47bf
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/c72c5e35f464d05795ac1e2cf5b2d516fad3c57f
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/e48eac9397ad160eeaeb0efe26486e07e2831a43
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/69544562c94286851bf801e08952ca48730ad56e
      x86_64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/d33794676142f6b2ffdb4855696ccba624dfee1b
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/bc3120a45a925d4703dbc18331ca477b73b312d6
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/19b819903b4300de4143e24bc54183143364faae
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/487568952b4f8719e63b4ae78b2b7876cea8dcd7
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/09542e264c97c02875a96b34a2fa6b18c4cbebc0
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/ad446b74cb7da43c95edd933a544e71aac2ad064
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/50a368057dec9b07c51fb75ba00529493c51ed62
microblazeel |                    libva-1.7.2 | NOK | http://autobuild.buildroot.net/results/1749e0a93e2c74bd08c8eb3b6593033b78d94530
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/2dc42a97fb2403c16d36b796b5f61b0194ed7a3b
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/0cfa43b1bdaf96b84b135421a70b53beacdeb3c4
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/ab5ade2b596cf8ab1c5e090cc04424ac5f17cd9f
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/427c6b066b7d1ab98dc532b43b85c9587349809f
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/f31d628e1085f8c2ad07cb2488496e6f51659026
         arm |                  lvm2-2.02.163 | NOK | http://autobuild.buildroot.net/results/ae24054688472a8eaf5be1d5519408def9752907
         arm |                  lvm2-2.02.163 | NOK | http://autobuild.buildroot.net/results/46617237f16ae32c8bb318cdc61c9b40a5ef2d1c
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/83f63c062ebed6b84c8811210eb0c1db0885b1cd
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/0a4a6b37841afe79ee757f4a98f3125ff6d0ef8a
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/9b7ef36bb34f38e6ff29d324f847e81e58e91865
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/9836a7cdb48a3d4768c710cd7787f67bfbd32566
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/b93e853754a51a80bba2ada10c630e40ec969524
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/2f7ec21ab02ac95f8c45ce37a873857cd6b0d965
     sparc64 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/2b6fc56b98474e66febb673a14a860bd16746172
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/c91c23aa17ab619e7fa8ab159da04d8dbfbd3ae8
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/7ae04a62c6aaba4ec2ab06eb248edb2a4f42d9bf
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/9e449ba22435535992141a48a5d1c4a92f1535ea
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/2f0357c31e255a5adb11e24676aaa3c6f5c59461
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/3dc7bcfeaca36ccab100d8bbfd61deb31ee44607
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/497c931715dd225cd86dc4de3ad21ea984178945
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/34e3205dbe97aff75bcf0c420d47829aa0af17ea
      xtensa |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/d927545ab8c5ebec1ad8380ab0de3c6133410f17
        m68k |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/f01efa01636bc7afb8167fcb8227ee9e90ef4bab
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/1735839122b7df8345017936e73fe5b8f75eca74
        sh4a |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/87027d1cb9d49db64110ed07ca0779508d314e09
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/18bdfad1ac6c9170aaca28c09b049e28e52b0de6
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/72d66fa1767fb8323ea02af9638d9142c5ac0a7d
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/e711dffa676cd4db30fbaad0d664b29642cde53a
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/2abadcda251536c34d6bebbc46f72186ed69e6a3
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/0579abd52c63788a75d124cb91bb449cb6a44914
         arc |                    patch-2.7.5 | NOK | http://autobuild.buildroot.net/results/e5a8aef59dd3d0fd811fc2d694ea840e4684aabb
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d5b90e529608ceb5f8214a2951c631300edb399e
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/ab8b0ee19ace3256ba4a608fbd34ead8f3d83f3f
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/05dcfdba88a65325b706fab9d3e47c03e5a59c7a
         arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/6bcbdebe55b93a50597fb57567af148d66ce6834
      xtensa |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/af13f6d664f25824727165fd641362b6b79ecb8b
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/e0c7c8cef7fd876a592eb2c506fe676d0b8f969d
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5c134e1841cf33730375d057319883fde4a9fef2
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/8119b858c6416bb84577e72bc8f32d51bd51e4c8
        m68k | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/464b5fbab89de873ca740cf9060ae09711acc8b0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5d5c02b7966d2f441498d6e1155df7801126973e
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/c2a640b7855e0347a3e411482917ec29d2717c70
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/fcae0611ac87204ab68d6828276b635d1a31a178
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/1b85c287802ceb673092fa771a727130754bdbb0

-- 
http://autobuild.buildroot.net
