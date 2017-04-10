From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 08:28:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-09
Message-ID: <20170410062846.0862F2084E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-09
================================

      successes : 203
       failures : 28 
       timeouts : 1  
          TOTAL : 232

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 5 
                libselinux-2.6 | 3 
                busybox-1.26.2 | 2 
                  readline-7.0 | 2 
               acpica-20161117 | 1 
                 binutils-2.27 | 1 
             bluez5_utils-5.44 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                 libdrm-2.4.79 | 1 
                libmpeg2-0.5.1 | 1 
                 libxml2-2.9.4 | 1 
             lttng-tools-2.9.4 | 1 
make[1]: *** wait: No child... | 1 
openblas-f04af36ad0e85b64f1... | 1 
               qt5webkit-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.7 | 1 
                 sudo-1.8.19p2 | 1 
                  trinity-v1.6 | 1 
           uboot-tools-2017.03 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/f7b204ae89e888962309b3f3b59b6407975cd552 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/15b3b8050b55afc1fca9decc46176cc067f5aee1 | ORPH
        i686 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/7a0f265398ce1ae31358fffc2e7a24d5aaaeb56a |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/d96382ba6fb62c1baf29f828c37eef17898085c9 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/8bc0b81ab298685f3de3defdbcd873c6d208e571 | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3c5d061bc7b865d7ae36d1a8618c5dddee36f38f |     
    mips64el |                  libdrm-2.4.79 | NOK | http://autobuild.buildroot.net/results/ebb52df14da17713b4472dac20c2814a88f43536 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/318dd1a396b10e7655e0e9b290721fa7bf7a7194 | ORPH
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/83449b6c29ed962f85c69a5b8331461fdb38f74b |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/3a8de250c432c90308a9e65d2b8d5cc47c9d7cee |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/0c35745dc2852e8edb9f6adeebf960118bf62d20 |     
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/180ec71605ea063d0306ecc17a6c876002371bb3 | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/16a42e2aac0dd99ef3c88e50cb672aec7d26deeb |     
   powerpc64 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/945c4651fd53bc7f04d1bd3277c2837e4d742a34 |     
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4b5709b6f34cd2c283ff507830c88694f73061bf |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/accc4e975efbf98b679cf13b38fe9f62da7c9a62 |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5c56478a32aedb40d0e4b17a02d19459315be08c |     
   powerpc64 |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/0050aa0d5360d166d07d4b6ee4484f4746b224f5 | ORPH
       nios2 |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/7f84e1ea397f773e235f18ddfc2b4093ff5bb996 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/e4d05e6b0eb9eebc4b8c884a7d10922c29ab1c84 |     
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/b1dfae81985daee106700191fcb82387833c2e3f | ORPH
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/367199b6071c450159aa2ea74d6d1b4b7cb89a88 |     
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a1ea73e9b1cd89f90d1f89f79dabdbd5d23cd51e | ORPH
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/a49f47a4830d89ad099ebfc6cef7b4c83949c2f9 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/36f06e4c6275bb90f46ef11e298fb830e3a236ea |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/014fbd5ef204d9d04248ccec458814a339a097b1 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/39575fc049b407d8ceaa9f1e022ead61d6e4f8d5 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/74dc8066345ff8d2f0938520d31a4dc99c06554d |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4fb6dac0e0ba293982d0b8b3657dad08365a2729 |     

-- 
http://autobuild.buildroot.net
