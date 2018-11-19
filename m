From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-18
Message-ID: <20181119070030.ACA3F20CFD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   4 |   0 |  27 |
   2018.08.x |  24 |   0 |   0 |  24 |
      master | 170 |  17 |   0 | 187 |
        next |  40 |   6 |   0 |  46 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

  host-xproto_inputproto-2.3.2 | 2 
              wireshark-2.2.17 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

     aarch64 |   host-xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/e6badde04047e10023b97946bbff434abc07344d |     
        m68k |   host-xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/05e428fa68632e8e68dd71d43e5ec887edd6f2dc |     
 powerpc64le |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/971021ec0e05ba9894e76c28f4fcd700114ba27c | ORPH
         arm |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/d3ac4e0be7fa0aef334e993fbd54a1b13791da80 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 4 
             flare-engine-v1.0 | 2 
                     gdb-8.1.1 | 2 
uclibc-ng-test-c6d62cbc6050... | 2 
               boa-0.94.14rc21 | 1 
                 flatcc-v0.5.2 | 1 
             host-gauche-0.9.5 | 1 
imx-uuc-79e9798eee9cd972d92... | 1 
                  mender-1.4.0 | 1 
sconeserver-6b932d7d8dbb700... | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e293aadc692d2ed337881ef2172ddf66a60bc05c | ORPH
      xtensa |              flare-engine-v1.0 | NOK | http://autobuild.buildroot.net/results/a12ae622a44bbe025c3a8b7e8e4c253b52927ae8 |     
        m68k |              flare-engine-v1.0 | NOK | http://autobuild.buildroot.net/results/096204998429a5338e67184d885bc00d1cd7dfa1 |     
      mipsel |                  flatcc-v0.5.2 | NOK | http://autobuild.buildroot.net/results/a47f49cd2fdd809257bd7e83dca620f2e6aac85b |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/8c1aaaf69f963d059a4f37015795a0cb6472c560 | ORPH
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/0a9de481eb57131e13a1525099134bf8904ff150 | ORPH
    mips64el |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/929198013bd13bee9d0408643f85c73f9c3c4b92 |     
         arm | imx-uuc-79e9798eee9cd972d92... | NOK | http://autobuild.buildroot.net/results/1081062b1c32c44a9feb5b14288095bc72d15986 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/2e9bc1e261eb12236a770e9fa2024224e5a16f90 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/5629b39b3a792be3704aa6997639a958c0315f19 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/bcbc2b80c1c122d3d271a1e42a4915f1dfe6fbf1 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/266d7d10e46f336c919535465ba85e309f7a1509 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d4f4d19b8f69ebaaa10adfa3fc5cf7b0899fe3a7 |     
         arm | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/b5e2b8635b37e6f2803a6031b154cf67685a4221 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/b0a43e83b26639f692196ed4684518f631d832f6 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/eb7bf1930ccbc5d178d6a38bdbad34088ce5eca7 |     
     riscv64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/70b20e85d3e0e9e48a74fab24e57714d2ce4a587 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                tpm2-tss-2.1.0 | 2 
     docker-engine-v17.05.0-ce | 1 
               domoticz-4.9700 | 1 
              keepalived-1.4.2 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/16b178b30c10513034a5d8f3a2e0264b5ae898a5 |     
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/12ed14642e24860f2e22c3b15667c8525ddd5acc |     
        i586 |               keepalived-1.4.2 | NOK | http://autobuild.buildroot.net/results/b730e8b25c1d3343b7a6d73f6d3b82b13692578b |     
        or1k |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/59bbb3bd979f5af1926840719c2b57aa495a0177 |     
        i586 |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/b41c8d6f24ef47e39c67ece11d305ea5138d2ba6 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/14db78fb6fe38e3aa9b752097be9edb0c0015df7 | ORPH


-- 
http://autobuild.buildroot.net
