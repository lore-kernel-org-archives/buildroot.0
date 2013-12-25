From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-24
Message-ID: <20131225073009.604C610193B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-24
===============================

        success : 85 
       failures : 54 
       timeouts : 1  
          TOTAL : 140

Classification of failures by reason
====================================

make: *** [python-pycrypto-... | 7 
             util-linux-2.23.2 | 6 
                    ola-0.8.32 | 6 
              python-pyasn-1.2 | 4 
                     pv-1.4.12 | 2 
   host-gcc-intermediate-4.7.3 | 2 
                     popt-1.16 | 2 
            python-crc16-0.1.1 | 2 
                 webkit-1.11.5 | 1 
                     lua-5.1.5 | 1 
               harfbuzz-0.9.22 | 1 
      libnetfilter_queue-1.0.2 | 1 
              gstreamer1-1.2.1 | 1 
                poppler-0.24.4 | 1 
             iputils-s20121011 | 1 
                 qt5base-5.2.0 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                 cairo-1.12.10 | 1 
                     php-5.5.7 | 1 
                      icu-51.2 | 1 
sconeserver-d58f2de88c68193... | 1 
                elfutils-0.155 | 1 
            qt5jsbackend-5.2.0 | 1 
               audiofile-0.3.6 | 1 
                python-mad-0.6 | 1 
          imagemagick-6.8.7-10 | 1 
                  libv4l-0.8.9 | 1 
                 libevas-1.7.7 | 1 
                 libnspr-4.9.6 | 1 
                       unknown | 1 
       gst1-plugins-base-1.2.1 | 1 
                  thrift-0.9.1 | 1 

Detail of failures
===================

    mipsel |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6bbd3291d12cf3f35485a889b3feb567a81b2e2a/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/00ccf512ada4457a088eb444ef946b9c8ea096e1/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/4a6b933405a25e70163121d9c29f7dd0dac93d75/
   aarch64 |        gst1-plugins-base-1.2.1 | NOK | http://autobuild.buildroot.net/results/b3f72b43b8b2fc4116cfefa36bcd7b638a52d680/
microblaze |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/a6513761e9be11d80c6b09a905d4c29cd31fab8a/
   powerpc |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/acbea677ef5c8c554167cb60d7c3ce177308cdc2/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/be660e4ca2ac59a938810e95ea7c532cb904d2d7/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/ffda876682cf56a8d9d4944a4cac58658ce824fe/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ff07cfcb321322d1d0aee812624019d8c7a5e59c/
       arc |           imagemagick-6.8.7-10 | NOK | http://autobuild.buildroot.net/results/9848a9fcc81918b54ce6e8b2c53f7b774b04cac7/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/209eb2da91aa62d1d1d0292d91e131a41b985de8/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/25ef2b1b9e77b2aeff2a8edf7182964eda891687/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/8e025a0a9f0b304d2ed763231b4c84d27608e10b/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1ec55d118c0b4c37d0c4a6c64186a950a3738725/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/6bbbca3447cb6bf75263a3d84e361ab729386c8b/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/f84032251b41069d13c24f4b04c2100ce2d38616/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/e7b9bd8ea9dd2055f734bf759557f31835f857b5/
    mipsel | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/2f81a84423830944b3057cb9e5a072246c4679db/
   powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/47dc0d977951717f136f8c118f22bea7f83efc14/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/8ef1a937dd1b4e7b065d0ae502840f683023b2fc/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/4af7de57a5d1649253103040a4daf54424cb28e8/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/5f456501ef3395b33b1950ce7af55433d5fbd06f/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/61ffcce37f0e0034368bc9a47487362228fbf8fc/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/ddf337861486146ea7e91fd257f5a0ad360c2274/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/77ee93f45a4162b5b3f2ceb15cb85f39b5ccec6f/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/327aee04f4377815907cbfe9d38dcad62dd26515/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/04613a9da9eb34e2fe31f1c8745fce3757946e1b/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/7c6e05b80a2164ae3f048e624e28b290d9084d24/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/3ddacd6ce8bb07ab5991bc4dd11d084bc56841cf/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/1bc538c4825db58fce05c2110d0c3bc685840aaf/
       arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/4d7cb52b2a378e8ef23c8933856e9aa13b85aa1e/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/4531cd218f41ed9b26856262aada3e103ab6889b/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/2ea68deda875c71308e8cb1e7c784daf8ddc5a89/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/b2d8af74d1c3952797787383a0bcb4aec6ec2dd8/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/0c005eaede42f00328a8a171d49ff3a477a87e78/
      i686 |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/3c17cdfd79829878162ebac6d781cbf99846d9b1/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/ddd602f8b77f2335d203ac46fb1a1757f752c493/
       arm |                 python-mad-0.6 | NOK | http://autobuild.buildroot.net/results/01323bdeb728961271e17b48f5251aee9dc6bba1/
   powerpc |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/f735f451fad81f398635f5601120b1da41f2b428/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/3541469ab2d9281863f51c0730cb12936f3d2226/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/d19f54de165d14ab4634d29fbcc1ff928ee4afaa/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/03172aa21ede07516a1134d8e5dcf7583bb867d7/
     avr32 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/15b574e14644b5cb4a8afca21414676f55134d6e/
       arm |             qt5jsbackend-5.2.0 | NOK | http://autobuild.buildroot.net/results/4190c78c9cb6ff5b991578e53624948b0a8f5cdf/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/a900795334342bd6c066b2a5223e5dfe2bd6e427/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/62d66a6cf89786b4b4a0513e3ebd6803a2b28607/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/ac348ce83944f796a7cafc9323ee231063144f8a/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/3f4fd2251ac286dd3a66ee106a794f23af1b5338/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a73594d7d449d7e1e2ae7cfc77798471251e1ce6/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/5e9e3b434172233ee6711cffd2dd96df2e0301de/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/04780823fe51a9a3f5fbdbef160a4b6288367e56/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4e373c92bd87fc31c4d266b29351685d7108bdfe/
      mips |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d2a2e2fcb23c2c4036c93121db9bd3bee05bdb66/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9a33db5ef05a1d5829ba4c67af6aeffe21ab172a/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b4623ac4f7f5af85423cd5860c993ea00b90e7ef/


-- 
http://autobuild.buildroot.net
