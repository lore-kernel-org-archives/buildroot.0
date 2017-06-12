From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 08:29:02 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-11
Message-ID: <20170612062902.023A521D2A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-11
================================

      successes : 113
       failures : 32 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

                     gdbm-1.13 | 10
                  cppcms-1.0.5 | 8 
                 lcdproc-0.5.7 | 4 
linuxptp-97c351cafd7327fd28... | 4 
                 sngrep-v1.4.3 | 2 
                beecrypt-4.2.1 | 1 
           host-doxygen-1.8.13 | 1 
             host-nodejs-8.0.0 | 1 
                 mesa3d-17.1.2 | 1 


Detail of failures
===================

    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a1ad507371192ddecacab0df91f7b2a84c7c288d | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2000af305b6fb85008fa782cd65033212fcf1d35 | ORPH
     sparc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4eb4b9ffd882f48e4888cfd10d0bcad4257f9fbb | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8d93f505650e40c19215c2fd54ead4db4444c397 | ORPH
   powerpc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/59532251bb0d2307b1d4aaa9aca5e0dd51188c0e | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/daa1065be2b8d7a9a4204931f13c9b7ada7e0359 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9555fb7f9d00e7d461c2d60673f35e657b7050e4 | ORPH
   powerpc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3886c15fd4f6f282608c74e6d4c9639ff6ae881e | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7f30fc4bb94182775663b79bdc74ddd4e623e966 | ORPH
     powerpc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9486d4cccfc2f3e6fd92223b4669d4540788655c |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/f12b6f627c5fb7086a72cd7085688f05a0cc486a |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/e6711f378d4140883d3860e6dac24676dda6fb07 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/f0e0b7ffaedeb2cc54b66f9325f16742edfc9f28 |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/cf83ee38244ce3b99e8836245fbc131f676be363 |     
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9475de04b8e81bd03e79fb5c0f8c07e095c33f73 |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/0ea1784069fbde2e02164724a8f4cef6ec9f3472 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/510eb1c0430c395be15a181064d108fc5517ec58 |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/534085308c853307586a6b944f03d2282355e531 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/46825790cad368e9e8d678b3fe2d1f76c1f787c5 |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/68559b364efc62dc149ea40595eadafad7fdb700 |     
      x86_64 |              host-nodejs-8.0.0 | NOK | http://autobuild.buildroot.net/results/6d52bc9fef4c9f12f0091e93c020ab2cd4c4c5a1 |     
microblazeel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/68c50b69b73a69a328c1f1d4f9f95e9391355f41 | ORPH
      xtensa |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/df4a0e7db2b2a4d8cb46855ec9cb64a2715eb8fa | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/cf60ff7aef2750c629adf56c0c7e2adc965b1572 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/9487c2732f2436af495623d449e70a0298b5b19e | ORPH
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d46270a2862d121f74ea6cefd76e8e013da7b217 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/897ff826a20b15a46c71cc476bd9b6bb63e66d38 |     
         arc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/024e1165888ade3fdc6be6c1ca57c4a73caaac34 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/8d0bb8d2eddc3bc3008fa094fd4a62b087642dfb |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/775aad481a99926749a13c9f10012dbb9b90ead9 |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/0fa53e20cf02dc0ae4e32a0f198806a5991cf150 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/8fd76da2a6883b403209a14a6da3db50ba5a88e4 |     

-- 
http://autobuild.buildroot.net
