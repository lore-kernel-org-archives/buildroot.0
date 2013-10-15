From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-14
Message-ID: <20131015063009.2086B52C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-14
===============================

        success : 104
       failures : 67 
       timeouts : 0  
          TOTAL : 171

Classification of failures by reason
====================================

                  boost-1.54.0 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 6 
               alsa-lib-1.0.26 | 3 
                  nettle-2.7.1 | 2 
             alsa-utils-1.0.26 | 2 
                beecrypt-4.2.1 | 2 
     xlib_libpthread-stubs-0.3 | 2 
              cryptsetup-1.6.2 | 2 
                sqlite-3080002 | 2 
                 cairo-1.12.10 | 2 
                    nano-2.3.2 | 2 
                 lvm2-2.02.103 | 1 
                 mplayer-1.1.1 | 1 
                     pv-1.4.12 | 1 
                elfutils-0.155 | 1 
                      icu-51.2 | 1 
                busybox-1.21.1 | 1 
                     rpm-5.2.0 | 1 
          host-protobuf-c-0.15 | 1 
                     m4-1.4.17 | 1 
                    php-5.3.27 | 1 
                  aespipe-2.4c | 1 
                     apr-1.4.6 | 1 
                      qt-4.8.5 | 1 
              e2fsprogs-1.42.8 | 1 
               audiofile-0.3.6 | 1 
                 libffi-3.0.13 | 1 
           host-cmake-2.8.10.2 | 1 
                 libnspr-4.9.6 | 1 
                libiscsi-1.6.0 | 1 
                 qt5base-5.0.2 | 1 
              buildroot-config | 1 
               logrotate-3.8.6 | 1 
                    crda-1.1.3 | 1 
                   attr-2.4.47 | 1 
                aiccu-20070115 | 1 
               w_scan-20130331 | 1 
           imagemagick-6.8.7-0 | 1 
        liblog4c-localtime-1.0 | 1 
               qt5webkit-5.0.2 | 1 
              gstreamer1-1.2.0 | 1 
                 fdk-aac-0.1.1 | 1 
              gettext-0.18.3.1 | 1 
                 dropwatch-1.4 | 1 
                  libnl-3.2.21 | 1 
                 wayland-1.2.1 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/ba85db5cddb763ffaf346986ecdadb958e2cb0b3/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f04e2ff7ef02fab1e350e1152145050c79f0b7cf/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ceea51bdb5b1d8287f0e88cb6aca887b7b0e3d56/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a4e94e27c9b949d79b88513d25267e577b1da67e/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/201004ad326541fb92cbc2c3489b77b5045c9754/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8507dd085027d709dedd61d0471d2d67c9b71306/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/c1f2fe60b6c5a729320609a420aa1f9cb9352b4d/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/c5eb1808c3aadee7268a5ea7d6cbc50543316034/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ff1bdf3fe465457026c70823b867f9991d646627/
      sh4a |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d61a7933599a99fb3227ba7a18d8e6dc443426bc/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ee32099e4bda51f1ef255bad28c3b48ae633ed1b/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/98cc8e3d1c348ef3e849fff2da81fb369d205d93/
  mips64el |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/88268789993e904611440e23146cc6f1b711f2ab/
       sh4 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/09ed8486113af161be3682e3d8b95877ef4c4c3f/
       sh4 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/570b091702763b29843d9207bc14dea67085fea0/
  mips64el |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/b8950b86ecbb05a03ab9036cad97cea917c66fe4/
  mips64el |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/aff2b2ff0d81a6004ce1a0d40a7066ddc7927c74/
    xtensa |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/e47f97e32c6e32111d79050721ce879b83530438/
   aarch64 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/c26498f1a4e6bcbc3a2dfce6a51fa7d21b72f21f/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/08da468ab5fcdd0ba6081f3c18302cf900dadeb9/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/687421ff35cf239e7219933fa9bff15e5593a567/
     avr32 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b973811a147905ce8e0a0647a2be87b3035f833e/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7f7985a6797e019c5b89d965f04ae8e80225b1f5/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/7f13b6f81fdce19044eb62c3f9f0001f843a40ec/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/95b3e2d30896b9885cdd1f8b6a33cf0e8e8c36d8/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/c0128b5981baf721fab648d07dba43db50ca702d/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/76b63b12cdad0729ea1e317c6eacc566488b0266/
    xtensa |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/a6f8ca48c76a85ee6767e1731bb8c97d5fefbcb1/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0f06276d0a3a601beb63918796ac6b9dc0bc69bc/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/010e04d0b084c2cf509b57ec37753a10449b861e/
       arm |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/934c06576bbd92cba9fccf9e79110b7ac6c4225d/
    xtensa |               gstreamer1-1.2.0 | NOK | http://autobuild.buildroot.net/results/4d9f1656e37f8f776210f9895f41b001699ba20e/
   powerpc |            host-cmake-2.8.10.2 | NOK | http://autobuild.buildroot.net/results/e21a867f0fa07aa0fc71a656e64d119b487b5469/
     avr32 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/1671fb321b000e5f852a690cd2e92fd11b74759a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/06d94d036b7c046549f18bf9148dd949e360bfd9/
      i686 |            imagemagick-6.8.7-0 | NOK | http://autobuild.buildroot.net/results/013fcec1b79e5f909988c25a4a03d5fdad28d78e/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/42b57c215a8a82e0deb3ecdd9e5039911169a156/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/eeb46831ada5c726100ec30452c8243bd4201c91/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/d91f399c2177df0d6b6672654a63ec3091318a37/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/d0e59dcd5b0b2be726dffd25972c7054109bf70b/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/e05229768cba543d3a1f70db365c0dd3391f410e/
     avr32 |                logrotate-3.8.6 | NOK | http://autobuild.buildroot.net/results/c3dd428591d08f671aa1fffb10eddf9edd7e7a53/
   aarch64 |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/26dca1f8623b64a207831115b953f2e8cadfe6a1/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/7f62e4cbdf31c85ece3bb7cc907b62c219f735e2/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/45283be738e13c20db55da2840841953401f1e3a/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/e4ffb73980416a19694fbb421aef199b0b0fadd7/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/b2aa8e52b973cff6b1167de180e713c844930703/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/50fdd28ab429968e0142a5d934b84fde2ad97be7/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3ad688322adabe3ac16e1adaf4b9eb6d92b14a16/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/076eef34ff2bd38200e71766d3ea31afe812de2f/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/523d96b58d8bfc0b433d171451f09d51abf2c691/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/0ffbed7fd741ce868a8ed92a0c0a422acb52f28e/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/02a08cfa57aa48450ea924a6c7db198850eca99c/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/8534fef7063d845d57eba6a99fcaa3107f346e54/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/853f8ec53d22a8970036d225265407786d0da007/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/a646ec7d4d074b66c85b747d222cd207737df1f8/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/25a0923e58c53e4dd614eef1b313332f41d88699/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e5ab978c29a0069180116033927b5752ebe6467f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4b4ff17b66c20de49db7b683db68121c40500fae/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/74cf3f323ef84e8f3f2161c47ef4370844a6c1bc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2f7b389e154cb5cffe3cd285d62ad60f05ce4b79/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/88232ad11c96b885745609a1fb992571053e54b1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f021a98273df4c4eb99c29d33acc7d586d1d75e6/
       arm |                  wayland-1.2.1 | NOK | http://autobuild.buildroot.net/results/ad883c0301c791b00a600a4bf3515d010e2859eb/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/b710dba46fa76c328eeb7bcee5cc257edf5a1fbf/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/918bb39b16207a981c649997e51b364a57267162/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/53138727674a524be38b979886a0cadd00ef5195/


-- 
http://autobuild.buildroot.net
