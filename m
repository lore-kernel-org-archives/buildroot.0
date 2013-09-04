From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Sep 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-03
Message-ID: <20130904063008.BCFA752C5F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-03
===============================

        success : 52 
       failures : 59 
       timeouts : 0  
          TOTAL : 111

Classification of failures by reason
====================================

                libsecret-0.15 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 6 
                      qt-4.8.5 | 6 
               libglib2-2.36.3 | 4 
                libiscsi-1.6.0 | 3 
                  tstools-1_11 | 3 
                    mpd-0.17.5 | 2 
                      pv-1.4.6 | 2 
                     pcre-8.33 | 2 
                directfb-1.6.3 | 2 
               binutils-2.21.1 | 2 
                   dbus-1.4.26 | 1 
                  connman-1.12 | 1 
                 binutils-2.21 | 1 
           argp-standalone-1.3 | 1 
                 libnspr-4.9.6 | 1 
                  poco-1.4.6p1 | 1 
          host-protobuf-c-0.15 | 1 
                   mutt-1.5.21 | 1 
                   mdadm-3.2.6 | 1 
                  boost-1.53.0 | 1 
                    fbgrab-1.1 | 1 
                log4cxx-0.10.0 | 1 
                   mplayer-1.1 | 1 
           imagemagick-6.8.6-2 | 1 
          sane-backends-1.0.22 | 1 
                  avahi-0.6.31 | 1 
               qt5script-5.0.2 | 1 
                  ne10-88c18f0 | 1 
                  weston-1.1.0 | 1 
     xlib_libpthread-stubs-0.3 | 1 

Detail of failures
===================

       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b4a32554f7c0bd15fa4fe80d9f6dbbe6192f7b1e/
      sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/846084147e3cdf3a3e84a48090a2f07922cc1903/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/6a1f83cbe7d6a0e2c1a113cd845436000ffdf2ab/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ec44ce7108e087f8a4dc9676cd758769096a6b77/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/180cd26eab5ea736ac61b4906a3a03e650558bab/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/39b81c102f789471b449fa47150567767f583ddc/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/debc91ba455643b80d4046c7faf222660ef17e2c/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/3950a8d485c02733f3c5ac799034f0febe7b69b2/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/eb8f05768c5f2ed45ea2d0bb23f03dcdbf9cbd2c/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba7e16163c5563d0aabe6e837fa4c8e223fac69f/
      bfin |                     fbgrab-1.1 | NOK | http://autobuild.buildroot.net/results/cecfd67b00f83b7346e0490698f04b90f8bdadea/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/73d9c9ca0da49c2afa19872ee959511db624fe27/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/a4feaa11af1652f2cf6bcae94649848104f07a3d/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ba6b4ed283296e2ba68f107b6e730eb810bc63af/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a67cc6abf36dc000345e9dc22f0675583a57f6c2/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ce0ca7366a6fb4e74483b3a02a41cc4375f9ca9c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ff218644a166e58149e76f2f5cb14b8b40202f15/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/780e20f43459d89ec0802ad236a6976d58284cc2/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/951c73ef89081046912e7204910f0f9ea3d8ae3b/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/a157bff3bfa73ce685a0fa5b1cc248ec223e6cd5/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/ddacc46d1421a1a0d7ad3e090138e78e1f280d07/
       arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/0635eb735536d167f3723e1a0627710bc0237286/
      sh4a |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/3ebd0fc738f406c6009a8bfa5ef8f86b85843a6a/
   powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/c66c848e552d45c136a36a82b89b3fc94060c9db/
   powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/1830833abb97049c9b0a9c7c10622f9fb221f0eb/
    x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/46d392ee1395a63362baf906d048fcecf1152400/
   powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/eca10b8360354e7e51406f7ac942d343987bde5e/
      mips |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/7cd6b8c3a8edee6074e9987f129f8791c834bcac/
    xtensa |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/b4fd932050302343d6c1cfdaf0d4acb9d988bd79/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/926096f81008be1c26593837b5656e3e14bbd318/
   powerpc |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/05b63938aefe9883c20d86d15ec328da84cab30a/
       arm |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/3bc48e18962727ace360c7f8f8f1ac57379a2c69/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/2f7674f64b13fcb02d56d3016d4c07673a60f4d4/
    mipsel |                    mutt-1.5.21 | NOK | http://autobuild.buildroot.net/results/c4ef7f0b9410e08b7d9d4d386a15a9d2888ebce2/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/b996aa65472789d0e5368125f71df7f408a2b565/
     avr32 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/5be475639f5331fd7a8c69180b760e24aca32c4e/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/97027b981659502ff12c345c3caef4933cddb354/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/6cf6dc3112b8a5ea45d4c18a5a6cbe319c9339fb/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/82dec5467e6ece48337cf06d874bfe44400d8854/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/9582bcad9eb28ba9a76b5abc4d1d82670e1511f8/
      mips |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/398f71d2a2b0f7d9c57a24969cc9a5d7a264825d/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b5b6b6c9e5d56aec44ce73d6ac5861b43d5f2b9b/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/21689771bc1ff25e2cd4ddb0ed81fde4046ca518/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/82adef1912b4cb323f40cca76472b426c8692b93/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/bc0959489203824a61a00abfbba981c25241a83b/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/83d7d5280348d0c0e0edbea02d2d8b8eb4f4ae4f/
   aarch64 |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/cbdab4ce931f98fb94e0b2e94533760d260d494d/
   aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/33697b0351839583c65e60fe1cd084c506602018/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/92311eb53c559ff2def492c0b85c7da02b602985/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/258ea0466c64a9962e84fa1e7f944140918fc46b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c05db6b797a6113e920b21d63fcddc6729d1a8bb/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3be68a4cf3e81e4a65a5a8903a9f870a7ea8f66c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f2c4aa01fe6fdcc43bdf82124aa926daba84021f/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1e5a3e18b829b72925978287a836d691ab463a61/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/dbf89378e9ed9659c25eb8ad1267e8ff40bcd39c/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/4e009c7daf8c3d13f0c9a1efe37f216ad4f7e521/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e3fa9b62f982d946caf9b85c49c8fee199d97d12/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/cd08a78b50d4e833cb2e039c8ec516d238b2f9aa/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/af367dcda63caa1667863dad327153a4da812d34/


-- 
http://autobuild.buildroot.net
