From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Aug 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-14
Message-ID: <20160815063026.3EDBF102A89@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-14
===============================

        success : 220
       failures : 60 
       timeouts : 0  
          TOTAL : 280

Classification of failures by reason
====================================

                     gmp-6.1.1 | 4 
                   ncurses-5.9 | 3 
                  connman-1.33 | 2 
                    quota-4.01 | 2 
                    libiio-0.7 | 2 
              libarchive-3.2.1 | 2 
   binutils-arc-2016.09-eng008 | 2 
           igd2-for-linux-v1.1 | 2 
              squeezelite-v1.8 | 2 
               binutils-2.25.1 | 2 
                  fio-fio-2.13 | 2 
                  cairo-1.14.6 | 2 
                  ffmpeg-2.8.7 | 2 
               tinycbor-v0.3.1 | 1 
               linux-pam-1.2.1 | 1 
                      qt-4.8.7 | 1 
                wayland-1.11.0 | 1 
                libmad-0.15.1b | 1 
                   fwup-v0.8.0 | 1 
                 lvm2-2.02.162 | 1 
                sg3_utils-1.42 | 1 
                alsa-lib-1.1.2 | 1 
                 liblinear-2.1 | 1 
                 rpcbind-0.2.3 | 1 
           libfreeimage-3.17.0 | 1 
                  fbterm-1.7.0 | 1 
                openmpi-1.10.2 | 1 
                    cups-2.1.4 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  babeld-1.7.1 | 1 
                      axel-2.4 | 1 
                tinydtls-0.8.2 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
             spidev_test-v3.15 | 1 
             libxmlrpc-1.25.30 | 1 
                 php-zmq-1.1.3 | 1 
                   taskd-1.1.0 | 1 
                 openssh-7.3p1 | 1 
              lirc-tools-0.9.4 | 1 
sconeserver-bbb384404575f8a... | 1 
               libcap-ng-0.7.7 | 1 
                     pcre-8.39 | 1 
                     xen-4.6.0 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/224bdf75e3303815b4fc0686e249747a7c0bbf3d/
microblazeel |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/e9d89fd5b24a76a3c5ab9dc8f01f4643f7c13396/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/b26abfe265f640e0833164f1905912cf6b3c593a/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/0058332d0f3c044f86655b9562de9884b4fe92e0/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f0f57b0b8b9106248d4e8611a022c40616ed9ffa/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/402b28e5b6b21dd62e3fdb5983434da05118a3a2/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/173bb7fc5d6fc1fa6285db507b73315b119e9e76/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/6d2c2b1cf08aca144f0b8dd57d547aa82843db3a/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/1c0221161207e011117b392ec8f8c4f4e918ddd8/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/71c0d2d087b09b1cbb67e997419f7b8180b964e9/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/c6cf6e0d576de83be0912caa385e35e71c536459/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/84c3d0a8bef7dd54ef142c95fe09ca05c7915e43/
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/d7b1337b0fa2e0a4098b94505b44c30a30113d99/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/f37ceb8742dcf79f39184e57359b8d726d563a0a/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/11813518e07f196bc30d44cd1aadf53c7f19bf53/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/1d91af590b44d70db83e1d5f6415e7b5cfcff803/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/e8aa0b8be7b61ee49d56defd56aa08baeb1f189b/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/08fca98f85908530a158364fc4490910b43cce41/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/69d410e13a49b0ed34c501ba27d32df3269adb16/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/64dd1a2bf81e30367921ee618fa397429e0d0a12/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/47ea6916617296db4a165fdc4330445061e55871/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/96d2d9ef0a582c3df30e0cb3244256620826061d/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/fe13b8dc4faf3e30a4b611abcc9a9b16ba87a185/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/674840bb79db1cb7ca03de4e205a849758799390/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/1687fcc45d20ab4a37b39ec5ed67b657d84544b0/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/87a8130a6d3cc49c5cc8766bfd36fd2ae43c2dcd/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/0bee88228d8e5fe531a62e336f9c93570ff15fff/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/67225c0d1f168822d01c9daeb2a84b3d83803d5b/
        bfin |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ec19b3fa93536077f2ea0263bc9efd3585b0e7df/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/65894560391a75d51ab33bfdab974c6bd5b56e8f/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/67a13bf7dbd9d90747a2a6e50575407328036ead/
        i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/fdb17e87b790df6b6cddafeebe36c04823135e3f/
    mips64el |                  liblinear-2.1 | NOK | http://autobuild.buildroot.net/results/1521d5071b290719b31ce4967783e2fe7ddb63af/
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/ddd6747792bbb558ef356b346d23cd351d44b7ca/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/96fb927299fc4bc9963d9e1260b16f3c3b91942a/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7c869979e1342d27328d568cc1e996d99974327b/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/75ef5ed364b70b11399418cfdee2e3b42551d457/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/0330f0ed2492f3270c3feca4b7ef9c014810a514/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/fc4b41fb955c390913a879e0202760347ce29987/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ca05b1170eef573fc4fcd49f025a7b3879e1c7db/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/4102b736ef434d86199bbf521a781f6767054b6d/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/6822a1854b9ef3ea5e5bcf2e166fb4fa24ba5516/
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/a9c26df6dc5be26f5bd0593c383a697a87eefc23/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/1ec691746b5196e9fd6779c22ef2ca4600349fb4/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/8cacdf4ad9876190e35c0170e68058cfaf0501a6/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/84d338b70c8ce3f21dd202de387326f18526aa63/
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/743c5e578da71ca11166c3c588b235a0168b655c/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cba980cba38daf46fe9e5f893ddd6ac537c6bb66/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/837694d68272f4b0a1abd6cf62c30b0964328f88/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/b3017198f787b457030447dde29149cb2ea6bcb0/
         arm |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/4f7ea4bb4c4c12ceb9cd08bfb6720386f5bdea0b/
         arm |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/bc1f8f0e629652232ca839cdac55c454241cf293/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/a1922b9a109046a2a1c11e90f35271d9dd70a306/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/f5d2dde55e24ad6b20dba60304bbbd446ebd6cf7/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/44f747a540b9479e9c146c1a30d9e12fbab51b4f/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/2f4b3209b16e9daa469343c8b86f9100b4a4e186/
         arm |                 tinydtls-0.8.2 | NOK | http://autobuild.buildroot.net/results/b461674409a048ea980dd74bb4790e54790f272b/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/0f52c99f48cd6370818da503c8b493596dcca648/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/bdf1554756161ac4ca8014cd9f33252bd424a120/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/93182461ac12397fb9106ba42ab7eb6df6e96aec/


-- 
http://autobuild.buildroot.net
