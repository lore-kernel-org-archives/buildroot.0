From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jun 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-22
Message-ID: <20130623063006.71F0A52C0E2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-22
===============================

        success : 96 
       failures : 43 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 6 
               openswan-2.6.39 | 3 
                sdl_ttf-2.0.11 | 2 
               libglib2-2.36.1 | 2 
                   mplayer-1.1 | 2 
                openssl-1.0.1e | 2 
                    systemd-44 | 1 
           imagemagick-6.7.8-8 | 1 
                 libnspr-4.9.6 | 1 
                  libedit-2.11 | 1 
     xlib_libpthread-stubs-0.3 | 1 
              e2fsprogs-1.42.7 | 1 
                 libffi-3.0.13 | 1 
               sqlcipher-1.1.9 | 1 
                  imlib2-1.4.5 | 1 
               audiofile-0.3.6 | 1 
                    acl-2.2.52 | 1 
                pulseaudio-4.0 | 1 
                 nodejs-0.8.22 | 1 
                   dbus-1.4.24 | 1 
                  samba-3.6.15 | 1 
    enlightenment-0.17.0-omega | 1 
                 qt5base-5.0.2 | 1 
               wvstreams-4.6.1 | 1 
                      gpsd-3.9 | 1 
               aircrack-ng-1.1 | 1 
                 cairo-1.12.10 | 1 
             tvheadend-5513b44 | 1 
                  zeromq-3.2.3 | 1 
          host-protobuf-c-0.15 | 1 
                libtirpc-0.2.2 | 1 
               alsa-lib-1.0.26 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ba7c23d7441c92f53780de76056543f6f9504d1f/
      i686 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/ee16e34e5d49b1ff1714e9390adf91142c426939/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/41f3d699e4dc7b7e5ae97bc7fe9b25cafa37d33c/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6c487aa720a608b13c7a8304a9e454c24d62e3c3/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/032e571537f039f69c720e01798d3d540fef46f8/
      i686 |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/13e6ceb726e140fc170e6cbc6ffac20d9e80fff8/
       arc |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/7575dc80c498be20ecce11883fa02485b39f571d/
    xtensa |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/6c4ad07618b3137c1bcb16d992a22604597a0166/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/a6586e517568a38fda3fffd867a6a8ebedbf2626/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/1b1debee2594742a0eb2b172b3425e9122129987/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e3f9e878d001a6ef7a08d187d2bf7da6acd4a882/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/625c2b9e0b4687065c4a562b8b3bfc1936e065a9/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/9e629b40fde7eda1e48c9ae75e535e607ba529c3/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/eba3b2aa79a82cdc715f96f1a023c741e1256a86/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/c46bcf1d0a49808f061ba934233f91ee560f0f6c/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/c4ce60a9f16d7738d233684d2e94a2013a482d2d/
   aarch64 |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/7549f177ea3813509b523a5e332e64a34948b9d4/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/ffeb7813a89b89c4b662d3e66e6f27c005165293/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/a9417162370b2caa5369bdad76f41b0bca467333/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/60b5936fa8445cf04173c6e461d57874d0eb78f4/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a218f843b812c099a8e7dc78abd6d7fba0c0c8c6/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/85ce08068f99a6e2674979e0560d03e748f216e8/
    x86_64 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b9bef88f1d7f9642068538023454dcd252cc2f4a/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/64c82ac9398f22925a97537f1ebeadf60c4b222d/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/025074fd9d65c644bc62bf511b868acd1a2fb831/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/93739f831e4aa5dca3dbd1b336fa13be197606e0/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/1a15430938b8ced89c7ffeecbde1d72d15e8f9d5/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d5e870255fd332ba357b8e61767ea46b785d2b77/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8b4470adfb176e06b2f9f0047002930a3ee32031/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/f7fca182fa70c6a2139a4b6efdab2ca5f016b61d/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/a81714c7129203842963ed8792a499cbf48e9c05/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/0ff384967114bd232b6345bdf11f208addcf831f/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/743dbb5f24e60e3ff8f8787167d1bc55a09f50d9/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6808e4b7d6bbd0ed9f09bf98c576dc692e16c016/
       arc |                   samba-3.6.15 | NOK | http://autobuild.buildroot.net/results/eca9ab526029316ab544054b9f2724c737bb8e52/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/9957107fca33a16e47aa29a218e3aa5e1353f76f/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/5a272b4cf7887a6fcf7ae486737fceaf61b6a26c/
       arc |                sqlcipher-1.1.9 | NOK | http://autobuild.buildroot.net/results/fac8ffb02c769e3582386c45b15f8511f0b45ff4/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/b10122fc9a2a2149d0dbdd2dc7a9c20fdb8b0424/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/9c54096c963979f883b0c26571545195145938ee/
    xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/fac7521f03cec2e40198c5f8b042efb6a2262390/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/4c7f853e5a30e52b429dccf944bb550aa7812041/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/b0f777c119bddbc016e5bc74027e9bfd19645867/


-- 
http://autobuild.buildroot.net
