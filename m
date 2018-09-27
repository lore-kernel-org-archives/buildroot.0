From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Sep 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-26
Message-ID: <20180927060025.CA7D32073D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   2 |   0 |  28 |
   2018.05.x |  26 |   5 |   0 |  31 |
      master | 190 |  93 |   1 | 284 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-cramfs-1.1 | 1 
       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

     aarch64 |                host-cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/8c5997017568f8be1d2f664998fb2fdc433a51d3 |     
      x86_64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/9ec7f8bb96899dd0070ea0f3af7cbce87a7c5a84 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 4 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

    mips64el |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/5a83e12bcbb10d42c14943294b2d6cc8400fd46f | ORPH
microblazeel |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/f92fd090aa0c3b21ed7164599b87d27d070ef7dd | ORPH
      xtensa |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/2159a62fcc322fb013cea6d31a1fad95743f3e6c | ORPH
     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/5347ccd9c9ad56b982f73c7b84ba8fdb580b8f75 | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/e6d0195cd46e4c33f442f4936dab0386f1809ca5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 28
 Makefile:709: target-finalize | 11
              ptpd2-ptpd-2.3.1 | 7 
                  boost-1.68.0 | 4 
              e2fsprogs-1.44.4 | 4 
                blktrace-1.2.0 | 3 
                    brltty-5.6 | 2 
               findutils-4.6.0 | 2 
              glibc-legal-info | 2 
                libmpeg2-0.5.1 | 2 
                 lvm2-2.02.180 | 2 
                   netsnmp-5.8 | 2 
                  samba4-4.9.0 | 2 
                  screen-4.6.2 | 2 
                beecrypt-4.2.1 | 1 
                   botan-2.7.0 | 1 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
                host-libsodium | 1 
             irqbalance-v1.4.0 | 1 
                libselinux-2.7 | 1 
                   luvi-v2.8.0 | 1 
                  mender-1.4.0 | 1 
mjpg-streamer-bbf32fddfd02a... | 1 
                    ncmpc-0.31 | 1 
package/glibc/glibc.mk:143:... | 1 
                poppler-0.59.0 | 1 
                   qemu-2.12.0 | 1 
                qt5base-5.11.1 | 1 
                sqlite-3250100 | 1 
                     squid-4.2 | 1 
          synergy-v2.0.12-beta | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7fb66f6a334219c030bbd2be1976264ad1a0c2b9 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/bdc6cf6fa5208d7e768b7708b5989bf39bec6402 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/13f4d1a4d209b8faacbe8a0b93d75d4b5043b9b8 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/dabb41156ed4a85e2829049422f326916ab4cce0 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/fa913dcbd818c297964fbec6e7a0dac0cd3f9d6c |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a746680ac2b4d5a2b5388631acc58753942e149a |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/5727e27be7e1270c185c2e63ca394db373114fea |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/8ff589e8b124e5fc9a505d438e880b390bd32d6c |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/f32700a3b55c9972a6de672950c6b92b4a96defb |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/8fc199bca508fb6b0820092cc9c4079682134a19 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/bcdf1b4e6619c8d8031a341e89cb73330b1bd9ff |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/d4d229fb84d6a54ad733a853f3746d656ec9316e |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/128fd1506b597e216d078631efc5abdc37d7822d |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/a41f70161d2d04b191224f39ce6f7975321ff5cf |     
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/936bf07bc7804fe7d6826abb9dec4a7c1233ea50 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/b536006a2a3d84b4541ce10c4d6c9f9859b3659b | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/3de127e7eea9c48b98338c2abf5bf8a62d2b65ce | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/36462d9f4016523df41dd9d379019bad14ab0a84 | ORPH
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/c390bc11a9dab3d04afa7c947f66e44a5d4668d3 | ORPH
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/8d35a7e2b9f65648872488a9c57abc0a85cde647 | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a89157c901e81db6e143ff3010fa5992a91c5647 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/0108fe0ec207882926c38e215d702155538fd394 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/1aaf43b0cbf923e48cb64bbbd88d4fb881b43c43 | ORPH
        or1k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c471a727dd7ce99603e52cc1a898dc3ed8e32f6d |     
         arm |              irqbalance-v1.4.0 | NOK | http://autobuild.buildroot.net/results/227543e9760dedeeb4360de49e09baebed98f894 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/52afdcad0ab091475ec93b0da6e7626034eb3883 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/fc6d0ab1453fbc8648c2b259233403e5469affbf | ORPH
    mips64el |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8f5564ec85c7efd9cd81bd1f87620a411fdafbe8 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/8261ace6b509a2734f6f69bdcc452e0b20dd6b2c |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/d7a59ff3ff1930d099001e12492e5b1d0706a52f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/183692721065197cd2088ec60bc0320b1efd3c4a | ORPH
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/395332c6d8fecfe82eb682dd7c780b30a9ee8491 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/c53538a2c64a6f32ce9502209b813473e03868b3 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/bc48623255c84fff418a9eba63ef78b811846e73 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/74df858bcf22382d932a7afe32d29868b1cc7df6 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/31db5fd90514906a8c77f921c9650a386ec80101 |     
  aarch64_be |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/538040c35d78c6518674cc790fd5d883500aff29 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/7043ccfac86439406480649b3ead4882112d36e2 |     
        i686 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/422db61ce417b8b20049514ecddcf61bce44eefe |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/747a700f9c43533c0909c5f5d7d4347eab4a9457 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/bd586242dce89e4cd3b6da68258faa50716faeea |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/92a8b403572c7bb73130bc7187f109086ca7c7b5 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/7a2b7f6566f2dccb1e56035f0c21750566545780 |     
         arm | mjpg-streamer-bbf32fddfd02a... | NOK | http://autobuild.buildroot.net/results/4c8aac898d4580ed0b8b52cef7779d0f6f6a631f |     
         arm |                     ncmpc-0.31 | NOK | http://autobuild.buildroot.net/results/e3b1b1bdad841c151b70294d517dc75c5305b0fe |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/41b1744fce866125e86e96874b1f465b7086b6fe | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/dbd40f75e238ab6aa1389b0ed4c5d90f9c6be82e | ORPH
         arc | package/glibc/glibc.mk:143:... | NOK | http://autobuild.buildroot.net/results/7835b0497e41bce2c60a05001ecf3a7bf096f1b8 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/b39c5b14bec8513118510748d75ecef8e46c3410 |     
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/560ec7b2f0fcea34225ba668ba17637e5ac2dbac | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cf5b88befff971e267dfbeace8ae9536b8d29d5c | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5980463bac5461823e6621957457579832f59e2f | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7bbbec114f5060a4c39aa52a9eee3424f108bdb9 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/364cb2ca5164117616e32848590c52b638eaefd4 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b60d2f3934e606ad01737ec66903339673cb2035 | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/13cdeb21f37adfc042a1e23035871982ed6a543c | ORPH
         arm |                    qemu-2.12.0 | NOK | http://autobuild.buildroot.net/results/dbdcdba028b2821a1ec3ea6348042acdffae0404 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/cb334030fef82a683429c7aefd1904c064526250 |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/37ae7b59d29bf662de998f5cb4a77a36526967a4 |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/24a79ccd38d6219ba93e3911a703c618588f604e |     
  aarch64_be |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/640082b0a7d809d71fa5ef91a58774a5491b3e8d | ORPH
       sparc |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/434b77ef2b07af1624bb73bd17efc31a0af9730c | ORPH
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/276f2791095ff66012c3f52a147cb461700408d2 |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/6893b9de7dfc2244edba2ceed86b671c8734d99e | ORPH
     sparc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/b6c134e7dd58ac46a2fb8517d5b3c20b360a70d9 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/10ad1216f586ecdd791be7c564e026625ccc520f |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/b9f4a539b8998ebd89f8654c6f93415e2781413f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/38f27ddced13d020ec1c6b961aa5fc905aca2749 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/11a82e3c057c89d99ee6d8cfcc7a476b709b9110 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/3680304395a1907abee7509898655a79d7f740cc |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c1c00dedb8438ffd7e36ce0329f46163c9da9060 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/98f3d044a4e1cca00d89b891e609b6c9a44aa41d |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/59d4743973b8d58b8a8f31c3ba427186435534bd |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/bb9975b1c99e99ed00ca73ad54c535f4a20e359c |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6eb3e3ed705d4f3e622df5569a490f76c58ff948 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4b139d99a57c1c4b7598d8586e504a0bc381f12d |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/990cf9cefaced9d4848abd212c38e28b004c990e |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/10d4759af52a14c391d045989149c588c0691504 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/09141f1e294871f1c28e67e474e6e79145785bd8 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/12d1e07d166526c3d17c220ec5f0069b3a069176 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/a63c949bcb778496a17c4bf271df19ba366cc888 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/13880f0f7bff55633fd2b39601a0fce7ca91a351 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a1e4e6e4151bc74a4a100894d3f4ebee2a3d73a3 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1870e4076dbf14be3a063675a59ad32db6dc8566 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/614fd81f3d1451af8b58d4ad6363e12db799aa9f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e1f36e24055535a92ae6735a699d89f3731a6a4a |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/d57d3bf562cc3f4317e255252157118d0bbf768f |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/baac3c3ed6ead2c0add8cc97c81442d47d33bb03 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/367651859d884911e09c8c9ad1712b0bf7091ca1 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/81e1d2dcc458713b0915cb83d854e605ba48200b |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/299d8c68cd55141bfd23a3294d1a906faf6f4a6f |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/af0964988dd91f39b7364288748c52c98eea9b5a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/d0f14a20c9d90c96c2c20d488c71df9c470cde28 |     
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/2bcc58a879b5cb42f87f8bf0e3ce954edc61636a |     


-- 
http://autobuild.buildroot.net
