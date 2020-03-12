From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 07:27:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-11
Message-ID: <20200312072756.AF1528589C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  7  |  0  | 32  |
  2019.11.x  | 28  | 12  |  0  | 40  |
  2020.02.x  | 23  |  9  |  0  | 32  |
    master   | 177 | 133 |  1  | 311 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 25
                   bearssl-0.6 | 9 
                  connman-1.38 | 9 
                  ffmpeg-4.2.2 | 9 
gr-osmosdr-46698a67e7e06419... | 6 
    host-python-markdown-3.2.1 | 5 
               libglib2-2.62.4 | 5 
           mediastreamer-4.3.1 | 4 
psplash-fd33a9b3d68c89fa22f... | 4 
                     avahi-0.8 | 3 
          gstreamer1-mm-1.10.0 | 3 
         python-markdown-3.2.1 | 3 
                 rocksdb-6.6.4 | 3 
                       unknown | 3 
                 granite-0.4.1 | 2 
              host-grpc-1.25.0 | 2 
              libeXosip2-5.1.1 | 2 
                libtirpc-1.2.5 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
                oprofile-1.3.0 | 2 
               protobuf-3.11.3 | 2 
                qt5base-5.12.7 | 2 
                     belle-sip | 1 
                    brltty-6.0 | 1 
                  cairo-1.16.0 | 1 
                   cvs-1.12.13 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
      gst1-plugins-base-1.16.2 | 1 
gstreamer1-editing-services... | 1 
                host-go-1.13.8 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                libcurl-7.68.0 | 1 
                libevdev-1.9.0 | 1 
                   libiio-0.19 | 1 
             libopenssl-1.1.1d | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-20.0.0 | 1 
                openblas-0.3.8 | 1 
                  pango-1.44.6 | 1 
                    qpdf-9.1.1 | 1 
                sqlite-3300100 | 1 
                    tslib-1.21 | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 
              xapp_xload-1.1.3 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/af6f7eebb10fe611c98a93086ebe39da3145bb72 | ORPH
  nds32le    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/11ec506a5be42528dfe776eb707a57ae7a7b5970 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2e3372a1ec701d58783686107c6a96c6da350585 | ORPH
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/7d30eedc9cb78fc88458fe18c7415d6d7498629b |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3cd9d08ad4f5fa9705780c02b994900b70ec99dc |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6a458c1aa1873d8da8bb8c561663093d00cd1514 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/16507d9101b9471353f51e00b693ef3fc6ac04b9 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/7bdcd056cebe85ee42d4fb3270d71dda05758d28 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9272fc709f14cd2596a4335553fc43fa192f0339 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e5dc0be63ca4e112325e3889c2dec17064f1af78 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2904036d28bef32abe3b5c7ae6824e781df490dd |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/cd8d0c762afbee4056df34d7d44d08aa6c9d5538 |     
   xtensa    |           belle-sip            | TIM | http://autobuild.buildroot.net/results/3515babc6b83f5fbc7f5edc74f14d688dfba8779 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1104412d0fc98dcc850bd45226006716782231c3 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/6ec00f799892fe330476a48ed1ad4b2f0935c61e |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/7b9b5306091fb9ffd87879eab5ed2d1ee3fcbac9 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5aa531e790b6537d5f36e2d4fa3e9b42bb852804 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/3ed9d9a12ecd673829e74e98c6441fc34c8179c0 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/703126ca60688016dd28415faf3337631d5525b9 |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/c847bba763b68211a38340b2027dd9a46233e7a8 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/942e0e9732eaffa9cc3455e37fefc8cb155a3c46 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f590d10506239f8981590620c6d289d628e728e3 |     
   nios2     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/d54ec1532a21524d18648eb78634be9cb2aa0e8f |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f398e9c954c484a9dfa790e077301a7c3110f30d |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/3d2936d6babdc96a1563e77b98238efcdbc4bdb6 | ORPH
    arc      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/26852419052aceb77258ac6f6ceb533c2a29bcea |     
  sparc64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b7d577f2298f2a490abfba5a063501ca40ef1e84 |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/d0e04d477a45c68eaba261ba6697604311cbbc9f |     
    i586     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b76b4d723e52dbe4520aa079de6cde920ef6ef18 |     
   sparc     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/38541e7a21c532739f46d7dce4896e99826f091b |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/7c0b5be54c36d1d62199679f8007d7b98c14b9ea |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/858f69113b69be326965062044f07929eb061530 |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/1fd5347c199e8839f3010fca14c62a6225bc4636 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/6c182c016aa4cf25315fadc72171f83ba3d306c7 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/33f78e1a30571879e4ee6b634b83bad413b5c76b |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/ac26f8b40e8dd1d3d0d3152579cb7d098edeb5fd |     
  riscv64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/c702e44d4815e3f8157693f250c8c41ce9262008 |     
  sparc64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/bf460d744b348d69a1b49e18ab72acfdc1730202 |     
  sparc64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/06a332c7c9fb16e110a21dd6034144cc7f444daf |     
    arc      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/83232fac736e2cc2ca7773609053d415f351df71 |     
  riscv64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/4bff289daff068af45eea59ffa415b988a9525ef |     
    mips     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/be178a8af8dd5fbf7f95e1203e156e3f41aba66e |     
  mips64el   |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/e7b038151139c56b69242def13670d0a2207f095 | ORPH
   mipsel    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/7b1ed536fc4dbb321ac4f737fd3184d92201ecd3 | ORPH
  riscv32    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/076782a8aca2765f32672b113591ee34da5ce487 |     
  riscv64    | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/41d1cc83472e7d6f712c8d28eedd185fa561139b |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/34e152506d06a7c2c431acfc1cd77805083b521e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b5cb232fc08820dd2426084c421c82a1a09e8593 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/453ba0fe9d18fdf95021c2f9c41a9d057825e0f4 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/3d8c85b3b8b7922ccbf86e07548eaeba65893282 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/94ab4a1b0f14441b6ce2583730f3a31659e5ef10 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e64043d5136bcff4421a68519f323ddac38f153f |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/02abcea82c88e7e4836d6bf2ea11ed9ba6b7b09b |     
   x86_64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/6172105899486d7e759970f8ab3d5675a95fe6fd |     
    mips     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/e77c38d5669ec92e76bf55d0c0f4e306c6090fab |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/463b757cd8e41922479d1788dc3c4986be4eb39a |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/94486777e8d59080ca3078a88f4d7be2fa08573a |     
  aarch64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/cf921020721d1fd90454ed6b4a2d2afd6f4640b5 |     
    m68k     |         libcurl-7.68.0         | NOK | http://autobuild.buildroot.net/results/826d38d41703f45d57aeb35a646d1d7c93f499cf |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/c54e386121a2b75688a5c6fa02fc3756e7165b0c |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/84a5498387acd94e9f7670e843ded8113424c3d0 | ORPH
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/7b5f049fda390a7961b5a7fde42ea5aebe1f7564 | ORPH
    sh4      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f1f4a6a334fb52f1a75e52724927b122749151ae |     
   x86_64    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/bfa402587abf7dd7ae2bbf7a5c06f60ba9f4ae13 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5bbf7ad341131e09c747c74e453f181d1275fa2c |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/7749d6d3e67c54eeba003bbe16bc9e597968e787 |     
   sparc     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5c6499dd7875e04243ae3c1a2c0aaee717f7a15a |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/4fc25b7f9409873b3eef30f4c03ad65956fa9a0a |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/b8c9510bd2c495e691db8fe1aedf33ad13ba9bb5 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cb04f0504e43c733f5e6809283f1221581a72f59 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/beef8bba68d7ccc5d6407fc6559329671ec3061e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/8d6aa7b066ad032b632563a08ff04d08eb0437f1 |     
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/05d2d5704cb8ce761b135f9ce8486ab1c97f3b56 | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/9d7bb4f070cb4f816f0b83d532efb35080d1c1ad | ORPH
microblazeel |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f44604ff02407415de202eaa065b7dd258cbbcd8 | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8716f143d79e685ed451187a0b1f75c78e754d0c | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/71ba5663465adacb58a05fcd130f2a3eb2c36ca4 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/46d9f7818dea22d23354dc199bd904498bba6040 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ea810b0b6ad212f256acdb08105543165b03aefa | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6cc13f73aa19132e9069ecb9eba6ec80203ce75e | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/3da4326ee75cee2505ed7e613913f509e77176e1 | ORPH
    or1k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/7e4071be434033a1a290f29684d7ac1c266c4b1a | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/2129371ec1df652b86eb75f0b9c6b336f399c9aa | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4d68b752b12a5c98ba30ea7d4c6d912dcbfac197 | ORPH
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/796fe8f8b9a32f294311f2fbe471482487a9911c | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/07eb53902db4bfec59bcb977b8b9a67178ee4626 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/70a82e9e41613b6165c86cad5be025829c9c15d7 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/92b40e29fa11690c351796a565276cfdaf6ff566 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a53ca4793858ff0457b35cdacd4dfad4ea5cb2b3 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/067e1bed39bd12f915d99ec334fcf81c218e6b37 | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8167e96d3a2701dad097ffab98a97d5fc2c61f47 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/98298f6516b66a028d5fe7cf809e40ef19b01ca7 | ORPH
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/50821ff578491e7cd3c5e366df5296628fba944e | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/97995cb6d19ded44ac8068d14bf1e470d5ad09c3 | ORPH
  sparc64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e7ca65244e9d0f14a2577443db296a06a9901786 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6468dcba7c1b8de8d01199dae7ba02ac134bfff3 | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/d6a3f4d80d6d9996d0194f08af8c924a16f8fd27 | ORPH
powerpc64le  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/ead40e9c0ef984fafbfd8afe84351b67b663311e | ORPH
  riscv64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/4aaf4a04218a5062d049350000eecdc7affca1cf | ORPH
  aarch64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/98ff9dd16316445f2390b36e8ddd3cf6e7ba7cba | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/8cd8a7a0bea0795b9dd385beeccf88163249d729 | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/66388e748863a987b22d746adcf0bf6393fff8a4 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c0063c17f00692ba80180e10ef2782d1f0867f96 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/92b74f3a2096cd1488d4dd2f9e2421798784a71b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/25cdbf67b087eeec4756985757749ce66059e676 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/72843044678d0b75894eb2fd0d15a3cc855665bb |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/ae1eb3f8a24947cfa1b672f18e4318f3bee324b1 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/07429dd3479d136b2d219697937b1a4ac1e2619e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e43dee37a4295773bd3d61681c27bc6fab816118 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/3fee69c3dc3e449f44dbcbe355eaf08b485a1e2d | ORPH
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/83d1f93a2037794b3482a66196c5d5e05982ebf3 |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/ff6ea4f8f47c5b61ef6a474bff5817d5e22d796f |     
powerpc64le  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/cb46d93b90ca3b297d0e18fd84796660e20c3a52 |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a80a18d9257ea40dcbaebc8ac4b90d2b13e110c3 |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1d486177540675b86b32ab566aebc7207bf75e73 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0decae36550c7c8c99e011dcb6afc5b29ff00415 |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/67b72abd5898200a80a5a6730ea75bd4aa9471d8 |     
 powerpc64   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/c718cec967c6ae62daeb8bbdd1071f5b824d58e9 |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/3a3dc6b88975d3db0b7890b5a56ef411d895b728 |     
    m68k     |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/80a5e2359558350c9e6d3e265a9ad01521535c76 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/047ad316c9b5d5f2e97d66c3f42c51a994db7cf5 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/637bbc656378d11fe079714ed87a1f1144670bf4 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/eee019ec2bfb142958ffc8112393953ab4c42595 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9e8571669a68db722c88d4b8f786d9156ded292a |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/07568437dc21ffd3c00e2b29464a77b64457019d |     
    arm      |         sqlite-3300100         | NOK | http://autobuild.buildroot.net/results/765f04fcd79b92e5d311c72daebcdc3d64cad7da |     
    arm      |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/bc8bc3f1d88f3b64765025fee7f941d30a81ee46 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/3a306ba2b9370eacff0d9209c9a11f561a7f8f2c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/dceba0552b7090475ed6a49e92a4f353eee15c5a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8159f3628dfcf742aba038e1a841e53dd48b3fa |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/97f1d557459a9141eb8bfba62eeb14210be5c72f |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/f1d7dcbfb573fe181b2e9fa7171816f8ffbb5795 | ORPH
    m68k     |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/3eec0994490d1504ffd61f311541843571593337 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f8e30c57c6ad9e2637387b948166f73c63aa0092 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
           host-libselinux-2.8 | 2 
                   glm-0.9.8.4 | 1 
          imagemagick-7.0.8-59 | 1 
              wireshark-2.6.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/f7698e9fc3f4637517788d3415cf9ab57b151e04 | ORPH
    m68k     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/35c1b32a7cd4d9a79d7c28af109220335351c853 | ORPH
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/e17165f4c48a3c23478cf9aa85ffdbd2352d16c1 | ORPH
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/7095af005e24026e151d2efa4f82fb81478e8448 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/461cd7a2dfb239238c5129f1008f59fddf283861 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/a85321811708cbc555422b74ead0080a92b72db1 | ORPH
 powerpc64   |        wireshark-2.6.11        | NOK | http://autobuild.buildroot.net/results/7773e2c363fa925d057abe49fe6edb31b9adc76c | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-19.2.6 | 2 
             util-linux-2.35.1 | 2 
                  boost-1.71.0 | 1 
                classpath-0.99 | 1 
                     gzip-1.10 | 1 
             host-qemu-3.1.1.1 | 1 
              jpeg-turbo-2.0.3 | 1 
                libgdiplus-5.6 | 1 
                     lxc-3.2.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/af07bcfe974df9ca46240745f79404bb1aa8de77 |     
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/adf0ca184afc5eb96de4b3d7eade91492df8a379 | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/64548fe460221e09a016921897c4b4138330c5e3 | ORPH
  sparc64    |       host-qemu-3.1.1.1        | NOK | http://autobuild.buildroot.net/results/4ba8f424c58f6f19815630c943990abfe4f5f2ee | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/1a8f4d66a87464dba7cf4fee84d82e3ce6f789be |     
microblazeel |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/633e14b7846bd13cf1ccd39d7a57f70d2d9acda8 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/ba017d4affc6f9d0cd9b5951adf3be445d063bc5 |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/b85616df5a10484e7f915accf8d44e0cf64d7873 |     
  riscv64    |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/667ec528811321b755ee0da82a3ddfd469a662ba |     
  riscv64    |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205 |     
powerpc64le  |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/10489c03b3d596ce8014a304477ee45beeb910ff |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 2 
               libupnpp-0.17.2 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
              host-grpc-1.25.0 | 1 
         mono-gtksharp3-2.99.3 | 1 
                oprofile-1.3.0 | 1 
              python-pyqt5-5.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/d2cba321314511afcd01edd5efd88ef1962425b0 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2e2f3ffe7a1c428e665e79a28d11c1c90f0d9f86 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/4afd8a8ce6a933e8cf00eaf73d40e75b93945703 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/560b2d552a528cf01fd599725c902df4139cc421 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/59feba554190e7b736e61fb269f89932c0f9d681 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/c94a9e36c504b50e93c60b61d13cff2396af4c37 |     
  powerpc    |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/483775319ee0165c291b96b62fe4ed192879223d |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/b0768eb425a1a65f86a2ded937d872c8982603a4 |     
   mipsel    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/3591d8ba090d6556ec6cd6b716428f6b4ac8d4b1 |     



-- 
http://autobuild.buildroot.net
