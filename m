From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Aug 2017 08:30:51 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-21
Message-ID: <20170822063051.1915E21DD4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-21
================================

      successes : 202
       failures : 18 
       timeouts : 1  
          TOTAL : 221

Classification of failures by reason
====================================

            xlib_libXpm-3.5.12 | 2 
                 botan-1.10.16 | 1 
                  cc-tool-0.26 | 1 
                dbus-cpp-0.9.0 | 1 
                  dnsmasq-2.76 | 1 
                grantlee-5.1.0 | 1 
                   jamvm-2.0.0 | 1 
        ltp-testsuite-20170516 | 1 
             lttng-tools-2.9.5 | 1 
make[1]: *** wait: No child... | 1 
          mediastreamer-2.14.0 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.7 | 1 
           python-pynacl-1.0.1 | 1 
             transmission-2.92 | 1 
          usb_modeswitch-2.5.0 | 1 
            xlib_libXext-1.3.3 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

     powerpc |                  botan-1.10.16 | NOK | http://autobuild.buildroot.net/results/219e03f6db1ebc88b69be2aa937d82dec685d952 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/264c398ccc0d05bb68d5fc9470d19925800ee03c |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/07a7559c0efeeda16c239e0fa06259d4cd48c71b |     
       nios2 |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/d856ec3e6b28bd723176bb892a56dff5262a6b92 | ORPH
         arm |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/53a6c76649f518acfcb6e9767f7520fe18ab0dcc |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/95822a68563d56bc92628e1921f5d2bda596a63e | ORPH
    mips64el |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/2ee293c929aa4f4b49c295426704ca0e85339c39 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/84053e731405f789183de21d68eb7def25371505 |     
      mipsel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/57819fb3a1b580c035ff61cb0d90f0be5a269549 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/bb2b19dffa00f59231902f03a80dbc68f88e38b1 | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bdb22aef84aae758c4973a156780de78a74ecd6a | ORPH
         arm |                      php-7.1.7 | NOK | http://autobuild.buildroot.net/results/bb56553032cc70c2887d5c34401c38d177353c56 | ORPH
      x86_64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/af13eea7841eff29149c6c4e3323a7518062c38e |     
     aarch64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/2081a8aa8c7ca413373734e3ee447f34e204a452 |     
        bfin |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/0c7cebb9fe6e75299026f237c50b6e1d10895417 | ORPH
      x86_64 |             xlib_libXext-1.3.3 | NOK | http://autobuild.buildroot.net/results/cf18fd299454cacfc803ca610659a474ead9ee26 |     
        bfin |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/75c50e617349d327713cba9bc97163bb2c9a6943 |     
        bfin |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/af17324c0de87b7b52f9b37cb437a0abe4cf5261 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/99f9c5b141e0dec41b4c3af102f653ea7ebaa334 |     

-- 
http://autobuild.buildroot.net
