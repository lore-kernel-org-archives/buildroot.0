From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Aug 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-08-23
Message-ID: <20140824063010.7D12B101B14@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-08-23
===============================

        success : 100
       failures : 13 
       timeouts : 1  
          TOTAL : 114

Classification of failures by reason
====================================

                libinput-0.3.0 | 3 
               alsa-lib-1.0.28 | 3 
ti-utils-06dbdb2727354b5f3a... | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
make: *** wait: No child pr... | 1 
                  boost-1.55.0 | 1 
                      gsl-1.16 | 1 
                  thrift-0.9.1 | 1 
                      qt-4.8.6 | 1 
                  opencv-2.4.8 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/d5b7ac84dde0e4e26cd7cc46d79e66c39ed5cd53/
    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/b89ddf71d068f57c4edb988b9c07f5537af51c3a/
   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/bea21b6695b3612435d5898147f0a9e254b2122f/
      i686 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/27cf9de5706aba3360cfe11cd2cd3f463b8e3f13/
       arm |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/cf84b29384aaa83b32cd601a4127aac83967d568/
       arm |                       gsl-1.16 | NOK | http://autobuild.buildroot.net/results/bd3ad5168097dd5ea981653814c55632432ebc5f/
       arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/3707ecb7269f146a7e8685a483520696975613ce/
       arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/b9b19eea280dcc71c9febc2ff43165c14c406d57/
    x86_64 |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/ab50abc296dfd0a42a27304b408ddb6014c5ced4/
       arc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/44d07a202ed43f0163476e8e6fc7bf179baab1da/
       arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/13253536084839f8510bea2f386335d087e99331/
  mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2df1be2bed4f834fa740121c947af17697767c62/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/39d5488d0aa8c9e1c93fc83413c3e9fc058b1d8f/
      bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/16e67fd09c3c106898fdf18852c6091932185b7b/


-- 
http://autobuild.buildroot.net
