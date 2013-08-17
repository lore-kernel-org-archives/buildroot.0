From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-16
Message-ID: <20130817063005.A69FB52C5D6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-16
===============================

        success : 95 
       failures : 38 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

                 qt5base-5.0.2 | 5 
               libglib2-2.36.3 | 3 
                  connman-1.12 | 2 
               alsa-lib-1.0.26 | 2 
                  libbsd-0.4.2 | 2 
               ruby-1.9.3-p429 | 2 
                  stunnel-4.55 | 2 
                     m4-1.4.16 | 1 
                 ffmpeg-0.8.12 | 1 
                  qt5svg-5.0.2 | 1 
             gdk-pixbuf-2.28.1 | 1 
                    systemd-44 | 1 
                 fdk-aac-0.1.1 | 1 
                    acl-2.2.52 | 1 
                  sysklogd-1.5 | 1 
                      udev-182 | 1 
              libsvgtiny-12121 | 1 
                openssl-1.0.1e | 1 
libcofi-7313fbe12b0593034d0... | 1 
                   attr-2.4.47 | 1 
              matchbox-lib-1.9 | 1 
               binutils-2.21.1 | 1 
             ipsec-tools-0.8.0 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                   mplayer-1.1 | 1 
            lttng-libust-2.2.0 | 1 
               w_scan-20130331 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/6891dc3be68aa42d96b8b6e8f897d145e8788085/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c7d7907f824ba0e913fbd50853a80e86abb9d9e3/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/015a4c12fbcc5da8ab3f27366a31fd24cb9cb554/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/9540d48a8af06dffe2beeeec5552354ec46ac71d/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/d9bc008011780379b646273425d30b69cb7d23a7/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/97aeccc691603e6b41be32b49e745031a74fd23b/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/230f758b492c74a9fead1b6095aeb46ef1c2523a/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/5a13e0d9622e833abffa64a8d70cd7adce399b1f/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/814aa1daa414249c7d65afcb7984a724863d4f2b/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/7cd18de4b7aaaf111721fa3de7d18cba32a0f592/
      bfin |              ipsec-tools-0.8.0 | NOK | http://autobuild.buildroot.net/results/107a56a8b0ac08a752e33afbc220e2bf607e4632/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/40f3be947e5d686bb4e016db1b3bf59503237e62/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ad9d92bef3655ca279bfd6184dca0457ee6c94a0/
       arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/f2584f093a33df85d8bc8a1448312cb8d2816bf1/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3f2c4a944204e56d471d72205a266043d6dd65b1/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/aadac45f011eeb1b404e8d5dcd3d5ca479909dc5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/368515506e0a850c4d4805baee656a526b9296f4/
   powerpc |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/b31de14fc4af9f6a4e9996cb4920e94bec804303/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/2aa6b349c8ebf17e740b91d2e0e9c4e4cd3d56cb/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3d51fcbcb4a49a22efa4324383cbe7e72045059a/
       arm |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/47a4f5cc9bd31181945c0e4dc2bfffc30178fae5/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/d22e71cd5646ad1790cbe9000da5543eaff5eb0d/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/1ccc1083fd75942950661688a460f6ce25fe2604/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/3a4c6026f06bd0f9aadf8c1f90df89cb23b3ac96/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/5c3e6009639cae0d66c4d90b0d58ed219ea07048/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8dc013152f704a6ff6e360020f579f1d3d69ed36/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a70206a1497d6ec0e63ae969f29c636d94320da7/
      sh4a |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/7a279a0d20dd53df19a742cb2a0ce85f1ff1618d/
       sh4 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/449257bfdbfb9f76262604892a35fbe7ccc4bf2d/
    x86_64 |                   qt5svg-5.0.2 | NOK | http://autobuild.buildroot.net/results/b949f37c28cfef708492931380fe5ddef6f4f086/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/75e68660b929dd9b2e1553574c54f6b1af36b0c9/
       arc |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/7058d0a29c2d0e95c4db57763f58bb6fbcf2b1e0/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/b8f2fb98c082cc1e27f8231edf02aaab40caabc9/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/feea5eb3dda4028e4ed9e9a5ae282ce4d4f7558b/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/fd165b87e6fd618b7a58fefc4e0be14294754cfa/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/fb914ee0c3329727271bd60da8f303cfe1ba2b2d/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/c9a6508054d76ba00cff417cf2e453db27c5ed3c/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/2b551c00e32a8b5e4ff428305e0c200759cd423e/


-- 
http://autobuild.buildroot.net
