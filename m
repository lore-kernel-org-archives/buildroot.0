From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-24
Message-ID: <20180925060023.4595B208B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  34 |   1 |   0 |  35 |
   2018.05.x |  21 |   4 |   0 |  25 |
      master | 211 |  76 |   0 | 287 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-parted-3.2 | 1 


Detail of failures
------------------

    mips64el |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/6db5323f710759e2d1cc6afc59c3802bb25909aa |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 
              webkitgtk-2.18.6 | 1 


Detail of failures
------------------

     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/3a1b0020833f2d01733de9b5f5e168b6f391e94d | ORPH
        i686 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/32a6074d9b748d042a5c8e55b49d227226f93005 | ORPH
microblazeel |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/55ab89853713e7ae2d9f76765d467238fd17f23e | ORPH
    mips64el |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/2769b86178b6b89f8aad1771076652a60597d123 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 28
 Makefile:708: target-finalize | 7 
              ptpd2-ptpd-2.3.1 | 7 
              e2fsprogs-1.44.4 | 4 
                blktrace-1.2.0 | 3 
                    brltty-5.6 | 3 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
                  mender-1.4.0 | 2 
                   netsnmp-5.8 | 2 
          synergy-v2.0.12-beta | 2 
                    chrony-3.4 | 1 
                 dc3dd-7.2.641 | 1 
      docker-containerd-v1.1.3 | 1 
                libmpeg2-0.5.1 | 1 
mjpg-streamer-bbf32fddfd02a... | 1 
                     squid-4.2 | 1 
             util-linux-2.32.1 | 1 
                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d6da765a6cfee4a37f80053aaea50470d48d89bc | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/9362ef12c40cc10b4f384fc2cdeee76f79b26a0b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/3b2b47f02d5c1ae5c86de483e7f5a4f9108f7720 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/e949394b6e967e86aa5bfdc9f82719f7a23b2004 |     
        i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/fef147162faa7cc5f275f8aa8e7ce170372f0beb |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/cd6f92035dcf4a155d7affe6ed163225d7a15b35 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/7d41eaefacc43c7d7cecfa885d36f14f8d4dcbdc |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/06ed23e48b60a2a83a3c944836e51d1c889d6883 |     
      x86_64 |                     chrony-3.4 | NOK | http://autobuild.buildroot.net/results/3c609f94aff182c9ab47ef8ec4b9de03a4d20ffb |     
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b9219b8557d8e00b13bf72468ebe19f1a2963c5d |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/6fcd284092bd838cbfce1e64e438660f89a41af8 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/9500cc40c2f7462455543e89df53fd83010c33db | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/a2f310356bc62a1fc7bb9e76f13dff0a68062a54 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/69de3a4b3fc264859841f81e0351c7deef13535a | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/243ebfe71d15d7956057c89b6b9581bd8d18deba | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/e49d9333086ed714fa193b79b49c53e9cc511fec | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/7f8d25a8e2a33370a648d049debfe89e02d9491d | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/11189ec4999c49588df4abb2d6b530060a9b8027 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/6fedcda31528a5b5c6aa4a12484bef53033ad7c7 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/914fe642ad829769ae96d4ccf6ff00e8b758f3ce | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/7f5fa80725c5f9424697962e40a317863536437c | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/5dca7da3538615dbca1a9176e2bb8a8e71b06a9f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/75b67c3a877cd2cdad2873453ba7849bc52a24a2 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1bf3f270d9d0a4a526614dedc9943d132efa2a43 | ORPH
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f714200f144a80b51da886be4d4c815cb27688b5 |     
        mips |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/57356f057326e710af2c9dd31a6e98397231f2f5 |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/81d43e9d52431218e8500c0197fa04e2c787cc5e |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d798257d34e884ee38884c73d0649431abdb86e1 |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/bc790355a0dd6ba02bb5ea876b98ea4f2eed81d3 |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/973313ca577a681742de37b002f4e77733ed2ebe |     
microblazeel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4409914807dbe61bd96e5f0cda2e6301a4656fe3 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/cfb8817b43b7b7a9fa5f407ff71a2e33e0be5d42 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/e170e861d4c2503b0c7eca4ea85a7aeed88134a5 |     
         arm | mjpg-streamer-bbf32fddfd02a... | NOK | http://autobuild.buildroot.net/results/0d384992a924b7eb090558035c213a73b0648d2c |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/1954c0426be7b162c7a200162e2bee7ff1f80088 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2cb72e297f1566ca1405d92732fac9b05c8f0bca | ORPH
        i586 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7364aa885d274fd398c811666878ab3b43dda25a | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c591fe1e26aa58a01643272c11aae10c2e31cf42 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/52eeefa2f3d2cc4b247e6e710aad4bc8cbdaa479 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e97a685759f97915dc5721bc359cda98f0b55d65 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0582ccc4d2034b303b44219fdb083de28ebc3cd2 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5a2f19a9a63d9f45ddd312052eaad83d450649eb | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a8269c84d2c042b291672d792c154a96dec4dd3b | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/30f1b2659f3fa8f6964df39afbde1baacfb05f32 | ORPH
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/07bd62f746ed74394512235a3d70bd44b775f752 |     
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/62a289e7d41c076c47cd116589e3d02f0104ae8a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/b9ba3f4b129616cfa4e8840a3c42cd72ed92fe20 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a5b656d1e4f1206c8ebe06c27cfcb723eeadb48e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/eb31a8c5ce13236adced8fcbd4c1f15844a5a53c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0f4f37d0b3dbc3bffc76360bc088fd5b1d79f983 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6f78e765f653076282dbd5985a7b2f7c5005b2fa |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/2201fa2334c68d73a3a1960b90648ed7b9a5a771 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/02d462d97547e6e56e3201612d80e4c6cd09140c |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/aa5154a4c7febe4fcca179a925ceddeda3466b97 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/91d6aaa781c66ae811f0d024ade6e4c55b0b8aa5 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/7423f389fe62ef449336c0fce4dbe7e496b4f6a8 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/577a9fcf63ab57eb6fb94e7a1db378d3cc81b252 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/01be006d5de2302d7c3984f28446c20886c61fdd |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/815565e39c175d505d16330cf7d338d337e43f79 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/51e68939b4188f1265b2023d4b2d22b5825ef912 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/139ce45e0d7a0296a2dc923fa5766eff48bbe9bb |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/e856b283c170f0b7d1b1fb63de7bf3229074dff8 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0837351b3529bced93b023f9479219a36dfbf658 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/df156b279979f3a7e6c003faa02512c5fede716c |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/198a427dea97154f806840e5d587dba1f1793f14 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/444cc03116557157114439114aba6495f47fd8d7 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fe3a0d598157e63e3fedd2989199cfddd696f70b |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/7c2304c979ac53dad1a6f06d6ce1a3ff3503fbbb |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/3f509b0c9980291acf771f8481b07e26ea869d6a |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/eaffbbd2d01e31c9f968d12a9105267f2abc3222 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/81cb504ad587e48b9ea7487d0520f560069dd54a |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4ccf6faa19a9263b10bbb030a819ba94de099938 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/9d90677b7c5981b93bedb51517536d9b264b6df8 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/b2a50e7392965abe49f887a8ecdaca15acf32757 |     
      x86_64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/2ccb2f19601b077c70f1742b8ad0a2ca908600f2 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/946f397bb81ce2c69384fa1e378c40600fd405b6 |     


-- 
http://autobuild.buildroot.net
