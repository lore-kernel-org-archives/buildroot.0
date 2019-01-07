From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 Jan 2019 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-06
Message-ID: <20190107070018.E24E0209CB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   1 |   0 |  21 |
   2018.11.x |  37 |   5 |   0 |  42 |
      master | 222 |  87 |   5 | 314 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                pangomm-2.40.1 | 1 


Detail of failures
------------------

        i686 |                 pangomm-2.40.1 | NOK | http://autobuild.buildroot.net/results/ee628b5c02a23232e923e5b6318f68e98c34a9dc |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-go-1.11.4 | 1 
                 ibrdtnd-1.0.1 | 1 
                  libftdi1-1.4 | 1 
                mongodb-r3.3.4 | 1 
              webkitgtk-2.22.5 | 1 


Detail of failures
------------------

      x86_64 |                 host-go-1.11.4 | NOK | http://autobuild.buildroot.net/results/519b55769e5e3f2a144d68f65b118bd16478081d |     
 powerpc64le |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/45b7818992f8dae2c06e2b46886fcfd013dcb99d | ORPH
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/7c669ea50208155cfbb2956ef71fd753284d52de |     
      x86_64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/c849e80335283f05501a37911d03728c4a39c8a6 |     
         arm |               webkitgtk-2.22.5 | NOK | http://autobuild.buildroot.net/results/92f317093da6faf0c4e98674f4f7a1654cd16f93 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 30
        glib-networking-2.56.1 | 10
                 dmalloc-5.5.2 | 5 
                  libssh-0.8.6 | 5 
             host-grpc-v1.16.1 | 4 
         libcpprestsdk-v2.10.8 | 4 
odhcp6c-7533a6243dc3ac5a747... | 3 
                  grpc-v1.16.1 | 2 
                host-libsodium | 2 
           php-memcached-3.0.3 | 2 
                php-ssh2-1.1.2 | 2 
                wolfssl-3.15.5 | 2 
                  boost-1.68.0 | 1 
                  brotli-1.0.7 | 1 
                  exempi-2.4.5 | 1 
                  ffmpeg-3.4.5 | 1 
              freeswitch-1.8.2 | 1 
                 glibmm-2.56.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
              host-cmake-3.8.2 | 1 
                        jasper | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                   netsurf-3.8 | 1 
                          opus | 1 
                     pcre-8.42 | 1 
                php-yaml-2.0.2 | 1 
                 php-zmq-1.1.3 | 1 
                    postgresql | 1 
                qt5base-5.11.3 | 1 
                   strace-4.25 | 1 
             stress-ng-0.09.47 | 1 
                supertux-0.6.0 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

         arc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/2305c14b2e941fa2ed21e22bc25e231910c713ee |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/f3a68e2cce8b3701d6155349eb1360d709b91ee1 |     
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/4d05ff37b7e2ea335c45a4d3e68a72519342d5ad | ORPH
  aarch64_be |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/93e7c9dae64806e93b627e06f7041bbca8124db1 | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/1bb05db8b5fd468e9295cfd3d683cccfffd27cdd | ORPH
        i686 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9e66b54195886b793c16b39db1963c8a2fbd30ee | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/99d67ccf74db98a767199f8d713e05f412d46d09 | ORPH
         arm |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/96bf4f0ddd88233b9604056d83bb3d7ea97d2046 |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a3feefa4c2fb816fed2937a51d32fe35191154ee |     
      x86_64 |               freeswitch-1.8.2 | NOK | http://autobuild.buildroot.net/results/fe57cf23f2b71a6f4343a40774017b02c6f53a53 |     
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c77ba1b4c90e462ec7d8475a26bcc1c496952c4e |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/69bd071a0ffbc9ca890b9dd3ccb8c286678af3a1 |     
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/b58d03b5f4f0c96ae13910fddb7c5de3392fc00c |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7835689f507bbec6b98d02bfa55411fd48b03b92 |     
        or1k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/56d53d7cd436ec70e1d56979582362c58ca7a0b9 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a6c9f32e75b27f586b5483ea261d6dd8795f24a7 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/755d86ffc80ddb12445c391f81cdc1e44702b2c9 |     
   powerpc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/d017d35b0f2a9c6026fcac51db67e16bbe936a4f |     
        m68k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/2e0dcddf19948f2ddcd66771a0ed090cd501ea4e |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a2843dfdad053fac16bc417f0e19c307c93b3387 |     
         arm |                  glibmm-2.56.0 | NOK | http://autobuild.buildroot.net/results/ede214a50408bcbf3878923748809b94c2601b14 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5ebe44eae1c4ee6d6539e38149cdc3c18b497fee |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9a08ca2d9fc064df5749b734ec40d552caa822d6 |     
        m68k |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/fd2b4fe197719c4b09ea3057d9cb39c4103ea0f1 | ORPH
         arc |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/8b78c292544c0cf0e598fb1b87f9074af7755166 |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d9e42927fdc213781ab3696be13bbcf20c2a7e15 |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/eee25c425eb1e476a5c81adab091700841dfa83a |     
      xtensa |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a5ba85e0fec9b5338f5eb9ccd30d6ac1a1d6ae44 |     
   powerpc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/67771366cf2642cac9f4723c0828d250e25df520 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c3078cee3f213c4d051fef0aeeb6179d26814ba9 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1db448f499f967a5e11ba8aec2008cc79258ce80 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/28c99429dc5674b36451b16fb808524fa18125a3 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/565aea3cedcbb162d413fc906b8b7a8e357c189a |     
      x86_64 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/893bc731cd6b1e69bebca119889ef67dbf25db7e |     
      x86_64 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/609d00248c87e640c38878823269296b3df7b09d |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/d3a2f1b3f328f035c2bef8375e11f27e4d712c7e |     
        i586 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/af852e20f4cb9e3f50240a06090809162dde97f8 |     
      mipsel |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/c32f9648d9e8427971582df7084733eed6ab04d1 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/3c3c90ddd7a52a5869281af00628c17be0902522 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4a78d03d885b0be8e9031d27884bdef5dbd59360 |     
   powerpc64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/2281dc4c93155101147a0795c32938a7be703275 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/4e3c538de0d96772593834b20de24563bce87fc2 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3d55580900fb60eb2365c4163404483af80ab9a7 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/8c4dfe7e72f5c26f9db115908e61d33454e5766a |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/f99f45f7135aebc2a0c3b627e514c43b0d7af2cf |     
     aarch64 | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/b62d32f27db376fded75f8f8f479abfd9c87eb70 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/7b1afe72c4348545f5e34d9124d68c7936b14f2c |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/21d235cde148fdf9656d4834176167e407d2c66a | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9fef81fcef25ac14ae0be50b07512ff2ea692347 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f12d10522843e4773ff95382b67a5e28372a8d60 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/36851c6d7d5d0331b43dfa5aa67815e2f0d9a42f | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9b3a8090a3a872a9cf0b3db47a63db6573ad42bc | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5d8bdb96ad2ec556799470a568e6c97b727d4ae3 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e156de3bbcd9f0cf7015dc5576993856266823ec | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9331f25fa5b52befeba5ac1c2efd4c76090d58c5 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/86dff4ef2b9bd8a93609669cb17fdef0557fe084 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3b2983fc20053d6953688411541604d75161eec8 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8bd1260a0d4819996411d914bdd4f9133e975d2f | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/272526d4c7dd1e1791c5d4cf63a91b2d33849e33 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ce78baba310105584f95f18802742e086aa6cbcc | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c53de80c59f8eb03550b8b2290fb81de0a38bab9 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f2961ba14fb29750cfc8f3c085eff50138a1cd7b | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3d15d4e188108e9c95d243a8a04b5a9b331884fe | ORPH
         sh4 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/09b277ccefec7ed30c0ee2d4088909ccf79fa1ae | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c62bdb79e540610506956f69c5e3f1cc5f8495a9 | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b9d8a3f3a52bb2fb6892ce61560ef75c28d412f3 | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3dd93c2bacff52fd9ad24f3dfe436131a08f6524 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/856d35d8354f91a3a044597641d29f4d2d1e5bc4 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/05f110eada650b5c03caf7a743f4c14fdafadbff | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/94c64d27461e6b13d60dd8f00d8e0b06b905243f | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/adb3002ff394dacec7c3d517831c8627a0d27f0f | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f48977313df0f98dc0e4bc78317cd0821bbdfda5 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3c6d042dc1f56f628d236b6f6bcb66fdfa22ffec | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/354d1188fcbf0c9d4d7a598132be4ad8f1452824 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/295205a0cf2ec6e786232713c894a8e37c06c2f3 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f52a023a27dbe7a6c5519094d9380ab90afcb601 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/57e4fb2b31524d873e52a59c987cf4bee11620bb | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1819808812dffb607bff6de609273b108648ff4c | ORPH
     powerpc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/bd084aa8502d8a2bcb249fd0526b2aa85c59df4a | ORPH
       sparc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/a835cde13857aab3857f3a5f03c55ab0f55df3e1 | ORPH
     aarch64 |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/38f8d3a57d835382082cc1bd5a79a5cea9c5cbe8 | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/e3b2a72e1f7f776c30a52bb98bb47c04d0b4919b | ORPH
         arm |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/f0d8b1f10c867d720ff6489cff2257206cad0790 | ORPH
        mips |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/b368897c24c56a702f094257efb03829d4106eec | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/a18ef3c1df617fd5ddfeced837cb87d27154c1f6 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/892909748f35c9026801ce38e9019661604141f9 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/c8aac10119d1278480082470cc8ecb1e95e8ecc2 |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/33a154cff778761ce917f64fe4abfe6775822d26 |     
        mips |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/d9ce409a42ceb88fa335c21c42efb14d2c8668b0 |     
microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/82d0fa29f300f9d478d692e4aa74e61e0fbcb479 |     
    mips64el |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/bb34c4737bbb20ad859a15eedc8c9f4e34b7d35f |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/8cdc5b41577f78f7f51a9dd26a16b4ce8df62176 |     


-- 
http://autobuild.buildroot.net
