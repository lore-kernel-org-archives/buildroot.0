From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Nov 2013 08:30:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-08
Message-ID: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-08
===============================

        success : 77 
       failures : 48 
       timeouts : 0  
          TOTAL : 125

Classification of failures by reason
====================================

zmqpp-31220ca4a0fb43a0848d7... | 4 
                 qt5base-5.1.1 | 3 
                 libnspr-4.9.6 | 2 
               libglib2-2.36.3 | 2 
             alsa-utils-1.0.26 | 2 
                 binutils-2.22 | 2 
                  nettle-2.7.1 | 2 
          host-protobuf-c-0.15 | 2 
                      icu-51.2 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                libiscsi-1.6.0 | 2 
                pulseaudio-4.0 | 1 
             util-linux-2.23.2 | 1 
                openssl-1.0.1e | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                  boost-1.54.0 | 1 
                      qt-4.8.5 | 1 
                  aespipe-2.4c | 1 
ne10-88c18f02199947b2c8b577... | 1 
                busybox-1.21.1 | 1 
               audiofile-0.3.6 | 1 
               libcap-ng-0.7.3 | 1 
                    php-5.3.27 | 1 
          openpgm-5.1.118~dfsg | 1 
                 fdk-aac-0.1.2 | 1 
                     gmp-5.1.3 | 1 
                 mplayer-1.1.1 | 1 
               alsa-lib-1.0.26 | 1 
                  tstools-1_11 | 1 
                  libv4l-0.8.9 | 1 
                  zeromq-3.2.4 | 1 
                 cdrkit-1.1.11 | 1 
              fontconfig-2.6.0 | 1 
                valgrind-3.8.1 | 1 

Detail of failures
===================

      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/da0268df99b9bf920d88121e7c3d33d41a57d951/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/983828bd27a521020e42e58cce9393e6b8d23502/
   powerpc |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1c6a33e75fe0617e01d7413cdfd5fbd466f822d4/
       arm |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/6123186a66bbea833ab2fa980346f16825b22d21/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6aff0a6b9c7b2890cc069868b041ed74e549933b/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/11de6f161585c12148c1b2b4fc8ab830183edfe9/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/2d3d255b2d3ae1456a377dbc03f695b7adf010e8/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/84f9d9d2b6b5356984c6d59aad5e28b3e7847651/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/116d13f7489981c39c3759eaf8302be4d795f339/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0315c117986f3aac8c0719d744cb47ee03738ee9/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/8579cb481e86dcae0988379c5781bd00f4e70809/
      mips |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/69b0804cbfbb24c70f90435a37fb56a118247a57/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b99eb6a9067cee885da88bff64ee447c37e31e0c/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b320bb61650c58e9c855e3136f5f6d7bf5e4ef56/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/5d163e750808f2fdd8098cb58240bada12b770a9/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/038340dfbbbedbcfcb98ad5dbf828bc03fe26af6/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e0a1130feb1784b3d4fefe1224943d93409a3494/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/85c082a693ef795cecf0ef9204b7c9c0850d4b74/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/3df16d60f6bbb679129cd568df4440be6f35cd9f/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6f0066f56f10d3f17023e698fd3ba1bd2d00c4c1/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/79d2df836063167f12f5bba177297a041bb7c16f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/39e8e0ebbeb196276492b928b41cc0b0fe1e9ec3/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/efb87b17c49170f6377631371438911b18029cea/
     nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/8c01fdaac7afa00bd1117c79ae047344242d1463/
     nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a418145d72e92f64956518bb2786e33dadd08a86/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/4de7dc58e826d1dd60add2821f774c9c5f5a2a71/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/8f946e28b11b2ab1ba0d9688286c665488de0486/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/3631f7e9dad9fab356d31160ac95b7d0fec70ce2/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/82acbea862ee0bb5288ab498d86772bc475d3a53/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/88ea0cc0815f865e1a144d39231fdc9b47e689b0/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/120b7de960a04def5c53b59644eefc598bd0a1d4/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f313ac3233a8ed5b3087936c1cd8408a00fdf2bb/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/08d3255303f7ceda8a1ecfcf56ad665f00829632/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/281ff1c8046b7e93759c5f51995f34788e717fad/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/0ee61f71e61f2215a15e4655a4e22d0521334c35/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/37613281f21895716ceaf64654e175148d7f543c/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/
       arc | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/63d294574b053aa4e2148fbc3185c5594d925ae9/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/ce02d7fb9ae3aa06eaf53db39cbef27c051b525d/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2ba1bd78f4303ef2f543a4e4fa65d1b68ba3a765/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f174541ac06aeeac82b8399686a8d4371532760d/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5cdf3e58df0df184f2ae1f2896c44f3f0f41c94d/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/64494152b75037a1194312a2a408eb7ecb6b56c8/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/75f2cc531892e649599681433f62a1d76e5736c9/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/65783df07ebb447f7561cb84b1bcf581a3084748/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/14d441c5f3a50f61cd5a872711d09fda4e5f8bbd/


-- 
http://autobuild.buildroot.net
