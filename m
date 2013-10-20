From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-19
Message-ID: <20131020063007.7ED7152C601@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-19
===============================

        success : 103
       failures : 55 
       timeouts : 0  
          TOTAL : 158

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
                    nano-2.3.2 | 3 
               libglib2-2.36.3 | 3 
                 libffi-3.0.13 | 3 
                    php-5.3.27 | 3 
                 libnspr-4.9.6 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                 qt5base-5.0.2 | 2 
                      icu-51.2 | 2 
               alsa-lib-1.0.26 | 2 
               w_scan-20130331 | 2 
                 dropwatch-1.4 | 1 
                  iozone-3_414 | 1 
                 omniorb-4.1.6 | 1 
                  libnl-3.2.21 | 1 
        liblog4c-localtime-1.0 | 1 
                  avahi-0.6.31 | 1 
                   attr-2.4.47 | 1 
                  connman-1.12 | 1 
                 libpfm4-4.3.0 | 1 
                valgrind-3.8.1 | 1 
                directfb-1.6.3 | 1 
             alsa-utils-1.0.26 | 1 
                 ffmpeg-0.8.15 | 1 
                      bash-4.2 | 1 
                 mplayer-1.1.1 | 1 
                 fdk-aac-0.1.1 | 1 
              cryptsetup-1.6.2 | 1 
                libiscsi-1.6.0 | 1 
                  nettle-2.7.1 | 1 
                 binutils-2.22 | 1 
                   picocom-1.7 | 1 
               libcap-ng-0.7.3 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c0a65642ee2424ff7ec89c11eb3f7425d8b6a350/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/311bfaab99623882fd3ee749af6998a011384927/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/3019aa0564d7d02508741ff206ccb2e310b89ba0/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/0987a5751d6a4882fcee5535478161c28e353f85/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8686c5241fdeccc2ab5ad2729cedd117eeeab3b6/
    mipsel |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/ffe368a219d765f12ac66e72984145436957204a/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/df47ef18beab5ea00d880ef25922e688fe93ca88/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/d2eb356278936d5d05f7c5cab2b11cca87940b20/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/59b739a35fa3f0a9baa2383cd36fb3e0ae2374d6/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/4eaf790b6f84f027fcc8b23099e9db4a4fb733ff/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/526b1be16926b5350e464c434fd5c071287ec656/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/e07d309ae2e9f4ee9a41c66dbe8770e75c5418a5/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/6cc89989ed64fe72ccc063d7ba7659316f500231/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b7fc800ffe81eb0ca3216d19007c1316f3689235/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/215f49c98f7dd76ea911e71262106db9c9116306/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e96a633c5f4a9da3bb6872995d34434efe019f83/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/36aef73e8e7c7ca76f1c1f666705b4ebdfab42c3/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/7ee9880ccc65034977742bca3fb233360f177fd5/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/b582786a61c80dd217fb753e92ccb4c976729721/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ae27ae1152ba0018840de43c77280acb3f3b64ff/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/57476a1d1e5367c67bede7c221e02fdcab05f165/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3d4c491a81ead546a10f3ae1b8225c8b83944b79/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/438afa8ff16bd11642e2c8a7ee4925f938fb9e14/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2b9b04cf2084d64a1f84eb153c3790bcabf6798c/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ddc153bba02328af41bbd960027e56e7a96f09ff/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/a301c4514dd009c5253661c20fd6849365dadac6/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/f8921f62a0d236d920e7d0979a61500032cacc4d/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/1a247ea81ea69051b8e22d1fdbb54a4485370068/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7ea0f7ab9116c082d9e32845866be0ae017ac9e1/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/05c265e39fda8ffa4192369f8ca72ede0fa82f58/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/5772c47e120d2ac0451bae7f2139ccb6ba2aae7a/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/132f9a9f73ef67771d5b08d42e6700557249f5c9/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/44bc20c07bf254c24950a57640b00bab18b1ef1b/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/09368bebcd843df9ab3a8c62221682e9a94b8e44/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/b0b853ee17e049e93266ce20e23ac41b6ec7833c/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b56436844d032bcba30497b904dcfb61e8a6d894/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/0415053362e9838609f0d2ea8b2801675d307f35/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/08ce34162d76bd9c122a4e5c1830532b0caa2e79/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/8ae6b216824e9e239c59d85d3053ca8b26770e6f/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/805d272c238265747e1392d6538d0241e4b12581/
      bfin |                    picocom-1.7 | NOK | http://autobuild.buildroot.net/results/ea372d6b880448a95733788298fec53be84b0077/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/50e54e91c0a5ec6cf3169e98e236aa75b64dbe23/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/dbe353e71ce63ba8256052b77ef8789b4e2d76a1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/45b5695a5533ed8e0108ccf174952d1e35812cb0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/50cb287b8ffbd3751640eceb23fef9279404986d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b7d8e12e2a0efa20909c4c06fc05cd0489f402df/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6959cab5c137af44a163e6eb46d5c5b58eb7f550/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ffac356a1e16843efdf11d8d766a7fccc8db32d4/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b291d2f8e38762a0038bc2f279e6c5fecae8a92d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c49a6c794db825e7fad0d882592c40d301c60799/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8b7cd67d4a700724adfef06573af3c18e38e0f38/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/318e2b413dfe976b247bdc8345acbf4b8a70fa2e/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/0dbddf47363f4c39878c24cab261dde1df4b698a/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/57eae0e66338188c06902f65699cf8ae937394dd/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/53a54999af70588db4f2e3edb7629bb455c94ca0/


-- 
http://autobuild.buildroot.net
