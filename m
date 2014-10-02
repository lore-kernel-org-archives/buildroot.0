From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Oct 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-01
Message-ID: <20141002063010.44B71100DB2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-01
===============================

        success : 126
       failures : 22 
       timeouts : 2  
          TOTAL : 150

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 5 
                 webkit-1.11.5 | 3 
               valgrind-3.10.0 | 3 
                  zeromq-4.0.4 | 2 
checking if /home/test/auto... | 1 
        gst1-plugins-bad-1.4.3 | 1 
                  sispmctl-3.1 | 1 
               alsa-lib-1.0.28 | 1 
                 cdrkit-1.1.11 | 1 
               iptables-1.4.21 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                 pixman-0.32.6 | 1 
              librtlsdr-v0.5.3 | 1 
                  prboom-2.5.0 | 1 
                   geoip-1.6.0 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/b777cb1002caa6ccaeacb496231af06e61de98af/
        i486 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/bd7ddbf9b1b6192a26b3e48d53515ce675b4002d/
         arm | checking if /home/test/auto... | TIM | http://autobuild.buildroot.net/results/a4f8fe4c700a07a0d76e108a05cbb457ca7d4afa/
         arc |                    geoip-1.6.0 | TIM | http://autobuild.buildroot.net/results/feabea43bf113143e6149e76cdbff307a6fb226f/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/40fff3bc304e1a83524f28be8f6afc2e217281ad/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/c06f72212a81ef2aa4af6115d09daf18a20d9652/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/6708384ddd5946fc213c8caf6a2dde6ea17ab4f9/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/2c55616c8f4d4c7a1c69cc882fd6c88d1876e637/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ccd482b9d5b1ef497a2e4a06d5c890ec8ed56c5a/
      x86_64 |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/2adc9777bdca9c20945cabe2a7aaa7fa1b9d778e/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/8c345e65ea602d17c35c632cfe4ac89a928de1df/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/7bb4bc3ef78555a7e3ee501e942a942c0340ac5c/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/3a746d9c185faef9b2eaa4407b19acc28be4e72f/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/779eb8f995d335a3430437ee8208615c41f43ed6/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/e67ec59cba977b39ce93d9298979d0ba9b7af50b/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/c80df50df22d27a93f0c400b7347fbc72d353a48/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/3a26174f685983a861e4d84c926b0f271c1fca9f/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/a1117482b191506202fea95ce75636b4ceb665d7/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b6b3018d09b932f8dc87626a12c7033d246d9a48/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/eeff309d6d02953dc7ada5fd4b5f0c74737a0076/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2260e5f81ac5be76ae7fdfe21ddbc57923531773/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/c8165ac99206fdcd429635361dd0c61c67c663de/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/68d6ed348858416904aaa4f4b2969da5542c35ff/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/fefc752e9c9f4eae6ea50eb1bfeee93808110e1d/


-- 
http://autobuild.buildroot.net
