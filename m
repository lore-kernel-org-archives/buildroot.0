From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-12
Message-ID: <20190113070029.9C4502079F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.11.x |  27 |   1 |   1 |  29 |
      master | 222 |  55 |   0 | 277 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/82689c256160075708ad43263ef1886918c7ad97 |     
      x86_64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/e8846b2c83dde822323be8b4eaf9fcc7b71c86c4 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                         mimic | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

        mips |                          mimic | TIM | http://autobuild.buildroot.net/results/7fb920a9a0201bfd60cd2ba5c98c7ce2a43c276c |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/50f70a6d9e089d51f88d3f541f73c8c45b8a3b98 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 9 
glibc-4e2943456e690d89f48e6... | 6 
           php-memcached-3.0.3 | 6 
        glib-networking-2.56.1 | 5 
                 dmalloc-5.5.2 | 3 
                  libssh-0.8.6 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
                    atk-2.30.0 | 2 
             host-grpc-v1.16.1 | 2 
                   netsurf-3.8 | 2 
                php-ssh2-1.1.2 | 2 
             keepalived-2.0.10 | 1 
          libcdaudio-0.99.12p2 | 1 
         libcpprestsdk-v2.10.8 | 1 
                  libftdi1-1.4 | 1 
                libsquish-1.15 | 1 
                 minizip-2.5.3 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                     pcre-8.42 | 1 
                php-yaml-2.0.2 | 1 
                qt5base-5.11.3 | 1 
                   sudo-1.8.23 | 1 
              syslog-ng-3.19.1 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/a965350f0d8d35d3d2557204c0d4a1624493fbdb | ORPH
      xtensa |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/bcf82901faf77ec4cd5db12d5851a27bcc6b4f33 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/37fbcba80ae635c3dd72ebb4aa4ad51b82a81f6f | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/8f98758d783e27263347e6c01bd6d83c16023948 | ORPH
        i686 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/65261aeadae1a278a755df908b18056948c8d4af | ORPH
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/682d5cd2df721f30f41b3c5392ad39d2cef786d3 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e19817fa3f68e12f9940edcba46e3c6743d77b55 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/759b3c5ce73292d7347e1d905ae678ae56963117 |     
         arc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/64a7b1f002ca2fe85e94fd797c7219b24b5b8e0e |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c84b9bf1cfa3c5f482d7c428bbbb22e458bfb2ca |     
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/3c892728d04201a8d7cf756b0d146ad5f2ec7d80 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/80fea289a304f57c1f5e184eda85096596bff916 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/44d051463f920a44e51794d30c06523dc11d3615 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/e23111dcf4e43708a1c37b72c04e552596dc5805 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/77b22b2d14d3d152d8663e4fa4c065487e10f63c | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/fd7283d0cbd4b54600c3936734d331ada8b6fe56 | ORPH
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3b3c8c2e851b382a28696a73e53752b8eca20fed |     
  aarch64_be |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7007818e7e3dc221f4c805b45f8a8e4cca69b1b5 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/334e471259ed70cc2ea5f3c8cb2d6cd1ea90ad89 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/2358d07bd20a5d5aeec8206cbbd0546157f01838 | ORPH
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/fdaa7e5e972eda8c995ac94981940904dacc1341 |     
         arc |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/42c743c8fbb94f49b0fad8c029969395d7c12c2a |     
        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/77e06c092f4e7804dc166e259b25e779e5f1e83a |     
   powerpc64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9ef7b435c1b8469b26778d02448b1336f46fb361 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/2be6358ae57f69c7b9f69a3d7aef14d01b4219e5 |     
        i686 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4aa654f61ed1b147f5aade70039206628eabeb7c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ac3423b29fbbc263eb74508626d16b7009ccff08 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8760cd1119c1e467d6822ea3598800204b5768c2 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/cfd81f8801be28b36a9f0ba6a2424101e8631232 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/0d843fc2cd0b451ca6e9a2b2497e4929059f6a6f |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/16a3adc8452d0c841280a7badc7c8e8ff92297d1 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f0cbc3b05423a6c0676e5bfa860a8f52142cd485 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/a019855875a88175fe40b678daed0baf79cc6de4 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/9814263a81f3d39b1e9f13dd9580b35d8adb168a | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/764b45d94e858715f046fbeafe07fad5044010ba | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f1f1745cc71e4e3778ac8edb277e593f69cddb2b | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/88eea3dc79f52894fcfe00f119b469bcc6d5bcae | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2e49bdf9bab506245357dc9a87c5a4cf5c2e26c5 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/61b98ab61afb02acde8f6bf066af13f57da72775 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/95c29d21ebc0a94eeff0439da28ba9919a348a76 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/eaaf2b851512ca355efd0cfb17d7542de305d2e4 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/48d0aee480b3b11ac1eb1f0bffe63f2510e8d2d4 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ac0e2506d706a9cc2d7df37b727df72bf38ab0b9 | ORPH
         arm |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/0bb1b5837ec249a9bfac4ad93696c121b5e4a874 | ORPH
    mips64el |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/e2e2cd4bcc567194f4c6ded2c8eda2e985f2925a | ORPH
     aarch64 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/68faf5d6d22694c0adda0a3f0f8cad35e296f226 | ORPH
         arm |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/b52b1c46dcf2ca54f681d88b419cd3910c222318 | ORPH
 powerpc64le |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/adeede65cc0939fe96bcbabe17360f693ac7fec8 | ORPH
      x86_64 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/bb7e0f57d0750be9da83248d5b86c1b1611b8efc | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/71e06a404991f81a4bc11ba0a66867da16b30bf0 | ORPH
       sparc |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/77921143dd6b9e73a8c3e823991753f4a56dc6fa | ORPH
        i686 |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/ff5570ca2ddce0f5ad2a5f3e804c7dd87392e3f2 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/02f69f653f3cbba0e625660b719bc49c219f3d4c |     
    mips64el |                    sudo-1.8.23 | NOK | http://autobuild.buildroot.net/results/79a888b7d44121f5734e19e29e4e2b45d7cef518 | ORPH
         arm |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333 |     


-- 
http://autobuild.buildroot.net
