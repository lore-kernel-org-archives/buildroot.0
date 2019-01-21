From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jan 2019 08:00:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-20
Message-ID: <20190121070026.B750220748@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   1 |   0 |  24 |
   2018.11.x |  31 |   0 |   0 |  31 |
      master | 226 |  76 |   2 | 304 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/a02fc0b2dfdceb0e96702d1a38b72b4502002d34 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 23
zbar-b3b4e32b55f570372fc3af... | 7 
                  ffmpeg-3.4.5 | 5 
             host-grpc-v1.16.1 | 5 
   libtorrent-rasterbar-1.1.11 | 3 
             libva-utils-2.3.0 | 3 
                  libssh-0.8.6 | 2 
rtc-tools-33ef4aa1c92b0c92a... | 2 
                   strace-4.26 | 2 
                wavemon-v0.9.0 | 2 
                    cups-2.2.7 | 1 
               curlftpfs-0.9.2 | 1 
        glib-networking-2.58.0 | 1 
                 gnu-efi-3.0.9 | 1 
                     gpsd-3.18 | 1 
                host-libsodium | 1 
         libcpprestsdk-v2.10.8 | 1 
                  libftdi1-1.4 | 1 
                libkcapi-1.1.3 | 1 
               libsigrok-0.5.1 | 1 
                     lua-5.3.5 | 1 
                     lxc-3.1.0 | 1 
                   netsurf-3.8 | 1 
                       opencv3 | 1 
                     pcre-8.42 | 1 
                     php-7.3.1 | 1 
                 qt5base-5.6.3 | 1 
             qt5location-5.6.3 | 1 
          shairport-sync-3.2.1 | 1 
              sqlcipher-v3.2.0 | 1 
             stress-ng-0.09.47 | 1 
            sunxi-tools-v1.4.1 | 1 
                    tekui-1.12 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

       sparc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/f7a02322b1cdcc68a26a515d6239d948483efc71 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/c78750e05722de74ea32814d984403d33fe85d9b |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/474303b2ac854a8c17910459f43b2be8b12ee924 |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ccf33dc866741e89366d62329ca3f211b75516fc |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e424b8f1a86b3a62d200485a59ed2759c193143c |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f327ecd78d097611be7a2c105839eea3b9b2a607 |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/6f3c2ce3ce3471e7731019eb75de200e65a764e4 |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/f19d5bb534c14a0c78128ba2c239ff51aaf1c807 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb |     
     riscv32 |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/e1864c3c1047e90f42ecb9b8ff2fc5d56bb83b87 | ORPH
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e688371448894232f9259c65bb0f9ab57c2e98c7 |     
       nios2 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/8be436cbac47704d0f5ca89f4186c5c38154096a |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/0d95f77ede495b415e6d183c4d653eecd935a628 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b7d5633f5b46f5a807143eec9de582c8099d1390 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5b5a74c764317629a6e13375ca10d869cd3a1fbd |     
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9cf68b4b0bc7ce6dca4e754a192eea20a83fbb73 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/ffe5456ede715ae4d23fd1c0cb8c805e01057016 |     
     aarch64 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/ebda2a2da02d0002689dd240913bdd83eb4b1f65 |     
         arc |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/8355bc42238e885f7f11ed3d9d37fc55ebdead2b |     
     riscv32 |                libsigrok-0.5.1 | NOK | http://autobuild.buildroot.net/results/15af79eb9e4ba5e8d67ca600d46e02dada1260c3 |     
 powerpc64le |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/c68b5123f0b75640073a737897fe58e436c53d0f |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/1c31badcb013a7bb39a58bf4fe7bf7e9f94c3be6 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/44efbf05f08821270a9b670a2f902f92a4c32328 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/07e9e9eff42fd315889f6a66cc5639f30b062987 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/de195618edcca0d1e498179b7437c4934bd10c5b |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/644ccae2a29f4f26fca0736e3dac95421e1907b7 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/2b74dd4459085b361fee94d0d391a8a2d49e39c5 |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/5fa3e7fb8cd381b3ed1191f532acdc08482bacb9 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/dbf84ebe5a73412824c63a6352e8c91d0f00aae6 |     
       sparc |                      lxc-3.1.0 | NOK | http://autobuild.buildroot.net/results/1b2bafc551fb3f25aa5d072a144dbaab8884d84b |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/34ea0ae9f19516f012231c344430f7899a4ced05 |     
         sh4 |                        opencv3 | TIM | http://autobuild.buildroot.net/results/71859ed4d731ff99373c1d0d16c13e23769ac1c6 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/2f2829295bbc95bb08c9e0f1a3ca1df1df301588 | ORPH
      x86_64 |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/734b6f357afcbf3a5e1aef645c37b9fc4a93e470 | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/9ae3c8ce9b57355e87f404df7e8bb778509b76c7 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/1bc21b02b4976f496cd5c4fe484a67716b48afe7 |     
         arm | rtc-tools-33ef4aa1c92b0c92a... | NOK | http://autobuild.buildroot.net/results/57350271eff9284a8b07ceef02a9960f3568a0a3 |     
         arm | rtc-tools-33ef4aa1c92b0c92a... | NOK | http://autobuild.buildroot.net/results/b6cf05deab77c7a84c721c95d9d618b1ddc2957e |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/90dda738aaf3a4cd1682cd0febecaa06fa58415b |     
        i686 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/ae6f993b36ad19e54e2264f5fc5739ac67cb7904 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/af14ad42d1ab7cc031f05030c389100c1b0a04b5 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/c004461cbf228076039d754166d15439947d87ea |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/fd8d19d44aacbb028c22150e0ce57e2a3dc43da9 |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/b89b262635ddf7ae08c4f15a0947eb9c1aba31ae | ORPH
         sh4 |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/0732568fcbaa6829154fa91c352b52f074384df0 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/678cd67fc6da8990d99b87a9a83ddafeadb05756 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/1aeafe832e824483d6881dfd5680619ef186336b |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/3fdc3b19c1f575ed3009a3c071ea21878e4b796b |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/dba10dc1342a882d28c0bbd8c72fe8ea1fd101a6 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/1f4b849c3e8d95c5b4b1e9542d7fef6ae0adf4a6 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/aff211bb59e557da96fa520ef44e70972c3348b3 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/aa734318b9ad318d25e772585c8794429cc0f489 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/275287b0b7f9ee694a3c484fd10c937ef1268bd0 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/32890b9e1f88346d432c222f06a9e59c200c0f22 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/c24525a525310cb2c08d49a0e6a6b5c6ce79a01e |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/147b1cc5da15e7135148c30b30e920ede82ebdf4 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ff932a0e366b6d9637a61b3ab2f0b99d28156b5b |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9fbcadbd5b03b5857b1964e54b8d12c1742d5d63 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/dddca5713ff6992b5fced53f17e43afbec063561 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b591744c97c96d645e9c11fda02db0b903c429c6 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/3b91b2cc517354c5d6dfbea91416ffa171152135 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/088b92ac2278f598299e6569d517129e69392ad8 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/490568ed11c37b7bf5018559a6b6c720dd8d32b6 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/6641bba6256649908bf453e0b2519b2c405ee107 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/86f402a830742b64f30af1c81b2202fad5bec298 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/66685894273cd17f5ecf00fb684692d38184de9d |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/703ccf95af59c9cba2412eeb4111b7cfd7f2ed7c |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/cc12bade4062fe35a93e722d2e075ca9a1f1ee7a |     
         arm |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/ea62c89e7c295091603445dd8c155a3e2dfc91ae |     
         arm |                 wavemon-v0.9.0 | NOK | http://autobuild.buildroot.net/results/ae54441c65fe9a1bdcf743aa7f6a208e5545ca29 |     
         arm |                 wavemon-v0.9.0 | NOK | http://autobuild.buildroot.net/results/40fd66e6a351a1acd537ade715ab3e993eddb1c1 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/307914b81663ea11a37b0a92e3a8b625442b8ff0 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/bf8357bd5787a0e0926b24b1f86b80592637742a |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/9212fd35e5acf27be4671ee6a493bf447de15c66 |     
      x86_64 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/a560e615b2f77cffdb81393120a5ae468aa4d37f |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/04508c9d1392884f1aca71c54b1592f9ecae6756 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/58d7d81bc3347c4b605c7d068b683fc6ed0c3c2e |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/eaaeca313e5e5d47330dc15821c51865e4f4dd77 |     


-- 
http://autobuild.buildroot.net
