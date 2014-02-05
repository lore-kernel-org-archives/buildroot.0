From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Feb 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-04
Message-ID: <20140205073010.8762B101A86@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-04
===============================

        success : 81 
       failures : 79 
       timeouts : 0  
          TOTAL : 160

Classification of failures by reason
====================================

                    gpm-1.20.7 | 11
                      axel-2.4 | 9 
                 libhid-0.2.16 | 7 
          sane-backends-1.0.22 | 5 
                  ltrace-0.7.3 | 4 
              pcsc-lite-1.8.10 | 4 
                   minicom-2.7 | 3 
            iucode-tool-v1.0.1 | 3 
                 cairo-1.12.10 | 3 
        ltp-testsuite-20130904 | 2 
                 pixman-0.30.0 | 2 
             alsa-utils-1.0.26 | 2 
                   open2300-12 | 2 
                minidlna-1.1.1 | 1 
                     monit-5.6 | 1 
                      mtr-0.85 | 1 
                     pv-1.4.12 | 1 
                    sdl-1.2.15 | 1 
         host-elf2flt-20130904 | 1 
                       kmod-16 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
                  libogg-1.3.0 | 1 
                   squid-3.4.2 | 1 
libwebsockets-v1.22-chrome2... | 1 
                     popt-1.16 | 1 
               audiofile-0.3.6 | 1 
              e2fsprogs-1.42.9 | 1 
                     lua-5.1.5 | 1 
                  libv4l-0.8.9 | 1 
                  bcusdk-0.0.5 | 1 
                  python-2.7.3 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                  nettle-2.7.1 | 1 
           imagemagick-6.8.8-4 | 1 
               libglib2-2.38.2 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/9f8e572c9f1c677155cc7d1828371bcf572ff878/
       arm |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/4fca4f5d904808fcad4cf8a0f750980a0d51ab9e/
       arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d88d608e656ee3df374e857a817f0e7f0e296814/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/54601634f51416ae119e484dcbea9be1e54d1de2/
    xtensa |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/18228878b9f8eb3f5e89b7a6c3199244a18f0617/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/b8a172136e3305ca238a23596cd1162ba842fdac/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/e4f63199953277926c5d66cad16450a3d0dc98ab/
microblaze |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4e5178f7171231a4ad69796afb6c871dfb81b235/
    mipsel |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/a649b3d6384879a141574638b0aafb54465694a0/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/be2162908f8eb0dfbe9894fa2f92fe2cffcda2b3/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/67f309ea2cc4bfa23fc77ae5f22ff0405b447cd2/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/d277a864294f7263ff566d66d2c39febe22f53af/
    mipsel |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/32ad17192194171a4b9b5334731d32a323e2b007/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/36324a8ed32b9d839054cd720077cd5350b1999d/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1990bbae82ae082da9efe4d98a5885b5d10cf77b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8705e5cb1feddedcd2b6ff352d090ad750901cbd/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/f7235a499c174c0733055372f1627f22fb269361/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/661aac45bcf125078b93637d9dc64b6ca5cd8e18/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/88456ff57ca6fc29575147f9b6df56c61ba57f0b/
       sh4 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/42ec8611ed1ca78ce26a1a8d66ac583de0e6b96a/
      i686 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/825eacac802df88b2f99b773febaf3097edbeedc/
      i686 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d72440e03f3b8d7ed3610b22feee9dbd0f1a08ed/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/512e6136510c1658311a46082b8a22b4de95d73b/
       sh4 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/2b21911fdce314d7630ce35ca04249f9c38f1fb2/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/4ea17d63c132d6bf0eeee8eadc69866ec5b82800/
   powerpc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/762853f670b89b7cd88a852043a6d499887956d0/
    x86_64 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/49c7748e174fa29c70e36c188a411d61e9bc853c/
      i686 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/870c505bd2412b3f28a58d8fc2d715b5092c9f5b/
     avr32 | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/e87687afbb1b09f730d112a0150ed4fbf3d6de01/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/77997fd75282c355f6270b92371c161c9457d1dd/
       arc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/b7536a0b04cb549670e0d0b8b10dd800327b6956/
      i686 |             iucode-tool-v1.0.1 | NOK | http://autobuild.buildroot.net/results/c646da4343301b312ef260d3e22ad69496fe9156/
      i686 |             iucode-tool-v1.0.1 | NOK | http://autobuild.buildroot.net/results/183aecdc1746ffb4d3b35b1f3cdf83c5271292e5/
      i686 |             iucode-tool-v1.0.1 | NOK | http://autobuild.buildroot.net/results/3fc0b3f356efdebae4f7597a16d0d67f8bc4b76d/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/a2c4cca0aec44474793fae389e988d3d5c28b4d6/
      bfin |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/d4d10ddccf4f53087e2012a36fd80808f7dc7cc5/
  mips64el |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/e311df80e0f9f5b9f625e52e2219acfc1015586f/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/76b4655b48f281e41b9d6e62cbf0be4c23a4a54c/
    xtensa |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/6a50753117cf835e020a5cf07e419613c67007e4/
      sh4a |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/46ccd7f47ab370f780b690c40b8110a0297d7dfd/
    mipsel |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/464b0d3b5b7cf265b6f69c41046b3a96ade7541a/
  mips64el |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/f1e6a3f7f21237b30ec3b916492148a2c7571661/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/770b49baa721f8c533745840e528dba6a0b16350/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/004ddb62a73ae9d5eb62f80ab10d3f8e26312d04/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/58c10d5b6434e309810bb440a6ffed47ae701914/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/ca3556c8eda707928d4aaa6545f3a4888339e40d/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/14c107a735bb54f55c99391b0ea0ff6bd1234e12/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/8c5488aa86595c1373998b7f29c50f36d3a96b28/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/d1df76d20dd42f026a42492c9a05bceb350fd64e/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/f36c5e8f7c5d7d2c6bfc0d578827b0c01ad1ade2/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/0471711bcf8e476f75cb3a9de0c7b6ce66fbff01/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/b9f1e5f3a5e113d38cf9ba532edcdf059b488f9a/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/e80c7de60ea17931d5935256284ad959da64bfc3/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/91df6a84735984504fd4fbf323cd8c3f61a247e6/
      i686 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/5094184c854c7be6dcae95f5b3cbc3684eb972eb/
      i686 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/ab92f8c43fb12f9ad3d119f06c1cafdfdc8367e7/
       arm |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/228ef8daedfea0dde0adb3d27adc5e615aa58f78/
    x86_64 | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/3364bba431ef522280612067fa0ff1418c8f9d7a/
      bfin |                      monit-5.6 | NOK | http://autobuild.buildroot.net/results/0fcd4ee6272ddfa55c57814f6c109c9126099927/
     avr32 |                       mtr-0.85 | NOK | http://autobuild.buildroot.net/results/4eec6e29d0f2a46bbbe3a748e85bd06c3601b7c1/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4320050d681aa825aea3f57d8522a76acfa6151b/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/79eb20d3b8acd257d084d3cf7b27982a6dc11010/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7c20c807e95d2f1e18c1e507dd6015566921e57d/
    mipsel |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/337fa6e4f2a9a80ce34ccaffc6b0ad8d280c63a1/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/2228e31e76fa2f87270effdcb6b174c0596a260f/
   powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/2790ec44a55b41f722e23e83dbf0c8367cfb6e25/
      mips |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/8fa2ea563a5e6a8004e8f091c25c6357c639ce10/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/140461bcaebc8b6b4ba1b1347c8535a4c385f147/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/bf7a0f33c48aab85d2440eb78e0885837bce847b/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/cd8764c3237ef93a5e8e1af19964924fa146ea08/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/c321aaa3d59145178f4d9c2a19ffd8cba09362fd/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/40eaac0bb65c4553b1ccd0bad667e3429ca2c650/
  mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/11bc9e43558309b908cccb4db0ca1c57ef0d3ed9/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/cadce0734c44d1f196b494498467cc3bcf4cde96/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/2b0178ce5f1222770cdd01ccd419b9536b478c06/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/37b6102d6884dc5eee601dd135d61603c59a3c23/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5f831a55e45aa7243e3d5dbaa179485600855cc6/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/0b0f99bb63f430c81eaaad7eece9df6acebd80ed/
     avr32 |                    squid-3.4.2 | NOK | http://autobuild.buildroot.net/results/c6a686885a6c845b527c58c3f2075f82bcf120e2/


-- 
http://autobuild.buildroot.net
