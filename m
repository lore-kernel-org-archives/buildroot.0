From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Sep 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-26
Message-ID: <20130927063006.2312452C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-26
===============================

        success : 94 
       failures : 63 
       timeouts : 0  
          TOTAL : 157

Classification of failures by reason
====================================

                netatalk-3.0.5 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 6 
               libglib2-2.36.3 | 3 
                 omniorb-4.1.6 | 3 
      host-gcc-initial-4.8-arc | 3 
                 libssh2-1.4.3 | 2 
               ruby-1.9.3-p448 | 2 
                      icu-51.2 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                 cairo-1.12.10 | 2 
                  prboom-2.5.0 | 2 
                      qt-4.8.5 | 2 
                 libnspr-4.9.6 | 1 
                  libnl-3.2.21 | 1 
             ctorrent-dnh3.3.2 | 1 
          host-protobuf-c-0.15 | 1 
                  tstools-1_11 | 1 
                      pv-1.4.6 | 1 
                oprofile-0.9.8 | 1 
                 libevas-1.7.7 | 1 
               libsigsegv-2.10 | 1 
                  nettle-2.7.1 | 1 
               arptables-0.0.4 | 1 
                  avahi-0.6.31 | 1 
                aiccu-20070115 | 1 
                 cdrkit-1.1.11 | 1 
                  zeromq-3.2.4 | 1 
                 binutils-2.21 | 1 
                  poco-1.4.6p1 | 1 
              cryptsetup-1.6.2 | 1 
                  connman-1.12 | 1 
                 dropwatch-1.4 | 1 
                     m4-1.4.16 | 1 
                openssl-1.0.1e | 1 
             alsa-utils-1.0.26 | 1 
                 rt-tests-0.83 | 1 
                libiscsi-1.6.0 | 1 
                valgrind-3.8.1 | 1 
               alsa-lib-1.0.26 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/949470543193d7834bb0beada4c3e1d1a7f51e15/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/62a34e2143ec3086f4a802faf2473c12f565c02f/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/fd181f6aff13efe4dd81b88b5e71ca3f3decfc5d/
       arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/c9f960d1aa3e081a5ff3040ab243026a753f151b/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/7bec2133a06349fc3acca7ef0e7e78d14d72edb6/
  mips64el |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/dc18d94a2b85339a3c6ea13a3fd8250a6e9edf59/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2f5ba04706ed77fdbc277c0c1d8853b781a6ac66/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7890a1729dbe954967b04564ba55efb3828ceccc/
      i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/4516c70d5b144d9d244e35b1c87c6629b9ba5ed2/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/2c0b51f384fa77cf112a96a3f4922131abccc5dd/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/d7199b15c7025adb43a05250d58934d161400bb0/
   powerpc |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/5226982e88d3031134dda5c41a0fa5851d109dac/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/84e7fadbaf6aedf8d1cd5b11f2c461676a04210d/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/af66bf722044b8aae4a29a629ffe4c782745eda4/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/54e6f003173d708b156c5bcfddfd824be5173d77/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/56f977349681e6ff9cdf3f6dcac557fb8e484129/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/8be5d6a35cfa2901a0bc4f1d0d345a9b8c6dc317/
    xtensa |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/8306cb74225a03895ccb8bcff71f51f2c0c791b1/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/360007e59009edd7fbd86dbf5877504c3eff87a0/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/7a9199f9d6ac9bdc9e1b17cc9b80dbcdfca0c927/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/23d7c97d28fa007106a8db06d4bfa696d307a982/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0a99919933645090999bdc2a41d56f3ba5ad4c8c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6646ed7a995422c01bc13014582c9e13fd041f53/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/52527d7860051e7c4a8c54c698d3fab4ccdb322b/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/ad132181d9037ed4f969c2a8d342d5ad3e5e72dc/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/425ac6fd24ee614e655d839360997ddb66a2745a/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8846e1f091f117280c73110bfcf8b425d823880d/
      i686 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/0dd4d73c3dc9cbb07253dc53d5b93450b1cab3c5/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/13821cba0862c0a4c48fa0a07bff73166c857b79/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/336f9d3c3d37d77bd98cd64c5ee9dac58a8656a1/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/e21f12b04b9c65c53498455401a09d1fe86bb506/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/817644e0248062abbb0622687fd868a07cf0eb51/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/8e3373dea92af93dbf3b9d789e80a855a93374bc/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/00f6356257ef67fe922a6b373620699e5d7c8529/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/ee8fae038a66a4239262c645c7349d1c70a9bea9/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/12bb0878f63b8b166f9bb670056b1be76de18e15/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/d9a80689e8872b6324c17788d96cadc67630a31a/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/86bf5ac89e19ee9b83949988ae297825ea19a891/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/a08baf8821e3ee1fb9c36c8f74c4ced466af167b/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/f0c7379c1f405385d3a64c0349c3d9565065e8a7/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c3de25ca52fdb8ffda7472cf9f7b64514954cbb1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f0ca5a68a8ec9b1bc80e69e2c2b59a49656387a6/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/fbdc2d9bbf4db44820d0d1826370094f78e8c7eb/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/d178748e5873ebe62f62719f532f4d13adc20b96/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/95aec76544664916d61f99e9a14b0eb6f95338c3/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/376513631c25021168be99b33efbb6a914ae77fa/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/bc9f900c231fa7df29b2e08009cf682c7d92be0d/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/55e38faa9d67494393feb4d9c6cc2763a0807c86/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b2d16d220fbedbd62745bcb7223c8bf61a64d648/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/f90dc5850e61ebb06cbcea8589a40373900b1a43/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/289f1e3394df64db358efdff5cc4cc3ab65a7c0e/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/2cca352d106de24f76b60dfd62dc0f74eab7f6e5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5b86f45c3f1cf8915b631321d1925461ca5b46f9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7905ddfdfc4eef9998b05d93814d0aff65e9c291/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/46dcc16fa8320f77fbd4c161c914ee7b6df21521/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3e413faccf592fc0cc31a2e89c9809abaaf23fa3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9aefd2215c0cda8753fe567f2c9e88fb245097e9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/281f5a92a0bb1649cb13f101519a70479d7ba8e5/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/8ecae621569b1ccd3792746bbb84446a3d72afa2/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/db456beac19657a51466779c805e2d4721b4ca80/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/88f627c67104e94a34761c24d316cc7e601a2193/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/51f6a89c1d1733b19dc60111736be4d21ad9a01e/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/312ad8acb9f90f737e4df0f33c6a4fd3074f54e0/


-- 
http://autobuild.buildroot.net
