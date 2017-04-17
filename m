From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 08:28:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-16
Message-ID: <20170417062830.576BB20858@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-16
================================

      successes : 171
       failures : 55 
       timeouts : 0  
          TOTAL : 226

Classification of failures by reason
====================================

                    mpv-0.23.0 | 19
           uboot-tools-2017.03 | 4 
                    mpir-3.0.0 | 3 
             rabbitmq-c-v0.8.0 | 3 
kvm-unit-tests-5731572b2ac2... | 2 
                      qt-4.8.7 | 2 
                   trinity-1.7 | 2 
                 xenomai-3.0.4 | 2 
               acpica-20161117 | 1 
                 binutils-2.27 | 1 
                busybox-1.26.2 | 1 
                    efl-1.19.0 | 1 
             expect-2014-05-02 | 1 
                    ffmpeg-3.3 | 1 
             fxload-2008_10_13 | 1 
              keepalived-1.3.5 | 1 
                libmpeg2-0.5.1 | 1 
             lttng-tools-2.9.4 | 1 
make[1]: *** wait: No child... | 1 
                 mplayer-1.3.0 | 1 
            netsniff-ng-v0.6.2 | 1 
                poppler-0.53.0 | 1 
rpi-userland-f0642e3b58d8a1... | 1 
vpnc-b1243d29e0c00312ead038... | 1 
                     xen-4.8.1 | 1 
                 xenomai-3.0.3 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/c97ddbf3f3a31965a12951db3122a7b35d6f3d18 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/e5d18ce8226c700efbe526b6f7ffa2079eece1b0 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/eee5fe795be092d9f3da93003052efceb373ee09 | ORPH
        i686 |                     efl-1.19.0 | NOK | http://autobuild.buildroot.net/results/54afac8148cff5f3c17e83f80917fd9006948fe0 |     
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/45514e25ac605482d4b6fcb74777ed4b246c129c |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/5a2a7f24c8727f7f3aee2ca72b4472f261610c27 |     
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/9ce1b1f333a3e3db2c555c52830bbd6743c2965f |     
        i686 |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f5cbb728d5f2848d001f598e446738a003b077f0 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/aa195d867133b855466c4aa64ce4ce16b4f53e5a |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/256ceefa67c2be8c56c2125f0c00fff03d8eadae | ORPH
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/ff08e641adbb47ea4b4e8487c3e0b77fbe122e99 |     
     aarch64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/4a661ae261e785233cf816125f304682e3176517 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/a0c14b093f3ee0d1c8547b9a1aa0e66eaf153a47 |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/f0b522f968fe4a03b7b69a1c568719252b625809 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/b4c65ad8f35299588de67917be5d020a7f641ce7 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/446833c0f8da2090510c25e51cfba955eb2517e8 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/959cd453902bf3f9577870f73653be65b9cf2a63 |     
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/921320497586b341e26fe098f67e16c7fd8a5021 |     
        i686 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/f432b0ce43f831f071d5720144d641c80c10cb1a |     
        bfin |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/e892a537265ad7259024403a0bb3ca5da85ed096 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/2b7a966cd15d24a5f140713a29693e2b55846554 |     
      x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/c5fe3e16ae7801f410e3c06018c8d36168c25a46 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/948cbe5d51722a81807624831b92f2fae3eb7ff3 |     
        mips |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/84b7200f8b850be3439b394a7c2bf99a3c04f3f3 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/47b5ba601cd373c90b62d591813ffcd214d14921 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4ca43a9b62829df424e92b80dbf571db6523d38b |     
        or1k |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fe197bee251392cc8698a82f20a02b1caf3aa48d |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/adb3588f4f21ce0eb84eed469c3dcfc72362134b |     
        mips |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/97a24f9c0c07186ec246e74e5628fad4e3f30956 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b0439d316eab6c993e1a08631f55d9d248fc94f9 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/5ebaec1a5c7f06eafa1220e9a0592ae16d919f38 |     
         sh4 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/082e90d09ead0a8ba91e1d86ad5f6db51b0fb002 |     
      x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/dbecac0b1b7f2c62dfeb7e727b774030a89355f0 |     
        mips |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/c65838884f76494c3d760635b26807880bcfd0bb |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/7ba8ec72dadba4496ec60cd032526adb9779c739 |     
      x86_64 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/0efb90d69fdffafe0630e6507d40198bfb1c5818 |     
      xtensa |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/41162d8a3e837ace603b9c4306e30de14a189395 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/61f2dd2b436bedbe9f35e180277fcd9680635fb2 | ORPH
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b3792d5f5db9c2e302e10c684735d48ef0fdd4b2 | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8f89051b0f4c04c8a1e4f18c472b7434eaeaeec7 |     
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6c9ae9b690758e2552604e7ed3030429b520c860 |     
        i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2262737a2a98b308a8279fad7248d72e5a025f2c |     
     aarch64 | rpi-userland-f0642e3b58d8a1... | NOK | http://autobuild.buildroot.net/results/8f6d4ef497498b56231df9842d9aa56d70c01751 |     
      x86_64 |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/d8c186a9d9138834462d9acc12d4e59e1131947a |     
      x86_64 |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/80c01b2bda33fc80bd1c757bb3fba31866bb5295 |     
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c598bffce85d3a728a8a69fc17d09e9a6aff9a0e | ORPH
        sh4a |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c05b80725dd17e68c0d3276f6dd9ea7c416825f2 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/8794664d7f8ba66fc03981e5d8837d6d15deaa86 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/cd0f1e182cc5901e55a6ba8f6f68b17da5ba6a08 | ORPH
         sh4 | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/be0e9eae7cec19e627f5008a07ca892ed718a24e | ORPH
         arm |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/1aa1303f60372f51aa5a7eb18caac4a5b5c1d9d4 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/461e4fe1ae4ed153f47a826c13b7a1cf65dbf639 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/deff312be12ef9c90514a9d8b6af3d2b54a9a23e |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/11c637dcc8910d1f806d834dd5b3e54b23fac5ca |     

-- 
http://autobuild.buildroot.net
