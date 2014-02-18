From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-17
Message-ID: <20140218073008.88E7010158A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-17
===============================

        success : 105
       failures : 35 
       timeouts : 1  
          TOTAL : 141

Classification of failures by reason
====================================

             alsa-utils-1.0.26 | 3 
               audiofile-0.3.6 | 2 
                 libevas-1.7.7 | 2 
               alsa-lib-1.0.26 | 2 
checking for pcap_setnonblo... | 1 
              pcsc-lite-1.8.10 | 1 
                 libxml2-2.9.1 | 1 
                 cairo-1.12.10 | 1 
                  dhcpcd-6.1.0 | 1 
                    sdl-1.2.15 | 1 
             iputils-s20121011 | 1 
                     popt-1.16 | 1 
               w_scan-20130331 | 1 
                     gd-2.0.35 | 1 
          enlightenment-0.17.3 | 1 
                aiccu-20070115 | 1 
                libnftnl-1.0.0 | 1 
                elfutils-0.155 | 1 
                  libv4l-0.8.9 | 1 
                 qt5base-5.2.0 | 1 
                     vlc-2.1.2 | 1 
                  thrift-0.9.1 | 1 
                     pv-1.4.12 | 1 
                    mpd-0.18.7 | 1 
        ltp-testsuite-20130904 | 1 
         qt5connectivity-5.2.0 | 1 
                 mplayer-1.1.1 | 1 
lua-ev-458165bdfe0c6eadc788... | 1 
                 webkit-1.11.5 | 1 
             util-linux-2.23.2 | 1 
        gst1-plugins-bad-1.2.2 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/3ca4e88c716fa145dfe59be403f947e9e9d6c704/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/46519740cb878fe92187f7e15cca5d17b8c209ff/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e97a37287f7290ccb254f804dea9bd2d4871ffd5/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d4abcc530e3ff8f6fa6c869dcc8606363487037a/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/5060c77fcfb98c08332bba538a32863998832c7c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/c0f3ff41bd7faf62642083f2d9af9bd598b3eed7/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/04822489cc173d1087c75ff55f68761f86eb62f4/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/401c3ccc2feb01fe19f6eb1dcf2d6fd688fa5f9a/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7517f7a2cf979be30156ddb3a8ee0f6d9413b2db/
    x86_64 | checking for pcap_setnonblo... | TIM | http://autobuild.buildroot.net/results/487b524d06550b9e00a7e372a663e79c501d4214/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/0e50643d89fffbf5b0a5ebbb9c348e0113b34c0a/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/92dd2822dbf8262d9f27f6fbf6b2e5be58aef3fb/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/58231ad78260c09a5518631ebb8048efcd478962/
       arm |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/8fca3b25342c4ee60aa2d37eb9671b6e072f7c31/
  mips64el |         gst1-plugins-bad-1.2.2 | NOK | http://autobuild.buildroot.net/results/b74751060ee1863513b9781a49a4a03d0b58b329/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/af27993eba11bfcac922fe9435c7e5cdccfb6290/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/eee1e7334958b78f65d9157b2bef430b0283992f/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/5cd46148cd1bce5383aa32d7217fa491988715a2/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/2075bed29f019a556bad7ff49f4ff224fa941750/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/268d61a9f2a32646e4f4dd759bb65050b29713d5/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/1192472236e6219638e454e7a2505faf968472aa/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/6e5a0234e901781383e23b063cb0bd7260ce0a79/
    x86_64 | lua-ev-458165bdfe0c6eadc788... | NOK | http://autobuild.buildroot.net/results/ccdcd4af463f2aaa2ecc5d250d4fe0d634aeb04e/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/5fd86ec6dbad8b2aac71faeb26c6f7ef689a9143/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/7cd8ce2bb7e41d167e9840f33a121c238da364c2/
     avr32 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/11998655a14a34b9d618b3bcef967d39d20f267a/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/8e49b1039fff99d4ee9380e596b10008880e99ad/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/2396ba8ab1bc0a4581c43573e32863214c0a1c23/
    xtensa |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/5e90ba56d3a95ebe7160c435a78eda4a4924940d/
      sh4a |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/1431924acbbf4816dfe972b80d1cf068e110f788/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/6357675654be8229f33fad5319240db322876a51/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c1027198b5b75b67a2ee7944b36db026b46dff83/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/5a7c5cd4cf843b5b1aead5387ba58196f8f30971/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/5419abbe8892b92a78056f676d483301c083def0/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/39ff80907971ee65d4a4c75a8dcf1796cf41abbf/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/9c67b37b08d33a5f96d8ce427926756b127fed64/


-- 
http://autobuild.buildroot.net
