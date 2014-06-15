From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-14
Message-ID: <20140615063014.70ACF100EAC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-14
===============================

        success : 74 
       failures : 23 
       timeouts : 2  
          TOTAL : 99 

Classification of failures by reason
====================================

           dialog-1.2-20140219 | 10
make: Leaving directory `/h... | 2 
make: *** [core-dependencie... | 1 
                 cairo-1.12.10 | 1 
               audiofile-0.3.6 | 1 
                oprofile-0.9.9 | 1 
       gst1-plugins-good-1.2.4 | 1 
             host-mysql-5.1.73 | 1 
                  zeromq-4.0.4 | 1 
            wpa_supplicant-2.2 | 1 
                  snmppp-3.3.4 | 1 
                 xenomai-2.6.3 | 1 
            eigen-ffa86ffb5570 | 1 
 make[1]: *** [dialog] Error 1 | 1 
 make[2]: *** [opt] Terminated | 1 

Detail of failures
===================

   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b62615a2d933f2b69c8b402d0134c72675a7e527/
      i686 |                  cairo-1.12.10 | TIM | http://autobuild.buildroot.net/results/211fbc0aee997139a7a9d65b4776e02a5b294b4e/
microblazeel |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/5f9957a76381890a5efa5f52900592bf915550ce/
    x86_64 |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/273539eaf9e930d0230a8c4b11e295733ab4f871/
       arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/128abc06acbf7d4872bbebffd99f97c073237303/
       arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/1bf4342d4aa1d49294a278f25322a00ee0d188ea/
       arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/411f6171e972eab4486143dedbfd078136886ab0/
       arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/365e6d1ef2faef546dd41b5c0a6ab04212b519dd/
      i686 |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/072cb54fdbc246a97c6cfbf854a6e648779e9755/
    xtensa |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/875ae36dff9fdd84f71f1177349d7c80adfb3f27/
   powerpc |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/de6000fbe76fe5e8bd2832f090ddf81c09c9d8d8/
       arm |            dialog-1.2-20140219 | NOK | http://autobuild.buildroot.net/results/0dd652d3caa212089caab0f962213d9938d9745e/
   powerpc |             eigen-ffa86ffb5570 | NOK | http://autobuild.buildroot.net/results/d7daa7ac359c6bef85ea0c65c5318f3068159010/
   powerpc |        gst1-plugins-good-1.2.4 | NOK | http://autobuild.buildroot.net/results/4f746cb9d8266abea2671718ad0f292763263873/
  mips64el |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cc99d4b8d0d83705071034bc72dd4e2efbb07acf/
microblazeel | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/30af5cd7f39fb556925321f9ce5c733a6688bc81/
  mips64el | make: Leaving directory `/h... | NOK | http://autobuild.buildroot.net/results/16c9d9baf11082e6b7db8bc5076ee7c54ddbd164/
      i486 | make: Leaving directory `/h... | NOK | http://autobuild.buildroot.net/results/67f79482f8a80e63aca366df6d3ea232336c9ce1/
       arm |  make[1]: *** [dialog] Error 1 | NOK | http://autobuild.buildroot.net/results/dae1d1cfff19f52ebdbf558b884cbe0a45cf2564/
   powerpc |  make[2]: *** [opt] Terminated | TIM | http://autobuild.buildroot.net/results/b9f67e5b23032eb81be30107fda8104952bf775f/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/549ef23ea1c9daeba8337b45ffabb254321c72e3/
      bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ec2fa986493cf278681e9aa85d80356f9f3f15d1/
     avr32 |             wpa_supplicant-2.2 | NOK | http://autobuild.buildroot.net/results/20908f479b33c1e2952622f5e8ad6b60d58af693/
      bfin |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/db4f913a0dc9a0d8875cf3879e350837a73e26aa/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/3af3d41ba5b60f30e3c9e7bcea33f52dc0c89cf2/


-- 
http://autobuild.buildroot.net
