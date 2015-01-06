From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-05
Message-ID: <20150106073013.77CB910081C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-05
===============================

        success : 241
       failures : 24 
       timeouts : 2  
          TOTAL : 267

Classification of failures by reason
====================================

             libselinux-2.1.13 | 4 
                  zeromq-4.0.5 | 2 
             sofia-sip-1.12.11 | 2 
janus-gateway-c632c1e9da5ff... | 2 
               lightning-2.0.5 | 1 
                    php-5.5.20 | 1 
               libcap-ng-0.7.4 | 1 
                 openocd-0.8.0 | 1 
              host-mono-3.10.0 | 1 
              libarchive-3.1.2 | 1 
              xmlstarlet-1.5.0 | 1 
            host-heimdal-1.5.3 | 1 
               madplay-0.15.2b | 1 
             xlib_libXmu-1.1.2 | 1 
                 httping-2.3.4 | 1 
               kodi-14.0-Helix | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                libsrtp-v1.5.0 | 1 
                xapp_xfs-1.1.4 | 1 
                     rpm-5.2.0 | 1 

Detail of failures
===================

         arc |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/09d15ce60df669227d6a5716c83792b688e21689/
         arm |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/e2446acab36a7aeecda1e4752b1a6f5b11e80e1c/
        bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/b82ece1b96b793f047b38a6493515c90a59dd29d/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/73ce7516900a9beb2d0c34285ac436e67a86618b/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/fa59ea9a074f31031a0be482bd9749aef3df07d5/
         arm |                kodi-14.0-Helix | NOK | http://autobuild.buildroot.net/results/2b6a6ffb4ac464bcd41ad51c17d8a34f1967819f/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/a16ac9f9a648973072e9ced1b3c5721f89f65f1f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/35ebba81407484338ad7e3b4800fa998d9df1ca0/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e23145e409c6f43878d2e80bc0d2227f7c1d9eac/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/36a5cd731bcbbdf986d00ad1780cdd83d603f1db/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/802d3fa70727cca129781a377fb8747654c7a056/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9393d03776a2e7f8cebd0141119764e1c4f1154a/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/9f603c682a8ce92ffefb9fd884ab89c67eb96049/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/d4cc5116a41520694b2c111cb22bb31936505644/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/c18cc87815e1a778c6fd444e424b399958835710/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/06bf6e0e1622771a4a792a3aa0d5e01d3ba290f7/
        bfin |                     php-5.5.20 | NOK | http://autobuild.buildroot.net/results/36435e2fa5c06aa099ec688bcb5b900b966a6a70/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8b03123a8680d7668b6e16837127f8a3493968fd/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/c5b4b1350bd73dfbfd3dc445e1bc2e28a71f163a/
        bfin |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/5958349cc6ec90a09f6bd9536b411b45130af083/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/7c85f2544c14a53fc2a1eafd50d7ab5154fbf2c4/
     powerpc |              xlib_libXmu-1.1.2 | TIM | http://autobuild.buildroot.net/results/1c055e0d77a23c473fb3f72ad46d571508261f6f/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/ebb1070c816633f477e6940f566ad39ff149c89f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ea51114f620a1413be430291a757ea3cda9cd3b1/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/11fe8295862ef60a799a6c3f695adc36b207a1c8/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c72b0bd383de9d5f58f4e68fce06a85c8d916cfb/


-- 
http://autobuild.buildroot.net
