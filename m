From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-15
Message-ID: <20151116073022.795C5101BF5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-15
===============================

        success : 155
       failures : 80 
       timeouts : 0  
          TOTAL : 235

Classification of failures by reason
====================================

                  gauche-0.9.4 | 17
  toolchain-external-undefined | 7 
                   mplayer-1.2 | 4 
                espeak-1.48.04 | 4 
                pulseaudio-7.1 | 3 
                directfb-1.7.7 | 3 
                  qemu-2.4.0.1 | 3 
                 setools-3.3.8 | 2 
             util-linux-2.27.1 | 2 
            libserial-0.6.0rc2 | 2 
             lttng-tools-2.6.0 | 2 
                  ffmpeg-2.8.1 | 2 
               libsigsegv-2.10 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
canfestival-7740ac6fdedc23e... | 1 
              gst1-libav-1.6.1 | 1 
                 fio-fio-2.1.4 | 1 
                  connman-1.30 | 1 
                    neard-0.14 | 1 
                    pppd-2.4.7 | 1 
             irda-utils-0.9.18 | 1 
              libethumb-1.7.10 | 1 
                   bdwgc-7.4.2 | 1 
                    libuecc-v6 | 1 
                   jimtcl-0.75 | 1 
                      qt-4.8.7 | 1 
                    yad-0.31.2 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
freerdp-17834af7bb378f85a3b... | 1 
                    ustr-1.0.4 | 1 
             webkitgtk24-2.4.9 | 1 
       openpgm-release-5-2-122 | 1 
                iproute2-4.3.0 | 1 
                  weston-1.8.0 | 1 
                      pv-1.5.7 | 1 
                 lvm2-2.02.132 | 1 
            libsemanage-2.1.10 | 1 
               libcap-ng-0.7.4 | 1 
libsigrok-fe473123ba836445d... | 1 
flann-04b4a56533faf8c8228d0... | 1 
       kompexsqlite-v1.10.12-1 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1e549dea3ef96b4ba83bad1db76c4b26a4d449ab/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/eb89bc235b5f8936f154221546836d9797c19e7b/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/687597c7b792fee446f7543ca88370aecb0e2d1c/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/691510aaababce95a47c83effc717952d62a89ef/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b67fc6fd5d19e935cba64db0fef1dd03f7f75674/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9536e6973308f5cc7155c95243e9d173ad12e8de/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/47f8d1f64231e927a49d405077d86373c5ff715c/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/1961342f225340505eae68e3c34e8d09dca25452/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/3f21546e7c115ec9d3ad01182571a51e27b6c8cc/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/4691823e68ba5f849a5e8110e05e00141c743c23/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bef3ef9d1562837f474e9a0082dd420215a9cf6f/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8ffdfd208b21af18b6f3a0a9f1b86ab628711f44/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/c000a9cf7a79865fa35a655dc522df81a5c82877/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/628de7807c0db88115e2ec244fc22a9e3f25bc66/
      xtensa | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/52aac53c796bf823e9541b2d63b0a66bd06bdb14/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/387a1e6aa26465ad9bb0f38442d35aa3e364366e/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/5739f391785c623d3b1cb6751afb1d5e35d74bc6/
      x86_64 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/074d3a092424f28215c282415dc90d9b2d9ba6e5/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/91ff21ec79075a3a8b7e176c777500df1cb97497/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e79d29f17038984d4d0fc8267b6cca7c185b4696/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a9a416eab38e32aa232d120f342f67c4a6772dab/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/7ba4e8ca398da5aac8eb9147400c92d7eeb08fed/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/cd2e55e5c57c12aeec48c2df63902c4549282268/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/29dea3bc0d903ccf0bd4d5c4cf9d363de22ffe63/
         sh4 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/7c3d53feab4420dc86bb3e4cded11502341656d5/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e6f208e09ca6d45d1311ef519e908fa547f0690b/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/9e0cc04084ab9d48c365913af01e3ac30538cace/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e9d8d1dac25813e7c312febdd93ae57f2484fa7f/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4e5144da2986b5e9b255656c8ccaede39d28dc03/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/35c28f6d005c75d94877e455df9f97a44de0aaeb/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/407d635f42269d841bdc61a8af3adb77293b73b9/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e8c063f2ef0d03991bb020c0466556387025cb34/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/177fb8a2a1a742740847617efe163e7e23734fea/
      x86_64 |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/b6fb73109502583e3f8540a8c0f2296b48cd0f37/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/f901d587b8b84b07ae186ba8987aaa492c82f71e/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/cf2becda8d9d4e932b418ff9e061f07baec338c0/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/40982686f194ae8b06382a240a29ef92a2d6abe8/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/78daa9ed3d94d1bd4fc436824f66993f482ba6c6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/bedc364592457f26a3ffcc5068e889bd2cc8d3fb/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/a35a39fee7c24abe0bbe12d71bebf92005367391/
      x86_64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/6b2bc0683cbcb65a4d65ae800b865ae32551378b/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/fc51c9a429b421b604f6dc686aece9a4061b2332/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/d491cf54f6c1da0e9fb8c48a7a99d48af69d7a04/
      x86_64 | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/5780dfd391360282449a74832a374aff5fdb5c64/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ed7f4ee37942eb14d2981662e2097471d2a8e114/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/38d27170ddf1792fbdd946d966dc5d25ffae993b/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/5c528a682c1152b1c76290881f55e4aec89b55ba/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/b8c6e0b91501635de54e045416fa18ed1564c38c/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/380c71689569d1ab872a26b7fe805277afeca149/
       nios2 |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/64b916a0950fe4def24bd3aab8ba2e659269a9e8/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e7dd55acdcd6dc22cf99ea2541ea70c0326e4180/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5641bdfdc0e6c77c976874d4e9ad710fbde6b3cc/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8131dcf4919f10377823f1468cbc987bc38629ee/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2364d8cf2ea1e7d5566c20c56028904ab06d1f85/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/198f09bf7b307aaea1d918cb82bcfb2a3350ca10/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/f7b75518273c2ee44c15c56d775f4c468788f0f2/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/736fb7c92f97e30f1a3916c4eb427d9482e4408e/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/d250f50f267567487cd9c5b5881d1f47f5d8f2c1/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/945509bdde23e98279aa58c227b4e57e90b9a326/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/2265104e7933b02e441e37dccef1d240f55178f3/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/e120e88f7577c8fff4792d5e38c3d1b0c7e3c8ed/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/443ee78024b4221278665b6549a6017732b998e8/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/18070b1bdd4bf806f00cfab7e2ece539efc17ad2/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/32556451ced2e134a71b59a98a1e07007c82c2a2/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/91e5cd3a6db20f5ccc51b92f390b55def2b6fd02/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/b44161c2b467ce66f459757a71f8cb42927e1951/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/19a0a1d4ff40c6dc7f177f57de46ff074d3c29bb/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3fb3c5268697c7ea58f383adf0e8b29abdbe6ab1/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8b11698facb86ec1e5f68196e160b765b0094e0f/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f77db0705bcb43a04badd81ca10421c054b50861/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7633f159fe6337bff7bfa0d3f465eff596fa628c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d658c2f84ea33b5c4ec7954c6374243f14ec9f0c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c64be2850ee8bf470b8f63158b5a2d2539e516fd/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/2c1df7868e3c163c3cf00669cebbf0d52ab19840/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/cddd60bad4cf1af76ff1463159ec017275dabe77/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/1f6e9f097c1fccf4ac49540a86e419acd0670cc7/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/683cd688950ca66ca9c5a14bda4323dd495aaf24/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/4c77bb1a0fd38a179b8ccf77913d024b817e4d77/
        sh4a |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/7e81e952cbabc3c44d36d2d8534a0c8b3ff8783c/
    mips64el |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/6075c018e24060cba84370ef9764d14d7028b487/


-- 
http://autobuild.buildroot.net
