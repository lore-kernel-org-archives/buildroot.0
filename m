From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 08:31:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-20
Message-ID: <20170821063117.9438D208E5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-20
================================

      successes : 203
       failures : 13 
       timeouts : 1  
          TOTAL : 217

Classification of failures by reason
====================================

                  cc-tool-0.26 | 1 
                  dnsmasq-2.76 | 1 
gmrender-resurrect-33600ab6... | 1 
             gstreamer1-1.12.2 | 1 
make: *** wait: No child pr... | 1 
          mediastreamer-2.14.0 | 1 
                    norm-1.5r6 | 1 
           oracle-mysql-5.1.73 | 1 
     python-cryptography-1.7.2 | 1 
       python-smbus-cffi-0.5.1 | 1 
          qt5declarative-5.9.1 | 1 
             transmission-2.92 | 1 
                       unknown | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c2d5547016b8a9be4868ded81cb1ff0c97eb9b60 |     
         arm |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/1d094f20017e04b867e1ba0f4ff9c1787c419358 | ORPH
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/bfdd7d06c9d92ec343ffe90d6aeb0a5087bebf9a |     
         arm |              gstreamer1-1.12.2 | NOK | http://autobuild.buildroot.net/results/9d4fbf7167e9afce0eef5c9e0cfd42c966ecba36 |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/8c2bb335662bf05d0d21e74fe96bf16bfb590a58 |     
        i586 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/af091cfd0508df9395778cdc796f77e95c168410 | ORPH
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c79dc84cdc34d62199099eb4438b1aed3e7459bb |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2a55d767f6d6e8b54e5581545f531a422081d392 | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f11d73f625b4a712b72d2ca47a9b38eec641cea8 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/6cb11908f6aa84a62434fc7c9c2266c04a89c64d |     
         arm |           qt5declarative-5.9.1 | NOK | http://autobuild.buildroot.net/results/2dde17bf55db5d8c963f70f6c58a6e7086519368 |     
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/71f6fd76de397fbcda6ce6310adacd6c42ab6a2e |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/d58d03c7f2605a558e3610b473f4807edc63ecce |     
     powerpc |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/e98f7eabc5271d5f1b38c4205f10a842fb6eafe7 |     

-- 
http://autobuild.buildroot.net
