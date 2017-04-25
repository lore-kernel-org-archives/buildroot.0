From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Apr 2017 08:28:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-24
Message-ID: <20170425062823.5749320C8D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-24
================================

      successes : 166
       failures : 87 
       timeouts : 1  
          TOTAL : 254

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 29
                    ola-0.10.2 | 16
                 xenomai-3.0.4 | 7 
                protobuf-3.2.0 | 6 
                busybox-1.26.2 | 4 
                 mplayer-1.3.0 | 4 
           uboot-tools-2017.03 | 3 
expedite-0529ce56b6fb01e965... | 2 
             rabbitmq-c-v0.8.0 | 2 
                 xorriso-1.4.6 | 2 
               acpica-20161117 | 1 
                           all | 1 
                  arp-scan-1.9 | 1 
                 binutils-2.27 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcdio-0.94 | 1 
                libmpeg2-0.5.1 | 1 
                 libxml2-2.9.4 | 1 
             lttng-tools-2.9.4 | 1 
                    mpir-3.0.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                poppler-0.54.0 | 1 
                 qt5base-5.8.0 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/e69b97a93008265932e9945f6ae32c3c7d4da121 |     
        i586 |                            all | TIM | http://autobuild.buildroot.net/results/ca692b220aad7db99aa0c2ec408e9f5def05f223 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/edea93f40b709ae5535c733dff415cf6735e0cf2 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/fc9c77742a293973cd770da441b2701d40497c4e | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6449a94112cea9caf1e9dcaa536e2575d102b708 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5f886df33538ee12b784aa98240a89caebd64116 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/becc9070d6fd371840bcbd11625fd0a68ca68165 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5dde29960326d27f5a7d052f3c43fd22c0fb2cf9 | ORPH
     powerpc | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/dc9d7be90452d127ba9ad37bf1ac1ea713bd9e91 |     
        i686 | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/a42e5e9643351795f6cd5b1ccbb5bea25282288b |     
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4b3a2b389fa1fb223db8b6b3cac3d3c9f5161989 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d76764d5bee7216b99501d4c3ef96299dc334842 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0af6a908eaedbbf3a42dbb32453cf1acbe5ae7c8 | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fbec010f21a63e9df45dc29970be6a711cc2c991 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/73531daa4d5e0a5fb1dd95a47a1ba8bbbf83c457 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/25024d9bc7692f7ff37e7c4acf18fa8bd877e83d | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cf3a0c7161ff89c863e9c10032abd7da9ef65d7b | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8e65c3b77fafc7ef366a87a4fddc3b5a3bd1ae4b | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/355af073b397812654f01e5e02dc2b2a685bc675 | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0df914d584afad358915cc6ac62ad120d879f1ec | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6f1fe1f882e2265023b7115d1a8056f4d6595e00 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cccacfc18bf4f4281b555f7e0f645ad2c4983e41 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/088f55af8b16afee0b0f6586605f5a1075ab5170 | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fc8d2ef2168948eea8ea3f16aefa8b5244d35c3b | ORPH
     aarch64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/aff580fac3751ca6497aef0b0392584fb3780637 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3367f01760ee2e3c931164b3825665a5c30af8c7 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c0caef5ef7ca88fe7b6cb88bc65d1ae09104a3e9 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6e349c3de0750676b181c08cc8cc2744cac72b7b | ORPH
        sh4a |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/06cca371bc6ec6c8eca0e263528a19dcabc744cf | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fcaad1a4c6fa6e5bfdcf55b8a3510d0192279db9 | ORPH
   powerpc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/01eb30d856891649216a6adeba3d795c08ddff4f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/24aa403aa2d4e0f35011156b234eaa84de25ed23 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fadef7d141acd454c7c4e75e4ff41204b4577634 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a960850ed5237b10ed9294584da43389eacfb2ba | ORPH
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7c1298982c6ccf63dd424692c6cc7a218ba08247 | ORPH
   powerpc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/35adb6342c7d6ab0915b964494c21761221c2d45 | ORPH
        mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6b42a864381ae13cfbfbbf023660a6945ff67b43 | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/00c560c58daa9be913b1d8dbbb3be96688283cba | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1435b738f00a0c0fcee08f1d4f91ebee3562b2cd | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/0ebb17ebb7f4e8f6bd841115536c0f225cac8dde |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/6c0e9a7fdd0a6d7708278c7261c757ba6aa564a1 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/5a83dfa0813a606e80794754e177260341158a74 | ORPH
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/c1940a8042322b26dadeb84d2cade85d7950df69 | ORPH
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/94411e480486b8ac7380ff12f9bc8c7e45ad50f4 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/44ae3ce7102d5ee296b4a57e93f2e710a0e56f38 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6502f0c9c04407257e45907971a4db3c900461b4 |     
      x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b79dbb650b0f0b6bcf9d954608c1ca245432fd90 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8287918a75276ff0dd8eefabe065b310e5da3f4f |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a08ad2128284b9896a12db6c6cddd1fe9f78edd5 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b556e2b79130768b6a7da2a4a3cdd9bcb477f51f |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/74adbb42bbf28fc74816bdc222e76d18ee797320 |     
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/900501f3878b9e4f315a400a204b6578a1342fa1 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/f05cd9293d5dc61fe174e31f8117e1df6af6bb07 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0f90127a6adff9f55324fcf47d90b0c57a35a876 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ddc2e3a5432e08239351d391cac19783d027820b |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a8ec3a4999822f3645af35edf11bd0e8543028e5 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0c067badb2e2124f96751ce5503c85ae623082c9 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/99abdb12c007a9972e34a913b46a5e1a2d0bfad5 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/55fa699f5846e2c1d4c5ee92110cfd1786c3253a |     
        or1k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/60aa780ecfdd153821a2c7a9ceaa96dbc9dff7e6 |     
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/94ff0c3d232ce4940e6f66f31e4b2e3f684047ec |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/564cc2b9fb794da3f90eacb0aad425b6d5190a2a |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/317065f3a76bda5d303b9bacd0b1d9ba7d0be453 |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/1288dbccb266da4163116b4e966df08c786b0cea |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d5d4c7c6bfc37c41a62be70bc19532a9c0f2b089 |     
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a02fbbfc4bf9a70095f574ca70c835a8d8f13688 |     
        m68k |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/e4546e7f85bf799e071798475a2f81ee5e632051 |     
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ba9fee0edfac0051ee725b9ef20d599249a26980 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a8b9a2395e666f58d7d40112edbda2be9eb84af7 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ea1af7d7a738d4feaf404c6f839e359015da7657 | ORPH
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7f3fcf8ff4e63889abdf708374323ac78bdc357d | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4791faf1ca43bb0e3a59e92b2c6b72601af8f3c0 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3c59db592ed09b8af173cde55593f91b1e1cccac | ORPH
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/040ab283dbbec623fe5ff4eaece754d9701fafc5 |     
        i586 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/dc677f21218084c87298dde970edad74e630f3cd |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2d121c94a7c0baf327eac0e0ea571e6557c39329 |     
 powerpc64le |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/7803351da86cfee402101c37b1734c174c9ed73f | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ec6c7fb3d4ee0a691db4dba29fb66a1d830baefd | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6ebd08aae1a54e9e8e71d51a3db1224dc7709d2c | ORPH
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/2ea49b082030cb07cd7ff5dd1e96f9f2284f6c05 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/0555ac457645b7419c6aec010ddf803f879277b9 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/8470268a0137b35f3c9669de7f010c03cec76ed1 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/f9bafb381364bd6976da56a730b97399a17447dc |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/6ed8509045791726169aff31f96c674cc159fc48 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c447b582076541e211ae0e8ef69def9a71dfa6de |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/39183a35280bf02bd6c9d45d47699502e298ab94 |     
      xtensa |                  xorriso-1.4.6 | NOK | http://autobuild.buildroot.net/results/04433b96b9a51b9e5df26f2e7b1d184638f7bdec |     
      xtensa |                  xorriso-1.4.6 | NOK | http://autobuild.buildroot.net/results/254f9559f90b722d531cfa36426c97fdbf24942c |     

-- 
http://autobuild.buildroot.net
