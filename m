From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jun 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-02
Message-ID: <20140603063009.6ED1F100FF9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-02
===============================

        success : 64 
       failures : 32 
       timeouts : 1  
          TOTAL : 97 

Classification of failures by reason
====================================

                     nut-2.7.2 | 7 
tvheadend-0ebca1b3dbb6a18d8... | 6 
snappy-1ff9be9b8fafc8528ca9... | 5 
                    sdl-1.2.15 | 2 
                 cdrkit-1.1.11 | 2 
                 mpg123-1.20.0 | 2 
make: *** [qt5websockets-le... | 1 
                linphone-3.6.1 | 1 
                       unknown | 1 
                  cppcms-1.0.4 | 1 
                     rpm-5.2.0 | 1 
                gptfdisk-0.8.6 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                     lzop-1.03 | 1 
                xapp_twm-1.0.8 | 1 

Detail of failures
===================

    mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a81597d086eb297008516f3be4986e59eab1cf69/
    mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/378ffa25982f820f9ca7e71ce79e8c812968f39e/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/0684c749af111bb133a945e51000954a60a18719/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/7f852d9f16890b94d011b4d8a4bf1f35d37c7c8e/
       sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/298c30d91c54ba72fa077310df3e193902fb2072/
   powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/4805656c2a30481a866e23bb9993f63aff4ed7c6/
  mips64el | make: *** [qt5websockets-le... | NOK | http://autobuild.buildroot.net/results/c1de3b819af574712ec69a99d0db355c6c0ba735/
       arm |                  mpg123-1.20.0 | NOK | http://autobuild.buildroot.net/results/d8af8f991b4429cf06081ddf2f08043861842a50/
       arm |                  mpg123-1.20.0 | NOK | http://autobuild.buildroot.net/results/8da887aed0a878d496d640186dd6a72401ba626d/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/ed9f2ae76d58a566aa0fa2b0a7f44ab3225d2811/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/5868c95395e461a0d53e5a88529976d397ff1c47/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/d5cc13544bc2699373a415302829dc4e0716850b/
   aarch64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/a182f4bdf0e20ccfe84086d66a769a5f5658e1d6/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/8c5dc5f09e2dcb2a3aba1c451a53de8e79d531dc/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/c3c0b56f4a6adc278da7a019772daead392d6b76/
   powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/ed4b541b86fc16179e96b0fe5933e20d8ca23d89/
      bfin |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7fa2bd8e464c6708095ec4038b6f3d534b10dd82/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b866642296cda2121c83df1bc2fc9f6c42aa0c41/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/9bb039b826a32bfa8dc35030fbc82b9d5452ff95/
   powerpc | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/f9fbf337e0a6ce4f2131384b7b9d912d216c1c64/
      bfin | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/49c4f3186a2de3a8cb02ea12b158b278d792fb74/
       arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/007994a8c12cd70d10f82b7161128376a5208a29/
    x86_64 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/a88f813a36198966118f09a46fb9d657630d6746/
       arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/0ec62efed0e0aec56b4aa6b5ef1a3bcbd1474949/
    x86_64 | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/78f8d37d65f5db8cc45361b205a27131b023409d/
    x86_64 | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/b8d5b200ff1beaa6d185c7fac626c19e6ea05f68/
  mips64el | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/808e5bb035ddef09339fe6a4d00147ee29ec2a18/
   powerpc | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/d10b4ebf3c21a55413a30d7ce1cb9ec9790bd9bd/
   powerpc | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/92558039ed35ba3f4cacb5a955664ba4ce40e0db/
       arm | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/30baf8c8d7968f4504f6c7a18f9f51193830cb07/
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/9ca4c3d3ff8edbc86b9c515365691db9055b19f3/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/eb0942a3e469dc5f317d9a7d0220aa733726fd2b/
  mips64el |                 xapp_twm-1.0.8 | NOK | http://autobuild.buildroot.net/results/c680a2fec88861f20a2cbb17078537a62924dab9/


-- 
http://autobuild.buildroot.net
