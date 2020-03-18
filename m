From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 07:26:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-17
Message-ID: <20200318072620.114E320481@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  6  |  1  | 25  |
  2019.11.x  | 26  |  9  |  0  | 35  |
  2020.02.x  | 21  |  5  |  0  | 26  |
    master   | 156 | 109 |  0  | 265 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           mediastreamer-4.3.1 | 9 
                   bearssl-0.6 | 8 
                libtirpc-1.2.5 | 7 
psplash-fd33a9b3d68c89fa22f... | 7 
               libglib2-2.64.1 | 6 
                     avahi-0.8 | 5 
    host-python-markdown-3.2.1 | 5 
                  connman-1.38 | 4 
                  ffmpeg-4.2.2 | 4 
                libevdev-1.9.0 | 4 
gr-osmosdr-46698a67e7e06419... | 3 
              host-grpc-1.25.0 | 3 
                  ndisc6-1.0.4 | 3 
                oprofile-1.3.0 | 3 
        perl-crypt-ssleay-0.72 | 3 
                       unknown | 3 
               belle-sip-4.3.1 | 2 
                 opencv3-4.2.0 | 2 
                  pango-1.44.6 | 2 
         python-markdown-3.2.1 | 2 
               acpica-20191018 | 1 
                    brltty-6.0 | 1 
                  cairo-1.16.0 | 1 
                coreutils-8.31 | 1 
                host-go-1.13.8 | 1 
           host-nodejs-12.16.1 | 1 
              libeXosip2-5.1.1 | 1 
                   libnss-3.51 | 1 
             libopenssl-1.1.1d | 1 
               libupnpp-0.17.2 | 1 
                linphone-4.3.1 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.0.0 | 1 
mjpg-streamer-501f6362c5afd... | 1 
                  polkit-0.116 | 1 
               protobuf-3.11.3 | 1 
              python-pyqt5-5.7 | 1 
                    qpdf-9.1.1 | 1 
                qt5base-5.12.7 | 1 
        qt5imageformats-5.12.7 | 1 
                 qt5svg-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                     vlc-3.0.8 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/a49fbded3c94412e1f5e9080a3fed15014b9d278 |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ca6c6fa11de45d95ca6a5de88b7a89afd5fb584f | ORPH
  nds32le    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2f974255ac59253515b323cedd664fc84824a9db | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4baa03cc07f651173a61d5c962f3067cd3a08f8c | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/32d124bc428292c7cc69d5352274d2341431dbce | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3a559c5aa3a7aed6c522646365571bb32fa38ed8 | ORPH
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c10a6c044887e95e2bf4548d39f7a97455abf049 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4145d80544ca3c57ca39323f433f26343d9e7a67 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f8ad52ace639df7d933372066859c5c8c7c7a3e9 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9accfa25541c249f01fed4f04df039a8706b3c16 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/77cd8ea68f27deff27be47b3d2a34f76707be8d8 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1bff2206363e2cab7ef8da732d6215d7b1ca405f |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c257f05a01cb878cde475cc55aee06cf8a5c0b07 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ba606eb3f7d06cc710afaf7077d6c165667e9a18 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/21ccc8c2f4b550abb9f74a577f9cd4fe23968e98 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/efd79697007619a505016dbab48c0b27dddabbac |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/89242975d72bee51439976bb239a920153729a80 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/a622f2c74e8cdd3cd61981b4eab22255a376bccd |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f5d2abc330d6b61a389a78a0f16c15599f1a9234 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/9615bb6ffc553a9f1dfe1420d0f930c468166b43 |     
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/35b3bd196ce621ba36b37ade8305fd47b183686a |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/24de352382be132866ae20101283a0316507e42a |     
    m68k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/6912ba084c904c2ed0d96a279cbb5e57b5d82d7a | ORPH
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/3c1ee61912be715ac5e5441f2273533095e493c9 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b97c97e0da7888ffbb82fb9a6cca0a65b885801d |     
  mips64el   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ff98d7a7fea555c1daa84d2b039abc7c6317c705 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/4c92c70d98f28765059a3336a375ca42e7609543 |     
  riscv32    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/539a50f26f5d514850e1ebb8767d8db0ba21d65f |     
   x86_64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/751ea3b760101333fd55a0bfe8f7f556ead4415c |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/c33796e85400728e92799b1e775278da818598c0 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/7f798fefef2f472a340896efd3955b57525c6e68 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2f4c3a5464e4165091b01979fbf474fce3f6f746 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0a3cbb32c4a73ceff5104573f63646aebe782e1c |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/552ba86cc34cb99b0ca505d834c2cdcce4d56eac |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/cb91a5a25103ab8227a1ee7b0e0c2da6c8859c64 |     
   x86_64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/49b11b3e9f39f4ec965aa898c8a068ed1152f7cd |     
   sparc     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/274fbc2fb31c8dd673b73ba2f555f9638935787f |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/b8da9ffec49047f2d619eeb910426365c62270fd |     
    mips     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/5a5178d714c3ad4de57feaf149d4350d63067646 |     
  mips64el   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/b58f570c0bc6dad37c8b06d4491679a743e0e902 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/588936910096d21a120b442f6ea0b1fcefe86d9e |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/7a0f903d1447ed87072f565812e9c4c08ab62fae |     
    m68k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/40df0a5f165bba7385d5d11eaf9d444e1dc9bac5 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/ce1ec69db97c65aed9d891314928c07a2e50b9ed |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/115b3885c42805a7bf031fe1673908705731cf43 | ORPH
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/c9579ea18c750dd25c952a9631fb7e6805ad62b8 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/ad4bfb48317a0e3c5c587d4aa693a7471405d7a3 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/d7e10a7d5e4379b74a68d1c4406b49bab6b58f06 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6ce7a05b105d5c84f7bb5645f7df55513e21635d |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/91ac2f5ba6c41fa58544577303e53589c5acff12 |     
   mipsel    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6c7150e17ce8ce8dc7f0658e6311922d86ba4309 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/115d011439fba354a4fc752464a1ddc31deaa35d |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/e7b30ed5936b6d04e9b5c7ad84d79189850952a4 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ec562bdf491edc7650033d5eb215bcac19fbf6b4 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a7dd3797ee4a0c5c5d67520da06229b45fdb3b3d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/086318e6b09dccde068a305b52ef93ea7a1ff31d |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/898dcb7f5b42a3e72e72694449448692e0c6f4a6 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/021f67f57f707e20ee9e1b4c9e212d38c8822769 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6099881e9b4105c0d8772f26e54ef32a63d3dac9 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/bff9299025377bd2ff545ced6f58790a1a962e6d |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/ca953fd9cca3297002cca252e5ff78df81c69142 |     
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/0f851d87b6f376f4e521778eb77ce45f30619aaa | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/86a88d774cafdae68356ea307381bd6e4260812e |     
   sparc     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/7f6c5c08498339618e654db5235e239a8920720f | ORPH
   nios2     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d22cb30b0e771b1a0cb6007e8d11636fe99a488d | ORPH
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/6b577e9fa7243f697f54e534a94476827ab19fde | ORPH
powerpc64le  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/f766631545ed664c861d0fcd424f993d67e410b5 | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/8c053fe96a000414ea95ea1a197fbe31a6c851b4 | ORPH
 aarch64_be  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/09dcad855ca4e8e5a64e451b725248c7483ac1d0 | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/b647e2c21087e1e20b4002743ea7cdb414c1380a | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/072d219268f22bec34dcdd603bb6b967de2704e3 | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/1534fd2e7ff00ecc91deec4f060c2b0afd3423b3 | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/1760c86b62e9c166db53c3e0c94ef77504c12c79 |     
   sparc     | mjpg-streamer-501f6362c5afd... | NOK | http://autobuild.buildroot.net/results/20282677c3dce5534e043847bd4f0709f85c5e74 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2f059e8e7bb2c5ce4eec63c2e5b781a1e2a225fa | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e7ea9c702f95568251d1f3bdd04337fd00d5ea0b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7ea36c031707392b09e740d6e17efa5f6dbabc45 | ORPH
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/bdede1d10f6516f775e6aa9ab33a77cd79dbbf09 |     
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/7c1b250e722e818138ee150fdf1c90a226d435e7 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/1569f6e569a41d02cead95b12bf075ce484da7a7 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/787398ffaea58859a75e320f521ff8e1bc024e65 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/07c2a4b5a805af536d5d1e1ee8ea54fb759142d0 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/7bb31016246779d697c5dd4a6d0cbe34c6f76d10 | ORPH
   xtensa    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/690eca875906d3ed8ca645ea6b5c00870a9eef02 | ORPH
   nios2     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/f3b32b494113c1ea54b72a1ffff3f2ff792d1f8b |     
  powerpc    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/81b50833887c5d508366e0222535e9e28d4f3f93 |     
    arm      |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/d9677184c99c44b63e1a7d19cd25c49543f64398 |     
    arm      |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/258b734e14f8f31355eba1ddb734213bc3f29591 |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/5eba7ba1f9539f279b9a2642e38e0d319bd19546 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/bc53cd91e39e5eb71f9da6b56d3237ff7ec3734f |     
  sparc64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/34eca83958dd9a7c402f3cd2a8dda93dfd4f7dfa |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/62d8127e960f4fd184597b25673e73c877cce3ab |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9a6f082df1c13b00f5ea539f4773a84dd60ccdd8 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/efdadea1e9b052225f62dca4eeb64f9840d48f06 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/db7d26e85af1d01f15ac53d8b1cb36043be3e8ba |     
  sparc64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/61a8413a14e1e4be83812ccbceafa04dcbe50170 |     
   mipsel    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/e410d1f3ff24cbb2c8bb8c46439786d555507eba |     
   sparc     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/45920a04c9461a2ede4692a0a4acb30e4a80300a |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ee47a746e67fe7245666f5cc811cdcf9e9c85c78 |     
    m68k     |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/cc917c96de562824124b2d818896eac25ab4ca68 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/e9a8de5681292df348ae2acf9ae9e399d89a9828 |     
   xtensa    |     qt5imageformats-5.12.7     | NOK | http://autobuild.buildroot.net/results/663cdfdf31601b4a3d2b5eb11c064342d3ea57e6 |     
  mips64el   |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/a2a4703b0c317e129e18ed6f570b7a5f78a8a35a |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/58cbe77cad11b5a48997a826967775610a9cbcab |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ca6afa225c4d3cf9d0d078cd1fc9b16191014142 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c11d0770da8dbd228e4e3d9cd512e93a3b0b49d9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6c311c3fded0a441945d3b46f37944cf4685b305 |     
  powerpc    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/03612f056350794389198443309eb6cf1649a2ba |     
  mips64el   | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/7a531d0b5c646fa99660417340ed9a6c7b0cacbb |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                classpath-0.99 | 1 
                   glm-0.9.8.4 | 1 
             host-grpc-v1.16.1 | 1 
                  linux-zigbee | 1 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/e06e834c3b9422f4111b5972366e23cfac8713ce | ORPH
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/789d3b650c71476c4b56742db822313789294333 | ORPH
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/5cda6bc019a3ec0267b18607dad470ce3c492ac1 |     
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/1e07a5bd170c075ff1cf659d6671886b072f1679 |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/f487761133bfbed3548de7dc79e9a3065e2d6d5c |     
  aarch64    |          linux-zigbee          | TIM | http://autobuild.buildroot.net/results/ed4e2e037bae6a5d28093265367b124faf9f1409 |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/3466b2cb9d0c2bd41035259f62d21a87fa05f8da |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 4 
             util-linux-2.35.1 | 2 
                 host-icu-64-2 | 1 
                nodejs-12.16.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3b2116f37c599152f365b8617ab46dd35fb356dd |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/67036b40f3c9ac856f6645b26d66a385fd07af0d |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/9864c09090a44bd21f668cba7d495cb041380906 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/a3aa33c470623b7985e1fde1f522e5fcf03f927b |     
  aarch64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/6e00604454b1377c5c954b9fb1f0727c77277844 | ORPH
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/81eddbe92b7b6c5c2459bdf2df59b1182b0e2328 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/54059869d6d03e35a5fc47ed67f73a4c919da864 |     
powerpc64le  |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/1ab31241173ac4d37d80e708113ad9ae3cf1c283 |     
  riscv64    |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/5499240207c7fd864c6748b6f10a8a7640cabed6 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

gr-osmosdr-46698a67e7e06419... | 1 
           host-nodejs-12.16.1 | 1 
               libglib2-2.62.4 | 1 
                    mpv-0.29.1 | 1 
                 opencv3-3.4.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a1c2c8836a88303184d84a7796c306956171b208 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/65cf187e747a42a463e0db38096f388ab86a1b8b |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/57043ec7db3a2fb2e609ed9be79d2a7cd6ebe6dc |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a7f3b970d2f9e7e2d4b5d969a0f498258c552f1e |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/14e3fca87dbfe1d3f8814da8b796d4bf12eda61b |     



-- 
http://autobuild.buildroot.net
