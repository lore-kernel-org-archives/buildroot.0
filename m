From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-29
Message-ID: <20131230073008.A397C101C04@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-29
===============================

        success : 89 
       failures : 36 
       timeouts : 2  
          TOTAL : 127

Classification of failures by reason
====================================

avrdude-eabe067c4527bc2eedc... | 7 
                 xenomai-2.6.3 | 4 
                      icu-51.2 | 3 
                   qjson-0.8.1 | 3 
                aiccu-20070115 | 2 
                       unknown | 2 
                    ola-0.8.32 | 2 
                  libv4l-0.8.9 | 1 
                  nettle-2.7.1 | 1 
             alsa-utils-1.0.26 | 1 
                grantlee-0.2.0 | 1 
                     nut-2.6.5 | 1 
                cegui06-0.6.2b | 1 
                oprofile-0.9.8 | 1 
               qt5webkit-5.2.0 | 1 
                libiqrf-v0.1.2 | 1 
              cryptsetup-1.6.3 | 1 
                  weston-1.3.0 | 1 
                  connman-1.19 | 1 
           imagemagick-6.8.8-0 | 1 
                 rt-tests-0.83 | 1 
                  thrift-0.9.1 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/7c2984d0e6c682b6f3fda03ae9146586f95680ac/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/62c5a4b503d5af8319a8749bc97593ed5513f6a3/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/e723258be069f27b03a1e3ad15fe61263f57e3c4/
       arm | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/30bafe85fd270bb43d6e14cfc882df5d05e97875/
     avr32 | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/ee5085c43f8a501b82f988c89362f43822f978cb/
       arm | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/0cd2ce5d2a94ee2a032ff3f2d125ab8545125ca1/
   powerpc | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/19757e2e2561b1623598ff52c2f9dc68bf4a9df6/
      bfin | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/2542b656f22ecf4a9338b14d0104fa99e4cbdfb1/
       arm | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/374608a852e66b89d02bbee1199a8dc9817d3aa0/
    x86_64 | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/9f85503e543084a760ed30a9a2436b71e2f16c3f/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/ea9dce60294f6f91979f1a184400772d3a8e32b9/
      i686 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/be25644707a88c6deb00f5c707f36995a1aa7c1c/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/18317601efafc79dca40336650d4ddbc27509b21/
      i686 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/75b45da597c12034baad50492c0c8150dc1bf0aa/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/35b3e9a0f023aa635322edbfc8605a3ecbbfbd81/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/71a2fbe5b17b89aed96175a10859c108d415ce92/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/06f3eaa9cae25f155943a31d1b98fa14e55aa39f/
   powerpc |            imagemagick-6.8.8-0 | NOK | http://autobuild.buildroot.net/results/eabf33bb9b84c58ff99994fa2c407bdf6209f95e/
      bfin |                 libiqrf-v0.1.2 | NOK | http://autobuild.buildroot.net/results/18eadd61fbc6b6312560dba3dd501cbf5365fe48/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/3e89356e4a9ed73fd2209a8f984172e63018f5e0/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/678f5340f4e43fde12ff8d453ef38f76b6c89722/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/4a6ab97f1d7e196038b2fe8638d0a0305bec282b/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c495c7f032ab0f0e08ba29788081e056b0ceffec/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/d7b40ea42fb5b4f5ca8038a915276e9f5bfb534d/
    xtensa |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/df797a81111fa15de9337adefca05cbac156d0b2/
       arm |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/3b9d022b02c4497efed178f35c069ea99a7d3eef/
       arm |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/2f95f6b14140048478a53b5ff35a2f965b4d0bc4/
   powerpc |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/7caca1d7787109f1039615fe5ae712cde9f03230/
   powerpc |                qt5webkit-5.2.0 | NOK | http://autobuild.buildroot.net/results/08cf889ea4aae574521aee2bf965c921e8066080/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/74ce055c396fd3d015df56c23450136147d6bb80/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4151648e8417909776d6edb25b8d4763087e64cc/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/3d0bb5f8a07b81632765a036300b5a3214976cc9/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/9c5bac0bde67f57bb88966f08ad14f8298c27f0f/
    x86_64 |                   weston-1.3.0 | NOK | http://autobuild.buildroot.net/results/5e40764c9b5e4eb717705a160be29f63fbea01a6/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/5a44022be407c59fb53d334de524ab26aeb4fe81/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/267edd54ea3f5c993b98cf79ce85be0cf84096a6/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/d590be34637a4043c929ce615f9db504484be435/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/1dac7a3e55343b6d485fb0e671bee92a37c3854d/


-- 
http://autobuild.buildroot.net
