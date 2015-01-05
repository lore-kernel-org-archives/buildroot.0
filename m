From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jan 2015 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-04
Message-ID: <20150105073011.73629100BEF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-04
===============================

        success : 217
       failures : 17 
       timeouts : 7  
          TOTAL : 241

Classification of failures by reason
====================================

janus-gateway-c632c1e9da5ff... | 3 
             libselinux-2.1.13 | 3 
libwebsock-3c1615eeadb0b582... | 2 
                 openocd-0.8.0 | 1 
                      make-4.1 | 1 
       host-xapp_xkbcomp-1.2.4 | 1 
                  squid-3.4.10 | 1 
                  thrift-0.9.2 | 1 
                     rpm-5.2.0 | 1 
checking for wchar_t... mad... | 1 
                  xerces-3.1.1 | 1 
                     vlc-2.1.5 | 1 
           libmemcached-1.0.18 | 1 
                    ruby-2.1.5 | 1 
                   opkg-v0.2.4 | 1 
                  weston-1.6.0 | 1 
            python-numpy-1.8.0 | 1 
                   erlang-17.4 | 1 
             sofia-sip-1.12.11 | 1 

Detail of failures
===================

         arm | checking for wchar_t... mad... | TIM | http://autobuild.buildroot.net/results/3f38dab6bc432f09b71e9cd8f17af90fbe20e285/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/35375a2c2cc9317f35e31275ee9690498e31cb09/
        i686 |        host-xapp_xkbcomp-1.2.4 | TIM | http://autobuild.buildroot.net/results/963ee5dd2c33f1d45e4edb08def48fcfc25c1c75/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/3f07574e6e4edda9e31fcb0de520a4dbabe6b94a/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/efd3a1f26749f987b229316ccbc01b2104052490/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/2fc5b014ea549d94eee4cca375ca44956a094372/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/55a526bfb4ab9366875fa85ca1f72543f7690430/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/6b9f5a3a7c558bfeb3f19192de8ba7558e5be384/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b491c9eef0c3dcfc5fc6f68b7da72a385fbb5983/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/c48962886584dc524d7bbce247dce6bb9bf2307f/
      x86_64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/2c49e45667aaf2f2a59ace94885b9d4ed98038d7/
        i486 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/f5d4f92079e82429df4a90e3cac75f12dad53fb5/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/d2bb99603435322f3ae707e68603e06f7036d842/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/f81c01b27468de11907a13deefa40be6a04ed182/
      x86_64 |                    opkg-v0.2.4 | TIM | http://autobuild.buildroot.net/results/8035f5d447479dc2469a0506814aabaadcf7031f/
        i686 |             python-numpy-1.8.0 | TIM | http://autobuild.buildroot.net/results/42344c49afa3d1b528606f4e2a8b9428118d440c/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b90d573779b34b8a1a29e0c9704a7e53491bfc53/
        sh4a |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/b673e2c4f983dc99491bf588a111316817bee1e2/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/b14aa9d2d6d70626c05e7c0c13783c7787dbaa6a/
         arm |                   squid-3.4.10 | TIM | http://autobuild.buildroot.net/results/6c5df9ace3bda0c808518eb5be9c230cbe6efa28/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/708840b4523489d4a2896a7fd78e6152e0d80baf/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/db6bb41dcaf4f01dcfd96172506ca52ac35148f0/
     powerpc |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/55df000fc3c1f7cc1bd0d9c322e55e47510a8bae/
         arm |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/7c4683ec1eb41578413335d40dd46162326203b7/


-- 
http://autobuild.buildroot.net
