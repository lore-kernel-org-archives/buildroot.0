From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-19
Message-ID: <20150520063015.F3A9A10113A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-19
===============================

        success : 317
       failures : 14 
       timeouts : 2  
          TOTAL : 333

Classification of failures by reason
====================================

freerdp-770c67d340d5f0a7b48... | 2 
       host-erlang-rebar-2.5.1 | 2 
                       kmod-20 | 2 
filemq-482797b8aa30fcc9ea13... | 2 
          sane-backends-1.0.24 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                iproute2-4.0.0 | 1 
                     php-5.6.8 | 1 
                 jack2-v1.9.10 | 1 
               libedbus-1.7.10 | 1 
                oprofile-1.0.0 | 1 
                nodejs-0.10.38 | 1 

Detail of failures
===================

         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/6a14124221801fcd5dbb41b450627b1785686cc3/
      mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/4e192c4e13f91d91769274d004367cf59fb395c3/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/f77a2c9eea7973b54a22e12ab33ee8964adaddfd/
      mipsel | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/9373d4238bc3f027e571581bd3531018c4faed91/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/fd1b9cc33094427c4fba1053e51fe06b57ca5b26/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/3f9381a410e8411c390ccf5632a06c66b1c93524/
         arm |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/f42bbbf5be4594a8806d0e571586ce2bf119582d/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e537a500852ddb8aa0b1155ea9bc8a17636dd50d/
      xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/9d0e53e12626b069246b86f079c6a9f26b0f3eac/
      xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/e7490ed91237cc726ea0b0f8a4c227a8a56ca11d/
         arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/4a0b4db5fdad581e1ec3e8133bfdb1c485105a65/
         arm |                 nodejs-0.10.38 | NOK | http://autobuild.buildroot.net/results/824bbeeeee5e04039bf9d7645a44f3f2aeca7628/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/87d0d4f1ab5cd358df94cebcd2c33188088a85a9/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/e6993d66aeebbe994063a60871412b2235ce5455/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/db7314d0ce444dfb48fe75ed61685c9fa5ea7bc9/
       nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/b2a1a4ab3c83b47e73096a1e47e531dd94fe5dbd/


-- 
http://autobuild.buildroot.net
