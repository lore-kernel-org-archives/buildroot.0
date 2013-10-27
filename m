From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 08:30:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-26
Message-ID: <20131027073006.E120752C1CC@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-26
===============================

        success : 46 
       failures : 77 
       timeouts : 0  
          TOTAL : 123

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 13
                    mpd-0.17.6 | 10
make: *** [uboot-tools-lega... | 5 
         host-freetype-2.5.0.1 | 4 
               libglib2-2.36.3 | 4 
                 qt5base-5.0.2 | 3 
                 libffi-3.0.13 | 3 
              cryptsetup-1.6.2 | 3 
                 cairo-1.12.10 | 2 
                     m4-1.4.17 | 2 
              e2fsprogs-1.42.8 | 2 
               alsa-lib-1.0.26 | 2 
           binutils-2.23.2-arc | 2 
               libsigsegv-2.10 | 2 
               libcap-ng-0.7.3 | 2 
                 libnspr-4.9.6 | 2 
                 binutils-2.22 | 1 
                libiscsi-1.6.0 | 1 
                 libiconv-1.14 | 1 
          host-protobuf-c-0.15 | 1 
                  tstools-1_11 | 1 
                  nettle-2.7.1 | 1 
                collectd-5.4.0 | 1 
              fontconfig-2.6.0 | 1 
        gst1-plugins-bad-1.2.0 | 1 
         matchbox-keyboard-0.1 | 1 
                 fdk-aac-0.1.2 | 1 
                     rpm-5.2.0 | 1 
                valgrind-3.8.1 | 1 
                 binutils-2.21 | 1 
                  libnl-3.2.21 | 1 
            host-gdb-7.5.1-arc | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/bb12a72518f412228e1b63bf41835fa171fc7a9b/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a766ebe2045fb1a51f51128aaf624f831b51424b/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/a60c787ef51b611c2e92ce0c2bcc5eb1bff265fc/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/9782922ab3fbda9471043d08efb88da1fcb1024a/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/6aea59db33e2e7ae1619d6090d1565ebb1d63004/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/6b658c8e66e4636d2e69366ef50c65a782903fdc/
    xtensa |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/4231c083ec63fd79b5b43ac480101af86d0e5cb2/
   powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/014879dfc37f948e1b3590d969571604f4982901/
   powerpc |                 collectd-5.4.0 | NOK | http://autobuild.buildroot.net/results/9cc4dedaba817add8276167e392af170c2c80d57/
       arc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/13a98acb74f53ebf31683e42d01ab9d7f19d6c42/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/c04bec34eac24edd762ff1604685b7e034400071/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/f377827c89b29da3a64b1bddae3e45e5e5c14306/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/850417122de6bb58afc325eb438e3f482893b41c/
      i686 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/b507a6292e5c7d8c0b6e3194eefdda1667d6aa63/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/820161f5d0675ac380e62ddf86c5a544dc416cb0/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/36ff6f4d759aec19b9812a3f3e0e5b3f2765467b/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/14fdd3f132620934d7f05d816b456204fa620ef6/
    mipsel |          host-freetype-2.5.0.1 | NOK | http://autobuild.buildroot.net/results/b49c1c502215c7972d61c900e876909c9e79c312/
       sh4 |          host-freetype-2.5.0.1 | NOK | http://autobuild.buildroot.net/results/3ddf44f928f9be5aa14c5149bc449779d27af15a/
    mipsel |          host-freetype-2.5.0.1 | NOK | http://autobuild.buildroot.net/results/ab6e9529240ab9b535bb67386d541ba65919a9c7/
      sh4a |          host-freetype-2.5.0.1 | NOK | http://autobuild.buildroot.net/results/cc95a3b5bda3dd40f04428fa49bafc307cef2fba/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/2909875cf05ac4d42f485f6d0844b2343518095a/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a29d4173a09ffcc10e5aa386ebc8828a4fd180ea/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/5cedaef36676115933d4fad9a4e21e2ee87f3043/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/83c8866c3088976183ffb40b64a51d8802ee4428/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ba7786a63d17304b75222b0933a4ead4516d869d/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e837992f0f7dcb6218e7547e4d74e8181b72301d/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/af14278cfc50c52b21f6344f23898d49b5afb38f/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d4cc01b9339c2781fc597a28c7fd969e428e51d5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3001e53ebc0b79e0449a9a8dc84ca3f94a22e94b/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/967ec106e763fa39fd9ef7010aefab796c1cacb6/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3bc8006b277d5ece9770d85b5fdec6e8d86b5dcf/
   powerpc |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/82f88633021e46f2c69c015c8fb20a18ea1d944f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1321ca9f0dad4d7b372e93314573969ec6676141/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/abfdde041dd16384707920c1f49230acfbb139d4/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/cf8881fa73671365c5435408a40b50f2dae6f7b2/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/bd34e0b11a041ac56f55d72c3971fb29c6e2dafa/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d02a15bf9b8a12e65796354109f9309af04f98e4/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6794338ce7f30eb16fc05c3a4b680f7e6999d7e1/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/85d12a09428d32e76c20f56ad1b6f7b050b26d2b/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/8da8dd07f5031a41ca726603ec90d667bbf0e3f3/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/235471aa15ce241d37baf09f5316926514442edc/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/5023e70df1a27a7d543aa6a520cb54e64e8395de/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/b9ef169ca9bfd4a472af61d5771864fc0511e9c8/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/3f6d16ea1ba17508b9d1f70c431878fe022cdc96/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/6190a154ecf45f8b75bf9ed569427e1212e16f86/
   powerpc |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/fa294248a1cd0193b89a0ae2ceaede9f26c0151a/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/283e094e35ecf31097fc83df9e611d6a2722f9e8/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/3b616dfac8bfb26c3d02d05b244af357108d70fc/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/4c6811020cb055185a5aba3bd576afffaf778aad/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/4b8ba296d92d3fde814bea118acf54f8f9269a89/
      mips |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/192f2cba9d50d8132cc35fce0c0d88b88549a223/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/f99293db3218732f8b9629db78a6459153c82585/
      i686 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/f6ffd5c0ab6ff45e0f17e46105da3176e35ae49d/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/3a7d3d6a896018300b866d790880405ced37840e/
      i686 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/bf30f6c11dc3a806914caa85b4e92a25ac00d9e4/
      mips |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/8b2d53c3d289c3d9a34effe6346c7a032be2d112/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a439177b5eb058145f4f7775c73e92fc4b142722/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/82baea85c0c80be5d06687a71bb070ca3fe40c50/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b5c31cd3a58dddf29228e84a3f9b90bb94ea5476/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4a186157ae4ac0ba4d85f76f652c867dc4c8418d/
      mips |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/263146770bd4b764d2dbd85f2143abb8704b18dd/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f44b8e1a88fea96fea87df3a7269549a5b79de3b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f08e4c9102f3c134056b47f53c5fe144c0f0a9cb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b98dee5e37182d78ef2b5ae1ea0fe4a71d9935db/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c5ce39e0cc4abee36706738e6b6dd1ea06adbc76/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e835006146cddcfc6b94321ff3cda6e7c6a3dff5/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/198ded5280e6ec59093e0e63abf18d81a4490330/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/70ab4f2b99b97e746ac6127772b349eb184ad8b8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5de353c814acbd5060a41c7ab0889d340b7da339/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/42929cd345178658806df4d8e98babc5584cee74/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/00f9b4a51a28f72a4d928fe35c517c0bef5d26b7/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c0fa1b56f5410209d86f4476ad137b18db411c21/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/48d27661200d763a753fce9bc777f6d38c00e04e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fe2a35f4d5e80f02d2ef263f2e5460f2b3b98e33/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/4b1b4f206651da83e75a31faf081563a8d60886c/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/dfba5af3e2eb6dfb1bab7185808ccf1d1ce32e7a/


-- 
http://autobuild.buildroot.net
