From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-22
Message-ID: <20140723063009.62CFA100F9A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-22
===============================

        success : 86 
       failures : 7  
       timeouts : 1  
          TOTAL : 94 

Classification of failures by reason
====================================

make: *** wait: No child pr... | 1 
                  zeromq-4.0.4 | 1 
                  thrift-0.9.1 | 1 
                oprofile-0.9.9 | 1 
               ruby-1.9.3-p545 | 1 
                     tmux-1.9a | 1 
                upmpdcli-0.7.1 | 1 
                libmpeg2-0.5.1 | 1 

Detail of failures
===================

   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/9019b553abd093714b0f0ff1ddb2278c92b0b75f/
  mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/467dd1be96d8217b872010ba9aa874cf60e5a552/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/14580eda4bb5d8d469e9c590e2dc539327d1badd/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/cf8153e8abe856e89f4947dfc41dcb35bdf6f392/
       arm |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/56d9feeedb03dd840e94e7329704e0372a24a354/
      i686 |                      tmux-1.9a | NOK | http://autobuild.buildroot.net/results/0b1a158d98df51145c986c9ead79778c52ba9a36/
      bfin |                 upmpdcli-0.7.1 | NOK | http://autobuild.buildroot.net/results/d8fb4adc1e028e938bf7eff0307d1cb53f9be007/
      i686 |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/e726d759752ab2569360a9e0222a0b240637f634/


-- 
http://autobuild.buildroot.net
