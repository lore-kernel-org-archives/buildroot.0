From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-07
Message-ID: <20130808063004.7C3E852C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-07
===============================

        success : 83 
       failures : 46 
       timeouts : 0  
          TOTAL : 129

Classification of failures by reason
====================================

              buildroot-config | 5 
                 libffi-3.0.13 | 3 
               ruby-1.9.3-p429 | 3 
                 qt5base-5.0.2 | 2 
                  ltrace-0.7.2 | 2 
                      icu-51.2 | 2 
             gdk-pixbuf-2.28.1 | 1 
                 libnspr-4.9.6 | 1 
                rrdtool-1.2.30 | 1 
                  tstools-1_11 | 1 
              strongswan-5.0.4 | 1 
          host-protobuf-c-0.15 | 1 
               libgtk2-2.24.18 | 1 
                 ffmpeg-0.8.12 | 1 
                  libmnl-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                    neard-0.12 | 1 
                     apr-1.4.6 | 1 
           argp-standalone-1.3 | 1 
                      udev-182 | 1 
                busybox-1.21.1 | 1 
                   flex-2.5.37 | 1 
make: *** [/home/peko/scrat... | 1 
                  libogg-1.3.0 | 1 
                    zlib-1.2.8 | 1 
                      pv-1.4.6 | 1 
                   mplayer-1.1 | 1 
               libglib2-2.36.3 | 1 
libtool: compile:  /home/pe... | 1 
           libcec-libcec-2.1.1 | 1 
             bluez_utils-4.101 | 1 
boot/uboot/uboot.mk:144: **... | 1 
               aircrack-ng-1.1 | 1 
          host-libglib2-2.36.3 | 1 
                  poco-1.4.6p1 | 1 

Detail of failures
===================

    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/89bcd472ca2382c6308ca6dda4d0e2d667eb0035/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/5ea865b7a3025737a2c551e7ca8d0e4edd266476/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/bd847ae559c779b3c2fa9032a6838edbc6bd141d/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/9f01eda419beb0471de1235b30e303d4a31bcfac/
      i686 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/bc9cd6e7a39ff575008e1194f23aba7989c7cb50/
      i686 | boot/uboot/uboot.mk:144: **... | NOK | http://autobuild.buildroot.net/results/c3184ed673427c825bdb9e965a25bb39882d8d90/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/6860345c1b42f4e3c01815d35d6f0703284c50bc/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/cdbb6699c8ff7ca07332b9227750f15af7be1ce7/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/dcfb1cde2a5e7a12d0e12a63182cb165d9773563/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/b514a8c090cefc5b60918ff9c3cfd3480ef6a96d/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/dfa66a71a20bbc425c719e5e5883fcb8282c44a5/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/f77c7bdd3b7cf8b6aefb23fd7450f7a0f2d58a5c/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/a095b442b186cd741af090511af4a110028295ef/
      i686 |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/027bf0bdf5448e401a2e6314dfcec06833acfeac/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/a9ae8c349f471935d60c4f3469ced173b9e190ab/
      i686 |           host-libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4ef2adf5ba85a84ba6ff2ae77d2913ba09897b8d/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/92bddd139744de2096a7ea32a18e91e5670d0574/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6b86b4caf1f90a5da75621b4a699043b43e2c851/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/0e7dd45e8d700cfc84e47065e900b7567f08b288/
       arm |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/964c26020c21e3a1e883d8e36ce0f3f04e3ff039/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f0c9db496233f53c26e92294d7305aa4511ec7b3/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8968690c248df86b040218867f92b573721e872c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a35db8e6a49d022133b486b12f6a8e40b3c95b6e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a2e1b4650dbce4cfdacf3c1bdfa3b61af1b0a23b/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/f46a907f4e4fc5092f626470bc638354fd080939/
      bfin |                   libmnl-1.0.3 | NOK | http://autobuild.buildroot.net/results/a1277a559c6d2a9dd40596057e347db0d218fd58/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/74d1f797c377a29448f716a83b1ae9e987f23078/
       arm |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/aed131190b34d427b51f638ab06e89c34d239fdd/
   powerpc | libtool: compile:  /home/pe... | NOK | http://autobuild.buildroot.net/results/1047e7263bff670388267a7377ee501e2168bab6/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/e653d67a192cb5a7e01415f3c5afac194783c4cb/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/53cfc54ffda8a90f8957b325bddfa1a5c440483f/
      i686 | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/38eed4e5d987d0bebd8d73e0b27a48c51fd53091/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/9266d72ec421dbb51738e33d1ad857ab24f1b577/
      i686 |                     neard-0.12 | NOK | http://autobuild.buildroot.net/results/697fc1f360499dfc7ca48d919820fb3444402089/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/297bd1d3fa4a6b3393e121247298609e23018afa/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/6a33d1a85f0727e8633fb4fe8444efaf72779f7e/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3f4087ecdd9c1a75f6ff69ab34157081937aaaec/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/dc91a29624a6e50896d30211629a759198add2a6/
      bfin |                 rrdtool-1.2.30 | NOK | http://autobuild.buildroot.net/results/6a1156cbf123b7331410d2831c0f80604a378293/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/0c705868d947f5d7d1727ac0760588d295295e39/
       arc |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/383fc99911a696db23377db3265c4e0b71c6fd6e/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/4e85e78a4f0c2986f40cbea0d56f7df20bf2cf6e/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/af020f2a9344348a6184e7e801ade706c46e1d03/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/2d82b737d486b6ab7e71e88c5c1fed932e03fab0/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/55c2661d13413755f0d338662e7c5e53de6d24f1/
      i686 |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/1dc56329372aeffab3549599a2122b8ed3b4fb31/


-- 
http://autobuild.buildroot.net
