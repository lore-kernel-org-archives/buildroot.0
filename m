From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 06 May 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-05
Message-ID: <20190506060044.CE8CA85CCF@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  27 |   2 |   1 |  30 |
      master | 250 |  52 |   6 | 308 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 14
                cracklib-2.9.7 | 10
      gst1-plugins-good-1.14.4 | 5 
                       netsurf | 4 
                     vlc-3.0.6 | 4 
                   netsurf-3.8 | 3 
                suricata-4.1.3 | 3 
              qt5enginio-1.6.3 | 2 
               wireshark-3.0.1 | 2 
        18xx-ti-utils-R8.7_SP3 | 1 
                   bullet-2.88 | 1 
                  libssh-0.8.7 | 1 
                          opus | 1 
                    postgresql | 1 
           python-numpy-1.16.2 | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 
                    strace-5.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

     nds32le |         18xx-ti-utils-R8.7_SP3 | NOK | http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12 |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/c74e5eb6db1592b6ecda9fd6240c6af4a2f523da |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/69375a9a6f308989edcffa059996e2306e209640 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6c60548a1e499195aa86c0d9bd066453298d7f10 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/e2da674ee7dba3b05fc97bf21213d0d663ab2187 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/dcd3670a7aa473bdef29cba97f48d67c763e4ddc |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3d65bf2d93daa02a7537bed994584cdd3058bc04 |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/084429324ee3898dd913c77ebec04d37d6810f29 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ab77603dcf608ab82f2ba096b67ccacb6a15220e |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/24b9cfe06d05b370601e130222ea5a1a41d36784 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/e31b25863d09bd4a96cb8d4faf70bf42c81538d7 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b74afac6c1632fc7196ca54f3ac02c1d0645506d |     
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7160900045bdc187953053a3f1c35ea5e3270f8d | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3fdd274705fe59eaad97ef2e870ae4bf602b173c | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/899cd5adf93986fc1c138f2fa4cc3306bdba6078 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8000089b2fade42c8417b7112ae92d400ded7627 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ca59e173ae4b7c1b888d78ea1f9ccad1b305b0b1 | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/eb0652dcb724b775547324dc9ca2d8bab17f2a96 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/618272986fa3cb222b9f6276b3b039bbd7f0bae0 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b9c4d39ced9e3babd2731770afa21e8778b51435 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/db9fc52d0c79697552c41179caee86cbb55ef3c6 | ORPH
   powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7ef01c213e57222ccddcd399422a7ef9a8cee8a8 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/57e492656c28e5062d99e0a2e01c3cdb1dfa5467 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f89db8c8da4394b385cf50a1e875905098c88d3c | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fdc98ae878be75bc5c79ec5e89594624bc486742 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/174419387369ef98cd81ddf13a3124a78e5b62a3 | ORPH
     riscv32 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/57709397bc46da1ed54818e61f20e9e4259d3a4f |     
     riscv64 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/e7f20795adb47885c3e0bdba6d17c54f17fca43e |     
    mips64el |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/1e058ce46393c3323f1da59bc5deba618544ab12 |     
      mipsel |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/663ad730dccc8646254489eed409d99a53ea9078 |     
         sh4 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/459a4378b6662b5476a0166caef372bd31f1ed9b |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/fe34b5ee87c36eaffd7ef966b12294fdff91d700 |     
         sh4 |                        netsurf | TIM | http://autobuild.buildroot.net/results/5afd75b9a4efbc7eb000e8fc40cf661bd06517b0 |     
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/c84607325ab3d280d53f207d915d0c55b240446c |     
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/c9bb295075d8f700a185f434ac64b7f17f64ea7a |     
      xtensa |                        netsurf | TIM | http://autobuild.buildroot.net/results/20fa54641fd281419eebdf0b5a892b02a6d72dcb |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/96819e9b4d509510db584154a6b9a9f78894e67e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/646c0094c9cd6bc1c60c9325b040bbefa53b8c0f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6ed801a99a48994ec007c5653e248c701accf722 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/48a4f39d8b7f57ca1647db97e7ca55c768636b88 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/547b1766c8034404d3a349321e2ba377b524826f |     
     aarch64 |            python-numpy-1.16.2 | NOK | http://autobuild.buildroot.net/results/3ad6fb200b8b55e44847ac89ccaf838033b4c592 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/4915273c1cc693cd554fb6df2e57ad9ea59590ac |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/42c2b3cbb7e38ce98f039d87e2b47f8e86e02869 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/0c08d49eb1a8167300479fb139f58cc1670c3948 |     
 powerpc64le |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/4e14621e8bf16534b5328f915952ba5caaa41da2 |     
    mips64el |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/937e6b5fcb4a376c8121ff944f87735981a1a8bd |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/ee0c7d3849b087fdc6a17289993809d9fde8bc3c |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/478b9f18ba780b90709fce4885fb709253c32598 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/938fb7747a8bdbfc816f2695901c2c65f80a0b7f |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/2a2a1b8ade1d2714c689695f92c131e3cd3951c6 |     
     aarch64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/86466f2a8cf819ac5988147a69b0a9eb495ba9ce |     
         arc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/3e727c9381f642ddc9a9af2ddbc4b8670f613ea3 |     
     riscv32 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/875bb9505e4ce80f5fc81eb7bcd70a4e0a3bc211 |     
 powerpc64le |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/1164c4ba09ebb3316e24ef7900c22d230517e1f7 |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/5b0110bb776d3ae009d1560133965eeee07a61ff | ORPH
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/1d1c1ad1b8ca30d3e9df1675dcb25929f3723cc7 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/0ba8b1bb4ca8336c7d9928701538762b5f8ae62a |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-cryptopp-8.0.0 | 1 
                   netsurf-3.8 | 1 
                    postgresql | 1 


Detail of failures
------------------

         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/e4a6da8186f2633e7ec0a678379977bbb12c9b26 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/83a60c73708cc55188b13c6e1030434adc3775f3 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/53c270c696ee999d541da0b09bf6a215e5335e9a |     


-- 
http://autobuild.buildroot.net
