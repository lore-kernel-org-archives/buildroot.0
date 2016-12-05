From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Dec 2016 08:30:00 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-04
Message-ID: <20161205073000.5E3E921D23@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-04
================================

      successes : 182
       failures : 107
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.5.0 | 16
        lttng-babeltrace-1.5.0 | 15
             gstreamer1-1.10.2 | 9 
                     efivar-30 | 8 
uhttpd-59e0c739634f46a164d9... | 7 
            lttng-libust-2.9.0 | 6 
ustream-ssl-ec80adaa1b47f28... | 6 
              lsqlite3-0.9.4-2 | 5 
uclibc-ng-test-4ad1c23ae2eb... | 3 
             berkeleydb-5.3.28 | 2 
                   cmake-3.7.1 | 2 
                    cups-2.1.4 | 2 
             libxmlrpc-1.39.11 | 2 
                    rpm-4.13.0 | 2 
                bind-9.11.0-P1 | 1 
          chocolate-doom-2.2.1 | 1 
                collectd-5.5.2 | 1 
                   erlang-18.3 | 1 
                    fltk-1.3.3 | 1 
glmark2-fa71af2dfab711fac87... | 1 
               host-ruby-2.3.3 | 1 
                ipmiutil-2.9.9 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
                 libdrm-2.4.74 | 1 
                  libvpx-1.6.0 | 1 
             lttng-tools-2.9.0 | 1 
                 mpg123-1.23.8 | 1 
                    mpv-0.20.0 | 1 
                 opencv-2.4.13 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
               wireshark-2.2.2 | 1 
xdriver_xf86-video-vmware-1... | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a8890b02ab473091f5cc2befaea1828abdc8fcb6
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3563c5a4e61eae9c1829b87968845b1bf597eae1
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/a2cece6dfc3f6f2eb7a834baf6f3de20fc52796c
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/9248a34764ad546fb47e4091d6db28fbbdc66185
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2ad6c001a714ea74a1c94dd742d9b1587b1eebd4
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b3c04bda253854f715cd73fb1362f9042ef8b968
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/da544a9dae1e2685e1a7d06460d443674ea4ba01
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/867077dc772c40c0a7e3abeaa8330c90391e74b8
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/8b5623eb1b2da7bf3d7f645bc55343b9f5d3c7b9
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/adab3e9c4148c8a9336bb2e14f85534d2d07840d
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/85f9732e2affe9535a47bda81790abff9b028060
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/acdcf44c6f465fc8f001970510597c974835ba26
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/544beb441ca7a4d6ee3bdf1673a0b738e42a135b
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/bac67ec83ad6312bb1ba5178cfc241d57e0e16bb
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/f4c82b277d4d834a48e3546266605a2121e54344
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/5dae0835b6114fe901c0dd210fbe766992c75208
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/76f620ff1fd5706cf755dc0ada6e2dd8c2f9f06e
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/cba60679fa916128796a7b4131ed50403bc74798
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/3373d07edbd27b38eb7515c7faf272a10b62c941
         arc | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/bddae1bb6a7c7d341a1485e769df571b690efa30
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/552d8040a4291e73e3becd1f5095003d7cc0ee2f
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/c172bc6a3a7e9db9e5d9918eb37347098007e917
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/8dcbf00a5122677f750e9fc9ee8209aea6ed7d7b
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/243eeccbe14fcaf816a612649ee9af1b846d67d2
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/251cf9d2447771813fccc2f1e8faf5a6835d48d4
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/70cd1df8816cc5bdff410091507cc2ac9049838c
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/5c99df5b0733d3d92edfc4b570a55630f63880b6
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/ec39cc9351c405414cc08e746aa96092116bfdef
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/6d8d772b361d0646cb0dde27d893c323e46f69fe
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/c6333004be9a8bc7195795111fae63e611632091
        i686 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/84086d465a9ca3e4156c052d186f5d06d2cd4b0a
      mipsel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/87fbeaa49f6069d82ceee63b0f8686a5cbdf2779
         sh4 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/c6c1b56060d410b49e5e8b5c303b693803fb3d39
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/f61715a41d1d4cd788971924b27c2707afad85ff
     sparc64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/7ef4f50710cee2e77424b8b4b56f863fdb58acff
microblazeel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/585f960eb81b0e15858aadc4aca516af23012b61
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/4894a5023512c26fe66fbd6fa44036835dc553a7
      xtensa |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/31e9a9f961651037db128651f5e811b145858e70
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/5cb7264e1dffb30cc953c3dd20fa092cea8646ec
     sparc64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/0c5ddd083328df5ae52fb83c7ebd4dfa3d029eba
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/6169a45214063efd3b19ec8f4c264955c5793c24
      mipsel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/4034df31644ad471ca49cbd4c6807af5aea31e27
    mips64el |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/819a03ecdbba0a4cf35398e8430ead2d9e7c0442
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/d200a8e5ad669dbd4c3a5246bddbca39b568caff
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/b529063aa35a2817454383d9bbe43739940bcf59
         arm |                host-ruby-2.3.3 | TIM | http://autobuild.buildroot.net/results/8202abb6953756a39b58ec2620c5461b66c5136b
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/d2395d5fc1711e73caac3c15293bcb7d3fc91c44
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d36ce7c6961d336fb6a499a84bc848e139c10add
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/52bc8baeb4decf25086a6bbbff89e52457028392
       sparc |                  libdrm-2.4.74 | NOK | http://autobuild.buildroot.net/results/d2a02f6dfebc4619de1bc689921880b4a0eeacb9
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/26e74d42ec216d6e0038718544a88f9d8a00997e
         arm |              libxmlrpc-1.39.11 | NOK | http://autobuild.buildroot.net/results/cbff6c816606a515467d467677763533a41fc276
         arm |              libxmlrpc-1.39.11 | NOK | http://autobuild.buildroot.net/results/72bf807d39b8320274c40f7afdea03887d2c5870
        mips |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/b7548d2e7c56cad81b36eacd8b3e1bdb8dff4ef7
         arc |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/deb3b383380a27cafc0c86e6830d2c4eb0f135b4
     powerpc |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/3efaac0351784ddfd153593943b6bfaf9e6bc025
     sparc64 |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/75d5c7a0514c58a17a17dde948da1e25c9d7e1e6
         arm |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/fb848889e16c8b15648586867200560e87f645a8
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/9192649e837dd1f7fc39c970633244b04f630e42
   powerpc64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/10ae9b5a4cfe863a0de05fc05a126af0c5fe4b80
        i686 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/1f4a307a759003b5682e9191dbb7f5957bc3cb5a
     sparc64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/38601df44284a4941290b4e5a13608ae7aa45537
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/3b5254ff0d9fe425f59fac735c028fb2afe62e22
         sh4 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/1af530e10811528a10adaa6ef3788a72335cd119
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/a3062dbb6ca17e8845cafc1fddf93527aed7ff2c
     sparc64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/ff2865d9961421201d6e8c01344fb5713f53fd8d
     aarch64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/0992a631fbad11c4d72b81204946b959f908930c
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/ccbd94fd6ef783149c8628de38cbce9e36f13b69
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/a35b716d79ac2fb254460456274fec8b0dd6a0de
      xtensa |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/4f0cec9e9f72fa9ca5539c7819cbd920cf5a6e85
        sh4a |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/054df9aa3221294869212465743a7c7e53d52a78
     aarch64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/b0599ae3f243cebfc298beedb1aaebac0631c474
     powerpc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/676b2d127dbe0bedf89254d09023adbf71c5bca9
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/60b681159c4e052a104950bcc5aee09457ce9d0c
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/7828ac941f28691fa0024b5671b0bcfae13758ca
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/dd14259303e0cf1e561f67ec24428bacd15b42f4
     powerpc |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ea6cefde13efe648fd86400c402aa45571765c6f
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ee270db7605d63e725b18d163d90de3a7f6ca80f
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/e917552ea1069da74c4e392556914d05c010a250
      x86_64 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/d8745ef5c8c7d71f993edf2a8f3f107d2d1b35fc
 powerpc64le |                  mpg123-1.23.8 | NOK | http://autobuild.buildroot.net/results/7dc1642f3dd4755e7413881fb1f944b62012632b
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/87aa7c7f6caafa5dcc72a283de25c1ebf4e4f018
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/fcf36702855ccbfea7588bb8ca66e955ca5049c7
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/4f62166406582ddc3c35351045221f89fbcf95d0
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/cfbc15f7439b6cad70eb09d1abe8a8b23ef5619c
      mipsel |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/319191524302bd2ebde9543f6658990eafc4caa3
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/6bd50d97d7700bec3e782e7dd4fa3b95e6fca2cc
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/bc7cd5d9e839836845c0a0791296cb55e2a3b8cd
        sh4a | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/30dc8ebeabbcde61394e967ca8fcce42767294ac
        sh4a | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/d31c547c73079247ed7f2051f96a69f454e956a5
        i686 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/b2a4e1cb2114039b7fa663b98a2cef3b62cce961
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/b33236b3f83465ce344662ab5074769c8c834ec4
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/9718ad0f5efb271115133773c39af3381c718876
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/1109b8a5edcdf42c28bf2893b180416ba0d18def
     sparc64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/f23447bd343070387a198d0eeef183c087051280
     aarch64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/3b35b7322ede5425096dd322ce858b124f5dd2b6
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/004522faad4996771a0d39aacb53c452d08f5300
      x86_64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/fec20447743ad2dfd5d9452ba973cbf2dc30c722
     sparc64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/0d7a5e54de8998575958ec6aa5daecf83af8c9a2
      mipsel | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/ad2e9020c4ba3c713c85265036676d7962d7949f
    mips64el | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/9f1fbdf0f1209c4cb92554fcc088c51abd28a292
      x86_64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/998f0cd98e331be1f643a2f689fde274d074bc5d
     powerpc | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/2a327e98c5890eedcffff9b975bc1829294b6047
     aarch64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/9ffa28aaee0e761f4fe69940cc2b9e0eabe7c0b2
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/53e60ffdb43a8ea39f1dfd8e4341e9ac0dcffa31
        i586 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/aedef941cd63154c8fe567670cfc5e534111ef1b
      x86_64 | xdriver_xf86-video-vmware-1... | NOK | http://autobuild.buildroot.net/results/7b38105dd1115ac622964cf243ac137b7624fb43
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/0e0d4aa4a05da5804821951289c0a4049b009c61

-- 
http://autobuild.buildroot.net
