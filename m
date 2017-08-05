From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Aug 2017 08:30:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-04
Message-ID: <20170805063050.9E97C21ED2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-04
================================

      successes : 154
       failures : 19 
       timeouts : 0  
          TOTAL : 173

Classification of failures by reason
====================================

                     gpsd-3.16 | 3 
         libspatialindex-1.8.5 | 2 
     python-cryptography-1.7.2 | 2 
snappy-be6dc3db83c4701e3e79... | 2 
                  cc-tool-0.26 | 1 
                  dnsmasq-2.76 | 1 
        ltp-testsuite-20170516 | 1 
             lttng-tools-2.9.5 | 1 
            luasocket-3.0rc1-1 | 1 
                 uclibc-1.0.26 | 1 
                  whois-5.2.14 | 1 
               wireshark-2.2.7 | 1 
            xlib_libXpm-3.5.12 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/eb76c00f691be48ae69508627459bb30eec970ba |     
        mips |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/4aa75ac4009ce9997d028c942a42f854d906e3f4 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c14ba9784598bbe591091bf0939bb11da9ef234c |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/624efaa84055a5c787c937a3392fda01388a91ee |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/9fc77de5eca55f71d0a556c5d50ba0034f25538f |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/3df379e49e4c728fc38c953f572d4db8bd3f2917 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/282e774f23ebbcd8997d49f6216a89456be0bff5 |     
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/4b4bb924e90cd892a47e1782f281e3af3a85e291 |     
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/ac3a4a2f6aba920a46cb2377732f14f6a3be2951 |     
      x86_64 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a43b04c0136cfa2e94dbde6c78804e4b97f9a734 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6c91f93b7bb9bbfb9c2eee2f2e9185aaaafb8756 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ab2228214777182820c1b0dbb16a472ae30edeef |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/b1c18b9755d3a1746907259513b717548b546677 |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/827f766f73c29169e08a0d64213a7ad9038c4f11 |     
         arc |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/bdeb4bdb62e6aab92f9794708cc87570f89e230d |     
         arm |                   whois-5.2.14 | NOK | http://autobuild.buildroot.net/results/b62ec9d6f350e409731d47ffb585344c516944e8 |     
      mipsel |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/3f9d593aac70d9d9cf2b0c768c250c289fa919ba |     
     aarch64 |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/af070ac3b98b56e7f128b3862fc45c21cf7c9121 |     
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/8451a21ebe66997f93672ab2962341329254390c |     

-- 
http://autobuild.buildroot.net
