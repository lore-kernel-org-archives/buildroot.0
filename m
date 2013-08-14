From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Aug 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-13
Message-ID: <20130814063006.629A152C665@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-13
===============================

        success : 107
       failures : 50 
       timeouts : 0  
          TOTAL : 157

Classification of failures by reason
====================================

               libglib2-2.36.3 | 7 
                 qt5base-5.0.2 | 3 
                openssl-1.0.1e | 2 
                  bcusdk-0.0.5 | 2 
                 binutils-2.21 | 2 
                      pv-1.4.6 | 2 
                 libevas-1.7.7 | 2 
               alsa-lib-1.0.26 | 2 
                  ltrace-0.7.2 | 2 
                pulseaudio-4.0 | 1 
                  libv4l-0.8.9 | 1 
               uclibc-0.9.33.2 | 1 
                 libnspr-4.9.6 | 1 
                 ffmpeg-0.8.12 | 1 
                  poco-1.4.6p1 | 1 
                     apr-1.4.6 | 1 
                      icu-51.2 | 1 
                  libxcb-1.8.1 | 1 
              strongswan-5.0.4 | 1 
                   mplayer-1.1 | 1 
                      qt-4.8.5 | 1 
                directfb-1.6.3 | 1 
                  zeromq-3.2.3 | 1 
               erlang-R15B03-1 | 1 
               qt5webkit-5.0.2 | 1 
                 fdk-aac-0.1.1 | 1 
           imagemagick-6.8.6-2 | 1 
                libtirpc-0.2.2 | 1 
               binutils-2.21.1 | 1 
             gdk-pixbuf-2.28.1 | 1 
           argp-standalone-1.3 | 1 
                  connman-1.12 | 1 
             util-linux-2.22.2 | 1 
        ltp-testsuite-20130109 | 1 
                  ne10-88c18f0 | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2d7bc8e63be1bbf2684b5bcfea972a497dc71187/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5e7cb5469b6bdda88a3cc5c600bffb03f2320cc5/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/3125922d3fae0d192a44ddcc6d006df1415b0a68/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e78d6e49f4d76c4e6cfe13c72d2cd40e23ce48df/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/14bae96bc92dc741c2d93da0be26fbf998e6dc05/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/f62922ff9ad4c0938cbd8fdb437ae540c5681c14/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/12fc969d172d8f2096feee5164c2530fb6d61a9a/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/87784edbc20e7eafb6a10b041a409700ab7d1409/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/d07ffef48b21de998e2f56cbd86aaec740540ebb/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/936b4af0fb1586d85ea3b7e56982b463a0114d9c/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/f311e19a1045c8ce74cb598ccc856c840001b217/
       arc |                erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/23ef34190f461dc5b968981888721390f0bc4dd4/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/5ecdb0f02a48a2ac65b405fb5342417e33a68e06/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/1315cee25339928d593b04b300d99f8986cf6869/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/06f4b81a6e93cc814a98bf0b7468793e8b034326/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/55d0715f10b3c49d55d80e22ab3312cbfd368ad9/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/7cf3265c29cbbf28598c6f3b0c0f43747327857b/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/c551f1bcaa9828fd67a7b6b16361cc8594c60c27/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/44f2e200dd7d97ef2c24b0ea6afc91de5a1e2cdd/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1cf8478cf4c6f348538765f90612b9fed93950b7/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9073d9564ac0a997160fc56604a446c2c388a65a/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1082557a0add3d2d1926233811eb54327c56d3dd/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ffd19a76b9dccec0ff631ae1a3b61167c2c62d6b/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/32d52fda517a90b7ddb67b15bce874f443847c5b/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/97e831952e6591b204eb704cd1f6dddf58a67a10/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/64e268c55cf3015caa5ab5a79e4cd24265c139d4/
      bfin |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d05c1650365ce512fb974427d2a23f80cadbd6f5/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/c8dd883225879d0d6b377683b2348068a6697202/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/f05be48f3cc382d5f89f78ce4800a38a8e6e0d5c/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/437b9d11a299a4815ce471f62174cb46dd9631cd/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/af4d39429ec832ac7becacd0b04d1140f850b5c9/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/788b89e041b3d24a28fc49b5027446ca2a9b2ade/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/0c38bc62381683ad8251e9988b55643f8de2bdeb/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/0aaea3a727f3e337669322dd57778d521a76279a/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/350b7ceedca96f41e842cb7d7d0036c8f654353f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/0d934e3ae14d5973d9b07b0b8292c7caac1d7221/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/89ddc12be3de147fcadf496fd7c6c0995d31275f/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/9b49982ab42f2a2ebc6054442e1da556a7c3c747/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/29601d41b214bbd920b440fd79973eef3ded9fc3/
       arm |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/2fcdd69b886142a23cd65879b47f9830d5328946/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/95a283d989d969e59c9a0b5a2de6eaf9c16c396b/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4d28dec9cc5a618405184a343c2d5581897dad84/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0caed984dc4a22f0b2e53f18b88cb34291b35f01/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/ba2642442d2a9226ec8d87ae2735e23922274159/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/975fe74ad1c88a5bb9a9d01c782f39418f247189/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/f8278dd3c7a861d2074bfc4e88abc4b3453c6097/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/34501fa39b97a9bae667077c98e036b25c358e0c/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/5f84af3cd741ae027cd970d12bd959b4806faaa3/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/7396b799bd2c8372899103c7f843bdc526a9fbbf/
  mips64el |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/57f78ee615c0082885b632027542422c18f744d9/


-- 
http://autobuild.buildroot.net
