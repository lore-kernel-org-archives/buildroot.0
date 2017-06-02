From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Jun 2017 08:30:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-01
Message-ID: <20170602063034.DC512208FD@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-01
================================

      successes : 246
       failures : 14 
       timeouts : 2  
          TOTAL : 262

Classification of failures by reason
====================================

              gettext-0.19.8.1 | 2 
              pcsc-lite-1.8.21 | 2 
                     php-7.1.5 | 2 
               domoticz-3.5877 | 1 
       host-erlang-rebar-2.6.4 | 1 
         host-gettext-0.19.8.1 | 1 
              host-swig-3.0.12 | 1 
                 ibrdtnd-1.0.1 | 1 
                 lcdproc-0.5.7 | 1 
                 libiconv-1.14 | 1 
                 mplayer-1.3.0 | 1 
                tinyalsa-1.1.1 | 1 
               trousers-0.3.13 | 1 


Detail of failures
===================

      x86_64 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/365843f89951dd18b369bce0a78fdefd93179fd5 |     
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/6c295aff1986680bb6af16697920f9fbee04154a | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/04b645c13cb4798107f7d0e90324099baeb6da92 | ORPH
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/01077d66b0a6c8d1f94ad1ca5dde05512b9b531a |     
        i686 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/b08c3998a7b7e6b10b97ebef20a6259c3b4a2036 | ORPH
         arm |               host-swig-3.0.12 | NOK | http://autobuild.buildroot.net/results/3fed071114f08a621053e8685e9f79a46fd20a59 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/7821a22d8b2ef180f0d9519305c52548aa34bf9b | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/f62d18e1480dff78e3c2f8e536f276ae2f2311e6 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/5ca0fb5766551fc8761f429c23a12b2f7c86c936 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5f63a7d86cdf23dc26048ad34ab4c1453c30b674 |     
        i586 |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/2f22625a2ce189d905e25c619e92429b1da3f887 | ORPH
       nios2 |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/19f7247f81efabf92e2c017395a488a1167416eb | ORPH
         arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/df76e2eb8f70ec9b11fac864b94cbdb54370e3b2 | ORPH
        m68k |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/7f60cdfee031809e6371f9e9da13948d6cf78cd0 | ORPH
        i586 |                 tinyalsa-1.1.1 | NOK | http://autobuild.buildroot.net/results/de97fbd0b9c88bb5d9aa81ea6d73cdcaadb9c763 |     
        i686 |                trousers-0.3.13 | TIM | http://autobuild.buildroot.net/results/90ff8075087315db575f34dd9959b400d2ad9505 |     

-- 
http://autobuild.buildroot.net
