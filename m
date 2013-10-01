From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Oct 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-30
Message-ID: <20131001063008.46DEA52C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-30
===============================

        success : 95 
       failures : 51 
       timeouts : 0  
          TOTAL : 146

Classification of failures by reason
====================================

                netatalk-3.0.5 | 8 
    trace-cmd-trace-cmd-v2.2.1 | 7 
      host-gcc-initial-4.8-arc | 4 
               binutils-2.21.1 | 3 
               audiofile-0.3.6 | 2 
               alsa-lib-1.0.26 | 2 
                 fdk-aac-0.1.1 | 2 
                libiscsi-1.6.0 | 2 
                 dropwatch-1.4 | 1 
                aiccu-20070115 | 1 
                     at-3.1.13 | 1 
               ruby-1.9.3-p448 | 1 
                openssl-1.0.1e | 1 
                 libpfm4-4.3.0 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
                      qt-4.8.5 | 1 
               libsigsegv-2.10 | 1 
                 binutils-2.21 | 1 
          host-protobuf-c-0.15 | 1 
        ltp-testsuite-20130109 | 1 
                 qt5base-5.0.2 | 1 
                 libnspr-4.9.6 | 1 
                 omniorb-4.1.6 | 1 
               libglib2-2.36.3 | 1 
                  libnl-3.2.21 | 1 
                      icu-51.2 | 1 
                oprofile-0.9.8 | 1 
                   libcap-2.22 | 1 
                   dbus-1.4.26 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/18b4670025a7a28ae7d46ff00ce46fac98148d56/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8567a7c86b771205802b052a4e6ba8c1853da5fc/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b14620ba2edb571bb793ed5792f1294cccca7b79/
       arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/34c1ef047b1ab8bdb76801a2bf0a07f865b6b9e0/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7608a31aae2ce3597a63c45f33c0b49fa8672c8e/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7ac0270f163b1183fd3b931fe4a9776a3c822fbd/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e8414d2fb225233cc8aefb69485d63be0c858e80/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/133c1f260a2291774f4da27199c3648e7b6669a3/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ac0b40265cd5b8fdec6808cb72ffc25468e5f520/
   powerpc |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/3463926ec4d978c6fb03e840f5cb3f949cef4237/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/e3244abc550a95eb69e63b8db203f39b27f3288e/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/ae4b135664e63042e83a3096d672865ab9caa29e/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/5838ce4c69aa92c22d79b731e5ee5dc3a1e45d38/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/7d2617038cec6d886c55706c1a4aaacaa943cc18/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/6ab22fc297af59c936f965f19e782f1ab9ecdc2f/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/3ea4edf9431efa535cbf9cc71ab82a858e0e6303/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/fbef5e569c1941bc0f42f107e94b8798dbe49381/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/fe6fe1aae16c348f4e7d4006fc09e35fdf670d09/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/1854a0fad48c2bc1a137b16dcf36788ca31df177/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/498336416bc55c953017061bb121fa2886a9ec1d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4a39e0bb3a07c450e9c07fdd9746579b73b3a340/
      bfin |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/d6f76fa39a1fc1c1d351b4020bb1d45fdd93a501/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a44af8dee49fea322824f99da31b82c828728476/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/e21c3bdfc535b9b5056b50ce9815b5cefec63cb2/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/8cacf3c4bf3a0a8e028f00946216d2ee6eedbf85/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/a403979ef8ae8443b75dc573fb1e7c312384346e/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/5c74f8328e52d2bcd05d22913fc5a3761290f5ec/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/d08967dc87317e516ec6f06eef88756e83ce6e4a/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/192f081c99281b349c2ffe8a9362a6224869c10d/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/abc33f4e8d368f45a9a53bcebba9465cfc2eb1fc/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/942741c968db096fd95037f579c1932dcce5fb19/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/bb227fe09d66fa34f0d175ef78f484ccdf3474a3/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/5f0b234ed5c00c9f421f911de17adf866465beb8/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/24084f8cb86235be7b4f5ce1610f964faf98d5e2/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/082aca26c8848a71322b662b2ba7aa5cbca5414f/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/073d09bb4bf0b3f9d57a03cd5ff423921b516e7f/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/644849029b76b58c9fa45c88b61e0530612444ff/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/53c37493bd66b6a2ccf133e4e94faa4276044219/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/ac4511f3b6bd2e09eccae3c5fbbcbdd7d8870292/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/74284d1087fc5677787882681c7f38a8f19e4402/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/1e859b5776be78196a56ab5d85a4258be3cd033a/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c423e422c60ba37778c6ae1fac321a3ac9fcbb93/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/688b01097fcbb00cec7ee3bebcdb6f7bd1e8c318/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/9a9a2e71d85ccd93095820bc443fc72594b0b4c0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a9dcd65c1cc72fa06a918ce70fda55f6010f7bae/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/dc3e252e27d3a6e59503a626f51895c63e531f02/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6324fc2a160471442a996a94ff86911d0845547f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2b176da0cfb0ebe247d77855752f66ccd5262b14/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/730f4ac363c038d6283a0cfb55497e37145fbcff/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d50d54f39356d412149c5d2907b2b109dfd10257/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3b87e8b29a2523ba201c3a99f947ab2acb3851ef/


-- 
http://autobuild.buildroot.net
