From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Sep 2018 08:00:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-18
Message-ID: <20180919060049.9ED9F208EB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   6 |   0 |  43 |
   2018.05.x |  28 |   2 |   0 |  30 |
      master | 226 |  82 |   0 | 308 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 4 
                   dillo-3.0.5 | 1 
          motion-release-4.1.1 | 1 


Detail of failures
------------------

        mips |                    dillo-3.0.5 | NOK | http://autobuild.buildroot.net/results/61f937739e57960bd212eea199d837f60da9dbbc |     
     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/00f93e1d317af8857aa0647295e779e5f71da31d | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/36d007d6c81c4532c1005ed91d747e4434cb9a46 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/50f8511598172e9184ff1f65e0a8197053919434 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/761ed0ad21ee2bcd99a7c6b3e00e7561b6dc7f38 | ORPH
         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/275e4e0030d26c029085b408cfb272d5633969c6 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 


Detail of failures
------------------

      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/ca8bfc80b9ad72cd8184d614500be216a1b798bf | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/f3cf4350fb713de973eee556ea9be2ad660d2a4c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 33
              ptpd2-ptpd-2.3.1 | 8 
              e2fsprogs-1.44.4 | 5 
                   dante-1.4.1 | 4 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
          synergy-v2.0.12-beta | 3 
                blktrace-1.2.0 | 2 
                  boost-1.68.0 | 2 
 Makefile:708: target-finalize | 2 
                   netsnmp-5.8 | 2 
             util-linux-2.32.1 | 2 
                   botan-2.7.0 | 1 
                 dc3dd-7.2.641 | 1 
      docker-containerd-v1.1.3 | 1 
                    efl-1.20.7 | 1 
                flannel-v0.5.5 | 1 
          host-libsemanage-2.7 | 1 
              libgeotiff-1.4.2 | 1 
                libmpeg2-0.5.1 | 1 
             perl-sys-cpu-0.52 | 1 
                   qemu-2.12.0 | 1 
        s6-linux-utils-2.4.0.1 | 1 
                  samba4-4.9.0 | 1 
                  screen-4.6.2 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/2bcc0209f7814e00937268080fe8699b61a494ec | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/ed56b93a8a44b94b4983dd3c0e9b45f1ccd476c9 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/b65c80a2f377cadcd1642f60f433d3af92c63047 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/6b4fec8f6ad277a9774244aa2e276128a1e46306 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/c2093f920d95a788a1b0b34203a4292e92f52d31 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/0315ced02bfd87c7957b2d8e5f1efea3c9c7d25a |     
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/86f6f1255b682e97d8c6c44a789f4aec963c0ecd |     
      mipsel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4536c0a6ce7b91f0fc34106dee82260ba4aa2b9c |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/884d322983202c4cd29e0a0dc7d1a2a022b2a2fa |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/fadebbce30bc4811346284b249c94b2c1c552850 | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/735f7018737d0a52f16af24b0f0aaaa245838059 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/494b3d8e1eb024e29ce86ff964e87daf27b633b0 | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/142259ba51148c6066b76888009561e89586b536 | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/6673f2de5c480fad792970b52664d05aa8c6fa77 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/c984258b372d76b807da5f4ea410a10480614189 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/318a8d7f6582ba77031e1f19b67fc7be04984a0f | ORPH
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/ab697cb589d7354a3f1641471c9faf6b43e65c03 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c8f111d8fdb7458938541e13b8b1b49bc2ae1a9d |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/5bcb99e06bd88fe1f282d2ebbadfc3a16fb378da | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/3d8bd170845f4661678c7539c411847266c5eae8 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/6e5d4e1b6ac5d229238588d01399a9c6b59a5773 | ORPH
     aarch64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/5e0a18611ac07ae8658d30ab3de1bceefa98b095 |     
         arm |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/c96bf34297d721fbf0d6a11dd91189012b097d6b |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1f0f3067936fbb95e6e19cae3cbab3e33e0e46b8 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/aca8b09c5d05f49c7bbcfab98bf68b0f7cdc17d4 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4b253e0a8a9198c84867c06f8ef094eac9ec8b8b | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/50f90f110a749b8ac2e274eb3f8904c6aa50c58a | ORPH
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/7c63f31b700985994876fb0f63832ce92dca37ab |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/8f6de48169d41b71d127f39c5b8a4cad043212f5 |     
        m68k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/3c527fd75ace91a61753c914085911342cc30511 | ORPH
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e6962a38bfd489560f8f83a94a7554cf167208a4 | ORPH
      x86_64 |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/fec3aeb884b561383b3667812765cf4b515b8d5d |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0bf2c0566da3e4f36548d6d8f0a67728e4105129 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/66680071f8c620e866e0a87caeaaaaa8eac047ca | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6762fcbb192e3ad2e3c51d468a683ed44c079fc1 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3646c0307ae11ce1fb65e3e0feabf3663485d3a9 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ff5fc1dc1b5152b1b8bbbb4062728df4528b94fd | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/56f91eb1f16d1245ae27488f1890f767c4f7f3c4 | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2eb9f036f33fa068d3d0e4d90f535e6742569030 | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0a852ea0b88a3d01616e3af5e8e0326cfd1792f2 | ORPH
   powerpc64 |                    qemu-2.12.0 | NOK | http://autobuild.buildroot.net/results/2c43bc053619bf1861424ef4fd63662a31880d90 |     
         arm |         s6-linux-utils-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/9742dfabd9b244e1381983dd05edd3e65504f0fe |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/73209bd0035c125d35d2f0dbfcf07b5961e2e17d |     
        i686 |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/dcdf85b690a1608213ae4a68601c19e0d1919ac9 | ORPH
        m68k |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/a32cf6051ce4bc98d86ccdd21db8f7319721b183 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/85c2b7eaeaba7b970f638aef2f83046d214e06c1 |     
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/2b4d8358d07692fc8b9dbec5be8d0ed56a924bd7 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e48a5ed6b170d52ef2a8b489a21cbedc9bbd019b |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d0ed0348bafa9f8a22e7bc8bf0fb459a53b13e7c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a4d73f1a574df2205e3086054926a0e7dc2e8f2c |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/7ea741c797d6bb084f438ea1e84407278de7a3aa |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d9213ffb9ea9c3c9a0f0b628e1d5c09b4342ef70 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/40f987225a5372db52533c3c5586b5b8e7dce110 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/cdc80608f73f9c0857d1a2526e55a90e1c56c065 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e3f9d6a620d582f3ddf6d416d419d82e224b7ce5 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1d07ae971f2c302521cb405f686eb80a7c93de35 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/8d4d6141ac4492326e4452357fc469399f35fe72 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c64e6560013f5f0b8f992e6212962e5e6bcd4417 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5f8bfbcb2913ddac692a5e3ce0da9ba27e8212f7 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d30e608a1e5e97d8a75f88746a43fb8bb02fc1f8 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e10cfe0880b7540cc6d96337351cde4868d4e8e3 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f1c187cfff6ade5768aba037ac7c56d9f1c02826 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/0ff3f860b6d4e810022ca6f19b8dc96ad3de878b |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/0a835c3a2a40f78d6aeda51df30fba3616faabf4 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/f0e81dafb48ce96cda8fca3672f81372448260ac |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/728cd25189fa897ca05193d3509fef7e1b35e5a9 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cbfa236961bea2ea202b00945773a7816d8005d4 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ebf9ddf7dfa1528a4e10e691d5b0142e440cc20c |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5b586e1df5fb8de60a3f4201a3caaa11ce0b6ab6 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/5644c633d6645d48d6f9fb66fe7963cb8b5ef92c |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/c35d388b2848fa3149d7b972c1d0909ff7f2e79a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/574bbc22b68a3b01dec0635a9f4bcbb0308881df |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c6ac8d0a324dde623a7ef8fde0c23132481f435c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5eee52b980ae64e2382e53795c70235a77822962 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/7dc3e09147ca2700ca4c83a32a4526a4dccedb5c |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a40615844527a89dd356e007068a6a827747f397 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d488803f786be07d0d61edcb4996156641e2b48 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/ed74887ab3d271bfb9201dff1ac49839f08d5fc0 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/22e01f7f3acd9221226668297116da89b78670a4 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/f071c57ab7afa980004756b49517a354c4ca3e5c |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/72033a95dd7bbbf5e5d67314d3ce352226d0a0db |     
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/5534e260d120aa30c433296f01f26e3a2f1ea947 |     


-- 
http://autobuild.buildroot.net
