From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Sep 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-02
Message-ID: <20130903063006.40E1852C614@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-02
===============================

        success : 73 
       failures : 55 
       timeouts : 0  
          TOTAL : 128

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
               audiofile-0.3.6 | 6 
                  libusb-1.0.9 | 3 
                 qt5base-5.0.2 | 3 
                sqlite-3071700 | 3 
                      icu-51.2 | 2 
               libglib2-2.36.3 | 2 
               binutils-2.21.1 | 2 
               alsa-lib-1.0.26 | 2 
                    systemd-44 | 1 
                     apr-1.4.6 | 1 
                      pv-1.4.6 | 1 
                openssl-1.0.1e | 1 
                       kmod-14 | 1 
                 binutils-2.21 | 1 
                      qt-4.8.5 | 1 
                directfb-1.6.3 | 1 
                 ffmpeg-0.8.12 | 1 
            host-gdb-7.5.1-arc | 1 
               qt5webkit-5.0.2 | 1 
                  poco-1.4.6p1 | 1 
               minidlna-1.0.25 | 1 
           argp-standalone-1.3 | 1 
                libiscsi-1.6.0 | 1 
                libtirpc-0.2.2 | 1 
                 libevas-1.7.7 | 1 
          libmicrohttpd-0.9.29 | 1 
                  iozone-3_414 | 1 
             uclibc-0.9.33-arc | 1 
                elfutils-0.155 | 1 
                 libnspr-4.9.6 | 1 
          host-protobuf-c-0.15 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/130d2a185548fe1bdf8726ccf9404d6c73cf5f11/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5e549ce0e43d592d6bb2e3a79c87ee13cc7c6f4c/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/07b30081744d86b03e400eb7d340488ac69fd1af/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/df7abf04debdd47725ad810340aa09e43c6ac0fd/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f339d4943d90df1714753d5958422074e7f4ad23/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/8cf5cfe4ed4c27463c4fb8e55dc48ea3c70ba446/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ac82770c3f2383080ad71508cfcef50b76d13c60/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/54ebce755fccb46e9754f8f5adbb3c98d636b3f4/
  mips64el |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3e80e303903f686932efbc65fdeaf2e45fd2b86b/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/8eceeeea640fa5190ff7029a8295dd047a9e9fba/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/327c9658c9106b7ad6610544b6dea422799e9cfe/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/af429f2225925f1410c0c80e659615fa98ac0f6b/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ebbcdfe67e366723095add700f3dd186d4808354/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/e66df4c895adbc377b584719e8777a61e0c5a1ff/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/66f3ca81419643d0599f1a0696bae860e487d20a/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/3466f8143c1df11323aaa66ae316f4e586891095/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/d9c8788ee09798c2b69055ac24435835902f2305/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/fa3285a1ab2aeea1cb4f67dd15a4a7065d9c221f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/dbf8b78278d70d05cd4d5902b01a69e340d3d60f/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c0152a8521db802139a248b5d9c03cd42047208d/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/bb6e6000efdf09db9eae4e16915fcf56d7f0560e/
    xtensa |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/0adaa385e6d1f187d4495428e667949f2688b98d/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/05156f356f94933355c419add457919930f610cb/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a9b2b24a6dc407adb8f6a6b7e885d6e1e5f444bc/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3ba110c035c22801b91dd41b11f8fce98a84ee0d/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/4b38bc27d2f793146bba2eb47867636864844e54/
   powerpc |           libmicrohttpd-0.9.29 | NOK | http://autobuild.buildroot.net/results/836c39c11cecbcf9399675ba3ab01202417b9642/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/bcd5721198ce5aebf2f3b135351a1ffd22ee5dd4/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a631fac49f9159c9253ba0e013e20e34224ef0f3/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/ed135b50700a50408ffecc1fdec64b55b271455f/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/4d1b9c6132e7836bc2ecab4b1483b80d2e042dcd/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/60f7aef40bc8ce1857aedef823dc44620d29c866/
   powerpc |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/9c8fa2051b3cfeeb17a3e95c64835bab72aeb5ca/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/05860144b8c46c01cb72f15fec0918630c226ba3/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/eef4ed7fdc48c15b39594b1833e44aa85a1aea57/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/a29482ec384c68a6c26ec443a3042caeb7daafd6/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/496c7dfced0eb816319fdea0a7cd15265664e70c/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d184358f3523269eac0d08da2b02f273950c61ea/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3af4ecfaee2c1d2de48a0491e35a3b815232515c/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/68e2abfdc84a3c2cab938fb5f770a7b8389df28c/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/61f7899249ff6e33164214b063e828702fda1471/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/213cf6e0a851e4d0d07eb26eb40d5c4240b5dda6/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/9ebd146095fa5f439268d731391be1aa5457973e/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/e73f6cde6dd5a896cb5e4049142365f3cb0ed5b9/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/70bc5a1328f534be28c9251abee35173a80de6c9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d3373c467b84f18aac050dca36b4fa752bf56f82/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d9909389a82ae051f15a49200670d2c69409c34c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b2a34e506e4d9783a9baefc528c45826ff0dc3d6/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/23aaef83ca12983fb2032a8e5353d76c1dca7b42/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3ec0e3262dbf17b89db1b34af76170a6650c4c75/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ba8f3d26b9cbb747547c90efb3a0e7d1abe86d2d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4ec532bf84cb0f319fc8e9c964c4ba975f071319/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4bee1f993cfcd0fa7d5fb1fe845944182cb96c45/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/132c6cb5d4c0c9b45f0041989c43c95e95ba33bf/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/b542b746244651609c58339ecd74c4e4084b7074/


-- 
http://autobuild.buildroot.net
