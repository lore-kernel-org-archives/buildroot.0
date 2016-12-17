From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 08:29:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-16
Message-ID: <20161217072950.0A81A20D54@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-16
================================

      successes : 118
       failures : 20 
       timeouts : 1  
          TOTAL : 139

Classification of failures by reason
====================================

             host-nodejs-6.9.1 | 2 
                  stunnel-5.36 | 2 
               tcpreplay-4.1.2 | 2 
                 weston-1.12.0 | 2 
freerdp-17834af7bb378f85a3b... | 1 
             freeswitch-1.6.13 | 1 
                    gdb-7.11.1 | 1 
                gptfdisk-1.0.0 | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
                 libnss-3.27.1 | 1 
                 libv4l-1.10.1 | 1 
            lttng-libust-2.9.0 | 1 
                    qemu-2.7.0 | 1 
            xapp_sessreg-1.1.0 | 1 
                  xl2tp-v1.3.6 | 1 
                 xorriso-1.4.2 | 1 


Detail of failures
===================

        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/9e1dee55a63c8476e6ccaaab700edac874d19034
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/7ed8f50bac5e6aa933bbe0b3fdd3a68ef071f344
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/1a7b4a264486dcd364cb9a52ce240d067a31780d
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/e9e2b161ccf102ffbc37c5950dc3f7bc09df95b6
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/d20d295c0529c21de993b42c2c2f6e4c616dfc69
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/0a24f8780b1ba133b07633fd4ec4547d2299e7e9
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d15dc78cdd74b51b551512ce1ba88e4d61219e86
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/5d330fe3f4ed5c5bef4b9bbd4bd3918050a3983c
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6067e13cac8f7c867167a4146f1b4ceace8b0dbb
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/95a7b90ccf6e9ee80a9b0e112db48f44406d59d1
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/416014a4e975192fbd9d4dfbcbfef3546f57c138
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b9bce4ece97e1ef1aac0afaab23e9e7232452e70
      x86_64 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/c8dd8d6ec94a01fa131255265b9f56dfb6a6b707
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/2439bb4154563279d970dcc73df242878d7f2ef3
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/03c0d730e85f40df305a9f6d9fba273226e6a883
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/a65b27f9e288f94f041ced64313dbf55af47bf36
        sh4a |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/bcecdbbce4a99eb1e9bfbf519857bf94d8952037
     sparc64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/0fecffa055d8254829ca6a731634024389357bdd
      x86_64 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/d7166c3efd52b831bc5973886cbd656a9c80b925
    mips64el |                   xl2tp-v1.3.6 | TIM | http://autobuild.buildroot.net/results/b63a603f03ac5d1e2f91b8a1692c12138db092c7
      x86_64 |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/b14feee58e47e1b57fc337063b1e12e595357c0e

-- 
http://autobuild.buildroot.net
