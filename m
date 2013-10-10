From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-09
Message-ID: <20131010063007.54C0252C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-09
===============================

        success : 76 
       failures : 71 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
                linphone-3.6.1 | 8 
                 binutils-2.22 | 4 
                 libnspr-4.9.6 | 4 
               alsa-lib-1.0.26 | 3 
               libglib2-2.36.3 | 3 
                protobuf-2.4.1 | 2 
                  python-2.7.3 | 2 
           mediastreamer-2.9.0 | 2 
               ruby-1.9.3-p448 | 2 
                 qt5base-5.0.2 | 2 
                    php-5.3.27 | 2 
                      icu-51.2 | 2 
     xlib_libpthread-stubs-0.3 | 1 
                directfb-1.6.3 | 1 
                    ola-0.8.31 | 1 
                    systemd-44 | 1 
                     rpm-5.2.0 | 1 
                log4cxx-0.10.0 | 1 
          libmicrohttpd-0.9.30 | 1 
                 fdk-aac-0.1.1 | 1 
                 libffi-3.0.13 | 1 
                  ltrace-0.7.3 | 1 
                aiccu-20070115 | 1 
                  nettle-2.7.1 | 1 
                    fbgrab-1.1 | 1 
                  libv4l-0.8.9 | 1 
                 dropwatch-1.4 | 1 
                 rt-tests-0.83 | 1 
                 mplayer-1.1.1 | 1 
             tinymembench-v0.2 | 1 
                busybox-1.21.1 | 1 
                       kmod-15 | 1 
                     m4-1.4.17 | 1 
             tvheadend-2b64995 | 1 
        liblog4c-localtime-1.0 | 1 
                 erlang-R16B01 | 1 
                 msgpack-0.5.4 | 1 
             alsa-utils-1.0.26 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/4a381205b815aa224e1fd43653242add8d2bc647/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ea5c5ef10c1d8d6450c3529d1c27a8de0c87e74f/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/94123fb45649161f14c7feb776023113c57a9980/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/923e73a7f3a7133fbab9eb7cc3e02d9cf2e3adbd/
  mips64el |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/5754e98cba73d81eb8617d26621469e19256d650/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/98f65001a4a1dc1382630c232ffb43514f7482c5/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/45d1546b5dab74dc9e9a52d6c9ad1f3f2957eae4/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/f31b2093399685498ee92873517bfa65ea366860/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/d90aa26a8ac309694f5dbf3fc546f6d6c9af434c/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/611bf9758de28662f1b912739eb5e8458aabf8de/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c7577b19f8e11666700e2949f7c781ceeecb832c/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/ba5784229f0505841f0186cefcec61c84bec1913/
   aarch64 |                  erlang-R16B01 | NOK | http://autobuild.buildroot.net/results/d84c089a8c1fb3d26988daec5635a60dc196104a/
      bfin |                     fbgrab-1.1 | NOK | http://autobuild.buildroot.net/results/725aee72b6a9603a127eb54a3e4e478a01024087/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/8a41f0e42f4b1e0e7c40a84962a406d3a26b8654/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/af347e81f8879920d97cc3a2fa4af379037625aa/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/33c4e9c685df1bb2121cfb119f8c42088891532b/
    xtensa |                        kmod-15 | NOK | http://autobuild.buildroot.net/results/8dc50c6f7aff6df23e51361b64aaff7897ad5949/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/97cb4bb7c58c029e995539c97a9b899eb28e26ca/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f4bc33511f1fb0f0219190998a445b1e4e0588f0/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d9aa9e028b10fdc09f1a85047393cb77cbfd0648/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/dbc6a15b965ef364596fd2a4bf4d36197a0aa856/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/54a23cb662bafaf327d10ac2f728d2398222e9b8/
     avr32 |           libmicrohttpd-0.9.30 | NOK | http://autobuild.buildroot.net/results/48bbb881c584f6ee8e472d47c1bb2b3827c58486/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/e232141825990dcb40f06f6971d37bf794bbce0d/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/ca1f53f09ff43e3d89ed8a728e590ae0a12fc6aa/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/88406d6ab1d40806ee79e32af354ebbf5eb50869/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/9c97793a2a204184c2885a00e10d5a95325bc1fd/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/7435838a1856d2e2cb003363fed9d52ed0315f3f/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/0dd15cce603933a40efe60403782f53d58f92b5d/
  mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/00673f04d0ce6cb0c5828e68f236a4eb8d7920db/
    x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e365419d9ca689e00027ef0f7cec247a4ec1a49b/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/907a49f58337f661f0df85e24cd485626b13789f/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/1a438b4d7db54f891156896b26fbcfc5fae89a7c/
    x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/6a0636f8a3bc194725fdc2b113034420633a0ae7/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/590f7ee01fc16791cb48dec376d468185ace60fd/
      i686 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/557395486d2b85961b90e1635e93a7a612b8a7d2/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/54777ef7f82bcad5eb30766040d7ed3694d9ebc9/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/1f821b4de99f1a1c927e3e7a62d355ce2ad8de7f/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/feedc39fa0a081b96bd49bd9989f2219026e8bdf/
   powerpc |            mediastreamer-2.9.0 | NOK | http://autobuild.buildroot.net/results/90f67de3c812ab0d02ec081e09f7a9573d9f982d/
   powerpc |            mediastreamer-2.9.0 | NOK | http://autobuild.buildroot.net/results/b164b87fefac67074d45a6413386f53a8ee47843/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9e0284cc87d95602a318fe2d407e6df5c267f312/
       arc |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/39185dee19f22bb8b2d03b2d43cbbd5419a392b0/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/45417fedc4f3e85df1dd4feaf13a4acc20cb9b8d/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/9293538afa317c1c6c98207082f0cbb52db66ca1/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/1bbeccd9ba048027468babb2972c2fdf27a58576/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/6d3f171b320afec83b00e314d70a7d4d0d60604e/
   powerpc |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/b00ed55498214fc19d9601d178b1a5238f85a781/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/08661b6bd6796c9126bcbad3245323160b182ac8/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/ccb1cfd9e5ebd0d7e8029068341dc1043b5a3ed7/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/594ee382fae7085c6fb166f4c949786a7a0a9790/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6fd500c15b0e3a832ba2f83c0a476600a8995f14/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0154faef82ec6d9684d621e6c6a0561f527e7a70/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/706fbd50022a133bb4b286ee456123d3144255c5/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/8512f9a8259f04ba3d9d4e14ea478da1aa0e453a/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/c05118ec657ce78d95feab403cc0210a5afc196c/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/d2407b858649cf88b1ad9d6d950ecbb4f1109f4b/
       arc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/7af23237855845ae0cbb283d966ff144a33ea39f/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/24e50a2cb1d3bc86ed0e5101cf8b3901e137bcbd/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6696caa72a812f87f9d21848ae7194f9cdcd1eae/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b161ddea278565549d81fd7f49f7dc6180cc3cf4/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9f2758e9c9f841ca943ca61d9ce206224cd1825e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ee30c86972e8ef7513fa236e0e1d0e7b1bc570d3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0cdda4638cb7e598b07dfadc5122c6c4a26b817b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/95d59e9450eaf408238f528e79e051d03889c830/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/628bc3fc86d8346441bdf4c29669c2947a1cac27/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2ab37e1e72b0408a936fc3bc08ba9319f4992fb9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c6f3476e674239b3835ef9efa5ae34c67dae1736/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/efdf1133e95791b5c76b7f7c27ccacb023851fb5/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/4ca55ddf20e45369dd8739236220389365065bf2/


-- 
http://autobuild.buildroot.net
