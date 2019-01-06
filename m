From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  6 Jan 2019 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-05
Message-ID: <20190106070032.C29AC209CB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   0 |   0 |  37 |
   2018.11.x |  36 |   2 |   0 |  38 |
      master | 226 |  79 |   3 | 308 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              libostree-2018.9 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

     aarch64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/ceebcd18e10ee16c6f9f548f652fd9ddbaf8edb6 |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/dfc9f9e62de934f159da930ecb3ae2ca90576b3a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 30
   libtorrent-rasterbar-1.1.11 | 8 
         libcpprestsdk-v2.10.8 | 7 
        glib-networking-2.56.1 | 5 
                    atk-2.30.0 | 4 
                  libssh-0.8.6 | 4 
                  grpc-v1.16.1 | 2 
             host-grpc-v1.16.1 | 2 
                qt5base-5.11.3 | 2 
       shadowsocks-libev-3.2.3 | 2 
                 dmalloc-5.5.2 | 1 
                  exempi-2.4.5 | 1 
                host-libsodium | 1 
                     host-llvm | 1 
             keepalived-2.0.10 | 1 
                   netsurf-3.8 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                          opus | 1 
                     pcre-8.42 | 1 
           php-memcached-3.0.3 | 1 
                php-ssh2-1.1.2 | 1 
                   strace-4.25 | 1 
             stress-ng-0.09.47 | 1 
            sunxi-tools-v1.4.1 | 1 
                   systemd-240 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/dc3ba70510a0ccd610cf8077932d63ce027ac9c1 | ORPH
        or1k |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/0c7a3c3c3b1819f204d6d3de3c7a1d3b96f6b93f | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/7a80d6162c6c5f95a01f2ba381cad61eb65f307e | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/bc6778610a3147ee4ec8c492fb10ef905e23c1d0 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/faf494a0406a1bfee362d5231bc019f86b314da4 | ORPH
         arm |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/d92c8eb3004165033c22cc98b153cf547a352fd7 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/ca23b7004542e6d037215afb018e9e4998aee1dc |     
     riscv64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/69392738c719abc4e9c0c1a95f2db594a6c94f03 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/186f432776afa0b5f84c93b532925b36e3cd3e79 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/477673712c9258c4bcd8811af828eafb17ae1891 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/84e8d4b7d36564d7219bbe37bed837adb6b8c8d1 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/eb30b8d0ae1dac204274a8717a6aac5de6f929be |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a531e31001a03d58c724feb549233d6dc1d94a8b |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/cee773c9fccdd003f70f50caf2a22d9fedae578f |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ac750e71bab6e7ca17c94a990984c2017923f69c |     
       sparc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/eea2a055537863c32a48d3223dc04668f426547b |     
      x86_64 |                      host-llvm | TIM | http://autobuild.buildroot.net/results/8995f250527cacb28085b56b4e5b858c971d6d0b |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/c29da734932e467564d52a62a9984a8a521ec2d6 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/4c61d22df956c632b335cc552d05b0322cd83fb7 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/5e5b55e6b2298e03013506491ca554b60559841a |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/7e03c2347cf26692f3ae678c683683d4dd3be487 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/cc43330d8c481d25571776e92412428fe96af994 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/ea6355f69534b9dc12f6d604505b1c61e53db5f5 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/4ed0d883f26f1f48a36e04e05a61ea773b60cebf |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/b8a0ea1367fd867fda425fe7d28154337b6299e1 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/a97db6d5c72c88b084e54601ac1fa8cc6d8ecba3 |     
       nios2 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/6280d9d94f8e5f1ba3e96b93c19a63d40c1907ee |     
     sparc64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/19b692d6635c2b9342be2862df436b23a4e39298 |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9149d725cabfc2a340786d6ddad2c1e87c21396d |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/1bcb2f28bf21114ddb177467383b0c5444f5c302 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e0872a96e5d19512c2f1a6348ae528c915580840 |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b7654ffe41f02103bc3ef888f3ef03b8d5abf9bc |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/21f61801af8dc8708f680efd2e052a2b4a6c3e8b |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/12b9ccfd04e9b5ff1cc64ffac32460461ebecfb0 |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f1e5b9f1e2202388fdb2c5931c66e744b3a8c50f |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/71a6eca9c7e687f32c38819ad1f9b86ad79466dc |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e7f25cb2d188f598cb73cba11bf8896b8a0bf779 |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/26d97990eb3455bcad3d7c34d98dfca824c59e9a |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/dd3c0e95ef3b7db579dfadf060e98357a179aa20 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/47a694bf07b03031bda8113489d29ce9209b6664 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/0017be74f01d46a6011a0b664b5d2a9f0f3bbb2f | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a1d5a6d721a8f0e34182205a668270746f1b0f66 | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1c6011644e43a6eac680c86a0a5087fffdd332c3 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cae18a41d5417323c2e9605934b4f39b5031a441 | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2919a21253348dfa2dabc3521b2161bc687bcb32 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/bff232b71560aa063cc2a78200c4bb0c142bce95 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4d16793688c89ce0f0fc9f39d4d9ed00e50b4b30 | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/72b6a2fcfb2a75879f7673aee87b4b077773676f | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/528a37c1d3498f3fd956a815c5b57f1416d7cd2c | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7b1ac2146cd33d09946e0596ef1eb9a3439941f2 | ORPH
        mips |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b3b9cb6439396f082fa522ca2cd81ff94562f9df | ORPH
      mipsel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5ac7a8c76709335ea5a5ba1d219233051a1f0660 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b95875c1e84bdc96d96fc4913a2ef8d18b36217b | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ae2f19df547beadea241759fc0abbb7f3f62b557 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7f5bf5a4d56d38a239823967529d743bd2c44ee7 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f301268d6eec1a1221aeae6cb6822759a592a682 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/86c18591b9a0e4e61124dae65d93e1ec06bceab4 | ORPH
 powerpc64le |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/235a8aa9255027d63a892e3649f1faf611102db3 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/28f3c08844b0fddba9c78544fba3d544ea1a1efd | ORPH
        mips |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cd8ee4bf075cc64a43d079dcc2459ed076bbbaf5 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/17027975cb381d4288e9e83e8d2956feb60b9b2c | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8d5d11d8e38120429fb7b12417dcf744d6367621 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8ba659634e15f27c3c28b31f6a845cf938436b31 | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b0a3ba2d2c15fa24b32cc080b4b1542b9077596b | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/efb862bdd976f3d87e4015e6f1b26a1f1b3437fb | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f8757cba99082a403b8774544aff6c3a0e2e1f9e | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d186385154c50bdfce3b47472b83a6e70787518f | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ab649d3aa4ca23bd015dcf4de89d2d3c0440dcf8 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cbf46178a3b129e28024245387f7bbe5f526278d | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/73396f689c0c5f18034f4dc1b3be8d3a1a2f8e0c | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/22d1f6182015cb32c762ce17e17334cad9cb33d9 | ORPH
         arc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/4902a60223c7e95910682315e02bafcce41bb346 | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/406c93458d880f9c02d4689d55e4a67f5bde4aaa | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/062388a5bd5f8d5c172ded34347bd2b2e32800bf |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/687922ba8ca10eb20949060ad359d713f16e2105 |     
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/c8c93702bcf2c3d07e47da935f3e3f2b060c8665 |     
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/b5f62f91b2bbc2e52dcd70f933d4a8a72d290ff4 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/7b2736db90a8ae500a81d4eaf6fc8f319276106e |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/24171b44b73deffcb889f2656280ca08439cc537 |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/8f0232de5c4bb32b295a52799a86a6b279dcd383 | ORPH
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/ebcb80b202da3ed3f35b179be914662407c6041e |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/b7b8a6319c7211431117388329071e1dc0e9f18b |     


-- 
http://autobuild.buildroot.net
