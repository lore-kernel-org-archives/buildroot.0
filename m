From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Mar 2020 07:26:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-09
Message-ID: <20200310072645.3BF0288344@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  9  |  0  | 28  |
  2019.11.x  |  6  |  6  |  0  | 12  |
  2020.02.x  |  5  |  4  |  0  |  9  |
    master   | 193 | 74  |  0  | 267 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 7 
                linphone-3.6.1 | 5 
                 rocksdb-6.6.4 | 5 
gr-osmosdr-46698a67e7e06419... | 4 
               libglib2-2.62.4 | 4 
                  ffmpeg-4.2.2 | 3 
                libtirpc-1.2.5 | 3 
          mediastreamer-2.14.0 | 3 
                       unknown | 3 
                   bearssl-0.6 | 2 
                  connman-1.38 | 2 
                 haproxy-2.1.2 | 2 
                libevdev-1.9.0 | 2 
              libeXosip2-5.1.1 | 2 
                    mpv-0.29.1 | 2 
                  pango-1.44.6 | 2 
                qt5base-5.12.7 | 2 
                suricata-4.1.5 | 2 
              bitcoin-0.19.0.1 | 1 
                    brltty-6.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cmake-3.15.5 | 1 
           host-nodejs-12.16.1 | 1 
    host-python-markdown-3.2.1 | 1 
                      icu-65-1 | 1 
                    iperf3-3.7 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                 opencv3-3.4.9 | 1 
                oprofile-1.3.0 | 1 
                  polkit-0.116 | 1 
psplash-fd33a9b3d68c89fa22f... | 1 
                 qt5svg-5.12.7 | 1 
                   systemd-245 | 1 
                 tcpdump-4.9.3 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8eb6b3f2604214a99e80ef59257502a9546449c3 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a7bad4d79b718c972f019d95902c4dad4dd95fd8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/85f033931c990daf8532ebd218384c732bbf1435 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ab0a09c31864bd03fedd1bd56054ee2e4d68bfb6 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/7d65a452e317360482c76aa9e1b7b408a44b3bdd |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/16f69ac1ecf3b59e1409179ece8b1773c9ed57c4 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ca2fd162ae1792d7d2df6a5c15c23e2fdf867080 |     
  sparc64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/9de474582652d1e9b140749c7e9066d2081305c6 |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/83428028fdc663fd258adc0a39678239f2cd4964 |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/ed674b9430091d3b7b8b339aaf2de3517152c2b7 |     
    i586     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a8731b24e8d1a096ea740e7b0d210f96a55fd7d9 |     
  riscv32    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/04c71dbbc13513457f4f66cbecda7d725dc213c8 |     
  powerpc    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/456591eed242f873c612e0336e7f1ea3faf7814c |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/d8a4767dbc4b0bc73ee1af73cc153061ed45008a |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b309d48fbd0ce8f076a9c83a9e9fb11df047419f |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/7454963cf4b5bd496ad70fd7d08b3ea9c287141a |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/bf82a3889af445c9f6ae82f271a847c6abd01cea |     
    arc      |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/ef96f4ebdae9d70240b4093d090e0173b1e7d403 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/01bfa713b61d8f9c9c0351fdecc4b2ddd8dbb8d3 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c0f9cbb8c9fda224eb98bab6fbcf9845f6a0568 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4931c09187a128e287f46878d59ea737bd7660a7 |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c1516b9f8fb5a4bb2aa30a7ef4a2f9ae022e1594 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2f33a217e9636db0bfdcd92dccc1c885cbd35caf |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7b9c39b0834043d94bb91f8db2ceb8232030e00f |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f4bfd76c82728e9ef21f2663573d857572c7c479 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/941afed71cf3d644148fe4d08ef59c6112c6288b |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe |     
  sparc64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/34998d3f202d77f0a7e89f83b7a960e994f7f312 | ORPH
    arm      |           iperf3-3.7           | NOK | http://autobuild.buildroot.net/results/7c452d74c2e698a1d319f0a389a47fa5f6845ede |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/b920ef5a250e7d23223352367ded50bf32bb5688 |     
   x86_64    |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/dc52a705c7490b722380af7b00ff7c6e172450cf |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/2cbe98c97f717bd93ee0cdc35be5c8c0e905a513 | ORPH
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/979329a861b14aa88027c7afd1738cb74658fdaf | ORPH
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5cd72fd7f8ec4f35e7da309520a9b8cd10eea840 |     
    or1k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/8eafef47dba7f446fb7bbdbcaa8d0e0f0c4030ee |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/b9c442aabbea4b85e06aa88783b3217df330d987 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5bea4ef4d78caec62cc3b0b12bd38b530d894c9a |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4863ffc80a7e76995d94f7f6b89ab75a27c92d18 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/89371df7b533edc7b644251a0727e810c539982a |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f7439ea0cf49b96810a18c8e50ace4c45f9e75bd |     
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b41065325da87e648fca1b1ede17ad2a09d455ac | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5123ce917dd86b5fc3b2fa5be28afd8260bdeeb2 | ORPH
 aarch64_be  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4c7bdd0e45bb7e024577972cd8ba1473dc842a8d | ORPH
 aarch64_be  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e9038f4194d1ffa9da2758e24f2c547889776426 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/7c67d363ae33c2748d57c69a9251f6667ede5209 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/e1c8ea165980eef9f8b874d232b8b7b48e039fd0 |     
    arc      |      mediastreamer-2.14.0      | NOK | http://autobuild.buildroot.net/results/e48db4d7a7b981bf0f054d9727f812483eef78fb | ORPH
    mips     |      mediastreamer-2.14.0      | NOK | http://autobuild.buildroot.net/results/f91bd53dfd2f033fd7988be02b3b883be83293c8 | ORPH
    arm      |      mediastreamer-2.14.0      | NOK | http://autobuild.buildroot.net/results/850b57b2d1d0ded60baca6bed0c03c07d15ecbb9 | ORPH
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0a0c788a05184688142e430331a40ed7ec141b07 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/aa425dc9dd52dd14f4d6767888c73ce2f1cd189c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/42c06037866ffa5aedca649591cd795bd2fdaf90 |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5a25487e7809f823fd5a4078cd6dc9cc4b47ff9e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/736c6744bf9aef3cf76d26300fc4a935bd9990a7 |     
    or1k     |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/b8e67ea46c2dee0cf0529662d9c14c203a796b0c | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/34b20c16aa9b4db824a2ad4c9465865cde44e1a8 | ORPH
   x86_64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/be5bca2187fb1a03d05b4abacb6cd0b1ccfbfc1a |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3ca336a8ab40c1a60b20ea46dead5a1f0d6c388d |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/4fa6ae65cbe7f8f387fcd0e6d575ca1c6873740b |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1057ddbea4dd2a9ffae73d94cc09b8159638cd8e |     
   x86_64    |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/130cc4160921b74f424df7cd616b579e4572ddf5 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d55e042586a998f4cc188daf02eef266d9a08b24 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/10fa734dbe850d77cf08225949ed8a78de39215f |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/577059a84e7d4d14dd76dd3ffc98f6911e95d216 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5bb7ed85602cad525c6f07387fdbc6f6c9e4cd2e |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/379ff364dcc2483ead3d58166b4f254316e42d85 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/0868d0baae59ff137f05e6646866eae24b524d5a |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/77d4dcc4ead5eafabffb2525049da42d70e80a20 |     
  mips64el   |          systemd-245           | NOK | http://autobuild.buildroot.net/results/3d49f83ea4e9e7355e51f1bf9f1ea99fe712599c |     
    or1k     |         tcpdump-4.9.3          | NOK | http://autobuild.buildroot.net/results/17e9bae17c008e6b7a7a0f848d18c8bafc8d677e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dbc00cb7c5510c8997f0d71f4e9f3c68faef125d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/6367f3c4fd69d9d1f8dc6dc687d58e6730593af4 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/ffe98d1c10b3b96b01dcba9fba52078f7e43de36 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/841f5c560a97cf04633ba7471fd2c9d2edb05239 | ORPH




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 4 
             host-grpc-v1.16.1 | 2 
          imagemagick-7.0.8-59 | 2 
host-google-breakpad-7515ab... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/80f67a37abfaab0a4bfd24a3a7b8bda3623d9ef5 |     
 powerpc64   |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/743e955848e57277f6750ac4195b612505b28f09 |     
    i586     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/be889c694ef8c6bebdec6c11d8619f134528aef7 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/7a580d44b8c5ee725d4f2249391285eca73c19a9 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/7e7d6a03d5fba849c21093aecb7fc0943c56fe1f |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d89663975d9c271b4f02fecc37dee5a0afc8670c |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/9513e4e3252e9f87b88a593265b4e64db264f803 |     
  aarch64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/fb55259c85d55d84f8273969f25399f61e5fa7cb | ORPH
powerpc64le  |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/621f82b6cbc4fc1ee67228744c38884e54a1f8ce | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-59 | 2 
                classpath-0.99 | 1 
              host-grpc-1.23.0 | 1 
                libgdiplus-5.6 | 1 
               libinput-1.14.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/02f43c0b82e4aa105d0383a87bf794e1b3bac6e2 | ORPH
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/7f6accece5b487dfbf50e6f7df2b354068bb8dd2 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/8c397f7432c2c642378a657e17b41ff9d6d0aa5f | ORPH
  nds32le    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/a1a196256e6860f97d76d6aaad79daa5c6bf753d | ORPH
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/7717087ee2735cc1bc1e0e2998da0b5660090fb2 |     
    or1k     |        libinput-1.14.3         | NOK | http://autobuild.buildroot.net/results/f213eee0bae78422112c5fb3aad3b5ac23f58640 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
               libglib2-2.62.4 | 1 
                qt5base-5.12.7 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/53bda216424753e9288c66aff1d7fdc6f398c44b |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/9567ca2ebc1793ff5636ca607216d9e8223c3d79 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/333013f947379b84362ac8b77ec880f4d9252b42 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0cbcbcf5e9f844f45080f6869a8e947caad8bcbe |     



-- 
http://autobuild.buildroot.net
