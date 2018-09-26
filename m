From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Sep 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-25
Message-ID: <20180926060017.55CE12089C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
   2018.05.x |  25 |   2 |   0 |  27 |
      master | 198 |  82 |   0 | 280 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

      x86_64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/4024f0bfa25447ec714f30888048b33b282c9e86 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 


Detail of failures
------------------

microblazeel |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/928726fc8b10c5a0982b2defa9980dbcc0f35d2f | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/e171f2a6ecb18eea7661c3ac05c6ecb98ffe4383 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 35
 Makefile:708: target-finalize | 8 
              ptpd2-ptpd-2.3.1 | 6 
              e2fsprogs-1.44.4 | 4 
                  boost-1.68.0 | 3 
                blktrace-1.2.0 | 2 
                    brltty-5.6 | 2 
                   dante-1.4.1 | 2 
                 lvm2-2.02.180 | 2 
                qt5base-5.11.1 | 2 
               boa-0.94.14rc21 | 1 
                    chrony-3.4 | 1 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
                 gadgetfs-test | 1 
                     gdb-8.1.1 | 1 
                   gvfs-1.30.3 | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.8.0 | 1 
                 mesa3d-18.2.0 | 1 
                    ncmpc-0.31 | 1 
                   netsnmp-5.8 | 1 
package/glibc/glibc.mk:134:... | 1 
                  samba4-4.9.0 | 1 
          synergy-v2.0.12-beta | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/3bce505f05d63e56e9262ccb3d7ccbc1ed4be45c | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/8bc911e883ba18d8ba9817f66e49d25852189d81 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/cf15fc5108e86ee68a6b26997872053e8401a7d1 | ORPH
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/cd334d875db76aa1c586b1e02c739f1253cf2bc9 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/16b943047ec6bcadba0a25bbc82a9c43f543421f |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/eee5401e76da2eb7b82ef42cfe7cab4fc76e1dee |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/ad944612bb1199c0a61071c68e92aa60fb3c2cf9 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/ce3c02ae19d419793ae70053c20c5a935c8403ed |     
         arm |                     chrony-3.4 | NOK | http://autobuild.buildroot.net/results/8f0d53b1d5a899e56540c859b908cbc1eaa223d5 |     
         sh4 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4d822ae3a0c31bbd8d7ff05f62daab3c1fabf3de |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/758a44dda05a633890d0adc1209be4717d8fe93e |     
        i586 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/96e18ddc7795470f3bf36a81f04d78b8376d18be |     
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/21a20afa0d90c6ed6e6970fb9d2db9f3b4d1d046 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/cbe98af93bbc40e2c846e9c618ccc0980433ba15 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/4685adf477670a2f045187e7c298edba723e610e | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/0df30a14f77ac1721bf91d68b84513f8f5f07b7e | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1897a74c3fe27f60f5152c8890c2dbe9c578c3eb |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/b10e41dbb588356ff4913bdc282728cd54527a9d |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/695066d5706ffbae4a62be759a51b75b683bd194 | ORPH
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/911115bfd7401b2cd5b2decf8bda8938258102b7 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/5072268013327d00792c95a91b9c4c2b412ca90d | ORPH
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/210b01e9f18028431cc3085cab2144aed2c88fbe |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1af58d5f1673cbc97a8d89a8f182360a149662e3 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0b3f5a3323f3a755e2516030b0f2d8776b7a4f59 | ORPH
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/a2a71f974959b98526f74fc0409c7baaa1d2d423 |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/89a9b0860bed34bfbe930da4deef292ebc735e88 |     
        or1k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/fede0f6978fcff28101297b00a6f74d778d7e21e |     
       sparc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/31c306c76c41d1913e2d3ab96ea8c275e2fc0297 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ebb7d5fc3ff1b22238c4e65aea13e4e8a78fd0d8 |     
        i686 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4d49eff2849d2fd5174e2a486ae947e6ad697da8 |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0147aff3c5a6251a65562e8526f0e826415342ba |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/187b4f336da8719226e4023eced44caee7317674 |     
        i686 |                  mesa3d-18.2.0 | NOK | http://autobuild.buildroot.net/results/dd0204efa319e5e57f529f6bd19e9a8ad9f24a13 |     
         arm |                     ncmpc-0.31 | NOK | http://autobuild.buildroot.net/results/ca70fcf544577918f3e5d27a95d0c18048281a68 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0be1096b87b738f57cc74d992595b018c2cd87e4 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/c02ca1b3dd40d4f6913d8018d7dee92d63ff24c8 |     
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d34d3c3b217e7318cf0013f07a2281aff733106d | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a030fc2a1cc741f7b4bbd1122f0fd5e794e9e712 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3aa0b244a85948ef58bf6eb5ad758c16f783ee2f | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b91c36f86cd50c972dff43a9b95f1712f48ec7cd | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/aced67362aef4ceaa00d2febac4842682b5d6bef | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e73ce08a37d67db7605e3c2dff222e954c857eec | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/5aedfd8c60f7ef380d739e251ea5d5e6ffff276f |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/ce60af8c3ce2a453375ee5a7b6585b06f86a3696 |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/57b90872e012856d285354ea8f1869fb9b46f4a8 |     
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/70e017d30f5164ef023ff262864e9cc692a32cc8 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d12bff7eff2a61d8cb0f4bf9cb23b2d85a3a5e64 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/b429dd4b3843c96a9dcd56bb5964746b023a89e5 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/05ab6340f0e26ea3eae8ebe3230a894dfd4f4d03 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/6e6b3136b5fa0bcd62b9c112b43b1499eb0b717b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/072bc74624103c68d7dc6a877754d7e44cb79164 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/43f2dcf4347c5a1d0844304ddfeaf4ea0f3b4920 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4b12bb337ef8b1cfca6007fcdc541a6d6cae5946 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/527726f05ef83448b7dad7e3bdfeecd9d472532c |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/441f01146adfb3344f11757a483633f2c452268f |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/698ca5b95c783cd7dfccbd03c461532c317a439b |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2b7c942e29ef184e3197974b5a26239763263d31 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/295080da42f9f01d158f99039b3e1d3ba1913834 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/80b9b1e7a7f6aabdc345041b1e2d4da8d6824ef2 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/74a42c2a04a332bd054432dc56cfac0fc5a89029 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c0df672635cde2e680bdd85643ba764cf109c970 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/6a7cfe60f419a0f50c6b9dcd37806cec98776717 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/6f2aa519ec65b4013cde187cab90036e191dfc34 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/da1aa2e02e73a8496e5100f5717e8b24b4c4a1e2 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/eefb39d5eb208217bd8f2dabe39cd11dc08f32e4 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/26b0a6d36f22159ad9217f57709f20d2970b1bad |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/55fbba9a8b5a20c847b205018f782d726db63b10 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/af324b50ffcb47895ad5a27e9ba093826e676ecc |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/aaedd01c0b82a5b5ed1ed83d0d7801539391b9e5 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0a340477571de37eb51a0fd1769ae47c1a5cc15f |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a9b23b0ef14d1079baf62713803fbd278ef96644 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/68f1de54f1f9809b3f82a36ea92334742a5dec23 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/fe9145743dc7d0c63eec6c33315c541d2f02bdb9 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/199248d47ca085d5db6f10937b6ab76509443166 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cec1f5692673e7d42c815de161cc88d72209f534 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/25fe1cedceceb43c4a51e232cfab0b1916047a2f |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/af9822f88fbc6c8dd28fc5d5d5e32dbecc833697 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/74c9ad7dd34d0af5bfd1524b579206c3bf025a4f |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b8ba114fca8042a56e405c47094f6203e03d517d |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f6eec537bdfe30e22b9236dbfecd4375ec97f58b |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/16ac97bb875572c69548321c4d505824245661a4 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/563f37691f9001fe73aee353de4f9d73a47a6cb8 |     


-- 
http://autobuild.buildroot.net
