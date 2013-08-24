From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-23
Message-ID: <20130824063005.4D10B52C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-23
===============================

        success : 104
       failures : 61 
       timeouts : 0  
          TOTAL : 165

Classification of failures by reason
====================================

make: *** [target-finalize]... | 7 
               libglib2-2.36.3 | 6 
                 dropwatch-1.4 | 3 
                 cairo-1.12.10 | 3 
                    acl-2.2.52 | 2 
                      gpsd-3.9 | 2 
                  poco-1.4.6p1 | 2 
                 qt5base-5.0.2 | 2 
                      qt-4.8.5 | 2 
          host-protobuf-c-0.15 | 2 
                      pv-1.4.6 | 1 
                  aespipe-2.4c | 1 
                   mplayer-1.1 | 1 
                  tstools-1_11 | 1 
                 libnspr-4.9.6 | 1 
                directfb-1.6.3 | 1 
                  libv4l-0.8.9 | 1 
                  webkit-1.9.6 | 1 
             util-linux-2.22.2 | 1 
                   cups-1.3.11 | 1 
                      udev-182 | 1 
               qt5webkit-5.0.2 | 1 
                 libpfm4-4.3.0 | 1 
                 libvpx-v1.2.0 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  zeromq-3.2.3 | 1 
                openssl-1.0.1e | 1 
                     pcre-8.33 | 1 
                 ffmpeg-0.8.12 | 1 
           libcec-libcec-2.1.1 | 1 
                   dbus-1.4.26 | 1 
               minidlna-1.0.25 | 1 
                   attr-2.4.47 | 1 
                     m4-1.4.16 | 1 
             gdk-pixbuf-2.28.1 | 1 
                    flac-1.2.1 | 1 
               libcap-ng-0.6.6 | 1 
               binutils-2.21.1 | 1 
                      icu-51.2 | 1 
                  bcusdk-0.0.5 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/1aed710104253349081edb019d2c1e60ce2ba34e/
      mips |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/5a3ae6293e625d9c924bb4b3bc4ebe932e085296/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/57f5a74aebe79d4de833579b638486f0f0c5ed6e/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/9f8433dcff76b74f9ad221ccf265d1b888ed10c5/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/93c6e4f3d99558e060a368cfc21a1781a7d6b533/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/93c48923022d36185320df9ac10141d751936377/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2fdd5b7b75678bf556cb15184c95bc63adc2528c/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e5f944507e954c9505869bd45c4b099291e8745b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8546615ae041737a552a31303205089e9f204fcd/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/1e71f88134e6243f5294012a5d3fd47d50ffaa8a/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/ecec57d4aff7e3aeb9d6f0e18e67265a119e4a24/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/9429ad9cb112c43f0089d44e473f0fdda677d01d/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/9b73e70345fb6572d5dd19d64547a662104388fc/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/62165f6f089121b1d7908153318fe600b3874b54/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3c96f3f9fc36a4ba5ff7a7f7e90395ddf9c85e36/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/3e7c896c306cacdd3044addbfad7ef9597b9657b/
  mips64el |                     flac-1.2.1 | NOK | http://autobuild.buildroot.net/results/1f8bac17ee52e4bea27dbe50699c38f54e671a85/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/70e7c644a9f77d891aca982e679bdbb0dd6dda9f/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/7f28004919b1417ca50045a1b6f67aaf70853a25/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/487f450f248f79d811b936639645c855ef602160/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/286326dff63380b023c9bc11b4375c92ffebecf6/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/131c1acd9cdf1bad883d75484f37c955a1202033/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/9198787fe90ef8596a1c5f00844c0718cada6204/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/ac66252fa3ac26b5ed47e5c202f97b32dd25e1fe/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/3fec254f072235f1e08f986a8965cbf0ca0b740f/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/af25d6b7e94c24eef64628d4e9b2b78589e970c4/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5c452fab9320227a58f63d0bbb8554f459f9822a/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8121c85e95f881e311de3a1aae72d770e8b1f641/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/afc44e501cf227cd815179cab1dd5d1e8477a623/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/99e93a722fbcccaff0c91d29fe66698a17d11751/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/702847984c5ec0453968e6c9409cd02e28c18996/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4622fa5552de550315a51bb9f6f893a5a16bb2ae/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/04965f47b76bc44ab85b63e8694ed3ea0902d319/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/32632183a99d8285837dd4af572458dd7e2b4707/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/51c684f16b91793fd452481dec4cf6b5bb6f8d27/
       arm |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/43f2dc44ee16c014dee9d3bbbac71c2afedc64b6/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/c72072b37be64c93f63f472df29dff58df3bb61f/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/26b8528b3046e129f9051d4cd533ec6104e19176/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9cb9d8cf4d86dd2d13aa25d35a46aae9b15326d5/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ddef569452d108a9ad2e4f0ee3b27138a1b312fd/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/fe4a853ee99ffe3f1cf002709b48210f7695d341/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3320f1564d44ae3f793136bc4948a5d22a49ec23/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/6c704a9445e7e44ee28686e638019751d35a7663/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ab88ae7048c7a65b427d0b0c115350693159afb1/
       arm |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/1b877b9b6bd6bdbf6832644ea9b7b7d6497999c2/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/b2c27517fbe7245c22a7d691ffa5ca23db4af49b/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/88e5e07e94e49879907186ff35ce66944f867ec2/
   powerpc |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/7305d509385af47b8ae2f8674acd0999c4e52088/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/629f60c605cbe5d6d8143699e4729c1f27f94f96/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/43d4bfabd4b9feb3744310679af9eea805c4076b/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/c19b642c1774b987f3c38ab5872ce2a9a8427b46/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/de30e358c099a0e63100a6b276ceeef4153c1fbb/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c9849ff2720ee8a1022606055421fdf58caadcc2/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/7a5ebd96557ad0e4f9e20e6d934a67d1a8e1473f/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b50166e06c9fb95ba3262702968f6ebe81c4a5d5/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/7878aa4c0cfc574893e7f2542ef7ff3b7f543988/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/37395efec3dcf1b726107095ff3e9af05fa65af1/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/e27191f40116ba2acbed2ab98f0cf44a41566a36/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/0a7ecb51b3d68bc3291eeb29cf739cc3fbfc7bf1/
       arm |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/b646cb87442f6f6f9670b1201e8d50d5196779b0/
       arc |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/856d1d6ab097cc73dd10efe3fff5e1e120f25aa3/


-- 
http://autobuild.buildroot.net
