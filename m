From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-05
Message-ID: <20131006063005.A7F7252C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-05
===============================

        success : 82 
       failures : 73 
       timeouts : 0  
          TOTAL : 155

Classification of failures by reason
====================================

        host-util-linux-2.23.2 | 16
                  nettle-2.7.1 | 4 
               libglib2-2.36.3 | 3 
                 cairo-1.12.10 | 3 
               binutils-2.21.1 | 3 
     xlib_libpthread-stubs-0.3 | 3 
                     m4-1.4.17 | 2 
                sqlite-3080002 | 2 
    trace-cmd-trace-cmd-v2.2.1 | 2 
                 qt5base-5.0.2 | 2 
               sqlcipher-1.1.9 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                 rt-tests-0.83 | 2 
                netatalk-3.0.5 | 2 
               libsigsegv-2.10 | 1 
make: *** [core-dependencie... | 1 
               pcsc-lite-1.8.6 | 1 
               libcap-ng-0.7.3 | 1 
                 dropwatch-1.4 | 1 
               alsa-lib-1.0.26 | 1 
                valgrind-3.8.1 | 1 
                  poco-1.4.6p1 | 1 
                   libcap-2.22 | 1 
              cryptsetup-1.6.2 | 1 
                    ngrep-1.45 | 1 
                openssl-1.0.1e | 1 
        ltp-testsuite-20130109 | 1 
          host-protobuf-c-0.15 | 1 
                busybox-1.21.1 | 1 
                      pv-1.4.6 | 1 
                      qt-4.8.5 | 1 
                 libnspr-4.9.6 | 1 
                   dbus-1.4.26 | 1 
           mysql_client-5.1.70 | 1 
                  usbredir-0.6 | 1 
                log4cxx-0.10.0 | 1 
             util-linux-2.23.2 | 1 
               ruby-1.9.3-p448 | 1 
                 fdk-aac-0.1.1 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/fdd1636ef79e13132780e84e5611587d559c08e1/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/9d6f624cd22fcf2cf113dfd3a3097c88f5e77612/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/cdd334ae490646c6367315668fff68feee03a4a2/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/436f1f897efb09bfc910b88b7396deaa9c67e158/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/b578ece284d14a6d78c32430518634e838df166a/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/94ef4b9cc8e87e1eeabea452b0d0985e5e19d359/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ce1c9a2ca389c2fb1c8955c75212737c7d57a803/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e9abee0a161b4ea61fcd605d278eb80afea00c45/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/0af6031272322412377ef5da9861c6f83e43d171/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/6fd1b1e01c0d6ab9327aec0ad82f602b25a9a2a4/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/55f9977c5ed9221646e3195127c9a48fa4f7a943/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/0cac54a8913740a396a5e228cb8d075d1c27c9f5/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/39cfad1c6ccab0dc4d9d1ae937181ec5cd90b93e/
      mips |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/5cdc28f3040b17f19d94f3b2a2bf669e2e921077/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/3bd721f1ca8f06a6b584c0aead58a37385876e35/
      i686 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/86ae21902de89e45e9738bf251342484bd711b67/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/e01a9595b55d05fe5a3a3b2f76b32d2932744d10/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7fbf44f4e17f4e7c9f023a3205b6ea536872a364/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/5df87a2e8ceea0dc236b4eb744009d3dcfbb320d/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/19e8e3050feb938de30c4c604f5bcf68bcba4205/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8d47922becf9e61bc057acde05fe25317d947028/
      i686 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/5eec1d7a8a66174d65fe2d1f6fe70b5071ce3865/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0eace31a73eb29113fddeba085cfffd469dd6718/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/56596aa80e61db1cf80b342ae28fd520280a56b1/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/19c496cdb895d013b2b41fb50e1831f8969914fb/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9e9bea353deec59a5f517fff0203ae9a823cfc50/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/931f2a8c466309c9234e20b7eedc521a3355619c/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/483ad0a02c0debc2c3222b257ee5876ab50e8e10/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/17d82b498801dcc379e546acb7a207f5c398487d/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/43ffa21f50e5321664191bfff31edbe562490a50/
      i686 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/57195454a303abd8ff7b5b8ccba9220cad2862e5/
    x86_64 |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/77061f301ba405a1607ce5bfa9e450182f0fdec5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4ec0f495f4ff77bb35e7b1ab8446671c8d260cd6/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5dd80d2d70035772d56d249288e79d8e485f0850/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/32fca009984ca0de4b4026ff6b4029104d0396c5/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a9234b8be684f0e2031722f81ae72c5a75c8ffef/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/07ca0e2f10011ef88e3b98c4e098b67ca6f8a818/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/a477e108acbb63a2f28287cda6b7faa952ceb42c/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/f6501c4e872b0070379575d8caebd5e49947ee8c/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ee14782a45875d1a480cc9ea6ce4823e31a17ef1/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/14c77bbf64c8eaad2c2855fe05d351b225f5a7fd/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/f4dc546f46279b5138881531421aef9b4c211e06/
       arm |            mysql_client-5.1.70 | NOK | http://autobuild.buildroot.net/results/9b19b312651d21ea2fd54f364b11b01e4aa25e4b/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/b42bfbccc133a2e080e549b5205adf809ff78671/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/7494a1e110de93a219b6cb5899d65999de678746/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/166ab2a8c2efffa0b518f07d7f1dcdfe8c85614f/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/bdc3b32ffd6f344c84b002240352c1ba692c2faf/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/20b2e2573985a687be29220a7df3b11a32894ba2/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b1d6d56d2c8bcd3df47e2685ed8e7de8742a7c73/
    x86_64 |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/684a3bed28d13ef5e5156257aade3b9aff32f180/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a050faaabbf89f9d3f324b821da84f8991a5aebb/
   powerpc |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/c3506a862d537db93452e7deba64e103d12c5746/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/b9d00422c747a8ad019f5e3c779350a8a13f9ab6/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/91044c01dcc3c4150aa6e74f5964fff27b9dac79/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/cf9b173fef3dcce0f65b812f9cc2a271c5c56d4b/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1d9c33d0919c525f96f7a220b1df83577324f514/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/f8110f56977854a4cc14b4b5a3fc61d7a2397014/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/2479dc9e539e0421e889f91bdf321ede96c2d9f0/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/246c38e59af9c0da35b0fac800974223a4e418dc/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/003e6cc1096a21480a37ae55f8b07a625920ce98/
       arm |                sqlcipher-1.1.9 | NOK | http://autobuild.buildroot.net/results/ac482030479b8172bf45c4f850d9007ec7c95ea5/
       arm |                sqlcipher-1.1.9 | NOK | http://autobuild.buildroot.net/results/ecd30bf43563eb69f4039eeecb037455d2b6150c/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/ee6ba3e95887c7606f37a8f2947d62d14f21a3f9/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/1a11c90afe2a3148f1a6b71e44b1080e23d49d75/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/41733c4bd8576fcc4baf7f0de2df454378a5a12b/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/01b203546f5665cd6535936deccff2c5aa48101e/
      i686 |                   usbredir-0.6 | NOK | http://autobuild.buildroot.net/results/62643a6fbd057f5ad359324aa8648b3b1cd2777d/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/de51aa9a6b5268d8e6f141a347a2b53ca851cd3e/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/b208a34c54324ce3d099b687c4742f170efb3d0f/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/33e221268a4cff010cc3e18b2ba1b2f0e1696b47/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/1062180c304e50e46bb2313763d60eef9f8e5880/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/ef670f05c21a2fe9f567d2428129d0878bd03eb6/


-- 
http://autobuild.buildroot.net
