From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-28
Message-ID: <20130829063007.64BCF52C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-28
===============================

        success : 102
       failures : 35 
       timeouts : 0  
          TOTAL : 137

Classification of failures by reason
====================================

                   dbus-1.4.26 | 3 
               libglib2-2.36.3 | 2 
          host-protobuf-c-0.15 | 2 
               ruby-1.9.3-p429 | 2 
                      qt-4.8.5 | 2 
            lttng-libust-2.2.0 | 2 
     xlib_libpthread-stubs-0.3 | 1 
                valgrind-3.8.1 | 1 
               libcap-ng-0.6.6 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                    systemd-44 | 1 
                  zeromq-3.2.3 | 1 
                 libnspr-4.9.6 | 1 
                 qt5base-5.0.2 | 1 
                  webkit-1.9.6 | 1 
                      icu-51.2 | 1 
sconeserver-d58f2de88c68193... | 1 
               w_scan-20130331 | 1 
                  prboom-2.5.0 | 1 
              strongswan-5.0.4 | 1 
                  iozone-3_414 | 1 
                directfb-1.6.3 | 1 
               alsa-lib-1.0.26 | 1 
                libtirpc-0.2.2 | 1 
                 cdrkit-1.1.11 | 1 
                  aespipe-2.4c | 1 
               binutils-2.21.1 | 1 
                  ne10-88c18f0 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/6425ff774d6b9fde99c8f0a6d6946796eda552ab/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/af152d7ace4e430462d848c4cf939ea799ca273a/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/fb3c4d18460749c697d78d7d103a97c255d10cce/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/063783ce3da556cc21aa6222593d4f05cab188fa/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/372cc71372039d73da60d9fadc62d79e1e06d6b7/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/2670f34852c6def45a806d72bd94ff955011b5b6/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/e43127b7506cd9b19d950edbfbde4a8f85ddb520/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b1fedd94e982198b8a77ba7bd7fc6774e97745a4/
      mips |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/77236299b6296c60da88e4b1b0d1d646acd3e068/
    mipsel |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/27d889ffac2e07f8eee77676ed4e5c4a1dd02465/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/29cf3b6ae2f253b08325395642a1b5977ddb386d/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/e292bac8f39e537eebd6cedef48a26f2569f071e/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/5a21d9bffe6f011dfc71d312fc203e17cbc28db5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/741ea93a542c05c060492844fa567fc7841e577e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6d1c1cf54f532c27706f92a9d35dcf6665b55bbb/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b053de26b9336ae923f31109a0eb584297137079/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e5dec21ed30f9f1df2861334ff4f1d3578936957/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/1c77debf5b53d5382819a9a0e0d674a9cdbe25b4/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/c4d9c5a379c1b0f55073d940d768e4e9b4732e92/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b7aae57ed5d29e15b04c18a143411842a633a9a8/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/408ab8c71609888f4969d595645642be387aab3c/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ebff845a2890b155960311eeec2f5b06be6bb15a/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3471efe8a6124c1dea687a2c421331c7920b9b40/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e0bf6f9d401c8fbc36ab3b2ceffde154ee683440/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b9c53207e7d6dd2f29e368506d090d2968dc726d/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/f3080a6db8f13f679765bbc53e3d22af1c1510c0/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/25cd2f5e4c7c96eac8cebe079a8b2d7c7060ce19/
    xtensa | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/2066bb2c04c033d288eaa8a8d1dd83c6bca22ad6/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/8f66614001da21384061404e29969659335fe352/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/79d307acef429212fcd2d391a5a93507f018f9eb/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/1d977265a4eb078a34cd1999a6445ccc39b603b4/
    x86_64 |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/d75ceb07f3b7e3ac116b421eb75935a41660d038/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/69fecec23cfbbb6d153bdcc344809dc6b4f05fdb/
    x86_64 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/788b20355a4dbfe45b228169502dd721535c1c3c/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/430d4c0352768ecf430a021a64439ff8ad8b41c1/


-- 
http://autobuild.buildroot.net
