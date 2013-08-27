From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-26
Message-ID: <20130827063004.E161952C5F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-26
===============================

        success : 87 
       failures : 58 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

make: *** [target-finalize]... | 12
               libglib2-2.36.3 | 7 
          host-protobuf-c-0.15 | 3 
        host-lpc3250loader-1.0 | 2 
                      icu-51.2 | 2 
                 rt-tests-0.83 | 2 
                 dropwatch-1.4 | 2 
               binutils-2.21.1 | 2 
                   cups-1.3.11 | 1 
       gst1-plugins-base-1.0.8 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  iozone-3_414 | 1 
               qt5webkit-5.0.2 | 1 
                      qt-4.8.5 | 1 
                 libevas-1.7.7 | 1 
                valgrind-3.8.1 | 1 
                     pcre-8.33 | 1 
                  dhcpcd-5.6.7 | 1 
               w_scan-20130331 | 1 
                sqlite-3071700 | 1 
                      bash-4.2 | 1 
                 fdk-aac-0.1.1 | 1 
                  imlib2-1.4.5 | 1 
                 qt5base-5.0.2 | 1 
          openpgm-5.1.118~dfsg | 1 
                  prboom-2.5.0 | 1 
                 libraw-0.13.4 | 1 
                  libusb-1.0.9 | 1 
                  boost-1.53.0 | 1 
                      cjson-42 | 1 
                directfb-1.6.3 | 1 
          enlightenment-0.17.3 | 1 
                 cairo-1.12.10 | 1 
                   libcap-2.22 | 1 

Detail of failures
===================

      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/b9d0d13d1c5d05c1c72024ec27087b1d4df649f3/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/f75dccb27a7c60c9c2e5306bc6ae27818fe8bfd1/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/c6caa603a4ff3ddc3506d74c3ada1a0ccd6c9826/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/be3f1ba188bff29925bf2e4ccd05fa6334fb1202/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/facef51290ea73b61812eb4abbc654c2839f56e6/
      bfin |                       cjson-42 | NOK | http://autobuild.buildroot.net/results/12e2869bf9a2e7d431c62e723a2a7c537205f0de/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/0946f5e257c469b2af4c188135e01a362379992b/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/8a0b69f79f8c50ad11734813df38c910b9c594ff/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/61a6365b3aa5219eb4e47ef6fde57bbcf0aa8584/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/80421cdaf4260622f38194301f1370f98644c248/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/570567e9ecd231e45bafa0b88938872a0e1dcd06/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/9cc5fbf3ab0af1c0d40d2ba2c771bf33fe12e955/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/b3c5ee42f0526dff009c6b585e9a1f925a50c1ab/
   powerpc |        gst1-plugins-base-1.0.8 | NOK | http://autobuild.buildroot.net/results/c844c9af22c7898e86b1c8278fa1ac68ee702a78/
       arm |         host-lpc3250loader-1.0 | NOK | http://autobuild.buildroot.net/results/e23cef50f907570bbeb72a365eb618fab3ac6a79/
      i686 |         host-lpc3250loader-1.0 | NOK | http://autobuild.buildroot.net/results/0daf4068239db87545c31dd7fb7cbe3306b1a10f/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/184d5f3bddd6fc0600bcb40b2423e352b25297a3/
      mips |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/4294c8b270e220c4331765b684bc89adb39a2d40/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cdec2eac777b66d0ec2f7cb9307b8cced317e05c/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ddd795a3d734361f3dc496bb8ab10279ae618607/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/3a7a511de034ee2cf018032bc6cfa7e8d11aaa4f/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/586f182e0ec87c01efd23df43f32eba4df435e2f/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/39b87611388d233fa2af886f6186fb955ae33f7d/
    x86_64 |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/4cbba189defd09fd99a299cc24964b03994c1df4/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/dcfdfb2763c543f940b2dc93326cb2b19f94f454/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/40570addaf7ef65de8a35450b321d7a703c3c33b/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6177e92fd09762e839b6f58be0e34e2f8f4d8e93/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e2e0cfe0038a0350528418bec2b15e9f0d7524a8/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ea5335ce0301d1ac2f8da543030f15d9b430fc14/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/948b923a8b59298201cd299cce8afc65e92c7641/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e84e746058f32f7760265171d4c27f213792234d/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a234e2ab7011e1ccaa69aa681d07f0d07a0f39d3/
       sh4 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/53d4030fa70fb8d27a086781459c0634c11793f6/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/2ec96525eb28a80df9cd92ecdcc3b2242cc5d6f9/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3c209e2112cb5c2f70491809309e15eb4c549378/
    mipsel | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/299ca22ae2a0bf6069040f3576b38f482575eb23/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/d72e2100f8ddbfae62efc18b87f9bb41dae9c6af/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/265071c9e8c604dc9c0781299a7fb79aac3f4895/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/2ec642fdcad102c46195b1a26f8e7ce2454597f3/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/8e83328a03d8a093bfa4f20b5518033722875469/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/5d2a4067312db7db611247c6f45186e613243457/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/df5203fe941d4c4cf6e1a653bc9a1e3f9791a180/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/761dd126f6a30b7f6b5867802bad50882f495afb/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/751c7c8d5444e5472458836ac146ac4d7ce309d5/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/05804ed26f82a8df33253f752b080cf2c4fbaf76/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/1932d2271e9041e00891ce71fa28c2d827b6da97/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/0df7c01c7eeade651a5490d95fb7993daf006103/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/ffb15f0d3571ebdab35d8eb322bb7a67eb87cd66/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/f9f41ef81df9daf54e606a0d863decb7ede29d6d/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/444580e32e8b9d2ad24dcc9e34f0d8f25f0f1ea5/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c411c32dfa8751c62bb518def660f4f6561500ca/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/d16a1cede3b6559fdec4c11a0d378b2576ebd2d8/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/3ef9ab6338e1ff93ae5cd1e2c2556848b54f2491/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/71d0112de42a2a589c7e703d0d2009280df2e72d/
    mipsel |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/a4b0476990480de71afb2a66a32db8a0bf50558d/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/077c7cf4a84f56649bb760f34f9f95a451bba457/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/868a51c125ee425d19e8ee9979dffa84dbc70a50/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/d7bd483402396ce308d5b0fd65e29390e71732bf/


-- 
http://autobuild.buildroot.net
