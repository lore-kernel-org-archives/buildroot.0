From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 06 Apr 2020 06:28:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-05
Message-ID: <20200406062828.658678827E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  3  |  0  | 22  |
  2019.11.x  | 24  |  5  |  0  | 29  |
  2020.02.x  | 16  |  9  |  0  | 25  |
    master   | 143 | 110 |  0  | 253 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libnss-3.51 | 45
               libglib2-2.64.1 | 10
                   cegui-0-8-7 | 8 
psplash-fd33a9b3d68c89fa22f... | 5 
                 jbig2dec-0.16 | 4 
                libtirpc-1.2.5 | 4 
                unbound-1.10.0 | 4 
                       unknown | 4 
                  pango-1.44.6 | 3 
               belle-sip-4.3.1 | 2 
                  boinc-7.16.5 | 2 
              host-grpc-1.25.0 | 2 
             host-pango-1.44.6 | 2 
                 libuwsc-3.3.4 | 2 
              spandsp-20180108 | 2 
                  zeromq-4.3.2 | 2 
               libuhttpd-3.1.2 | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                     php-7.4.4 | 1 
               protobuf-3.11.4 | 1 
         python-markdown-3.2.1 | 1 
                qt5base-5.12.7 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/986d431832a158d1322011e433c681724c3c779e |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/94be1068d87c4c010b94fe3929768bc8c33e4d21 |     
  riscv32    |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/38f52d33d0861775766ceb8582ed2a4ca7a0e791 |     
  powerpc    |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/2bcd544986346cc0a55378fb1d66b18433b34380 |     
    mips     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/11a0b1c5304fe0763efa0853b7c1eb06ccbcee56 |     
  riscv64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/1434dff1f67f1d2baf5dc186633f9ad62d8f7a12 |     
    mips     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/57b71193f1ef6275e6085a033a4a8b44b83bb4de |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/7f5ef4585034c29b4931fc4b6b06d3e5c35ca646 |     
    m68k     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/8fc9e3b54addb78eb295dda157f900db974472b1 |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a0f44ebfb2aa72fe7caf8f39b3193c69b7ebedc1 |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/5ee3ff45284ed6c9c66d3c223d8c14b01012ad1a |     
 powerpc64   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/abe2669964b392f505ae5db13220f2c378cda5a9 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/87a33c3cfd7abbb006d6b164d6c9a9a763c62d24 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/65599426edbf36b999edb93f9ffa85735e0c7468 |     
    m68k     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/8ba572853aa4981f50f7d76672e86713b6aacca5 | ORPH
   x86_64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/ea6ef7e2671f9f26ab0212893c4cdf2d5a23306c | ORPH
    arm      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/86038faddf309870a7ecb804c083ec04a9301359 |     
  powerpc    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/7572c34af5b956ab44d35a7d30e49f5afa2cc7f5 |     
    m68k     |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/fae79acdddad207a4b9218060aa82994dbed2e6f |     
    arm      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/b42bfbc75b751b6b934c6689f14ee887e2a382a2 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fa589af280cfe51d2152b87d6a0b094e5bba7fe2 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f134a65d569cc58bca062ab1a2b4752f937ef887 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/39c453bc3c770aa197dfadf821f2f5106f1435f5 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/ce1bdf477456ba58de6086ef7286b2c8dbbcc7b7 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/67d4e15249b8c958eadca00916bbc18af3ba7021 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/cd3ea0bd7483d2e3b194955499045b37088f9785 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3109dbffd5d95e7125c8ac9bf475b7d920791b0d |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b8555eef5365b29e70f1da59c4ecd69e00d4d861 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/970b3e547c36ac6dfe87ef5250a31dcfc056801c |     
    sh4      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e10f532fe310dfdcf3d810d07e8d4a68922c59e6 |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/fd3c15f06f0a123a760b336fbfbad490637c5410 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/3d49249a3732eccbc58b66a39a701f15b0ade753 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/2459936b0fb57fc75b58e465a85c58d13090ee8f |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/a73c767f369fe725624c795d838f457a0527ccde |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/3d39d8172204edb9ca385c6c43008c9fe77ab852 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c6dade5f9bc2c9beb1dd98a20e6b288137ea01bb |     
    or1k     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/f73c5d97f9b907d717a07a3f36172986d98f61c8 |     
   mipsel    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/48cb41cb3f8574f4a7d3d8050a1fd11b4591e912 |     
    sh4      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/722b82596ad4629c68090d4dcc0160e1b9988a3a |     
  sparc64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/e6381d27b572da56eadc7d25598f92f4a29c45c1 |     
  aarch64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/397c9fc7f340256d5a3d19eb96bcdac2c0b758df |     
  riscv32    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/9939a8fdb8c41fe3bd53787df458ae660074d1eb |     
   xtensa    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/35879c90324038b7fb51c71a5c8d2f3b2f9b8dcf |     
   nios2     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/8789e654b7d496ec0c8a0941b06d4acafc99c93d |     
    m68k     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/cfe1a3a396346f5c463f56d2afb30308949863d7 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/51dd25da4633663a24ad90a6a6b3874925da0166 |     
  powerpc    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/45cb36513231bd3cb415168fe43fde9b0f539867 |     
  powerpc    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/21a3cb63e41c5521116177656e41c37ebc1bf22d |     
  riscv64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/312fdb9a2bc1de70f287b79022623c66cddcf629 |     
   nios2     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/513d6b2befd9f1ae9b3642847337818cbbbdffd3 |     
microblazeel |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/f44b9176d55bda77e2f5bebe95ffdeab2b4104e2 |     
   sparc     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/6d62efee8a400d8e9d3114433aef680fbf87dc24 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/36d591874c84cbf0935dc0d0d2a962e62a0c01a5 |     
microblazeel |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/e638b13438d9bcce279c9b3a37a0754bb4a82b88 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/1b4b1c514f0544dfe4249b6da80448435550254b |     
  riscv32    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/3d499b13ab85a3c6513606efb3ea0a207b5eb74a |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/646ce6c52712ea5b47c55b30f2d40758bbbf4f80 |     
    mips     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/a851265fb9c0d2b1cab7e15458b42e81fdfd49b6 |     
microblazeel |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/606eb0fb4bd510faa436b655144afce514af280c |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c1923e82f5fc9dab58aab947e9b2a747a2fa4af0 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/0d7d7b8ca8b46a5f2e0bd8282c7b2d5091955f1b |     
microblazeel |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/86ac54e7032953b653a3e68f5ab8a9fd7b3f354a |     
 aarch64_be  |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/531ffaee07b6abe78cc550feace4d4d1d8316d75 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/dbaf936bc64913a06008b1281fc510bef88bd379 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/8707df20b026836e3cf43fa3eb4c46af6196bbc5 |     
  riscv64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b682fa7d2ffd8aab21923f09df3fdce74b526488 |     
 aarch64_be  |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/1ad2fd6c57b45bb67d728acc95b87951083a2e87 |     
    i686     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c8a6776a3e9cec1dc67862e4972e3ca8f4562a50 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b359555a2672492e804f34edeb4556b314d6794c |     
    i586     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/3913560fb78af0d0d0b952af27ede37b5cc2b9a3 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/cc93ced0917617293f9049e1647dd4d3201bdf45 |     
  powerpc    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b3dcc6a6d16c4b91ccf16aaae3a7e515ae524216 |     
    m68k     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b9a4a0feb86b6afca381d52c08f2d5256e29f9c2 |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/3fe76b824108debd825dda144615fa3ef91700a1 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/30a94a50d665d84c876209e0897e2006b64f7123 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/0f4f0e59582c17b8850289ab7931899f18ea06d8 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5a59142e0dd1aef18404ad90e86d16fe70416b02 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ea30a34bc24df091f78bc66fc3f29954fde1dd18 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b3fa3269535967306b87ff407e9a13d416fb03c2 |     
    m68k     |        libuhttpd-3.1.2         | NOK | http://autobuild.buildroot.net/results/58907866ceaf1449bcdc706dc2341c4ade7b3ec6 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/85c3643f547e31cd69c1d34fc85e59e9eb96f3b8 |     
    m68k     |         libuwsc-3.3.4          | NOK | http://autobuild.buildroot.net/results/e252416e37ea30149e2e131e04424f90a6f0322e |     
    arm      |         libuwsc-3.3.4          | NOK | http://autobuild.buildroot.net/results/98cee910caa5cdfdd8bbfd867ea39ea2244f111a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/307cbb2d10a162f4010ef978917ed6cbe15d9cd8 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/73bac7b5fe33fa9fbd213791034ea388a97d1868 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/03dddb9e42ad0ea00dc0bd5c365b329b9d182b62 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/3ddaf1e2efd974be1f0591a93d588e6ffefc8c85 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/54998d351043b9193aff509d5f7fd67b7ac8cb47 | ORPH
    arm      |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/c5be18a99afba13372e904ab7acf3d1788106ea3 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/fe689adacfae1b7a3180b7ebedae0519bc58c50b |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/640bc381b3699888b6ead8f10e22c6edb9706a9b |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5466a249e35f946ffe481cc71d3cb60ef802eb63 |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/745f9c7547685ed0c19a6690df3638809b709f81 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/cd4bfd71d99b8e448013b3790d5a2e816fc09e09 |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/387e50f8cecfdede059e273b716f67a6631c7e01 |     
   nios2     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0672fdd3c102a061a4e92e1986501911d8eaa5cd |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/20b208ecdcf2a66c0aca211b2e3cdde039d86416 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/c19f2b4fe856aed4a92c5b7d17522cb63b0d2603 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/1476a20d187030fa087d823207cddd7f7b6b3a9d |     
    arm      |         unbound-1.10.0         | NOK | http://autobuild.buildroot.net/results/a89ea6aa1cd8c253b1260ea227fea3dc9b095fe8 |     
    arm      |         unbound-1.10.0         | NOK | http://autobuild.buildroot.net/results/837b010edce9522d7c4d949d010a23773266da7d |     
    arm      |         unbound-1.10.0         | NOK | http://autobuild.buildroot.net/results/ef0942da2d039cb63fbc48434a74cfa9e67763ad |     
    arc      |         unbound-1.10.0         | NOK | http://autobuild.buildroot.net/results/f69820c9d8c6570c26d5d62779f46a141f9ed451 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ebab42f610fef453c7cc937772287a0a585a874c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/a39a84c88b54bcf6754ebe9d9fb9ac5287fa635a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/90024a294ce1f1c14bf62a6769941b22a8a06dbf |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8f5acb176c21c5c54d2d0b6f258de524b2c813a8 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/bf8df3594780b3032436df6c207b3378418fa14a | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ef08fc4437ef2a29f91e230d69cca953ec7918d1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/76175953cec2c9fef6dbe0e5b4ed661f6ca3ceef |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
          host-mono-5.14.0.177 | 1 
               libinput-1.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/cf6663099f78a7863845624a5b77f640738cb4a4 | ORPH
    arm      |      host-mono-5.14.0.177      | NOK | http://autobuild.buildroot.net/results/8da5157967cdab3733d07d4f5333e86801828607 |     
    or1k     |        libinput-1.12.5         | NOK | http://autobuild.buildroot.net/results/429aa77dd7a52efbbeb654ab0bc97affe07534b4 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

      gst-plugins-base-0.10.36 | 1 
                haproxy-2.0.10 | 1 
host-google-breakpad-7515ab... | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |    gst-plugins-base-0.10.36    | NOK | http://autobuild.buildroot.net/results/168e8fccee411cbb734886e4a6b84b70ad8bfd14 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/68bbbc515a4571a762a5b1f98291f755618d4dec |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/bd56834dd63efac74071d0d1277ed0798edb34da |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/3df23f0e1fb81166a9d08dbef986fd5d51ce1fbb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7648752934ffe624d3ae6c21d1a7d693860e901c |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 augeas-1.12.0 | 1 
                 gnuplot-5.0.6 | 1 
                host-go-1.13.8 | 1 
             libopenssl-1.1.1d | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
                  pango-1.44.6 | 1 
                qt5base-5.12.7 | 1 
                  spdlog-1.5.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d5f9f6181d28c4cdb3511f71411cb6e68d804fb9 |     
    m68k     |         gnuplot-5.0.6          | NOK | http://autobuild.buildroot.net/results/0d9d566312c1d98aa1b298ccc193341ec8dad580 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/143c9051f264d79b44d28b58b1bbb2b1af946293 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/ba45e26a73ee554fec4f02bc61fd6256f85cd3d8 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/11ecbaa1d92e6dbb5f479dc6f5ad67c26fa8371a | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/4cd49fc5aae0fd85f31b21f51b3d6908f00be773 | ORPH
   mipsel    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/8b1f1f1fb373f2b1c4bb2f38af907b251e02567d | ORPH
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/8794f53c4e32302671175b184e9adb7ef7b9b141 |     
  mips64el   |          spdlog-1.5.0          | NOK | http://autobuild.buildroot.net/results/6486e6146bed12b9a6affc2856f906b2e13536b9 |     



-- 
http://autobuild.buildroot.net
