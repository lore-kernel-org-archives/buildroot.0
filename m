From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-28
Message-ID: <20130729063005.5AAD852C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-28
===============================

        success : 86 
       failures : 75 
       timeouts : 1  
          TOTAL : 162

Classification of failures by reason
====================================

                  tstools-1_11 | 12
                 dropwatch-1.4 | 6 
               libglib2-2.36.3 | 4 
               ruby-1.9.3-p429 | 3 
                 rt-tests-0.83 | 3 
                    zlib-1.2.8 | 3 
                      pv-1.4.6 | 2 
                  connman-1.12 | 2 
                 libffi-3.0.13 | 2 
                 cairo-1.12.10 | 2 
          host-protobuf-c-0.15 | 2 
                      icu-51.2 | 2 
             gdk-pixbuf-2.28.1 | 2 
                     m4-1.4.16 | 2 
                    acl-2.2.52 | 1 
                  weston-1.1.0 | 1 
                 qt5base-5.0.2 | 1 
              fontconfig-2.6.0 | 1 
rm -f /home/test/test/1/out... | 1 
                 libnspr-4.9.6 | 1 
                linphone-3.5.2 | 1 
                  poco-1.4.6p1 | 1 
               qt5webkit-5.0.2 | 1 
               libsigsegv-2.10 | 1 
                  aespipe-2.4c | 1 
                  libedit-2.11 | 1 
                 fdk-aac-0.1.1 | 1 
             util-linux-2.22.2 | 1 
               alsa-lib-1.0.26 | 1 
       sunxi-cedarx-74923e55fc | 1 
                gettext-0.18.3 | 1 
                openssl-1.0.1e | 1 
           argp-standalone-1.3 | 1 
                       iw-3.10 | 1 
                sqlite-3071700 | 1 
                   cups-1.3.11 | 1 
                   dbus-1.4.26 | 1 
               audiofile-0.3.6 | 1 
               binutils-2.21.1 | 1 
                  libusb-1.0.9 | 1 
                 ffmpeg-0.8.12 | 1 
                      qt-4.8.5 | 1 
           imagemagick-6.8.6-2 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/58518ca51454fc98ef0935e3dee9c229fb2f8505/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/76e5faefe82b479e95bd4b1e0fb645349bc8f630/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9bdb43c50b935d82d0a90770d2854b71c8f9c0cf/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a2859135b1d976d3dd487ee6f9e182306c6b03fe/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e62a3e5c7d658129a0214e0950192874a3bb0b04/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/7a13e96091044db0cc6e22dbf9d5f47f1f3d8509/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f257056a359893f26ab69d37273898c289600d44/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8d4bdc4f344861af861194fcde8d330023ad2cb8/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/c35bdf20d8733875f177df87cc010daf40863646/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/3600913eba94ee7f2bf7085b6dbd44c1378ffeba/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/0714ef2ace82133fa0217fb2d9946bf4fa316a14/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/c18dfea79a45bd8b70aae7658c15fc3ff9ea48c9/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/80d2e546fe227fe38922017c7b8887d7a2d98eff/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/9b860db79acb4c64310cc613f245d691e584bd2d/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c0739f9b3e3928bf5b1b28bceb487e2e1e8388ed/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/ff460fd893c7801a7b0aa40d3809ee4a0a6495fd/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c31f0fe2b2b8d5274d856eb88f5821cb0d616fe6/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/69265fc1c1b5d9c1bec412313436ee6561edcc6c/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/a8011ce3e854d299c80113023861e0c0afc51b53/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/920dcffc628937457003d5743bea04b920615dad/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/dd42390447a10da25faac9f81fbcca812f1352c5/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/f4523e0f3bca01e6009a1c6f22d4a8d2466395a4/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/61ee58596d47416ed525c617d58707334e2bb7f2/
       arm |                 gettext-0.18.3 | NOK | http://autobuild.buildroot.net/results/99f31cc5d584d1be479fbb2c27372e0b4b881e47/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d2530585e9a105465b9ed3f9750066f296b8d517/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/96fa38c4a6649fbae9a07cdf0826cf975f7c0478/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e85270705a183ea2bad9af1f2c949de173578332/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ba02c28ea3ac2b36bf2e733a2c0c5842a5135c7f/
      i686 |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/f8d7a7726ed675f4e3303767698e3088ce5c775b/
  mips64el |                        iw-3.10 | NOK | http://autobuild.buildroot.net/results/2af56be7e1bb9a80d589779c00a6d7e5cf734730/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/6e6d2ffc4b1f4f45be5b0c2c3441f690854f9a84/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b541163bea980a6e9a7b13865f38976dc13df0e0/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/270c853931a5e0924622e5da017fd0bb6427de5d/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/904d980394fd5f9e2b84033f2e741b0eba70ce93/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/dfebfa29207944d49c9a7458b786fe9c82f9c7b2/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/304c82277c88a92fbc43328e6230841bef071bc5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/fb89f300023b08bc8f7ce1e35ff98f9ee43e55bd/
       arc |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/edcfeff3c51c98059f0356997568f254efa9c444/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/11195fd91e2f45f808271185a0dcda9f75ad6690/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/a5880fa961fab91465c2a0ab0733fc35493ef8b5/
       arc |                 linphone-3.5.2 | NOK | http://autobuild.buildroot.net/results/e8b1d88869f747256ac1489cdb152634fa887775/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/84ea32c0bf6fcb128a706f12fcf151a74d76c369/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/423233f47ea602e40f01fd701f2485be673646e1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d98d3fbea80e45b24e695b3e375672f9dc020c8f/
     avr32 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/9ce8c23eea43c323b76a60886771d8a20c59b7a4/
       arm |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/0e72671d4802c10ebd0124706198f558b597b9e4/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/2be8e6382cd50a6fe8b2e3c036a43f267fd59a51/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/7f6c470375f9c58f704739c8643a0d8b09a68fdd/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c9f898d90b21e2c7d5f799192838e17ccef0ad1a/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/10165e76455b492a98fb08b558c1cf97b6218344/
      sh4a | rm -f /home/test/test/1/out... | TIM | http://autobuild.buildroot.net/results/b90f65452d96e6dd3ecec8de113dcfc02926cab5/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e50617c8093bae819a756596f079d454684dd826/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e2e71d6939782c8ca492cec5ddb18c21ce0ad709/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/cbe3184225573f37b656d571c550786445a57a3f/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/7cc1c9e2f3d1f2a50494e2787c9ea7fcbad2724e/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/c0b010d451ef67599629d32e468aed3a1e7368c8/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/c64e28ef7bd3ece5181ae86d85ad678fface40be/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/6ac3c13ad86fe6f4c995bd2361c68276f8c357d6/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/de891e43024155976bcb5cfaf834d8a0d0b02f73/
      i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/7533576dfd7f4d4f781ecabec5b2e42256925fc4/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/64a3354a7b9349b79b88fac04ee11cb2862e190c/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/a8928bfd29f30ef49af73590e36a87366d436061/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/5e27fc63dace67a28877d00aca6c7bc91fdd98cb/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/9681cb190ba42bf67afa421fd839d6e1d6e86bf3/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/40cc0c18a563cf65fa095b695357f9dc41f92898/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b0f51fdfa4d7b71b6f4c879152dafe502de50b7e/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/cb7b360c430b376163bbd8a6f40f9ae7e3cec878/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/6c16f6bda1af342cfb0e8a1699b2381bc2019d96/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/f81a7808470e02ab3a7750dbef6b3c94c34a4cd4/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/9ca17657347bdc34c73a70e60f0c3c16927c6b1b/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/efd1d64a7b55d8e94ceb2afa156bc5a9ea821c22/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/05801b14585e3b7dd0a17955f07eff30626a8ec3/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/759e37833a7255f0e76ae163740423998f5c7987/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/ad028a31fe0dd467ab2c46938c9a65ef54d4588e/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/0ed09a790c14e29b65d48de27657a9bd0579345e/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/d05863e2b15073259116fa26494670d2ca2a49f7/


-- 
http://autobuild.buildroot.net
