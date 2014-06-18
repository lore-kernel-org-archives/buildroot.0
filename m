From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jun 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-17
Message-ID: <20140618063014.D6EC8100DE6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-17
===============================

        success : 104
       failures : 22 
       timeouts : 10 
          TOTAL : 136

Classification of failures by reason
====================================

                    sdl-1.2.15 | 3 
                 haserl-0.9.33 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
             lttng-tools-2.4.1 | 2 
                pinentry-0.8.3 | 2 
          host-gcc-final-4.8.3 | 2 
                 gnutls-3.2.15 | 1 
               alsa-lib-1.0.26 | 1 
                       unknown | 1 
                      icu-51.2 | 1 
         host-gettext-0.18.3.2 | 1 
                    fltk-1.3.2 | 1 
                     make-3.82 | 1 
                  boost-1.55.0 | 1 
                    parted-3.1 | 1 
                 mplayer-1.1.1 | 1 
               netsnmp-5.7.2.1 | 1 
              gettext-0.18.3.2 | 1 
           host-cmake-2.8.12.2 | 1 
                 webkit-1.11.5 | 1 
             util-linux-2.24.2 | 1 
                  ffmpeg-1.2.6 | 1 
               log4cplus-1.1.2 | 1 
                  gnupg-1.4.16 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4d3aff15b9ba2b04ae59e5a8eb4063a1e2117018/
    x86_64 |                   boost-1.55.0 | TIM | http://autobuild.buildroot.net/results/2cfa519d1a1c89fbaf68990c6d0e2089dcc0429b/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/18c0bef45b56a9893df035e7d4d01ce78643ec2d/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c0342f3f335cf11a7fe52a5e5508ab739954c989/
      i686 |                   ffmpeg-1.2.6 | TIM | http://autobuild.buildroot.net/results/6a23c77bbfc1ca97167f8cd59d4cbab5bec98410/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/4a7d39059b981dfdba0fe85179b2acf539a9b9c1/
    mipsel |               gettext-0.18.3.2 | TIM | http://autobuild.buildroot.net/results/b617c1204f7cfe04a3521783d57df445c10278e2/
       arc |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/f13082fe7615975a22da269af27b2363b6f405b9/
    mipsel |                  gnutls-3.2.15 | TIM | http://autobuild.buildroot.net/results/39a8e12a9179079bc731c948f6973c24cdd01a95/
    xtensa |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/c8c1f3a522d5577337c9fbd79d73f955ba591ea8/
  mips64el |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/a6c15099e1de1be569dd4f8a47e97a8a796d746a/
    x86_64 |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/8a676c7793b3b050aa061b5048ed871d48e2d42e/
       arm |            host-cmake-2.8.12.2 | TIM | http://autobuild.buildroot.net/results/99521cb2b445d38a8b08c772e0fdb297e1211bcc/
       arm |           host-gcc-final-4.8.3 | TIM | http://autobuild.buildroot.net/results/6a436df591c769f70adba06d6cc6f75f7fc8ee9b/
       arm |           host-gcc-final-4.8.3 | TIM | http://autobuild.buildroot.net/results/c6e5c4085e52027e81d5ccb19bcdb04a6fbea753/
   powerpc |          host-gettext-0.18.3.2 | TIM | http://autobuild.buildroot.net/results/790aae777b789ce20f3b68bb2d1a297e8428a00e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b4fa4e70ddff4bf50d283826933e193389ca5a53/
      bfin |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/c18a96e580d44b4dcb38aedcabf093897d1daa80/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/67d7d2594c409a40005c010740848a6be99da3bc/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/bd7298cacaa179835e75fc4658a878c2108a6d8b/
      bfin |                      make-3.82 | NOK | http://autobuild.buildroot.net/results/ec7931f899a96a0885bd69b3cba801c4c0cba625/
    mipsel |                  mplayer-1.1.1 | TIM | http://autobuild.buildroot.net/results/46f342ed5287cb3031e9eacef1d759bd9f47208d/
      bfin |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/b5d87f87409a37c39db0d2d5313f8d9cebdbe393/
      bfin |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/069e6e121c359d552a76c8f749134bf66ab60d70/
   powerpc |                 pinentry-0.8.3 | NOK | http://autobuild.buildroot.net/results/b6ef17260ed50afdf98d85583c80ba34658728ba/
   powerpc |                 pinentry-0.8.3 | NOK | http://autobuild.buildroot.net/results/3ef5d415b39877a1b8c2ff2c4446b1a1fea3ff29/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/2c12dd043f44cb57eacc886290a17383ca52cd07/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/34ff21a0f61f7ed27e14845e12380f0375fb2ad0/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/770e9f4041c8dd1b801bd5f673fd22d3bc7ad513/
       arm |                        unknown | TIM | http://autobuild.buildroot.net/results/7c607a4c23bf293f2f08c64927163888aac4660e/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/70accbc56f1618fc99e9d800151af3b2f885a332/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/950704fa1d35ceb53512019ee4b9a90c81ad903a/


-- 
http://autobuild.buildroot.net
