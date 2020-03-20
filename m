From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 07:25:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-19
Message-ID: <20200320072540.7317287447@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  2  |  0  | 17  |
  2019.11.x  | 14  |  4  |  0  | 18  |
  2020.02.x  |  8  |  9  |  0  | 17  |
    master   | 95  | 89  |  0  | 184 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 7 
psplash-fd33a9b3d68c89fa22f... | 7 
                   bearssl-0.6 | 6 
                  ffmpeg-4.2.2 | 5 
                libtirpc-1.2.5 | 4 
        perl-crypt-ssleay-0.72 | 4 
                  connman-1.38 | 3 
    host-python-markdown-3.2.1 | 3 
                libevdev-1.9.0 | 3 
              libostree-2019.6 | 3 
           mediastreamer-4.3.1 | 3 
package/syslog-ng/syslog-ng... | 3 
          syslog-ng-legal-info | 3 
                     avahi-0.8 | 2 
               belle-sip-4.3.1 | 2 
               erofs-utils-1.0 | 2 
           host-nodejs-12.16.1 | 2 
                   libnss-3.51 | 2 
                   mimic-1.1.0 | 2 
                  pango-1.44.6 | 2 
         python-markdown-3.2.1 | 2 
                 rocksdb-6.6.4 | 2 
                     vlc-3.0.8 | 2 
               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
                  botan-2.13.0 | 1 
                coreutils-8.32 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
              gupnp-av-0.12.11 | 1 
               libgtk2-2.24.32 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-20.0.0 | 1 
                openblas-0.3.8 | 1 
                oprofile-1.3.0 | 1 
                 powertop-2.11 | 1 
                qt5base-5.12.7 | 1 
                 raptor-2.0.15 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/3fa9fca53623abd6d0caa53a1b789c3575ba0a6f |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/58ff706c9409d6efd9c1292b6a652837c77085c0 |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/43ec20e404ec5bd62dda50671e1f9d3290688e18 | ORPH
  nds32le    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2747a0118b4320bc30a38a0d63d13f858626481f | ORPH
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e38f0dfa8d70a8385f0c9180f9197b905b142392 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/52224a85252008f10896732c546e26dde9dc2ac5 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/421de9e9dbb7935da38dcfe0f0c0ce82b9c462f7 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6ffd27ed3477c5118d10a4581379a4d97fee382f |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c1cceb11b67f9eadca78dfdbc70c3eb6cd2766a5 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d8a261af15b8aaeda269217c23f56b20a3c847a1 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/342b4ffc846f171854ed4412d1815b70a74fd0cf |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/90eb6cd0fe8c66a32c79079211ee9addcbbcb0cb |     
    m68k     |          botan-2.13.0          | NOK | http://autobuild.buildroot.net/results/3a41c33a796172aa9b066b4cbbc670e84e8575a3 | ORPH
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/04e1958111485fe639ae74e720463c19e532dd74 |     
  riscv64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/596a6ca338ce6f6448355d73540244f780dd3926 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/e2beafbf0543756cf736f316ff0e5e2090883c46 |     
   x86_64    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/a2f9a2ecdac56c5bce08f1991a9401de52113b48 | ORPH
    arm      |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/e6a01d641145b4550f4a31cfc8f8db816b331ed9 |     
    i586     |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/467d1f0c499108bc6f959ef93155dc4f6d96cc3d |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/caae95ed2d597a8920021cafe761fefca6bb6756 |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b493b38fb7143e275fe335cf0451d633a13936db |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f466ae4c53293f3062472185125724da08cb3a1a |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/4c9f2e621c5b6490c231a1a5ed3ed7316a9b96cd |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/dd1d1ac7044575fd0264c58f1206f7f5b4d5398e |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/d1a9c763ead903c71ed8ce1daf351a8db1bf7c8b |     
  aarch64    |        gupnp-av-0.12.11        | NOK | http://autobuild.buildroot.net/results/48254ba8e482ae8140da641e0d128903ce554612 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ad7ac940e6fd77707a53bd10fed51de01c64aee2 |     
    sh4      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/defb0f2acf81ea801de02daa4b4b955426709371 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/140a879c1328ccbdd91c55cbfaacef9581c9a32e |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f252785c29628c84e02a657f9e836d3f5eabeddd |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ba127969dc69e75ff3dc741bfe9c614b5503f58b |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/12514c73ff6310ed698481b735a268627b9cb9b7 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/23490bea9db6b0ebf9487de46f8fb759bbb2e598 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/55686bd2655c89f7c3900a1fa105b8ab1386f552 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c8b71bad1833d9164e72eef2f299782db280965d |     
    arc      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/193fedc33e39137fd75937c30c17fbd73b882ba3 |     
    i686     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/aa64e48da8f6c6ee0d43f914a67e81f37a8de6e0 |     
   nios2     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/fa08bfdcea8f2e8b9eed1416c8809bc1b4b3a2c6 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/7d2385e710b79d71fd9fe7b480e279161aa91e20 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/04f8aca18586e83d5e8a0f92a8cfbe0205c460d9 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/317a8550e15ccca157c53ce8b7f992623127954c |     
   mipsel    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/d75d0c51e28677ca66c5156c5cc7e9eee53e0349 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/5150a8b25abc670acb1df8409e9d19911f2519d4 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/368ad651412f81a7197e4e1756a1308d2df8cb2d |     
  riscv64    |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/dd5255b13b2746e2e2e056af3e570f0cebe392ea |     
  aarch64    |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/f8a14307e6feff61acd963d6cd2aac289e6d1647 |     
    mips     |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/9bace2ee1c5c535e61c5d77f177bcb8ea82c1b91 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/219b44a42d57d08714d4061c95434ca8b71b40e5 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/12627fb3df300edda7ec573b2bc01890bc3e5c24 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b2ea583d2e10d6be2de385197f0ea8fa557ee999 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/56981ac08c39cbbbd6df482473e152969d370d43 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f4b76f3a229b500b878570bef92fa91c66e00da3 |     
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/335891fe4394d6730f3a54a9f0009014602db512 | ORPH
  aarch64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/f2492ab575a979d447f14ed50ff168931461867e | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/dccb8c8a2044410c0d39d743a255a5f0a5177631 | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/f94e15d096062e522a97033b42ff6362f60d29ef |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/bfe2e133e6fc381d45aab7727c28cdbe0c4d7e4f |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1d8fa463fbb542a2c2b84b8b7785affae882fe54 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/9490811384ab068a30090986f530d52ed1f182fa | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/6bae2bb3aee3c86d7209bf902dd33007a611262b |     
  riscv32    | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/8093b7591a295e9090ffc25bcc493c55f5f5d6b3 |     
    i586     | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/86657c9ab234bedc234f49222f7eeb78888cae35 |     
    i686     | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/887efc8d475865a943f0cedcca013b77eec9f453 |     
   xtensa    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/226fab175a81c1ddfa9d3b8f317d5cd9a45f40af | ORPH
   mipsel    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/65daad2d69daad446196b5ed0787969c586632a6 | ORPH
   xtensa    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/bef8b31121dbcfc3e475309e8497689a88eae792 |     
   mipsel    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/9504b1923b48bbe29665709e10c2b2a5b0303f4d |     
   sparc     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/10a8780862b7a28fde281154763c71aec9680558 |     
    m68k     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/92e6259f0d9f0866470133bf7004be208ae8c50f |     
    m68k     |         powertop-2.11          | NOK | http://autobuild.buildroot.net/results/feb653b3d8e7fa79fad610066b117a398d784c82 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/278fe87d36241b175883993cf39e4694101b6eb2 |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c0e6741cdf090bc63bc07dc6e18b930904a7ba10 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7e24b64f9a24485ca9a31b44e08f1c7ad0576478 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c5d49624aa658b668624775a17740b71df6ab6ab |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b78a1afebe342c89404ad454b72fa48bd077c3e4 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/94e0d71116d62580973d30c85ff10bc996ee78c7 |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/84578cc377e3c49cc300c606f1f7691233d4edd1 |     
 powerpc64   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/13ffe7e68aac2754b114f0faf0fac3ea6ce4bc79 |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/d205ca66e504b63d4525a54da90d58ec58da03ae |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/a8bb7891b32b28c8b4560e2d4abc5aa9848553e8 |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/a4506ccdebe04afe4e2e0c3db41eca16479725a5 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/0420a0ff2eec1b2734f70875dd5653c8efa79d6e |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cf0cf90d4d0f7b364b5a87aac96eb4a05cf4dd41 |     
microblazeel |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/a659beb5b51510ff29466cfcd25e49706a54093c |     
    arm      |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/abfee376821ff86f087c561b2c63d9859af2ea42 |     
    arm      |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/714e04218cfee42c9aabf524928814d9e0e8f346 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/547d0e366f3715fc4acc6debc080e9438e1200ce |     
    sh4      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/f61727c1eee52729a855e84744f061ff3d24f59f |     
   sparc     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/abe4bc40ae0213df33fe82d493cf079de7aeceaa |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/6fae28212823a2b6d8f6e1e7bdea673d5ae3721e |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/bf8f24a8137e3fa6335f8a60a29c0c25f4d1a9f7 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                 mesa3d-19.2.6 | 1 
                qt5base-5.12.5 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/80bd91e8746ede500961b32b0e27202aca275893 |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/4f8fc79f3ec27ca14bcb8e7ba1c44186bee1c7be |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/e20707bcda55b29a7217276adab78d8836e30cd4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ea2c2607d709c8af53d651dd92de91fa4652e639 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                      tio-1.32 | 2 
                       unknown | 2 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.1 | 1 
                  pango-1.44.6 | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/0b62421188a6fa5e0fba3a77afa10c2e8e737b06 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/2025761be985d0b68d14d4df8c9196bda6ea84cf |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/4e43c1dc10af03c7d83a9c050aa47d274751d6fe | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b8b7e1a2b3a11c76c158a306085baa5285e0bdad |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/07e1c2c7600f8c5a63c6afa94cd36f5023cb21f5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1bbccaa12c254f9984eb751a848f6faa67b6a612 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b76b16f76cdee860b37369e994759343c73271b |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/09248e55bf9885be2c39098ba45822d713db089e |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/a3544069686c7e71669347dc3dfbf5e6a76240f1 | ORPH



-- 
http://autobuild.buildroot.net
