From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Jul 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-30
Message-ID: <20150701063017.91289100CD0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-30
===============================

        success : 105
       failures : 33 
       timeouts : 0  
          TOTAL : 138

Classification of failures by reason
====================================

              pure-ftpd-1.0.41 | 5 
                collectd-5.5.0 | 2 
sunxi-mali-d343311efc8db166... | 2 
                  opencv-3.0.0 | 2 
               upmpdcli-0.11.0 | 2 
               btrfs-progs-4.1 | 2 
                 setools-3.3.8 | 2 
          binutils-arc-2014.12 | 2 
                libtirpc-0.3.1 | 1 
                 lvm2-2.02.121 | 1 
                  uclibc-1.0.3 | 1 
                pulseaudio-5.0 | 1 
pulseview-198f9bc74d6c955a7... | 1 
           host-nodejs-0.10.39 | 1 
               libsigsegv-2.10 | 1 
             util-linux-2.26.2 | 1 
                 qt5base-5.4.1 | 1 
make: *** [systemd-legal-in... | 1 
                   eudev-3.1.1 | 1 
                      atf-0.21 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              wireshark-1.12.6 | 1 

Detail of failures
===================

        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/271adc01f92f80b1b961bc58d39f5a9737185386/
         arc |           binutils-arc-2014.12 | NOK | http://autobuild.buildroot.net/results/3e7cb3fe48e0175bea490687a9cadc5924d8e8d8/
         arc |           binutils-arc-2014.12 | NOK | http://autobuild.buildroot.net/results/8f772e6fccb4f918120a7bb814da2224432d1c09/
         arc |                btrfs-progs-4.1 | NOK | http://autobuild.buildroot.net/results/d6fcc7573d3ed4d70c42212c2abd90d0ef1f6bec/
         arc |                btrfs-progs-4.1 | NOK | http://autobuild.buildroot.net/results/f7b740423a73a09117b28afe4327ed31a82e8d4c/
         sh4 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/80db833cd6711df8c36198f9980a3e6b068268b6/
     powerpc |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/041725d489dbcc7e31ecf12e33840c0b854670c4/
       nios2 |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/84dd10dba6a54100234e5d0bc513b51aea527abe/
         arc |                    eudev-3.1.1 | NOK | http://autobuild.buildroot.net/results/8e25d0b950d6b79cd7c7124f18bb12e0ae745b61/
         arm |            host-nodejs-0.10.39 | NOK | http://autobuild.buildroot.net/results/48e56df60c511061b8d8c7578742c510714a16e4/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/381e7be34a518c5176d75f9cdc8837992247bf3f/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/c129f461c141c6cd16620cea45c2924b28007d7c/
         arc |                  lvm2-2.02.121 | NOK | http://autobuild.buildroot.net/results/99f1c4061895aa17f134672064b8ec7133181648/
         arm | make: *** [systemd-legal-in... | NOK | http://autobuild.buildroot.net/results/6e3dace5892a589225a93c896917833ebc8028f3/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/b5bca00dec1ecb118c7fb9c10dee74c94809c831/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/925847a89387bef8303fc563898fba6fe2cd431f/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ce2e27e1988c05cb382d138fc4c9ce2e5c709db6/
      xtensa | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/39aedb6a560dac6abc98b66db0643050dd91df25/
     powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/34b3eeaa4d48dfcda1d5829ee2ae16806458c2a6/
        i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/c441f35119191f47dd5fae96fd76827024e50329/
        i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/381ff4a1eb75854ba3082bb9c422df176d2ed6ad/
         arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/3e930b8c09c913e7826325784b7bf904da333b7d/
    mips64el |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/4c8c5a343231f0417fb7c2e1a6be4c83ff1ca623/
    mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/bb29ea80ef2630bf5231b60eb5c478c1be4129c8/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/9d6243ad0b53f1484a45f178265cf7e96b2b75f4/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c97882fe719e1e5596acc42f5eea131b4ac55274/
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/831acc7fff92ad97a9d4296750572579df132736/
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/9ad883951afa61e6e1c158fa8d5f6b5f13f22883/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/62fcf6331325984a54559a2474980afc2a7c1ba7/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/2963df8eaff1deddb86c341c36e7fc31e5cedd6e/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/be9a596e183b810d802618fa0c3623a93b826dc4/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/047f70b97c6a9bd9c8f37013a417c9bc8d79269a/
         sh4 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/eb9ae91bc2a481195ea7b60fb0c745f67c41e9f1/


-- 
http://autobuild.buildroot.net
