From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Dec 2014 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-29
Message-ID: <20141230073012.48EDC100C17@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-29
===============================

        success : 229
       failures : 22 
       timeouts : 5  
          TOTAL : 256

Classification of failures by reason
====================================

             bluez5_utils-5.25 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
                  thrift-0.9.2 | 2 
                libupnpp-0.8.6 | 2 
tvheadend-388f57ecc32a3b631... | 1 
freerdp-440916eae2e07463912... | 1 
            gst-ffmpeg-0.10.13 | 1 
              xlib_libXi-1.7.4 | 1 
                  nftables-0.4 | 1 
              libarchive-3.1.2 | 1 
                     links-2.8 | 1 
                   erlang-17.4 | 1 
              lbreakout2-2.6.4 | 1 
           python-pyzmq-14.3.1 | 1 
                      qt-4.8.6 | 1 
               libcap-ng-0.7.4 | 1 
               libsigsegv-2.10 | 1 
               qt5webkit-5.3.2 | 1 
                netatalk-3.1.7 | 1 
                     rpm-5.2.0 | 1 
                oprofile-1.0.0 | 1 
                     mpc-1.0.2 | 1 

Detail of failures
===================

        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/44b4d535352bc144d79d4a9cf15880848e122a4d/
      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/96750a499309ddd498e4be374cd6a15c9e34136d/
      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/2b1e521422d9af2b13133323c6534c49fbb0e177/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/63eb6a5fe3c2e74543377b574f3f6d643a150471/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/6ca9de1a11c675533baa68f7a6bf7b6af7cb4345/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/bfd5ff16cfdd262e0b532a700444d25e7434c341/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/f4fc816a492b5eb5d20d1d43df8bc6c29507f4fe/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/58cef3edd6cc7c0d03a66b10513d76101710f860/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/926a2c30cc4fecd05f348bc32b4f31436035d7d2/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9436c3208cfeee9bd3bc211df007e745fe13c2c2/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/8701a932c8ed80a9e1c5ae9416e1cd73deefe1f5/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/bc32c15ba569e700e401ddf97faba584fc16c4cc/
         arm |                      links-2.8 | NOK | http://autobuild.buildroot.net/results/f407067f6504b7e4eaf6001828c5d073a21ccd96/
         arm |                      mpc-1.0.2 | TIM | http://autobuild.buildroot.net/results/321b582f62d870b71da6e5d9f485500463ce6435/
    mips64el |                 netatalk-3.1.7 | TIM | http://autobuild.buildroot.net/results/23198014d9db29ff4b22efc332d9e79c5aa361ed/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/06166344cc8e162d3f901c70ee31ce07e481053e/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/d28447c1241ce3dd237710e388d799139d7d613d/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/526f8ae8d8fbb05927782c5195375053b1164f5f/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f32d8d4db3f7daad2e846c88247ae5b0b4088705/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/f1a9507c30f74d6c0edb30f34d1bea912970992d/
    mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f086cc5ac8d5d27fdabfe1371392bcfb4af7ff93/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/beb0bf732951ba18ce976176dc8780aa9a80c118/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/5d0c20d4568fed6cdf829612b1031a0c108ea725/
     powerpc | tvheadend-388f57ecc32a3b631... | TIM | http://autobuild.buildroot.net/results/9874903192142722b5de3c6f1034bf96bff98613/
         arm |               xlib_libXi-1.7.4 | TIM | http://autobuild.buildroot.net/results/1c46fed3fe23b35f6b92f65e5a814776d266c897/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/55034de0023cd2f5fe79b6d34e70257cf23503d3/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/168c0c3eedb90afafaedc1757cf5980a927bbd30/


-- 
http://autobuild.buildroot.net
