From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Nov 2013 08:30:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-05
Message-ID: <20131106073025.DACCA52C609@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-05
===============================

        success : 73 
       failures : 44 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

                pulseaudio-4.0 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                  nettle-2.7.1 | 2 
                 binutils-2.21 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                 rt-tests-0.83 | 2 
                      icu-51.2 | 2 
              sqlcipher-v1.1.9 | 2 
                oprofile-0.9.8 | 1 
                 qt5base-5.1.1 | 1 
                 mplayer-1.1.1 | 1 
               w_scan-20130331 | 1 
                 openssh-6.3p1 | 1 
                  libv4l-0.8.9 | 1 
             tinymembench-v0.2 | 1 
         matchbox-keyboard-0.1 | 1 
                 libnspr-4.9.6 | 1 
                  python-2.7.3 | 1 
                  aespipe-2.4c | 1 
     binutils-2.18-avr32-1.0.1 | 1 
               qt5webkit-5.1.1 | 1 
                libiscsi-1.6.0 | 1 
                    ola-0.8.32 | 1 
                 libevas-1.7.7 | 1 
                 cairo-1.12.10 | 1 
                   attr-2.4.47 | 1 
                busybox-1.21.1 | 1 
                 webkit-1.11.5 | 1 
                      bash-4.2 | 1 
                cifs-utils-6.1 | 1 
                  opencv-2.4.2 | 1 
                  poco-1.4.6p1 | 1 
                  tstools-1_11 | 1 
ne10-88c18f02199947b2c8b577... | 1 
             libfribidi-0.19.5 | 1 
                     apr-1.4.8 | 1 

Detail of failures
===================

      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/e644faab74c3914b3cd6f1e7d16bcc2aa663ca10/
      mips |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/84ac625e7e339ac35e63f5264c3ef3ad87abcd91/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/86bd50bce35a6a95073ed75489214e75fce1a852/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/4216e8201e4e09ef8ee9fe2da51c34ee174e4599/
     avr32 |      binutils-2.18-avr32-1.0.1 | NOK | http://autobuild.buildroot.net/results/8805ddfbe4c71e1a0306da046129935e9864c7c2/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/a083ebc83b3aaaeadb7473c09213721feb436f4f/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d90ecfb1978f324b0aef7bb12ea5dbbc2d8f0165/
      mips |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/3a8ac8aa6ba97195e02556cde368a169b33a8a6b/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/754a5294d73df465364238204200e1de19f1b6ed/
    x86_64 |                 cifs-utils-6.1 | NOK | http://autobuild.buildroot.net/results/6f7aa9b9cf7a93ee1140f42600dc13d250e42381/
   powerpc |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/8da2affdd2c912ea2b60dc032a191705b4cb6b27/
    mipsel |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/8109137862cf94848dc4310d436a4a5ac7770417/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e7b3173d961a7d50a2202c452c077a17c5603337/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c1d54f59d7b915aac4d2f335d7c65c953cdcb2ff/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/4d435a5fc608936362d605aca696c01023be9723/
   powerpc |              libfribidi-0.19.5 | NOK | http://autobuild.buildroot.net/results/c278c2fde33158666379a2a7c10ec3d5503684fc/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/6dfe7b0d0a2e3c64743755d58729522d24948f1f/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/cca8b44622d85b8cfeb9dc135cc8377f2c6fd7a6/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/764ab9b98de113ff17cea1e1185c83a8344e46b9/
       sh4 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/5bab7da5192433d3b71e1475d466d7b34918ee39/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a3e802699ebe7af6e381f175efa068d3d37d1bad/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/b1aea2d098c071c444897080fc6d5139e736c616/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e3f43fed8f57c52e07e20055f11680f8200fb65e/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8901a1110d3f0eae95a30f469cb5afed9bd2cbee/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/885369b506e06b22768c878f9b35ef1609e3b8cb/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/cfbf16ab0c65f1a68ebebc6297b0baf5a87dd246/
   powerpc |                  openssh-6.3p1 | NOK | http://autobuild.buildroot.net/results/90bca2a30886de237dd1ec670fb979ff728b064f/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/f7e05d318bd0ea43e969542fb3639f143d807077/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/231c7607f5fa97775ac951c0e6a11dc7e24ccd47/
   powerpc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/d3ea75e100f97338bdda04b205b854cb0de70702/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/6f7007915477b871cb88c6cbb7e651550f38df5c/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/d01783c85c31f9e7197b01361d2be2eda539016d/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/afcd251882fb4e3d543930810fab4441c8d3f818/
       arm |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/2831c0d859b035f7d2786f51885833a711b46b80/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/f86baaeb024d6357b4e7c95066c5a75923547fa6/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/cdc65a44095070545ea678397c7d7c6e90150a0f/
    x86_64 |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/cec03e9687df7e48d443ff24ccced917621b4c18/
       sh4 |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/dce84f552f869bd426fd43d4c2c5be92480dc14a/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/cf021fab96233562bc423add5c64f3b1a2a68c4b/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/c039d906ba82729f7547d85341eb403102568262/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b2a85acb717ab015d655a6ee635f4a5fce2c3976/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e87c2f2c98eb5d3a1ced550cdc3a37c2f58d8d24/
     avr32 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/465d50cb50726631ad196223cb101170f40a23cc/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/41ceaaa2e70fef28bc9e539b297eafb960e67674/


-- 
http://autobuild.buildroot.net
