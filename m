From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  8 Oct 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-07
Message-ID: <20181008060013.65E12207CC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   0 |   0 |  30 |
   2018.08.x |  24 |   0 |   0 |  24 |
   2018.05.x |  28 |   0 |   0 |  28 |
      master | 157 |  74 |   0 | 231 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 16
     linux-firmware-legal-info | 9 
              ptpd2-ptpd-2.3.1 | 9 
 Makefile:709: target-finalize | 4 
                     vlc-3.0.4 | 4 
                blktrace-1.2.0 | 2 
                    brltty-5.6 | 2 
              glibc-legal-info | 2 
                 lvm2-2.02.180 | 2 
package/linux-firmware/linu... | 2 
                qt5base-5.11.2 | 2 
          synergy-v2.0.12-beta | 2 
               boa-0.94.14rc21 | 1 
                  boost-1.68.0 | 1 
      docker-containerd-v1.1.3 | 1 
               findutils-4.6.0 | 1 
                flannel-v0.5.5 | 1 
                   gvfs-1.30.3 | 1 
                  host-go-1.11 | 1 
                 leveldb-v1.20 | 1 
                libmpeg2-0.5.1 | 1 
        ltp-testsuite-20180926 | 1 
                   luvi-v2.8.0 | 1 
                 minizip-2.5.3 | 1 
                   netsnmp-5.8 | 1 
             qt5location-5.6.3 | 1 
       qt5serialbus-legal-info | 1 
      qt5serialport-legal-info | 1 
                sedutil-1.15.1 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/787947958f05e15f76bca4cfe4248b18845aac75 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/2e760088395b91ed743a651c77d367360ccd2994 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/73f10f3128c26d809a28cd0e4a435b917044bd71 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/01f3c5c373f78cd1a2951de5fcc657ac83cf7b7a |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/f2f0314f7818b54b8d4065cc74321bb1022b1cec |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/0653d51e07bb7f88cd251fb21340e6de640c145b |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/681b6cde56fbe35a261ea4ef41c403b20f81d38a |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/35a31f8f3ebf7ff9420ef2b2587684da88317a72 | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/85fb3f00c264f26feeebff4c3e690d360d0391d1 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/29a970447ff674db79b7d3f130dc0f562ce92a75 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/6e408f7a36544628f0fe281db9dffc5d4ad1316a | ORPH
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/2f0cf34fbc2f01277d5dc3fd2d017053260379ca | ORPH
         arm |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/037b36d962b8d4400c2fc7d723ec5f1fc9b015f0 |     
    mips64el |                  leveldb-v1.20 | NOK | http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/7fb836be7344fa52430db646b1326f98e8ad4e67 | ORPH
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/4a85e983b8535d0f5b811dd69015751dfeeea26d |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/01b27e94a0d9a4f4edc8e94a822d2c2eca5f9f17 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/34f0f32e215ba0dae6732d638e5e2338a32bd26b |     
       nios2 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/fd0af3f062195b49b3264b86c9145f52af96f565 |     
  aarch64_be |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ecd27a7bcc53a584ca1680215dc27885b180f437 |     
        m68k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/f20ecb7fc1d2bd5a28e55e73ab21d3fc8d1b244a |     
        m68k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/68ab46840a1e4a86465f476ff3d982aa7de1b075 |     
         sh4 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/3585513ecc40aea2af3cb3503d06148cb2927f33 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/a0dd35fc431a6a8581366a500b5e647f1b766c94 |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/8fb63f627a4ba55afea49ad0566064d20021889a |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/9e4428edb89afd9ca44222804d6ac47e62f5be62 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/8be8196429a5ecf95faf22817edcf2deca688d9b | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1c16c2c60465457c1d201c449d9b2da17c50daa3 | ORPH
         arc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/47ebb45bc8fb96dae1ed9e7e005e32ec103803b2 |     
        mips |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/78347e5394472d170ecc7c943a37c011a7843c5d |     
       sparc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/4d2244b5f42b20fd934bcd5a640d183c62a18fd8 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/f1d6affe7e6b4cc7fd3f297ed4b324ae0316502c |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/0acdbd834504d1319ee7d79464803ae856c456fb |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/fdac37d833b38aef9a8ebb6870e80e9090b7c9a1 | ORPH
      xtensa | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/12cb85a8b090013ace05f5e84664be2226531f77 |     
    mips64el | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/0e292a140d2398081b78684b506e633c1b1b48a4 |     
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/42af6aa23f894b88bfff8d2f2f3087a3523a1d1b | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/07909188589dcf1487af0cfc9749e91a55f78711 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4d728b1047fd2d109a0cb24884869c9db1332867 | ORPH
      x86_64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e3a17a26b9b631cfdb53a876df265b8097881a04 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/32e30607567a5bc7f031bf675e5a3e48c23b2b96 | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/382f2afd9d80560afed3b31e15f480e064ec5395 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a981c4434ec3dfd9a8b517bb9ff1a1f094dba294 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f10dab19ee030143786f62dedb67bd34f6cee2ba | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e776c7335fd0b9686bbfed1f9744a60806701ae1 | ORPH
        i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/66f55a311dcf9d54ca6148b232287973ba226999 |     
        i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/a4759e8cea09a597dbeb82f6c673ddc531d419e8 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/bc33833aaaf776e55bd224b7a6c5a7f077b26204 |     
         arc |        qt5serialbus-legal-info | NOK | http://autobuild.buildroot.net/results/c0938774d8bf84c2d827a5c3b19c60fa2154e90f |     
         arm |       qt5serialport-legal-info | NOK | http://autobuild.buildroot.net/results/a07f6697332357b889741c791298b2ee3495f670 |     
    mips64el |                 sedutil-1.15.1 | NOK | http://autobuild.buildroot.net/results/e89d80ce079c803179d277ae3a31bd1d8abfbb5c |     
       nios2 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/957dd705aa21e52f72322d43c3f8df5dac10f2ee |     
microblazeel |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/d56fb1dbfa7bce16f1ed795266ebf96c63440e1b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/74949a9936e253bcad5213bb77da7453098f558e |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/bdd080a877ef4e6216a4f9d90cd0d66a4433861f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f57add1645a80bfa494e3c032b5d863a27728f62 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/40a39e227e320705afe3031203c6c956048dd4cb |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d4bbff34e174d8909a9458b75d3ca9afc064d385 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/46c6713daaf2f00baf12bb4def901010a3b05438 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/41e5fe8eea17e4bb5872742d1a84ec08df69d764 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/997a5585c51f1ec5de0ac130e71f8ccdbd042f16 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/741061ff8768e6d8d123f7446bae97d2ed86711e |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5b1edde8bbc18145a0e303e3b8fb59a7ee160316 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2751b3d0545d2606ef4e0929c5965cde7284cf2e |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/afa9f4e1a0abd0c134287155bfd8aebff0be8b81 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/1cb98e2422c74b119ae70b2777ad6aebaaabdb2f |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/6047d57ccef8a2469a0374ef53e12722e3e34a64 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8cb6f9b3769cbba04917b17d5bdcd4b124e9a5ec |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/89f84918e59d74e72fc06a049168cb0874af5bd9 |     
      x86_64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/5bc365ac3beca49f55236d0a9c937bddb70d37dc |     
         arm |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/d55c2edc52c57cd9e823a50b0694325a315166a0 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/344a552bb3834ef4a436f5f537383a2d106b5a78 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7bdd8701161ccc218fe31e98c97b318ebee09a83 |     
        m68k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/85d90c280527e8b4715d36a269ed104e4e594c06 |     


-- 
http://autobuild.buildroot.net
