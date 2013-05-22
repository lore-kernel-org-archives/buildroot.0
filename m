From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-21
Message-ID: <20130522063004.9E40452C0E2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-21
===============================

        success : 101
       failures : 60 
       timeouts : 0  
          TOTAL : 161

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 5 
                mongrel2-1.8.0 | 4 
         host-gutenprint-5.2.9 | 4 
                    acl-2.2.51 | 3 
                 pixman-0.28.2 | 3 
               sconeserver-211 | 3 
     xlib_libpthread-stubs-0.3 | 3 
               qt5webkit-5.0.2 | 2 
             bluez_utils-4.101 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 qt5base-5.0.2 | 2 
               libglib2-2.30.3 | 2 
                 libnspr-4.9.2 | 1 
                   dbus-1.4.24 | 1 
                   bzip2-1.0.6 | 1 
                 libpfm4-4.3.0 | 1 
                     pcre-8.32 | 1 
                  opencv-2.4.2 | 1 
                  fbterm-1.7.0 | 1 
                  zeromq-3.2.3 | 1 
               czmq-cb9839cf90 | 1 
            qt5jsbackend-5.0.2 | 1 
                  ndisc6-1.0.2 | 1 
                      gpsd-3.9 | 1 
               qt5quick1-5.0.2 | 1 
           imagemagick-6.7.8-8 | 1 
                  boost-1.53.0 | 1 
                 netsnmp-5.7.2 | 1 
                   squid-3.3.4 | 1 
                  gnutls-3.1.9 | 1 
                lmbench-3.0-a9 | 1 
                   mplayer-1.1 | 1 
               aircrack-ng-1.1 | 1 
                      pv-1.2.0 | 1 
                 binutils-2.21 | 1 
           mysql_client-5.1.67 | 1 
                       iw-3.10 | 1 

Detail of failures
===================

       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/cc082544c96cc79abcceb78afa0735e2b8732c1a/
   powerpc |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/3d63cd4b5448edf091e693c12fa4c93332d9451a/
     avr32 |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/90c91c4cbd231617135ed7bf8b3c32aea3e7969a/
       arc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/ee47de1a5f1fd68db9fcef058ab8b1aa239ddf1c/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/87d060c69e1426d1cc4e555ba9825be0ac6bc3c5/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/81e1987abd959d2805a6cdf08ba028e72625e0a7/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4bccbeb7a1e40f5a1edffb62a40646e50533e949/
       sh4 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/49499a9f7a798ea3aeb60e13f6cb9932057390c7/
      bfin |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/91f6edf6ab2c64bef6637eac5e670b5e0e0fdb62/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/988510857682b61bc60234c9cf822ec7a0e85cbe/
   powerpc |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/ca13fd90b45d3acf1c304773ef6496643865d5a2/
       arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/83773a8735ae7e037a11199e7411a4d6c0126503/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/3cd6f2973b920d2fce081e30cb8665b9734696c3/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/ab8a5d77970bbe2b40fdd0fd26c87691b927cc7a/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/817da420a507c4e848ed4738c29ca7f1d97588a4/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/89bb110b6bdd7c55ffa0950de1db45d200b2781b/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/5337e52a12472bf080d3eac383c0e14470fc91fe/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/8a8e744a1a4b8455aa69b11e1e1e236d7440f9a8/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/bd59b132394074c639877038475d7b1ffa1aeea1/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/eea3e15ae9d424f2104db2ceae22f9f98dfd3e60/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/f61b1e1ac6163716529bf21707203c3eb240eb7a/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/1d4b5323383c4ec9c7303768245bddcd62d322b4/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/512a93dbb1e6f619a29f510014e0916b383f7a62/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/246eabd5bfda02f4baffb1132b7091f86d8b46ab/
       arc |                        iw-3.10 | NOK | http://autobuild.buildroot.net/results/0e041a44cb80e42289b821fab36183dcbe0ea2d9/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/8e5ad6e100c757dd9018c96c0532231611c5509a/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/c92ef7f63dd6dab970bd5d783c9e7bcbb7df6e9a/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/34524c4d5f65e69e8543969480d041a47d729072/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/447e477fc59542ca25c0cc456f3506b76a1a27b8/
    mipsel |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/aabc3ebbcc6cbd5f588fc0bb1c1ed2bb9b7b8be6/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/726d5aad3680a465f1b99f32fb725fae1d4f9db2/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/04687361fa6b756ee395f7c4244f0544c82514fc/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/1405ca2a9cdc8ce826351afc0d4051cd3a08bf4e/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/f0b717013fbf837af55b033b0f1243c80389617a/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/2ef4ff431ce4008845f987a809d88bdb85b00edb/
    mipsel |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/5432c16bb98c781df538da93d1606ee2bbf699fd/
       arm |            mysql_client-5.1.67 | NOK | http://autobuild.buildroot.net/results/c527090a2dfa04e7243405463f7091fa5ac654d2/
       arm |                   ndisc6-1.0.2 | NOK | http://autobuild.buildroot.net/results/6d1200276038faa0ff1c2bc788226e1b62f11601/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/2e9f4e35ab5459ea223fec3a26fcc0e0be772225/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/9e69173f782a6a5209f580a6f046051879b33474/
  mips64el |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/ca2d17595127af477ec34c65782c04e3d1504708/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/29fc49baacba2a51c6c6db85909f071e7e662c3a/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/fe77dd0763e3c3e3cf8f9d3980e8ac75a827d7de/
microblaze |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/741ff4b6ef34da63094208aba7fc04438a29da63/
  mips64el |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/568e63970308784ad67412609fa367365a5d2522/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/66c2986a0f28c14d7990db475d2951e208dd3092/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4ae18fb05a52910e86389c086d6c9afbf39893ff/
   powerpc |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/8738e6e25f51b8a1da9e7f0101f390388007dff5/
       arm |                qt5quick1-5.0.2 | NOK | http://autobuild.buildroot.net/results/29509828a7e2f71898f7be53aae259f7bbb3cd6d/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/a1c6f4149a65863a7866741bf5cb76b33c241aa5/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/212920ac071faab223da5105aa2e2a3a3c8c0cef/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/7f62248ef59d63791f336de24da6a7566d9d5654/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/d0cbfd945e66be4596d373be8f1b7d73a458975a/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/5a218354373a3fe4bf04d08ae156dab7018e6fd1/
    mipsel |                    squid-3.3.4 | NOK | http://autobuild.buildroot.net/results/5a478f63e67f03661dca9d04d7de0b42d4f3fce3/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/ca543f6b5b8e071171c4bb333e545676084a8bdb/
      mips |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/85d9012af7eeb306d743f568862c0763e2836de6/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/c9337a143d86278bb9b9b3494cfc1fe18142401c/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/3e77eae9660c26bef2d5b3302a3cdae97b49d7c8/


-- 
http://autobuild.buildroot.net
