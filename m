From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Jun 2020 06:25:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-15
Message-ID: <20200616062606.0030688495@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  7  |  0  | 27  |
  2020.05.x  | 22  |  8  |  0  | 30  |
    master   | 115 | 91  |  0  | 206 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.73.0 | 23
                 host-icu-67-1 | 18
              gnuradio-3.8.1.0 | 10
                       unknown | 5 
                qt5base-5.15.0 | 4 
                  zeromq-4.3.2 | 4 
                     avahi-0.8 | 3 
             freeswitch-1.10.3 | 3 
              host-grpc-1.25.0 | 3 
                   libnss-3.52 | 3 
                  assimp-5.0.1 | 2 
               domoticz-2020.1 | 2 
                 rocksdb-6.6.4 | 2 
                host-gdb-8.2.1 | 1 
             kismet-2016-07-R1 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
              python-pyqt5-5.7 | 1 
                 rsh-redone-85 | 1 
                    vlc-3.0.10 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9984216278129784700578b8934025bcc9a80d70 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/455101032d5483bf301c960661344f41843e10fa |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/74f615263f55c76b61162e04a9ecbe9de1fac890 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e9c0c84a60dcfd2d73fc8ae6fddad78aad3d0bcd | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0eaf4b6827d0f65655e46a48d14b9ddf18225da1 | ORPH
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1c20e9d9fe53fabe15c1be90538a8776c8978318 |     
  aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/481cb38ed6b2254c432de8ae21befb5846632ced |     
  aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c6cfc687e50378c6000f9d245ea160f14f0fbfee |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b4647cbc87c327e29256b080149a0d653e6a8d95 |     
   sparc     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d8bb520beea1fd6fb5dd845735e9ac1ec76c30f7 |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b3c376a42ef01b3f56d15089a3aedcc9454a9ab9 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/169c06b1387853c94e992e2dd24b3b564372eb35 |     
   xtensa    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1d9fabfe65d1fd4e5c9b02429d2be319dbd5e4ef |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/4b2262b5869d029598241f82d21500ce48b6d5bc |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/fc5f4e90ac48a60fc73691d9b0262ca29b488b14 |     
  mips64el   |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/744251bacd517d4dde8f71cf57fcb82d0808cc2a |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/9cd400607e2b0c589147baec537f6425fd65bc27 |     
  riscv32    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/74258b0a9d2dcaa9ddeb131da6716956cff8806e |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/37ac84b0ff5b88ff23dc676c9d3505808771fc93 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1c3d984b522d57db5993a9ddcebd5a1c829cc0af |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/e7298e2f6be83de996d2ce5d72997a729d9dca88 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/be4db146439c9822718d9fd74bc9d6575813e171 |     
microblazeel |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f8fe7f3fd21c5a8cf92b5d6b3ddb9867723c953d |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/961ba0cfe5afff5b0bae0853c46b21392d2ff26d |     
  mips64el   |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/e7aad63b5e59644a798a2df90f07639da740e788 |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/634c0062b277242bd9249f7693bf6bbd6f6db7ab |     
   sparc     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d9363b7b02fbd841d76819755fc81cfbfeba0e16 |     
   mipsel    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c31872c3d3784b6699dc45f3bca473d901cebb2c |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6cdf9662852c2e7bd5f682748f03df2c553051c4 |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/c197cd630215e471aa7818811f2f8400a7566734 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/8bf1a65ab5ad107b92f7adb2ef9c4f56df55deb7 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/b8fec953594be9c357711b1d7b049f52ba32a997 |     
    i586     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/c8758aa83fced017e9e4aa52cd07d84d6f0bed84 |     
  mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/b9aca8631178471d019c3f4b09798e46318f647a |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/362bb79977a2222828577ff173c70d8c40e64452 |     
  mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/e57b8e98eba82185aa2fe28ea4f06f9b901fb3b7 |     
  riscv64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/c323d405a694f36aa926754e4b8ff566d3c5d1b0 |     
  powerpc    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/7c283c4653895de8139fc3b0ddd4c32392a5bbb0 |     
    or1k     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/c1c6ea2008a5958b972232f952ce5fb5eef47e1d |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/781d3a8727cbc71296a73acd643943c5a3606f49 |     
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/a11f36793a453203645a2bd83619b6da797d41e0 |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/7cabf13360b5b0117c0fed9a6eb65a4e33a4a3ef |     
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8bce5266e61f72ea576ac5210a829b11ad5c5d73 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/31fdbe58e7a8f24c49a31e5fbcb6b465fc2a8bd7 | ORPH
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/92c76affee976a110cb818729c1011ac17457f41 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9e3c24dcecf007e78b0773c2dc7baa32c2ddb792 |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f31d4b84c76e40fd035274f07ae764776cc53713 |     
  aarch64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/e731bb44cde64ea6c4a51f1cc31829f87248b8c6 | ORPH
  sparc64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/9ce4cb627ab3e822a2872a0ba946ba66f7320eb0 | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/4216390900408b307d23e57d2f5cfe46f9395da8 | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/aff9476839eb8fab2042ea3f173d09b6b25df81b | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/47c019f50e2bde803baa76b7fc9a457d0fc14cce | ORPH
powerpc64le  |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/22f5ae24cafa333dc574261bb7ff64a678f0baed | ORPH
   xtensa    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/bdb88e6cb76b2beeb7adba44cc74120a7476f034 | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/06b34c11a0b3da6951d8b72843bf5249a94d0ccc | ORPH
    or1k     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/aab5732eea7561564bb61939596c776b0cf79c0e | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/a6bf010ca9c1b61b607a091fbe3b96d373b71877 | ORPH
powerpc64le  |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/4aefcf844a31b7778bbd1b3a22264ed4c1afebb1 | ORPH
  riscv32    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/d5efe3ced3ebab5f033cbcc6c99b680f39f1435e | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/ee189ed2a784baf1af7ef7349c17257e2c455888 | ORPH
 powerpc64   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/38759ef09d277f76ba31f6cc3fb435c8628db210 | ORPH
   mipsel    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/43902b45fa8bbb06ce693b2eda392ec3856e5e1e | ORPH
    arc      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/f4c1d01aa77e8ee33af05e2d943fbac6e49ca69a | ORPH
  powerpc    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/49ef0419f1d431cec769062dfaf50c99a5534d5a | ORPH
    m68k     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/323e1b4c872b5f75d8b8cb9bfc81c6e94357aa97 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/0f328d73b8f1e285a9393a56f60dd69c84414613 | ORPH
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/bdbd33c7a764931b2066dd8b527dde2f5dc298b4 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/61bf50f73bb79e85c22e663f5fc22f4b9ccc0d3b |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/4437942a528ab8f782d3b97595e76bb690d3a409 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/8c13df27eea9762e458ce72b49b3eaee369624c7 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d5669bbec06bc892eeb0c677061be1e70bcaec89 |     
  powerpc    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/7968587ce336baffcec920c371b50b8e039ad8f6 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/eb7304f099c224b46025b52ea518a1e97f657f2a |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/44f5ad0af6703be93060fde077677214f06eb03e |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d6c11838c170255ae6344306399d3979ddb013be |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b862bf394d4acd676deff43dfe1da6f70abfe8e8 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/70641f29f94d0fd607971339f61123d9380a5545 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9b498cba553d5d2e9fd9f5f1b222dd7817211d09 |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/33e1d5c2e80c3fa41e310fb9a63fddff745b750a | ORPH
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f61feb972d8caca71ce8851ebc6764a1375d293 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4003ec98b47f15c3b01c5ecea03e92c721663f40 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d7a6201af4316ef46bd8798ffaccae43f1f1a5f2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/604a00cfadd4d51fb56d7c6b42616a4fdfec1219 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/521f69ecc787b7c9ae0a08debd46dfced511f8e4 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/ae95f219a18e2a6b478e5a61e06e2d3d9c7ed798 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/eb4d45c4285fa90e29306f1f2bf13ec97842245e | ORPH
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/a262f8cbb82eb00cbf92c2626b9554c33736d90c | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2a36c95752a0d45b20a4ccb2605c4108ffc593ed |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/38e27c513bcb22e8e73703b4594a2d44cdd13b3d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ad0c966b5d1621fd9e4095e883e2ea8649cdfc5b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8f6f982deb356fac0b094e6723bbf38f3e9d0c2e |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

       gst1-plugins-bad-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
         qt5xmlpatterns-5.12.8 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.4 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/b917e32fb75aede2c38edee57370b2d04f8f2b3e |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/000fb7202e3c2f65e0ec2742e3df35acf7dec675 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/d975b5a950713b66257b4021aee754076214beb8 |     
   mipsel    |     qt5xmlpatterns-5.12.8      | NOK | http://autobuild.buildroot.net/results/17fe1fa8413cfbfc21b9b9e63014690a8d33f9d0 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/12777ca9c687e8e8f9c8e9d37834e249296e696c |     
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/4ab9bd75e426d34cd45752ac15c1ae6db8f505c7 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ba734cd8d5b2fa380c5e39d75932c7d333078687 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 2 
                       unknown | 2 
                  assimp-5.0.1 | 1 
                  dnsmasq-2.81 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/53abb6a4c59a5467ca943680118f69a9197325d1 |     
   x86_64    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/3bfb23ab2170de146f0edf4a3994104de3738306 |     
  powerpc    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/2c5801f093e0c98258ac2b0c603b211173e00f34 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4a64132968c1bd5d81da6c9e14ee53dc687c2b57 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c2a2eed3c4255c0a8bb22a29f15cacfbc7ddef79 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/b293598cc35ce1a2ad3d07083efa41aff122cec6 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13f37635a6bcaca67eb9e72d93b5a89c3437036a |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/44983cae0f006682b0719cdf8b795863e366dbe4 | ORPH



-- 
http://autobuild.buildroot.net
