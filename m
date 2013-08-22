From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-21
Message-ID: <20130822063004.89EE052C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-21
===============================

        success : 100
       failures : 59 
       timeouts : 0  
          TOTAL : 159

Classification of failures by reason
====================================

               libglib2-2.36.3 | 5 
                 qt5base-5.0.2 | 4 
                  libbsd-0.4.2 | 4 
                   cups-1.3.11 | 3 
               qt5webkit-5.0.2 | 3 
                      qt-4.8.5 | 3 
           imagemagick-6.8.6-2 | 2 
               audiofile-0.3.6 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                   neon-0.29.6 | 2 
                libglade-2.6.4 | 1 
                  libnl-3.2.21 | 1 
           argp-standalone-1.3 | 1 
           libcec-libcec-2.1.1 | 1 
                      pv-1.4.6 | 1 
             tvheadend-5956233 | 1 
               binutils-2.21.1 | 1 
           binutils-2.23.2-arc | 1 
                sdl_ttf-2.0.11 | 1 
                  weston-1.1.0 | 1 
                  lvm2-2.02.79 | 1 
                      udev-182 | 1 
sconeserver-d58f2de88c68193... | 1 
                 binutils-2.21 | 1 
                 libnspr-4.9.6 | 1 
                  qt5svg-5.0.2 | 1 
               libsigsegv-2.10 | 1 
                  bcusdk-0.0.5 | 1 
                      icu-51.2 | 1 
                 zmqpp-31220ca | 1 
                 libfcgi-2.4.0 | 1 
                   dbus-1.4.26 | 1 
                   libcap-2.22 | 1 
                    systemd-44 | 1 
                  boost-1.53.0 | 1 
                     m4-1.4.16 | 1 
                openssl-1.0.1e | 1 
                   mplayer-1.1 | 1 
                 cdrkit-1.1.11 | 1 

Detail of failures
===================

       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a7fccdbe6a2d3193c28a0c72310055b2b103a901/
    xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/2f736f0c626f58894cd0e0406cecbaf37e9fa86d/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3017e2e443b7499870eaa548d04a8ccfb2148d71/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/8e51cb8642df2024cc51005eb59ffdeb1450a283/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/a6ce0d6680b418bc32d015af404c08797e987b3d/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/41ef2b791ba10456823c3260eb6ee00c1da2f858/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/2d0b302f387ad70ac20503ba17ebe889bf72f3fb/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/87aecb404970911908a698a1c353f6bdc045defe/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/43c78754e26ac93bb374cca2cc8d40b1d98e8b1a/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/c6804eb819296e43a5aa908399a919d208c1f06d/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/912859d2fc796c5bb311af4bb843dd3126b8d523/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/412a122fc46057c0e3ad8684605579e602fd11cb/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/0c292aa82905320a6017977e877e534e85454981/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/024e097f59bd2935cdcb134147ef86973cdf0333/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/1957fff53d875bf6f3f2af4976f46e2ad6cf0d3d/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/3eb6f35a1b06590428d28a387676c59305568351/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/6bfdddd758dcd943eb9571ac1cb44f2decabd178/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ddba5009aeca66362c6d2e4dc5e3fcf3addf608c/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/0bc8e8a55ef329291b90d9a103cddcdc2a59dc4c/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/0a29ef67013c82afd3e71eac79afddd2710059e5/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/a111b48832ae7430d49d0b4e84f6dfadc3b1bce8/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/a04f50808b8af461c6d56e2319b9080546ad8b21/
      bfin |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/ea5fd2dc2d16dd8d0aca1591735776e929d52931/
    x86_64 |                 libglade-2.6.4 | NOK | http://autobuild.buildroot.net/results/baed2f53ad4af802b6ba40b49a764946b6320430/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7c47ff286dfa41931a1ce2c6da55cf38fc192086/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/445bb0d85b584c7911da715a4d589d5a8cfa96d4/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/caeeb66f18b97d5bf57b991bb771601818e83644/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e87fdea94c8e95b767c676c5dd00c980925e807c/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2547c6c1b8bc9f401b396fa4e47753bfbce89a27/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/8da149d58e2e4f846558faa396d5e5a13898decb/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/dc291454e92dad1191d48e93576baa887d6712c8/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/5225c0e2a2f7d89e98bf58540b90a8ceadaeadfa/
    mipsel |                   lvm2-2.02.79 | NOK | http://autobuild.buildroot.net/results/05b609bdb87785ea0ef8a84489ee9b06d0f0607f/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/1db5a85923a1d6f8602dae37c09f02393d0af267/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/db9b885167cd85396c55d183c15e68b4398bf24b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b254dbf6e7301ff5833179b9d8d8613a93a9315c/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/621b10f86ac7f5d1b1e4ba0ed103f6524766d60d/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/93bd219fe1ab408562f7fd2f20f98a05944a5b8f/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/aa027804d19f04f2ab4c0da2c3e2c0a14eb2505e/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d62c8f7afb421f041f61272ebf9c4a67cf68dac5/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/449b8fb7b5361227e6aeaf126b6a12f6c3cce60e/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e90fffeac60f388e433bba8245c9428ed49f0421/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/aba67a2c1c7e3555fd7021336c7c70e5e900e3b0/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/55e98d4119c9f9c1b6a85257e387d95ce2a3d6bd/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8001bb1eff1c9722699f576be3be0d74dcf88bf3/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/37931bf517f8d3c830e994867ae96da248fd20c0/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/980d30a418ee6926d1a70c639ff15b5e89a2f581/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6aea33de9310a783c277e953afd2cd21509ab7ff/
       sh4 |                   qt5svg-5.0.2 | NOK | http://autobuild.buildroot.net/results/36fd89dc6071be49a0e17cd78d4a371b9d27df10/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/add691cc8f116dd686bb88537a4f64f7a0f90497/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/cdad8d5c249455c300600e2cd604a9de34f1f4f9/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/eba43f29c5249e1b374936464ef3bebb601838f4/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/3b8ea30d17d2278f5991f146746bf47ea07a32c4/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/e3aa939c534fd0dc6058015424cee147aa77df5a/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/ada442b0e0aa5061f612473472b76116b65beda4/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/90147679d84bcdddf1139c5333cc1b40064a7a91/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/c39e08e1c59ce8d960ee93cb06cd0ff54e1e7be4/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/ce244744d62d68ca534fcfae8978f3cb53e09e67/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/d2830e3eab331c27e4f49a7b06bf59865a4f0163/


-- 
http://autobuild.buildroot.net
