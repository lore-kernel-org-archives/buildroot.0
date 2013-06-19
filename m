From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-18
Message-ID: <20130619063006.EDB9552C0E2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-18
===============================

        success : 109
       failures : 59 
       timeouts : 0  
          TOTAL : 168

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 10
            host-erlang-R15B01 | 10
               openswan-2.6.39 | 4 
                      gpsd-3.9 | 2 
          host-protobuf-c-0.15 | 2 
                      bash-4.2 | 2 
                pulseaudio-4.0 | 2 
                directfb-1.6.3 | 2 
                     m4-1.4.16 | 1 
               aircrack-ng-1.1 | 1 
                 libffi-3.0.13 | 1 
                   dbus-1.4.24 | 1 
               czmq-cb9839cf90 | 1 
               wvstreams-4.6.1 | 1 
                  libnl-3.2.21 | 1 
libwebsockets-v1.22-chrome2... | 1 
               alsa-lib-1.0.26 | 1 
                sdl_ttf-2.0.11 | 1 
                 binutils-2.21 | 1 
                 cairo-1.12.10 | 1 
                   mplayer-1.1 | 1 
                   cups-1.3.11 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                 qt5base-5.0.2 | 1 
                    acl-2.2.52 | 1 
                  iozone-3_414 | 1 
             tvheadend-5513b44 | 1 
                 libnspr-4.9.6 | 1 
               libglib2-2.36.1 | 1 
      gst-plugins-good-0.10.31 | 1 
                  poco-1.4.6p1 | 1 
    enlightenment-0.17.0-omega | 1 
                      qt-4.8.4 | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a7faace0407f8c9e478ce0cfab236f580c9f5565/
    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/bbedae81d4859c8e7ef26979c8c5a5b073937f1f/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9fb4e96a2c42184f44e48570ca6265979af388e6/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/fb3ad8c2c510a80c5febce529f912c9f31c0d889/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/74dec5fe4c0ec9ecd5ad1f9e7253bb8814c671f9/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/a98c97c82d79b82b7353fc8bcdaff0f9b6eb9122/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/5fe74f1f1772b22c3d93052d2d30a08d6c774fac/
    x86_64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/7ce2f53ea7079bffb9efbf881f57793159c8b1c4/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/f4b8e7f1d2f1f0f6aeacb6a7de5b3a9007c384ad/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/a732be0ff97c8ac22381607bd1b0fc6a64f0d1da/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ead6ae1870338f9c864f2dcb39b2f08cdb841115/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/9e177332b82ecdd25cf0c2fcc2cb24b8cece3c74/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/56cdd83803268fb8fc7096123a8369e53ed43d99/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/a02131c4c6c3df1a185c130dfaaef1a12e210d39/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/cc088734578696e1202205a134ddf6a776c98704/
      i686 |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/5540ce411a8569f891d66abf63e4b137706f010c/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/8901c4ae7bad147d4338ca3fb79eecbcefa99df1/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/232cad7a33c74837ff4f1a94ca01356e92dbcda5/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/b097438719e668bf7c169213a8e7c65cab9dfa80/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6eaf9784c13367dfec056dde6adf130f745225aa/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/458ec119d257efcc9eaa3b8817b3c58ebdd6787c/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/3d2759f0e4d6c8b798f0e88aca69ba97d429adba/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/8719eb8680eec0593c3725b60cb3757b1ffd4924/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/8a4d95cb4862d74d7a9b38d7df1a209a490736fa/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/92ade468228d833fa7cf400734aca2539ed88771/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/1dc870b4c783d174aaba0d41d4589fba51e77749/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3045fa83d02404c874d522e2705383e7c0f66598/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/921e689a98242f6576da4c022890200ff2c112a5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/65aff037e0604baf3be6b90c5e6ad7a08cd6c3d6/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/88862a9b20faec0cb9c3056dded63dbc4549703b/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/db417685c757d9fe2ec9fce92d7fa7f2a5718604/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/51559073088a8f47c815e8dad3d3b39fc3fd3438/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f1250cb261aa5e10e4d1ad52df19729f5b4c0ce0/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/ac92075d1e780a70f92b4dd479bcf3628ac47965/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/12902a352e2285cda7fff2815dffd1527458ba7c/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/71a499a032ab4f7d84823f108fc13a3d5dc9bb24/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/b3dd148b08942321b26ed1423bc237234324ef55/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0bb58d3b3af1df9924907523a46010420037df74/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/50b2ae60e330c847c826aa9116cfd2524f911d09/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4344e31c1b79cfa448803d59279883f43ff5ee1f/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/e7c7173439d7eedf39ff53666a0364203fcefff5/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/6cecf6bc549733f0a1edf2ecc5f4d73910f82d90/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/2cc0b7b6e52c6fa51d4e3083ed618fc506e51363/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/fedd31bdd443cc948459f908dce927f27c078e65/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/985ef82dd4e39edbe719898ff2cfa7827ae87e49/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/50e261126123420318dd89218f985a650eca3b99/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/473990f7cbd1db78e8981dbcfe3bdbf0240772c3/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/54d4dbb4ea1ca88b6c198bfea9fa399b6727f3b3/
      i586 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/4e0f36915b408e612a142c318745cc0f61cc2362/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/dc90f316e183e2605bab8a5429f999ed8506f4a1/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/a6633507256a40d27de340c22bdccf4aeee39b11/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/698a1406b45fbeca0e42076bf5b1cff231950986/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/37b721290c3e182ce8b81266c29504be7060a076/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/cfd1fde9528ec55d9cf10660917bb4f68add22b9/
   aarch64 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/8615c5ed5caa23d93b5ccaa0e15352114f581a28/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/676d113dd89a5a16a4713a07e34d2406ad756b1b/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/2cc406cfde288aaec7d531e6d24ca783b2865b6b/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/8bff5397583881a37e2cef546c7ab4431027319d/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bcc903f965514b011264d12dcd793f6444488ded/


-- 
http://autobuild.buildroot.net
