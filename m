From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Apr 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-08
Message-ID: <20160409063024.476DE101EEF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-08
===============================

        success : 132
       failures : 49 
       timeouts : 1  
          TOTAL : 182

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 7 
                 mesa3d-11.2.0 | 4 
                    cups-2.1.2 | 3 
                  ffmpeg-2.8.6 | 3 
                  connman-1.31 | 3 
glmark2-499aa81a68fb4c8aac1... | 3 
                   mplayer-1.2 | 3 
                  trinity-v1.6 | 2 
               valgrind-3.11.0 | 2 
                collectd-5.5.1 | 2 
                   erlang-18.3 | 1 
                 libtpl-v1.6.1 | 1 
               syslog-ng-3.7.2 | 1 
               netplug-1.2.9.2 | 1 
                    mosh-1.2.5 | 1 
                 qt5base-5.6.0 | 1 
make[7]: *** Waiting for un... | 1 
           quagga-1.0.20160315 | 1 
                  ltris-1.0.19 | 1 
                 raptor-2.0.15 | 1 
             netbsd-queue-1.70 | 1 
                pinentry-0.9.4 | 1 
        host-gutenprint-5.2.11 | 1 
                     lxc-1.1.5 | 1 
              rabbitmq-c-0.7.1 | 1 
      ca-certificates-20160104 | 1 
        ltp-testsuite-20160126 | 1 
  toolchain-external-undefined | 1 

Detail of failures
===================

      xtensa |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/af9cfe869263a52e6d7e9a6bebdbb02e7e5253d9/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ac49a19b80ea5cf69ac415a774f522fd06516489/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7fd25867851ae7174381bea4eb2d3a3eaf92d038/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/28a5024cb2af4dc825837ff0a5f4f6a9693950ed/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/537c0a9c468b34f6d43bff1111a271bf596b34f2/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/13e99e28e1ead3f4391c758f9bf2d2dea9a1915c/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bd1335c8e07cfbf176a609a8b703a64f742bb239/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a8062231d7ec03b4a20fd200734e7183fc012f4f/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6dbd3b5eb60bc59f0042961c5aebbc4aa5719d1c/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/33718934153f2d0219da4d2c4ea158363d16242d/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/16324a71a68075f1335c7dab48459eb7a440d224/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/55a157fb108c679f3ee7d51e165294604c3d0ae4/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/3a038b6d1f3ec432729fcaff2294aa3ca2940a1b/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/4594066f911461b03aaa4589f058907e83060fce/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/89f41ea6289b762b0c5c0f94e7a0695d5b3227b4/
       nios2 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/3943ebda9ca559a72cf786562ad45979ad0e213b/
      xtensa |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/3b36f2f8b218ae5bf6ac19a9826a95534d936a6d/
     sparc64 |                  libtpl-v1.6.1 | NOK | http://autobuild.buildroot.net/results/a58a9d8080b6d93e685601123a4b91070da86c3a/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/fff6faddec1386e92380207177a7d67b135b64ac/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/91d09f0a5a8029081fac0256d81868e74e6d5d3b/
         arm |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/fd23bd4928ee596ea51675d4ec1183b021219a0a/
microblazeel | make[7]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/5fb05d5bfa43522e959da7b99f9d837c210369b5/
        i686 |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/66d45e34a38f15e391500ea7f7036606bbaf2655/
         arc |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/dbb153139e343a5a50885f9c43421ffe11d7c5cc/
         arc |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/02bf8c31cc366f5cba7c82e1e83a6cb31e0573ba/
         arm |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/70f2b30a73921fade7f03bfc0a427188e721a2e5/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/7e66bb6c9f37247bbf01911afe20e473610785f5/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7a81b934c10d58c24db7ffcacf3b51483f62eac7/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/40e5752f91a5194fdfb86462bd8d1a6ae63c7669/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/941fd9afd9894e7c9b030ed99a825512a1e9211d/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/7f8bc2699526028809162cb4a71d8b065e739cd1/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/e1c0910f26f5787a6dec7b79997f864a43e984ff/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/229c9728ea2916ddb40fd8e7913cd6a590fdb04d/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/07c675ad7083d687dc2c15ce4c30935d1f96eff1/
         arc |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/f50be43fb7ae38aeedd4fd6dcdad39c8b281a677/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/bda8c832f99f9cf8872f6781cc02fb40d83a5a9b/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/6a925faff52b1f1dac6c41aed5dc46bce79b1f92/
         sh4 |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/7f0558d048290d8371989fa728a36589ff26c3c7/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/410bc4e75aba96fa1ca35a759f897ae6f38384e5/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/af7ff744bc6039e12306ee3f600a62eff3f07c23/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/ed86d3030329c6430f83b4cf2b64e4d5bc14d2ed/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1b09558282fd29b30df15aeb6f79ab48c72c9738/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/898f4961783408673fbd1e584f0953abddfa2da0/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/88668e40d5ae25bcfeda6b6f3914cf9ac5153ef1/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/33d3d7a131e7d7a98d10e9eaded5faec744d53ea/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f61740bafbbd9d586063eb854aad38fde0e3369e/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/43565e5d68d48164a44e5dab41d111dbe904297d/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d3248e42143276e2c8a415761f064e79a8f98da2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ddf7eb2cf641f562ac2062fbe9bee18b235f9fa4/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c6299cb399ac0e719c368b1e25ffd08fde6caa4d/


-- 
http://autobuild.buildroot.net
