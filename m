From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Jan 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-07
Message-ID: <20140108073007.EE202101432@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-07
===============================

        success : 89 
       failures : 28 
       timeouts : 3  
          TOTAL : 120

Classification of failures by reason
====================================

                    ola-0.8.32 | 6 
libwebsockets-v1.22-chrome2... | 3 
                      icu-51.2 | 3 
                       unknown | 2 
            libvncserver-0.9.9 | 2 
                    sdl-1.2.15 | 2 
                aiccu-20070115 | 1 
         qt5connectivity-5.2.0 | 1 
                 cairo-1.12.10 | 1 
             util-linux-2.23.2 | 1 
             iputils-s20121011 | 1 
              cryptsetup-1.6.3 | 1 
                 netsnmp-5.7.2 | 1 
                 webkit-1.11.5 | 1 
                  libpng-1.6.8 | 1 
           imagemagick-6.8.8-1 | 1 
zmqpp-30d72d95f2cfdf9c5cedf... | 1 
                 libxml2-2.9.1 | 1 
make[2]: Entering directory... | 1 

Detail of failures
===================

  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/577db0cca808de01726fa870454d14a20f159322/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7516c0fb5af2fe52e2f04fe88c09752d71a68455/
      i686 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/b5ef439aed8bce6c43381daa69bce690131d2934/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/00cd81cd8b1fdaed77e8cf5df845ff34bac67973/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/706bb6ca820cfc369b04c10d529e29bb5ad92831/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ea8e99531cf40929f6e9b6f29c1553e774dfb211/
      bfin |            imagemagick-6.8.8-1 | NOK | http://autobuild.buildroot.net/results/04045d25dd8e96a07fad7b22ce03ec85a4f6a665/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/ff6719ef4baebdadc5303f94e142a0ca707abf8b/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/7df5ed4eae79b15ca97779c648e6ac45e7d07e18/
    x86_64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/5c393f7bd61d1f79f9aa97f60dc98a57133de86f/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/f033a9f7f01844a30c437b5ba949525078d0ccbf/
  mips64el | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/c8d3094283207ce7b746779e2561f7aca6bfc260/
  mips64el | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/71eadf9850f07ea734cf7c01aacd60be58672eaf/
       arm | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/f748d14247bd3cd77847568b81960dc4487ac201/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/a957eba9308109570bd60f4714a24bb913664977/
       sh4 | make[2]: Entering directory... | TIM | http://autobuild.buildroot.net/results/bc2e8594cbb7feef3fbd801c74f8079c9672a455/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/5c92314bc727d448e28f8ca849a9d3eda1de56f4/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/3aa269c62c4de4c9a8a63047eb1f222d5b56d488/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/6e9f64897883e04a59950708bd18a99c5ed8e8a8/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/78a209c3eba9eec2a5ecffe8316699b36057b01d/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/2e77808b009c76576aa0cf5068ad3e5a72285aa6/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/e634d5f0cee3967caffaa6e7ada8c0968e3eff63/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/47d7801b7ec19c81528c9df6bffef4d61bab523f/
      sh4a |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/6e53783b8d0701a7bb9141114c6bdcf3f744f000/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/4c14d11696c1ff7492c991d3b173c71542a7f7c2/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/bf83466a7bbb0635d97fe279a18778d92f20bea2/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/f4a5a6d544199b9baa7e0a793d6c26089ddb4135/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/fe600fefc17984af593742a64b47d4d8280d8d0a/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4a38f3e3981cd6678f6b9eabde611511d026af6c/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/1f057ccf45733638b2967fcfb64936366b6ec1c3/
      i686 | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/42590285167f779e27a4e8db9853c7065b9e31c0/


-- 
http://autobuild.buildroot.net
