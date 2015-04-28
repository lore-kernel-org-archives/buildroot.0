From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-27
Message-ID: <20150428063016.1188D101220@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-27
===============================

        success : 145
       failures : 58 
       timeouts : 2  
          TOTAL : 205

Classification of failures by reason
====================================

                      qt-4.8.6 | 8 
  toolchain-external-undefined | 6 
                  dhcpcd-6.8.1 | 5 
                libtirpc-0.2.4 | 4 
libubox-5a0bbefc8fa44044625... | 3 
               libecore-1.7.10 | 3 
                ipmiutil-2.9.5 | 2 
                host-gdb-7.8.2 | 2 
               dvdrw-tools-7.1 | 2 
                 leveldb-v1.18 | 2 
        gst1-plugins-bad-1.4.5 | 1 
                     php-5.6.8 | 1 
                   bdwgc-7.4.2 | 1 
                 python3-3.4.2 | 1 
               libgtk3-3.14.11 | 1 
                    webp-0.4.3 | 1 
                host-ola-0.9.4 | 1 
           libfreeimage-3.17.0 | 1 
                  boost-1.57.0 | 1 
                    qemu-2.2.1 | 1 
               libsigsegv-2.10 | 1 
                 civetweb-v1.5 | 1 
           aircrack-ng-1.2-rc1 | 1 
              xmlstarlet-1.5.0 | 1 
                 opencv-2.4.10 | 1 
                numactl-2.0.10 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                     vlc-2.2.1 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
              wireshark-1.12.4 | 1 
               gptfdisk-0.8.10 | 1 
             armadillo-4.000.4 | 1 
                   ncurses-5.9 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/94e59fa5a4640837391552a39754d5b2348127c3/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/d06a2710e8008c0718a9dae11a5bf02258232ebc/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7e5f25a4f851f67389ad4a3e3de68f15264b224a/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d0ea1a6ddae1d5eca35f3834cc1f17132f99c62a/
         arc |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/0a555a4ad0d100a7d402908b1f26d213de0ec127/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/523858fb930e74fe28f24989ff0697693b5fdd67/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/036ad866b594dec4a55f6d1da255ddbe2e931462/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/265ccbe0da68556c82f202d2d4eec0c1218e3fc4/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/a01793434bd6c39d1fcda9d184d3965e21f42e37/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/80476b6cc7f5ec77e4df9421cdddb8196d96eec7/
    mips64el |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/b2b836b095251950e3229b66d6ca9faeaec45e72/
         arm |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/a8a17dde5a1f6c5eb5ac2f178e92a706d9cc16d0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a69cec53220a8e4624092896387309f7fa445fec/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/2d09526e71ef4ae7617a07d063307c47f470b751/
     powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/33936597919c286f86c804da084c366d9fe5365e/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/e235f06b021bbbe9db6e6dc635e35cc682ebf6b5/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/ea711c5b4ea8b7f52f4ca4187ca23f48ff564db9/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/b26c5822e29388b27770fbb4e11cb42d7a7ef667/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/3d1088dd7b0411dead117a16645635acd28b9a24/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/87c2abf567a8b9b764f772ac9f23c333bf268da2/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/c25fcb2259ce855eadd9ff98887db31ff4ee2b3f/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/848580ee795e4584e0510c8ad73ea32bb5d524af/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/25b0fd310069629411d69669401225953ebeb085/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/4a92915500bd0f193de2fb2c88ca3e13dabc3829/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/0a93a9c1755eca548a28006fa8f78c8ae1c19e04/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/eb58413cb91b8bbab9e12c99dfc029fb8b642f15/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/34ad38694c02d2b2b4738012c32fac120fd5c102/
         arm |                libgtk3-3.14.11 | TIM | http://autobuild.buildroot.net/results/e20436797fbb79b9fe419084a38751f5206e62c9/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/dca796ea755cbee344bc684649630ea7959883c2/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/7258339d030e805e037dcb54ecb4c4ed6d7dec96/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9667b2515f8d9955b1fc2c6679e1006d9bd6aee1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5d6b76430a07271e286ec8a522c3201426340adb/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/765d3bee560a7b3650c7217633902c5188b7704c/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/50bba293773562deee463a66bb206d089638e61a/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/bf8ecd46e840de7642a1848883fdc1e1b8b825d1/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/385b97b52e3bad498be48de6265ae94108893c0e/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/f471fbf2a2371d5b202ce8b0c1f9387cc7e19f25/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/35473061323912fa2a5d35523ca330acbf1188a3/
      x86_64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/af8adc37e69e1dcf35002f5cebf18904b45d3765/
     aarch64 |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/07fde8600fde2804e6786c40940fd73525212dba/
      xtensa |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/e0db38ca12dbe664d472c4f6f3f1ade4150119c3/
        mips |                     qemu-2.2.1 | NOK | http://autobuild.buildroot.net/results/4062cf095b54acb087808607411bad11e5a2d68c/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/5e3744e76a2eb6b4f16f524a2d0398bf9ae1204a/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/96b3414eb91be17784cd470b676c6d276ef1df6d/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/99aebc9504c6e61776de931a23013d6cf079f8df/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3679924a2421843046f70f8291f14d48b90f7740/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/d0aace43a3c33327f51ecd7403786b8f495558e6/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e474adeb4c69406f36e823d45962f4a730e63bff/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7dd2c28c9257cf7b44bed6ce864a4081ebdcd5b0/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/379cc2b1a02f6ac2bcd4b477b1b8a97586354335/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/976ce2a8153d64c264dbc12a76250e91c90399bc/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0f9f2a3e5e101b3b30d18cfcb126454c657d0c60/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/89deedbf94d496a90c8a5ded7bc635730eca03d3/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/73273284bca45289839d3e8cb78f541e07b302a9/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7b0826229c10c27cf75bb38650e613e1f3149f50/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d7ae2f13578dae3e05ea76ce394428a03f72eaf6/
        mips |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/d158095d4caa8f58f1d205aeeb1ae707a1311ea5/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/6563be62557ab6c1bdd4152523774316dc09c9ce/
     powerpc |               wireshark-1.12.4 | TIM | http://autobuild.buildroot.net/results/4ae0e8f0606e83b60bde0670f356a71a9dbd16ba/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/83fde0f5dca48e141696e5b9fb37469c999cae25/


-- 
http://autobuild.buildroot.net
