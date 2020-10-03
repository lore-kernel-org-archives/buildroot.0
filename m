From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 03 Oct 2020 07:10:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-02
Message-ID: <20201003071017.DA63420377@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  | 12  |  0  | 33  |
  2020.05.x  | 21  | 11  |  0  | 32  |
  2020.08.x  | 26  | 10  |  0  | 36  |
    master   | 128 | 163 |  0  | 291 |

Classification of failures by reason for master
-----------------------------------------------

                harfbuzz-2.7.2 | 59
        host-sentry-cli-1.57.0 | 17
                  cairo-1.16.0 | 13
              asterisk-16.13.0 | 10
             fontconfig-2.13.1 | 8 
                       unknown | 6 
                  boost-1.74.0 | 5 
 Makefile:753: target-finalize | 5 
                   libcap-2.43 | 4 
               apparmor-2.13.4 | 3 
             ipsec-tools-0.8.2 | 3 
            live555-2020.08.19 | 3 
docker-proxy-55685ba49593e6... | 2 
               libupnpp-0.19.4 | 2 
               capnproto-0.8.0 | 1 
              cryptsetup-2.3.3 | 1 
                 dc3dd-7.2.641 | 1 
                  dnsmasq-2.81 | 1 
       docker-containerd-1.4.0 | 1 
                   eigen-3.3.7 | 1 
                flannel-0.12.0 | 1 
                 fwts-19.09.00 | 1 
                      gd-2.2.5 | 1 
              host-guile-3.0.4 | 1 
                  imlib2-1.5.1 | 1 
         libcpprestsdk-2.10.16 | 1 
                librelp-1.2.18 | 1 
                 mesa3d-20.1.8 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.10.1 | 1 
                samba4-4.11.13 | 1 
                   sdl2-2.0.12 | 1 
                 uclibc-1.0.35 | 1 
                    xen-4.14.0 | 1 
                xfsprogs-5.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/82469f7ef842d5625c1b4e18f8d60b3f992e3397 |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6e92c0d936a9d82ace1150e074224fb73ae40acf |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ba57d9acc545ee96387e37475af78a54b062e1a6 |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/924181378f69370e61a68cd44e0a5760bb3f2051 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4a90b74fb278fb5539bcd048fde4b95e5ff23e59 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7ab93daf5f66b29cb9f0239f36553be3a94bbd81 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/511e4a80d9e9a1cf39c12469caf7db21b928a342 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/028492922ade2eaec158a8147885407a33b98b72 |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/159b03a26358a224aa67f887311b31f2f0c346cb |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/56837e340f17d24602f35122c313058f86528a67 |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f596ccba0d51e1e3a83fdc39dfefab79d0570b77 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f7bc3877b60fd636064056aed4c136db77cc0f09 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6ee8b6fc063ad492ee412948f96f8b6fd3d388a8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f7c638390ccd5ff1418178a1c17840b0f6c0ebd9 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4c71a538da61df3a51a57c0e35f6b300f60fc517 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/1b1cf5e2dd26eff9a2ed033e1f272f3dc0502ec3 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/38fac0ca229f09db8949b71842089f8f40980e06 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/1ca9778eab223bfff327d13f670270d717d284cd |     
    arc      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8ebf0c78e19857b910be3f7f65ee44762293c1d4 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/85a7fb77614d6f4fc25b29b94725507be9968a49 |     
    sh4      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f888eb47fdb661204303b53b7e1a5ad375c0f7e2 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/e996275b2ed1df37fee245a2e63557448ea9c167 |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/d008605a4b0323c82a34ad6fe138b9ec9a3a7aa4 |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/151dc4cb3738334ead699598a2270bb819bd04ed |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b6ea95cab2a6227566bac16847ff96d2a69a2654 |     
   s390x     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/965034b40c7a76069ccbd3be14e7a3bdc511c8d9 |     
  riscv64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/49f343d0451913f163dffe0ea04c46558a97c56e |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/70e8ddc8bb884b57406c2bdd68f1ba9881613943 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/e42fbad8271a5df5f28ff6a81cf79578eaff191f |     
   mipsel    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/36af8cfa06336bcea1fb73a5a766bf76b34720ac |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/c460c8f797d66dda4336faaf1b89b2245eeea56b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c888c4e745f81e043ac6efe9469afe19f49930f2 |     
    arm      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/8d9e2a8843184165fc344dd3ca2e94e767a082c5 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d4d9a2ae9764d7a7c9fe6c82eecf09ba2697cfb9 | ORPH
  powerpc    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/f59c1044cdd8cfdd3cf434d6e01930ba97bc8525 |     
   s390x     |    docker-containerd-1.4.0     | NOK | http://autobuild.buildroot.net/results/cd40d863e520a4453a9e612487316e2c0ac034ef |     
   s390x     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/b6b93cac3ff18030515c7dbaf04f7db596f228f5 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/b5eb06fc3cf7a6eb7af915b6704412b56a64d8db |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/fb0b27f72f6de15ca20ef645b770d15438533886 |     
   s390x     |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/5b21433fe1d1f4147c5c81fbe3ba7dc83ee255e2 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9155d2ccff2059c229ee0c14dfa916376f06bbfc | ORPH
    arc      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7170b5065a7f57ea218969c2a9fbd7e1596c9ac2 | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/09703ab784b52f5c60318376effd421125eae04f | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/febb27f4620f377cd7b7ba065cd18717ce0acf3b | ORPH
   x86_64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2761aa27a4fee7da21fac54b7f6edeac954774a7 | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9c34020b8c8dc905a460fcec958e82188f1597fe | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/402fa92ea5f0df1f23958deda7cc9fde8bb6142b | ORPH
  mips64el   |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/de02ed05c7178d8478d81b549f0a586cdcca411c | ORPH
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/f4bba737ac7a6546f66419e8a4517e3458240f0d |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/312d91d65b6a62b2092dfe20e7bda327bcddd460 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/29dad75701de10a37d2b0ef0063d7cd0ee0157c9 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b61b009a3d0dce5b54915609795d1fcc827d39cf | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/4c16a3f776e75ab6cfc3a1fe583d3c19c80a51a2 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/72ea7cd7f09b0ac03a80ff10fb16970930eb56fa | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b77dbfbd8ffab75a63ccc2f676a71ad9d8751a76 | ORPH
 aarch64_be  |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d33ae376748b70aeb5002948d295dc87fd065f50 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/7fb70f272cb89f82fe3cf5194f6f9343b892eac3 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/14684aadd029e3986162ea78675ae95d434ff5da | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/bb0d2bcf26727b47f3886f5604bad978cbe66333 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/7dcf455a6bc5dad21002d0c15a1aa52aec1391d0 | ORPH
    i586     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/ff774d46c026f9ee0505e39f154d583a0076a9c0 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/187574c7a2e484d97ac58baebf84e52b378b4b6a | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/aaae65e763cdb69b00d86d48cd293fc43a1f0ff9 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/04586518c6a86d15d184910f4915c2e613e07696 | ORPH
  powerpc    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c50edb46fce1d08891c22afa52ebccc328829e06 | ORPH
 powerpc64   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/5e201fae3199ed1e60c2801dd97a626c4d10c162 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/648ae6ed5a993617e08abb6877eefa41669083fd | ORPH
   x86_64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/a73aa2e8b95743d69cad3e5e14a3ae88080ce0df | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/3cc4ce3207a253186a9c4f8f5151ea0fc0854a28 | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/3af440a190b89d693d7a082c89daac48e1d44412 | ORPH
  riscv64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/59b599d214e7fe5d0877d00bfbc9342f07881b65 | ORPH
   x86_64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/da6f501817a300045ee9dd4fe9f1583c79986be0 | ORPH
  riscv64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/1b46a9ae6bee4ba7f80db954f30c5bbd89451918 | ORPH
 aarch64_be  |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/650fabe44788a70647ac0eac6d1305cca771772c | ORPH
    i586     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/069816d657c470d92be0cff15843bde27da14df1 | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/04433d5fa82525ea3969d222bb9f71522675d79d | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/e471b491c71e6ade76ba859ec9efa8d0362db8e3 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/5a5e8eded97759e60fc8d8948b077b9f784cbb53 | ORPH
   xtensa    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/a94673e1d541105ee43fef99e7358a3d81b4f9e4 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/9372420d012cbd921b23d3972bfafd7a4fe4853d | ORPH
    i686     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/dbf2d47d771c4aebc93fdeb7b5c9222e37c57a78 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/77aeff3ff32d6be8b645915430d63b4e5d9838b5 | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/6f62d2d9c585c8c28d137fee9be1e069d0ef7765 | ORPH
    i686     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/7ae6e86c5fdcac9cb2d728b1f17184835295b505 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b7d3d6ffbc8b50fd910b653ea4c06833e546c398 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/fdaa29b976a483aaea45646876a8f7901c5c5533 | ORPH
    sh4      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/0851997ee520a12c5a99667ef0964486b1d9ed59 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/4532936195f8e826f97d9de16e3188426b90545e | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/ba98c441b3848c245dd96a79dac0c4816a013e7b | ORPH
  powerpc    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c0af73d40f297c21a99fb8f282624b3db0c0cba7 | ORPH
  riscv64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/188cd88ec23b5bff925d35b9ba964bc384c6ee7a | ORPH
   mipsel    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/ca0d9f86454184b3c9e085a8254a5ce8b749bc89 | ORPH
   s390x     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/f1f12aa3d9c5d44a175429020fb1f894e41769fd | ORPH
  powerpc    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/3bbb8e6940ba7c47c8a3a462ec760462dac07055 | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c27f4b9e04b268cc4bf558bde56d235fc33470d4 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/4d0fbaa359beac15f8fcd805c9e686481df95cbb | ORPH
   nios2     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/70aaf5f4ae61fffe2c310333cc620f68c6288a31 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/6c0143323ee0fbfd8a966a020ca9d4bc12d36c46 | ORPH
   mipsel    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/db71a04d9e9b72ea213d0cd2c2b907c8404074a1 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d49de1b31ee6fc950210be4c7a39708ab7b6de04 | ORPH
    sh4      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/58fcecf5a794f308e7ba0e060f558a4989d9b46b | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/57b21f8f3b374c2d0eda39e7759fea82ed6574b5 | ORPH
   mipsel    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/297f623bb634a13c7b1522fadbf81e870af338f1 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c89f2fa37ecdbd7ad9691d8a5998e0a19c5a3b08 | ORPH
   s390x     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c47f4b9aea615b3844503d768caed081de0e4a77 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/5d3e25248f27f69b7f7dfb1f286fffb558235350 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/1d46838794c975d17c431175a9e4f22c9a3cea65 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b0cd1fd3765a81767b06aa68d5542133ae6427cf | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c9edbe6cea63bbe0c6aa451e3a3d9fd9af4a1e59 | ORPH
   mipsel    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a8de61c7d156bfe6cfb06f7ae42f61cebd9f98de | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59959d7a085ae995f464bf6bb1024a25415032c1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9c85ce9c4c071b8c8aef943b31d29e6b717ce035 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8bc98f7adb2fde1be5cb535084b30bb146c96238 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a52e15fe21b001e782dec16b50240b1165bda228 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9f8ba5954e5305f9a59ff9975e9f6bc99efffc51 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f4a8e9ea65bf6df98f478068aaf4f74d25a914e2 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/217f98703855a120d47fa66d0520931e029195a6 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab17c092182a7d6a4e8a12fe6b61d5d8cdf07230 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d108d9997e4d0994b5481ca8426b01726dc1041d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc332a06b3aa4fd3e7c9ca384141f96fe40a2414 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eadbec62d13fffb00f3c51a0e5dddb35a88ac43c |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c86c0937d76d52899e180851a8b4499fd7226e7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/340e3dccad2bec117b863a7bffc8a3d10230bb21 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/395e5ed5badc8b88ac0159d257dcf6e0c4a81f7d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/172ba25404a41b8a69ff99d54c603a6672d8dfc9 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7225500ab0d49f70232ae7dd2c3488c9a533f701 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/408d37546d8fa2ecae98baef6d3065336d4b1d0e |     
  powerpc    |          imlib2-1.5.1          | NOK | http://autobuild.buildroot.net/results/2128cb3d6ab95af0b4e6aa79713825626781ee5f |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/5cd0528dd7c736f5e86479c21bb315e514dc4ca6 | ORPH
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/06def6ada780f3ff0ffac6fced196f7e0b738115 | ORPH
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/46da3b55a87b822b8d5de5897d93192e48d091fd | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/4378292baabff7a4923a8046e8644a9a5d8ad32d |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/9b224f36b6d6d300990059ea121fe83911d75a84 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/733922b29bd392914054e215a6a06a67f23a81dc |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/ee94c2e412e09e4c7b9cbf6cbf50d5abc3c4d7aa |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/4ceb50809bea1e21882905f3995185c8908fae5c |     
    arm      |         librelp-1.2.18         | NOK | http://autobuild.buildroot.net/results/e09f6eb989388cec2dab06391a8b6580aa0ff118 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/a6c504fcd59d2cb33d9ad3d809fc3dea3444d407 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/1781c264723b0f716150cd6f63d64c3844cc6291 |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/c640fc9efbff8c9c9c72d004f37b29470a9f15d5 | ORPH
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/0d79db9dc1bade0eadc5a8b0db0ca72a7eaf500a | ORPH
  powerpc    |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/8a91bbd7bae062af11213d8eab3d0521cdb3cdc5 | ORPH
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/ea684dcfadea51979d1ed1d0516f57a1d77f168a |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/0206949a602a31d64520165d7fc8238a880e5aab |     
  powerpc    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/62bd6b77359e8cebf65b352ae4d14438e36c1002 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/ca49a14ec5d7249e4632001091a5d45d7f860a77 |     
   xtensa    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/0ab37b0545be136c4f174af64e102729544bfb38 |     
    arm      |         mesa3d-20.1.8          | NOK | http://autobuild.buildroot.net/results/0c1cc23719ecb6c6147cefe5352a04f3f7fe488e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f13259814ff043950a006ac4bbdd3caaff7b8552 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0f0a3d72e69fbea855a396aa00fc2c1c57556b30 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2f08e022bfb99dddc036947b115ab3f95dfcc80f | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/e085c55a0e744ef64aaca97451aed060e34d1e1c |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/63b83a9c052b290292e8fd7c7507e8a8819fb270 |     
    arm      |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/ab2be69e8ce703c3481be51dd1df42108aa690da |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/35a98b418ee130ae19debc8090af89156f6eb297 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/402697f0eddd757545cb5f60a2f7509e0e04c098 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/76a9eba21e8d8cbb4c1411eca3466c1a867faea1 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd626e862990a1bbbf90f8bd6c1ee9a7c6d46c10 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5f164cf7d07f686c517a0bf3203e487ca1ea1f3c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee11ee646ce62518d0ec563e7e523242cb237646 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d04fe622d35b781c01def2c38b25d47346c6903 |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/fb78d1bcf20fe4a14127e0e39af3f996fc4865cc |     
    arm      |         xfsprogs-5.2.1         | NOK | http://autobuild.buildroot.net/results/18455090605f3691282778b6a64a624b109037d6 | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 3 
              host-grpc-1.25.0 | 3 
domoticz-0f411f781ae4fb4a82... | 1 
             fontconfig-2.13.1 | 1 
             libopenssl-1.1.1g | 1 
                qt5base-5.12.8 | 1 
        qt5imageformats-5.12.8 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/4219bec4a04f34e42e84faead2ef6a1d3d55df94 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/20bf63166606390598b6907939ec9d373b84052d | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/db3a3b161c9fa1cd16a1ad67c268e40099194c07 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/50f904d75e9542d89e5e411d6e89c4da705e3947 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ce4392221ab06619fd205a9f93577fc3009b6097 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c8a5c3c203d8449e724ad972691e03e0d1c160d |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e1d806078ee179b08ae30d97490c8e43115425ee |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4b6383720a06d3ffbff91f57c0a1f6b8e6da0c80 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/6c453f534a8e19f085dc6595201d554f082483ef |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/b9782a6a5ccbdb582ff195d10b53525106dcb7b8 |     
    i686     |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/79741ddad1d5e14f61080c1c3a75081bdfad1d09 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/60ac22b1282267b5f3773fdef3b5b518b0484985 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               target-finalize | 2 
              host-grpc-1.25.0 | 1 
              luabitop-1.0.2-1 | 1 
                 opencv3-3.4.9 | 1 
              openjdk-14.0.1+7 | 1 
                 rsh-redone-85 | 1 
       shadowsocks-libev-3.3.4 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
                    wampcc-1.6 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f1e2d9e9a118dfcf0efbe0d4079f26847c409c4f |     
 powerpc64   |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/69188ef526c04bdf2dccb56da1d179cf178bc646 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/17ea8c0baf11be2680dc797df6417c6605a0dedd |     
    arm      |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/753ed77166745860f7e52dd5c027a8e47979edfb |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/7da2107dd001f6b497b8a58d959f4134d5806ef7 | ORPH
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/7994d10770a4f987843322e29c8cf172d466f40a |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2112e76afdcab2927c881bb0a89ffb13e4bf2c72 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/689ab33533b843f224ea711dbc643fcfd499c30b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/753ec5b32bfd13bc2bd6207c846f75cb96461dfd |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/a667630b4bd93fe00a2cbff4cf24ef1de54d8eb1 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/156abe80efce1cc5d33d890252118a8614bf9c17 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apparmor-2.13.4 | 2 
               host-go-1.13.15 | 1 
            live555-2020.08.19 | 1 
 Makefile:752: target-finalize | 1 
            qt5location-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
                samba4-4.11.13 | 1 
                suricata-4.1.8 | 1 
               target-finalize | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/79d833115b7b295c52930d66b9217f7a3b1d851b |     
   nios2     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d1ed5b59a6015b1d8474c7d2314e3e0b2f5aa607 |     
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/6cbf74e458fea0fc7e2e31db2681b3814787c29d |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/fdfa2b1174b67efe9fb5d3f3e653f753fb550676 | ORPH
 aarch64_be  | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/e3e5fd8a915bf337c835d041af4200fe402a5184 |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/570d6c40ec0402d318e80e6e3babed122ffb7178 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/b735058f3cb260ef70b32bc3999fd7defd9eb576 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/fac4066538b87dd9190a6bf1f639784500bddba7 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/d465df70ca1984d165def89e050285f329d3d6d0 |     
  riscv32    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d58c69810a7a84f1a204cc6f87721647637188e0 |     


Gitlab CI results for 2020-10-02
================================


-- 
http://autobuild.buildroot.net
