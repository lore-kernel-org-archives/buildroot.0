From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-17
Message-ID: <20130918063005.29E9C52C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-17
===============================

        success : 74 
       failures : 80 
       timeouts : 0  
          TOTAL : 154

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 11
                    orc-0.4.18 | 9 
         lockfile-progs-0.1.15 | 6 
make: *** [/home/test/test/... | 5 
      host-gcc-initial-4.8-arc | 5 
               binutils-2.21.1 | 3 
                   dbus-1.4.26 | 3 
                aiccu-20070115 | 2 
make: *** [/home/test/test/... | 2 
          host-protobuf-c-0.15 | 2 
                 libnspr-4.9.6 | 2 
                 dropwatch-1.4 | 2 
          input-tools-20051019 | 2 
               qt5webkit-5.0.2 | 2 
                      qt-4.8.5 | 2 
                  libv4l-0.8.9 | 2 
                protobuf-2.4.1 | 1 
             tvheadend-5956233 | 1 
                 ffmpeg-0.8.12 | 1 
                  nettle-2.7.1 | 1 
                 libevas-1.7.7 | 1 
                  poco-1.4.6p1 | 1 
                poppler-0.22.3 | 1 
             libfreefare-0.3.4 | 1 
               libglib2-2.36.3 | 1 
             alsa-utils-1.0.26 | 1 
                  ne10-88c18f0 | 1 
                    dash-0.5.7 | 1 
                   squid-3.3.9 | 1 
               uclibc-snapshot | 1 
     xlib_libpthread-stubs-0.3 | 1 
make: *** [/home/test/test/... | 1 
          libmicrohttpd-0.9.30 | 1 
                      pv-1.4.6 | 1 
                libtirpc-0.2.2 | 1 
        ltp-testsuite-20130109 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c738db8405e127a2dabcd5617261df04ada956e8/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f6e1da89b3a0418a50cbfa39fc9373dad3fc968c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/888d14fba5d4fd7ad695b3fecd4e9dd0db946ca3/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/4b28a36e525e007f90c8d0d43566a30f65fcaacb/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/dc9ae93ffa8f62dffb5c68296b67aefb8e9e91a1/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/330f930fd77e6a4ea1b2720b91775950627036e5/
   powerpc |                     dash-0.5.7 | NOK | http://autobuild.buildroot.net/results/5ee6544a9d08025060cb5806870ae1c3f252cd93/
   aarch64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/a2c82fc633a3f1a4e07b2bca5a18fde7f4f6c45e/
    mipsel |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/8fc1bd2dc8919621b15b75c8910d7d4889d2236b/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/249b34b05112e0515364c2383c1ea3b5167bacd6/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/89bd3874ffde02fcd284713012a1dfe1ed25aeb8/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f08b419a7c058df63bf5f8bb7dbd88fdc13b508c/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/baf312a570c149323c23aac96c8954c19447f12b/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/976fec94408b071c323f4f6ad17fc123f28ae377/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/d9afd3b0ee818cd882960a7c0a85e7fe6fa79d9f/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/6d24bf51a5d4454aed0e49ec43e9f4fe11c87e21/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/1c30e111c0eedd982174fa4bfd7209edb5ab993a/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/c1a008d95338a1f7b2a7135d774d7418f24a0cc1/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/7f8a715616e1e8f6872d5bfd93c1fb9d0b4db540/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/4171f8a7b9055e095fb4a1c6fa36aab94785cecc/
  mips64el |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/97f8125766f68ee52fb1cd9bf414f05fd15ebd63/
      sh4a |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/36387c0693d5b32bce5da4bd198b1cc9dff8c61e/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/a14b172718e247eee3c24bb5206972acdc8ffcc1/
      bfin |              libfreefare-0.3.4 | NOK | http://autobuild.buildroot.net/results/03c86aba015943b99355762d51d05c24d6e6a94a/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8897b531481485c17de25f9fab2e7269002520f1/
     avr32 |           libmicrohttpd-0.9.30 | NOK | http://autobuild.buildroot.net/results/3ed509fb6a69740915bfcdca41f111a37ee965df/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/e672463d2ae92bb500e47446608a1c5462f60027/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/bffc278bc3ca5649db09803dc6419dde4fd231b2/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ec7936282f1f70552185a7074374787670b54ec8/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/7c64e0bf5a06832806ac813bed91cd55c918550b/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9d9cb294edde5dcdebc49b06a073c59f6bce7583/
   powerpc |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/4ae1d6e438e6d7580485a761cc3128ffb117b2f0/
    x86_64 |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/73f8cb35b93bc88a41c374494bd7c62367989a7e/
   powerpc |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/175729f1cbe85191943198f17eb1088c9e688b5d/
  mips64el |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/cc8c5c940f2cc54676ee7984d75f53b02dbc004e/
    mipsel |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/381e9f5a7edc68bbdb0a62fd511d92786e0026a3/
       arm |          lockfile-progs-0.1.15 | NOK | http://autobuild.buildroot.net/results/7c6d9531b536d53e419eea43b6aaec6b3c9c0a7a/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/e2530adb81ab4fda53166d5f7e598d1749e5a141/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/f3504e05b5ee60f574ef227f352a89d95e6d23ab/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2618a68d371eb25559cdcde4abe6614c897e9020/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/17db32320f9d4f529700708ae32f0d7c3f878994/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/ee079b08c02f5f6bcbc586a67b40914651ea11bb/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/677b2fcaff40261512f352f961816eb4616e2d1f/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/542c8c4b34a962abb720597b6e383b80ac6389dd/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/57ad321edcd9ecd0daad9caca3e19d1b5cc3fc4c/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b72df725cae5a29787c5886cbac53812c6226d4f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/a623f6819cec98666c2020c2e2bbd1275a1f51ce/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6b8ede0e5c11b8087113189a39672066fcc7dde3/
      i686 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/a1f3b4895e9d24cf58743197b6292702a3dab29a/
    x86_64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/eadf0203e3f83a56650197c353831a8fdc8def3d/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/eb44651a0a729c400881950976e79358bbdc9f06/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/3d72853e3668eab0a83222024d3556cd8cb12a86/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/c1f3940d06b4141ed9a66ddc1e427f0f20a85755/
   aarch64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/1e09cf60d2890e41c3073be33916aa0131898eab/
      sh4a |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/81b0b32d2c931d53667f84983597f36991321137/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/1e9f33c71f1bce6b3c282b9b9cc9f2d498c16aba/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/3d9d220a92801da4acf0b822a688597bfe8bb2d2/
     avr32 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/cfb423e65252bfe3da945ac281a87fa3104feb7a/
       arm |                 poppler-0.22.3 | NOK | http://autobuild.buildroot.net/results/781e76ba21476533ac252fe893e82284598307e9/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/e8a4aef2210323a47ba701df690cab5f48d82b4e/
   powerpc |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/44e9bfea770b3e6ef6010d901cc192b5d2bda252/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/82d96f1a9e2e0e868d8260b6fce2ecc17e4d7790/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/a7e9dccdf8c08b7f20ab63717c555846e9f8b9cc/
   aarch64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/6cf87d00dc544eaeb9f6ad17e837be435b77289e/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/a9bbba68f22076ea2c86ee09ebe8a0a5e86b3b54/
     avr32 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/d7e67bfc2e12ee3755379c1e783b49db4bf5426d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4c629bb19d9ad38049a58dacc96da89cea1326fb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c1a3dd69d719b80859c73fc76fe36e61115c023a/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8359507f7763669e9351b85c3648708234db56c1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c08bbb9494ba0a4aad4b027b578abe84ec19b743/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0410dce3a6d835f86688318b7ba4a5dcfe51bc05/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a41211038b2a242a218d541c77652f93adcff0ab/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/96896b333235bcf915697d272f963b521a343aaa/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cbedf07f95512225e765aba2f54be25023a7c344/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eb4d62c324244811658122258ce6bb8d79d71933/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e51396d9edb574d0f6f30387ef9f9eba4b011613/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ff2d791d942181ed719e49ef748aff709853a7d7/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/0384f3bb4406666054e177dd5374c7acd282f420/
    xtensa |                uclibc-snapshot | NOK | http://autobuild.buildroot.net/results/c5283156ca4d1f13428ea523d1e18132dc3cd056/
      mips |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/0586128eeb0e7e79a81f369c40bb8a94f68e4989/


-- 
http://autobuild.buildroot.net
