From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-24
Message-ID: <20130525063004.8F07652C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-24
===============================

        success : 72 
       failures : 33 
       timeouts : 0  
          TOTAL : 105

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 4 
                libtirpc-0.2.2 | 3 
                 qt5base-5.0.2 | 2 
                   dbus-1.4.24 | 2 
         host-gutenprint-5.2.9 | 2 
                  iozone-3_414 | 2 
               libglib2-2.30.3 | 2 
             bluez_utils-4.101 | 2 
                  zeromq-3.2.3 | 1 
                    urg-0.8.18 | 1 
     xlib_libpthread-stubs-0.3 | 1 
               qt5webkit-5.0.2 | 1 
                directfb-1.6.3 | 1 
              udpcast-20071228 | 1 
               czmq-cb9839cf90 | 1 
                  python-2.7.3 | 1 
                 libraw-0.13.4 | 1 
               aircrack-ng-1.1 | 1 
                   mplayer-1.1 | 1 
           imagemagick-6.7.8-8 | 1 
                  gamin-0.1.10 | 1 
                  ne10-88c18f0 | 1 

Detail of failures
===================

    xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/333b6535f2c89f7c2f0c1df36ad1894ff29b4250/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4596e3fa5d8bae02473a91cfc9b9f167e7f2b05b/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ab1a1702f476e1ab1a18ed15f5c72e20d05e2d26/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/c377b407c939647a4529d2a858a9a1f7ab6223a0/
     avr32 |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/3abc0ca0eef603a95928cd7a6258eedfa0c73041/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/15dfa4cbfb92f85dbf449b2860b24467e94dc31c/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fe99d95a4e14001bad8b85bdd1bf9618ea0c0076/
       arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/9cf08cad5f90e3be08fff5be970ea1f057cf3f8c/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/4b36de844e2ad4e1b0cd13207e2544c5b36a7c0c/
    mipsel |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/af87e66df4402a0a3613cbb711c4482aab91a4bb/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/ad9cddca5ef2d92de06738a9db4cb62b0697eccd/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/f717bd21dd48df13d2b3cfb781f498bf958f9fc9/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/52c5841d69dcc64e854e659a3b95adcd710e459b/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/71068d9e370570eafcf1db5585651e9c6d8821dc/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/8b9d241fa37558784d132c315262e98a75f1ee23/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/19371bf849255bbd561c67682c9e94899ad038d4/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/8685fc064d7b3157d2b0266d0e1bfe9befb115ec/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/c26ee6620c366b1ac3753cb9296a8d5e62322e12/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/97cc15f67527b9b78d1f88e198e5d4bb44c2f2b1/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/09d80eacbcba947796c710d328cd00a672369bd7/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/065195768e7fcd8e208a24c7e71de5e9e2c6d883/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/f32aa6dcc8fba9dae182271559c7710842567707/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/dcf97b150b8b76c1e2d80bf179b51f4ab560c998/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/d10d9a7cd0456d974870d8ce3f75a035bf8cac7c/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/156598f3691ce203e905ff57c432eb5bd7149ed8/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/cc37cafbb6b13784b0a45f828bd0b79a43aa14f7/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/728887d9296b7759344534736d4d172cae6f8fef/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/9a4f024d92634f33dc895bf2a9f6360f4fcbb93b/
   aarch64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/e1428b978d0b48cb19f729e108b8a84d01018856/
   aarch64 |               udpcast-20071228 | NOK | http://autobuild.buildroot.net/results/a80a1cb6e5797174abdb299d78f26b1eb088a3ca/
   aarch64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/f40594197c642baffd601eee3524963bd030bcb4/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/7b2da33760797740d0b084347c9cc4072d175ff7/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f2352debe3156c47a3f00bd16e28845a68396021/


-- 
http://autobuild.buildroot.net
