From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-30
Message-ID: <20130731063006.73F3852C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-30
===============================

        success : 89 
       failures : 61 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

                 dropwatch-1.4 | 7 
               libglib2-2.36.3 | 6 
                 libffi-3.0.13 | 3 
              strongswan-5.0.2 | 3 
                    acl-2.2.52 | 3 
               binutils-2.21.1 | 3 
           imagemagick-6.8.6-2 | 2 
                  sysklogd-1.5 | 2 
                 cairo-1.12.10 | 2 
                  ltrace-0.7.2 | 2 
                beecrypt-4.2.1 | 1 
                busybox-1.21.1 | 1 
                 binutils-2.21 | 1 
                directfb-1.6.3 | 1 
          sane-backends-1.0.22 | 1 
                      gpsd-3.9 | 1 
                      bash-4.2 | 1 
                     m4-1.4.16 | 1 
                    zlib-1.2.8 | 1 
                   cups-1.3.11 | 1 
                      udev-182 | 1 
                      icu-51.2 | 1 
            host-mtools-4.0.18 | 1 
                 libnspr-4.9.6 | 1 
                      qt-4.8.5 | 1 
                     apr-1.4.6 | 1 
                  libv4l-0.8.9 | 1 
                  prboom-2.5.0 | 1 
                valgrind-3.8.1 | 1 
          host-protobuf-c-0.15 | 1 
                pciutils-3.2.0 | 1 
                  connman-1.12 | 1 
                  weston-1.1.0 | 1 
                 netsnmp-5.7.2 | 1 
               alsa-lib-1.0.26 | 1 
                  tstools-1_11 | 1 
               libgtk2-2.24.18 | 1 
                     pcre-8.33 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/7f607173f45da15b45f63e4953b5ccaf5d9be96f/
   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ead3c81cdecb86c3f1b65ffdecd949252e85ae81/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/10682c4495d89ba970e72e33b055d8cc887fb4ef/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8a6f6fe7b75a05e85f8bf15491edd2bd410dfc1c/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/7a0e82b7e3785fa16eb3c80c97e6bf88f456c8ba/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/9d1e17e7b2ff4d5878d62d543759adb679cdf9ac/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/41c3dac5a00189cffb4efd52ba51ff14ab591f50/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e695dfb23fbe75788c79a5e00b431d693b91105f/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/183d3d6b8fdb121634a58990bf61add24a1e825c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/25cf41b2952df5c2d95bdfe5a8bdffe47e53963c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6da93aa902083c9e3c00cc9eadaf090928c3aa7c/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/70841f404e8b219a66fa3eafddfa956510bf9fe2/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/a76d05dc830b63ffbffd958044914939d909131f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d972bd17fa58a74e5e1a33fd5c2a798565a1445d/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/8940ab44c7cb274839c1e1a814d9fa0b36e1e75e/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/2dc12281004064cd5494a2cfb666dbce6f42ccea/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/3b9c79eb0bf1b52a7b1581dc55bd6b8740c45b4d/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0bc74f8e81c94020caabb7a89db39a1801233057/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8795becea8633c15b1fdd1097983b62045342996/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e99cb292bbf24c2c9db518e95bdea72ca4ae766e/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/abab0682aefbd132608c6b5d66481fd880f2e1eb/
       sh4 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b0e1c8d1b6d9e25aeed4ac9dc7d82b42d5211344/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/64bbf594259a3ee5ea70cff38a20d9edaf31c191/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/874cf373d91ea4af6a8184be9356315ab4aeb849/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/0184ed864462aa1113d2967b11b36071d28a5c31/
       arm |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/b2ef39ebc01de440fe7469e2eb91b571895d2723/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/7a77ef50dea75e95f5e9c46203185ad80bbaa3e8/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c4eb877a8f43e8189378296f6fd0b9bf02013967/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/a6eed045519c336589f48cd91cd037310c2fa538/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/8a88891a249e339344294c9ed6890a820a92cb95/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/304d30c172b6b1848fdce5e59240587e895427e1/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e0b86acde58c7b9b1b36babf916966551c14363c/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3805e2ab2405a88f377d411efed9fc0db1620b6d/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/df8b91226282f674cc543440df64d71b160ce5f3/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/421d48a1f893f6e74dcc3be5ed6f5dfb082a2d9b/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/cfffd352d5fb8d1aa18b92d8b1a6dadc14a0f3bb/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/afeb18e662daf553fb5a91895b52227bce11aa1d/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/21b6d6460f103fbeeb9823e7f84ebfcdcea163c7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9d7df7430c6627d7f7301853eb281ee351e8cdfc/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/5a4faf88de22b1f2e45030d1e1ca576ca995fcc6/
       arc |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/da3ce672eca71469fb3172edea0d22f9b51a1b69/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/d5297500b245676b3e02706f93f0e21a55c325fe/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/b0539f2a4d43f8c873cbbbb485787e21d2a0b5af/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/7784940c2d41d5b97c9fabcd8701b5b374523a87/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/987471428c9232b48cc2bcedb6d0f5d987dffe04/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/d69ed4ce77bdf9c3b9f922402ea912165fb5e612/
   powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/ae023a11287d132c390b3f8a5d23d1bca2235ca6/
     avr32 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/80365858cc444e48b3c6674fc25e436429a28ed4/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/79009676632063f40f1f9330129eb40c08df394f/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/44a265f7f45f6b0e9516ee8d684ed760e0d276d2/
microblaze |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/1795decbf26c701470e5a50187d37864e8f99d34/
   powerpc |               strongswan-5.0.2 | NOK | http://autobuild.buildroot.net/results/6e177b2a9e50d7b36c1acde762ff301fd2c09cd2/
   powerpc |               strongswan-5.0.2 | NOK | http://autobuild.buildroot.net/results/99211cb92ed3642a04ffc716022237900b8788ac/
      i686 |               strongswan-5.0.2 | NOK | http://autobuild.buildroot.net/results/6750dda33d327fd24add05595d77d99c9f958036/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/eb2f6bead8ee6899a273060c2f233ee7b2fce01d/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/371810693345c72f6164f71f690cb8bfd92cde4f/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/c928cd900a74b4f6a2ca70567bf39658b33122a5/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/fe79ac613dc20168d9bad9f44075e85585ebe43d/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/8c7f350e9dadced44f1bbee54230b12a8548fe88/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/847b91fecfd0db9dda67c5498076ba4dea94da36/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/ac299c2b8601056f8d717a415671cd3436a909d3/


-- 
http://autobuild.buildroot.net
