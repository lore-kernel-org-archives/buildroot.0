From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 May 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-24
Message-ID: <20150525063014.4AA50101F43@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-24
===============================

        success : 266
       failures : 11 
       timeouts : 2  
          TOTAL : 279

Classification of failures by reason
====================================

       host-erlang-rebar-2.5.1 | 2 
               gptfdisk-0.8.10 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               alsa-lib-1.0.29 | 1 
                rdesktop-1.8.3 | 1 
               libedbus-1.7.10 | 1 
                libgsasl-1.8.0 | 1 
                ipmiutil-2.9.5 | 1 
           libfreeimage-3.17.0 | 1 
                    webp-0.4.3 | 1 
                    qemu-2.3.0 | 1 
                 cdrkit-1.1.11 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/46bb18aa3600cd05b068fd658fa65ac25a3f7fe5/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/6b9d71b0fc4e74c45d1b1f2560a114a2ed798e1d/
      xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/24eba4ee0f6927569a443b822486b2b6003a44be/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/c7d48554d76e39cbdf715721ae51e3516a99f97e/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/ae7c685e42f769270f45400e8a5ca5c759c7ea23/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/81a153df073ac5763d64b8d6524edd65caad6300/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/40da06c9a9056f0a3e42eaee847fba3abd9dc149/
        i686 |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/21eaf2a07170a5e45267f3143e6aa74dc77acedc/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0476595912e5b05b7c7698379dfff3ea737c61f7/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/bfc1edacf56f7520f19611d38907e62d1161eb6c/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/2908f6ddfb0b476446ecb3b408fe1bd5fd3e956b/
     aarch64 |                 rdesktop-1.8.3 | NOK | http://autobuild.buildroot.net/results/720610a997f2321b40806c76afa8eeaaca97bc52/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/7fb50fe933ba67faf2dae1885a80e58427263f68/


-- 
http://autobuild.buildroot.net
