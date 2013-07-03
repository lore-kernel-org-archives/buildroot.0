From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-02
Message-ID: <20130703063004.ABFF552C4E3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-02
===============================

        success : 93 
       failures : 75 
       timeouts : 0  
          TOTAL : 168

Classification of failures by reason
====================================

        ltp-testsuite-20130109 | 12
                classpath-0.98 | 10
                 libffi-3.0.13 | 4 
               libglib2-2.36.1 | 3 
media-ctl-ac40b79f002a2315f... | 2 
                   dbus-1.4.26 | 2 
                      qt-4.8.4 | 2 
             lttng-tools-2.2.0 | 2 
                directfb-1.6.3 | 2 
                    fbgrab-1.0 | 2 
               czmq-cb9839cf90 | 2 
                libcurl-7.28.1 | 1 
    enlightenment-0.17.0-omega | 1 
                 libevas-1.7.4 | 1 
               w_scan-20130331 | 1 
                  poco-1.4.6p1 | 1 
                  weston-1.1.0 | 1 
                  prboom-2.5.0 | 1 
             gdk-pixbuf-2.28.1 | 1 
                    flac-1.2.1 | 1 
               qt5webkit-5.0.2 | 1 
               audiofile-0.3.6 | 1 
                    acl-2.2.52 | 1 
               alsa-lib-1.0.26 | 1 
                  zeromq-3.2.3 | 1 
                   cups-1.3.11 | 1 
                   neon-0.29.6 | 1 
                  samba-3.6.16 | 1 
                      pv-1.4.6 | 1 
                 ffmpeg-0.8.12 | 1 
                  bcusdk-0.0.5 | 1 
                      gpsd-3.9 | 1 
               libgtk2-2.24.18 | 1 
               libsigsegv-2.10 | 1 
                keyutils-1.5.5 | 1 
          host-protobuf-c-0.15 | 1 
             uClibc-0.9.33-arc | 1 
                  dhcpdump-1.8 | 1 
               ruby-1.9.3-p429 | 1 
                 cairo-1.12.10 | 1 
                pulseaudio-4.0 | 1 
               xfsprogs-3.1.11 | 1 
             util-linux-2.22.2 | 1 

Detail of failures
===================

    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/70eaaf55cb3cf03ee9c79e5df616105a2d029d54/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d1e72a385012a0798c07669c12ce5a6b164c12ca/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/a1de317759957bc155b7e15d453fc74bdf7e53ea/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/7defd92843516a0e09d02f9c16557e68157ffd95/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ae6693a9d1d8f4133d53f18cc2c913093f36ba5a/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3d745780c67fdc96c2ef45c3a1f98a588308974a/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/940ce032fd9bf5d1caf1687bcf6a5a22f83e8d6d/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/339ce35913bf40adb2a0c7285c6c99574c71a376/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/bc36b78974daa19665d3b3bb72f01ee15c5dd925/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/2027cf608888a16d49cac8ab0dd20d918a4dda1b/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3332f0018d62882d649c48161d6d4a5610a0765d/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/8c86861780abf5badf2c64cce7b848c048cf21d4/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/4ca833eb1168551b6da496dcbfd0d27abad49193/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/1da0d7158dbea54d311133c4d3ce7d29547de757/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/080ff44e6dfd7a8f6b9321f55f3f83c6f7a7f3c5/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ec46b31e72462e48dc32a1c599233326ca466d7c/
   powerpc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/bca395984720c7ddbace13cf618fd1d2ca6b853d/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/2294b3def9a1d275b2bc6c6aecf0e88e4515984e/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/dc4505cfa9a1da00b68136a44334dd5a2c0e0d68/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/8ef3474b8231d27e42cf7b7d359dd1cbc3d12c4f/
       arc |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/0f4b2006bae641948b67c167eb2ab36bd2b38ec4/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/4fe166d42ccd01cfafe500ec783b3f1ffe4becc0/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/34524a1f55b2477c649efc37bd69575da0db53f2/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/123595921105a0e017960b4f9043d1df46801911/
       arm |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/7c4c36302b236e788e3009f088bfad0d5b2f7001/
      bfin |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/64f69471a485accb435e3e1dbaf553ac1fea5cb6/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/f2e96ed9c1d2fc1e9ad6a6a196701bfd8738805c/
  mips64el |                     flac-1.2.1 | NOK | http://autobuild.buildroot.net/results/ed25534310dfa816b7870900d0c9e2a006cad592/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/0cfaa26e9977cbba0c795fc32b8f3e956e1fa3c6/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/bf182e3ea6bb0af865d1731c9c8a9e528068bdd9/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/6d6bcff00ca0950b8697aa05c0c85e5f8838b22b/
       arc |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/a908f38716669a47407e50842a7585dfe7480d6a/
       sh4 |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/122a2e68a1ea797cdf4b76aa18a0027f2e85a9f2/
       arm |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/51e0b8dbb4d9f48a0942302635fb9bb84ed2c68d/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9e7a5d3b698694065863049f406898a42678cab5/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/cc4c05c215cf21da7459ce440e33ed885fdd882b/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/16306c3aa81d89216a33c8c089aa60a15eb0fe28/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c9ff791cf96bac3491b0af201272e1bf8078bb41/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/28ccac8d5db6dbe60c97a0fcefea2807bf82bff1/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/f3a22bc205afc6c88ce86d5590ef981ffb850d39/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/76d7421ff739851bd4188576bc3463bb4f722ae3/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/d06c400ff852a75e0d15ece57622a2dbad576a82/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/08e6ea57181182888e649fdaa2727e1e542dcefc/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/a0fa13d717e0a3a786c6b6b5565edf8273cb6792/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/a19ad8bd19b3e5e6db5f3361b591d88618d16da5/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/e2eb2f57e348bdb45fd5f88fa67766ec5d24d55c/
       arm |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/d41a123380da98c40ef82a9ad2044539092eb81c/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/225903456ad8b8b7707feca07816b3db694e73c8/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/d920925b07f818fedea0047943419a02e0bc84eb/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/f3a3ae806976f3e0bb88de43e7e8dcd9e8b1271b/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/bc61ae1e0039bac2711bfbf10c3a32ab4a7f032d/
       arm |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/8658f0bbd8bd5c4bd53ac65f493cbf052c0abc1a/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/49eb90ff52dea8a838f6f0e96a03da037dd14978/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/a2ecc9a817b710dd00f418b6ee0388f885fbfe10/
       arm |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/dd025bd462caa8c875368fc4132c3c36f3154c1f/
      i686 |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/75eeb253ed6ff1f6a1b5bf92def0bdddd22d2ad2/
   powerpc |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/fa2d699901b72d36c5ac3078ef0e7bad2002b9d5/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0da2dcbf37a3d89c809ca16953c6449c6555c135/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f4c88e22206353f3496dd1841cbe3fbeec06348c/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/a9df906e278f8dcdb9414a3666e1022f8fa7f172/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/879ae96a439a5994b3aa5ae96ac6583ae72802fb/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/fb1fd3877009aad53c812d66b2948909ffe441fc/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/a234b033d49efa1f2f2eee3b44f3d4f9e7dbf758/
   powerpc |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/c034e73d619972cde0d8c7698ac7047453e86f5a/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/4ca1628c4c283bd15beb0726153c200df3d6e4db/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/cb4520673b9937b0d501c6390b7db1220fbacdec/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/e8cc1e95de7b284c947f38c1dc60cdfe16ac6506/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/55027446149310bbc91f79553bb884053835560e/
     avr32 |                   samba-3.6.16 | NOK | http://autobuild.buildroot.net/results/32bfb774d3d4b2942a8f5510665766e0d2d603e3/
       arc |              uClibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/4973d2e147eb4e5fff41ec463060130bd97977d0/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/5e90ad3b20103080ed6faf8b44b28dd7d9a179f5/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/a09132ea6b9612f4d8f09cd28d95be9144b27364/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bda11786649e8dd6f7d644bbe39c3d278fa37f9e/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6d6c1ef433a59d382098c94248da178cfb16375a/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/1607b85a89e26078bd10da14572df2b7319259b6/


-- 
http://autobuild.buildroot.net
