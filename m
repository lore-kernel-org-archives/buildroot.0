From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Jun 2021 05:47:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-14
Message-ID: <20210615054743.9577740328@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  |  9  |  0  | 33  |
  2021.05.x  | 39  |  8  |  0  | 47  |
    master   | 41  | 157 |  0  | 198 |

Classification of failures by reason for master
-----------------------------------------------

casync-4ad9bcb94bc83ff36cfc... | 13
               host-qemu-6.0.0 | 13
filemq-8940f34e0f1c8f25c1c6... | 12
                      pdbg-3.2 | 11
                libselinux-3.2 | 10
           host-libselinux-3.2 | 9 
             libsndfile-1.0.31 | 7 
                 rpcbind-1.3.2 | 7 
              libostree-2021.1 | 6 
                libsoup-2.72.0 | 6 
                qt5base-5.15.2 | 6 
                   seatd-0.5.0 | 6 
                   tor-0.4.5.8 | 6 
                       unknown | 6 
               memcached-1.6.9 | 5 
               pipewire-0.3.27 | 5 
                openswan-3.0.0 | 4 
        host-sentry-cli-1.57.0 | 3 
                 pixman-0.40.0 | 3 
                    qemu-6.0.0 | 3 
                    ffmpeg-4.4 | 2 
                 openmpi-4.0.0 | 2 
             safeclib-08112019 | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
             kismet-2020-12-R3 | 1 
                librsvg-2.50.5 | 1 
                 mesa3d-21.1.1 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.70 | 1 
          sane-backends-1.0.32 | 1 
                    vlc-3.0.14 | 1 
             xscreensaver-5.45 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/65e3f72cfa1a46cd38aee14cf001ed91e14ad6a3 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/69d10685ede7c25494148ac9911c53af42f8068e |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/16d0992231934cbeba90cd29d7edaa9ed6685983 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/769651aaa1b7a1fb0991c663ee08f0ecf1865e9c |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1349c90a7c215383b03e44a42d9e2805f7a4bb92 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/35356e1f0519a4b6fff3de11da8c730460fc2269 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2a1c10eb118510d8bc04679a8dbac899b0516624 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5ce5ef78ee1f872117760c2eaea8fefb10299ce6 |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/37376ede9200f09c2a9b69be80a08f55da5722e2 |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d52f5b9e322dda1aba9cbc0b9ad67d42c0986213 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ae7f03317f294287e25cfcf5f5e3c31bc27f9391 |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b83d21f4c4ce4557d3e20abc5f6b9b5a08cf9def |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/acc09ec263ed833298c02cfbea11c112885b18fb |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/14fe90f11cf904a7de245057f6ea787d74298449 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8d9ca2f7e32e4dff13660bfc8f196253bd0e11a2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/de8336db7cc91985f64cf17cd7c07a0f1a4d92d1 |     
   xtensa    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/b09c2838f8980f7138ac7f6e4da70bb5dc2a7fb1 |     
    m68k     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/815bb36313cfdffb85e501407ade40b205b13404 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/8d9995b24fe066c96e5943daee067cc504327d2e |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3b37c79c60dd6b6a89cdf0ee562d42ee2f93ccf5 |     
  sparc64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/16bcb86c541a46b8d07055ae2117ae26af4efe49 |     
   sparc     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/9ef638bb955829d0684091087f10087a78fe8516 |     
   mipsel    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/84e8e8ca3613b268a782846723decfae5b6a45ef |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/b5a55183dfd991e14ce63ddab9d50e8851010557 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/63b3ca108f64292a526980bb79a76685e646f57a |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/f5a8fae5f6475f4c9a53aed9ebbb602ba0d018e5 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/cdef1d92e8f4c480ae1fa37b1042c25466bb8c35 |     
   nios2     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/7a0a17a242a3ee27e47db1e83cf5e041fed1ec49 |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2e16d2afac0d17762259e3e1597423f6c5e0d0d5 |     
    mips     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/872d6ac91d76456d2785767d5fc7229a4be24280 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7e5b2f37078497ef5251c302681744cb454b1290 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/78dbe9805c018286f560cbd7be76fab5f9d9f548 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/343070adca4b213738aef9b8a2e14c5c0619d00f |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5333d95744253ad9afba4e277bcf6c45b294d342 |     
    i586     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/de1b4fc7eb072073a4fe76b3837497af492d25eb |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/80778570d4eac08ce4da64544a1abe0fbefb8329 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/1613075e3a9a035b851dd2b80949ba03dd19d659 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c605c62b584795c3484592e4efb5d3c4d94c33c9 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c8fd1484a7a62f30bcf1b4400664e731f011ad3c |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ce2c9ebf1e583b0abe9f61b6f8c0762ebd80a0ef |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/78bd58ac1c7b6fef65b35786232fd0074f9f3764 |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/fea90b538140e05f72be7cd4bc8a44967961a590 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/4865fb8b79f61329c39fad1579c5edab2d420619 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/70960c8293992ad544a646f3a03661155333e00c |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f9b6a9de4951e98ab3da4260b618e5686555cfda |     
powerpc64le  |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/17fddf4af3e40d18ace9ba4b97afb1952fc5c04e |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/a83ae0e8124400b3745dc8fba0111515e0ccce06 |     
powerpc64le  |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/283f5bee0d162ede7ec446842776afb7f9676370 |     
   xtensa    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9b0b175ad6e66439355d0ae5107d923701bfa144 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/964d77fe52bad68cc6dacb86629d1515a0bfbd8a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3a0d87cfdf54411321f8e849abe013e941d609a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b194f67f6427199351f4d3ac405526a2b45469ea |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0cbd9d966f8c9896fa1ba4b7b5052fd1a8540cfe |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/20afa5e0f112a285d9296da1629b2bf54626f32a | ORPH
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/bb4104301d522a45ecd878378f3a6cd7ec8717fd |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/d4ba0272877ae516cc839bb679548730363479b8 |     
powerpc64le  |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/23c86c3f7e50ee39bdd0e3efa78135a1a0e93731 |     
   sparc     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/36da5acfc9ad811be529ed5a3438ce475e4180c9 |     
  sparc64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/3dc5d037bef0c802fd109881bfcadfca0387f0eb |     
   sparc     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/01504fb2bd17c9b9f32f79aedc999cdfe636f6c7 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2b0052195913865b5c934cfc103f238ad748b47f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/0068c759a478c73aade0c344028220e1b22ee117 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/0c1233ffe51e4983cab963b6b198bd6f1049e42a |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2eef89e239b2912659a176d03f42d8fac735699d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b50434efc6e4a08f5597ae6deefe85b159f169aa |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/cc462a52dcf258c3c53c1f06504dd6cefcfad8f2 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/c94e2af9c3f1a29b643b623401764889bcdb66a5 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/e853cc706aa05c7ba8f431a446140a9a3c45ef53 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/fb1b025403d2e6a70dc42eec85f1da47fa888bc3 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b6082c24c755938a5a01357f289d186771469acd |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b694f66a1a654109e8b8f7b3efbf43c7940e3ba6 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c7d9264fbbd0a0bf55d93e5e3e377d35aea9ba32 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/eb7230884a976d438ef2e757590139f756ecf7f9 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/cab566b9a48646b389d6a5192f15ce008156c26e |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/e48b2e0650cf7b95c8f1811b87023dd15a0e2b63 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3c287ed55d395866d9ce2e29caf043b6fe41c9f3 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/412a77ba0027a684c4418d550200b7b5ffd3c8bd |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/0a2c5e1885eddde9c8749f1fa627c492a5a93971 |     
  mips64el   |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/3ef1f1a6b8951a981e359ad45a3a71e57b50f58e |     
    i586     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/fed85a3e9cc0724b049575aee2ffe7b8bd7f0789 |     
   mipsel    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/4e751979288b800d9768bae4129091ddaba4694e |     
   mipsel    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/34adfafe4a9ecf92df5fa60af025dafa96caf646 |     
   nios2     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/3e9cb5b26b19c4a45dfaa974741d529547b14969 |     
  powerpc    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/d64bcc343f7846ec039b9f186cad1db25afea85b |     
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/ca42c9e9663b25b0682057bc5898ad6c4c8ec088 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/08871daaed4c18ccf64f506ed9445ac88bb2d071 | ORPH
  riscv64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/88357d2ef80f48493922dccfacbea6aa6f6dedef | ORPH
    m68k     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/8e1e70a2dfe9bb8da5188cfff0258c0c6dd6f5e2 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e44cfc9fc859b65ed55ac78416d951fd892d47c9 | ORPH
  mips64el   |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/0db89a625abe43a4650acd1c67068eda770df11a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1597056fc191bf6b667e1c18749e71f2b78846b3 |     
 powerpc64   |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/553c261aa8ef1c76fb39d0e51e2263df4961120c |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/4c985b98b8de6a934333b7271bccf2c24c755b70 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/76e81f02a2ac7f0cadfbd5832a8a4866067e30ea | ORPH
    i586     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/b2a9ac5a85a61594c0494d20a87f0e5d1c7c5317 | ORPH
   nios2     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/26e3ba9e15ab4abe80e06b837e2cd479a09cf632 | ORPH
    arm      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/cc0c6ed39cee599ad30db21008f068121cebe9ac | ORPH
   nios2     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/d2091d434ebe242c2e853fd922ea04a9c1c3a683 | ORPH
  mips64el   |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/9d96cd617870543f7b124b45a27f50a98304bf05 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/ecf4485c0b321cc6fc5cc615d23c358039c71609 |     
microblazeel |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/56bd45e3622a075165e4645f4a14602d219a67b8 |     
   xtensa    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/6901abb7dc7499821d9d561d1b63fc4262a62aec |     
  riscv64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/cbde486268ca50b2f15aa84e6944f7d3093e49b5 |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/6f1571266ff0d838dbf3d31c7891de010e3c2ed2 |     
  aarch64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/a83281d24177a1a20444381245bf3effb8b63ae5 |     
   x86_64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/b890e16fd030612663622849a5c4b07fb6d87218 |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/53e9974865090a794bceefc843e5e6e4c0c59438 |     
    or1k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/80b2e1bb99972e1ebc9f012746fc82bba8e89052 |     
  powerpc    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/aad2ff5f6b135d7b8912ed0141582eff4baf0410 |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/82cc9fcc5d998ad3222353d5f96d897060051e6e |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/8e3a7cc28cede0ab119dbb35dd93b2fe2a05f6a4 |     
   x86_64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/f2f6a32b52e9e7627bceed852f7f7f17e044c248 |     
 powerpc64   |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/ca08dae17d9ef803089c9faeb8acbd1f0662da7a |     
  aarch64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/1a91ef0a4d5d6e4793a77fc4dbe30740850e2efc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1c0260997383858d5030d83b8a3907196b271411 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1218a914c72a08797027743517994f15c643a975 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1c95510528569e17c240639ed75ec589f1c7aa0f |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/30b8e6fc5c55ecdc9cc17edbde67a3b6cc0e98b3 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ba7d38b00e2dcb92be2ae2e39cdffbeb75cd9bd3 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f753f6a0fab63328cae6483a1eb395f1e17294d1 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/33543f3cc35c74d2a93f27f3aaeb6403b15994d4 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/dddedc98fb433258ac58e23de4932fb52b663cca |     
   nios2     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a6cb95ac539580551bca87fe5a214a700e49f175 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d09028ba220e07471b5183f0bf611d836aa19afc |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6858d3375f5d204e04326501fe9c2370e255d887 |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4e03aae8d8cce4237efdba519e3595027d06c2f0 |     
microblazeel |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/5d4ca56e860273770ea1e57c9f94e5efaf97a882 |     
   nios2     |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/6494605aa3fad81c52e33b323fa763ef3c304479 |     
    arm      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/2a5411765cbab91a54b26bb87c9762fb26124f70 |     
    sh4      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/e8f45a82012b940b2838842267b7d5ab158e47bf |     
    arm      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/6eb815286febb01610195cbba16c51a270ad3db1 |     
  mips64el   |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/964e1fbe8b16a1aa9caeb164b865461f2a6c3018 |     
    arc      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/d35389dd6e39f6cc6f7f01574b56f2c7fe3b0e12 |     
  aarch64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0f5d754f57e651c221a538d9a4ce84a25e5244ca |     
 aarch64_be  |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/253932d229b940437350517e6d20efd52b7187c0 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/06e749274eb27c7a85b5c9d58087c5695da75b66 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/419ac856054176315997d3b0c17a052ddbe4d3cb |     
  riscv32    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8a0ead04998d4f0a10675ebfc6735876cb8ee725 |     
   s390x     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/4e96aee716f4c277ad3a23a0010e4f6809b33a90 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/70197e3764e1487eec2c76971eceacbc867609cc |     
  sparc64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/08fbfe40742f77c8654aff4af6a134d1c5541f7b |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1371e4ba644230496fe7550f09e4f940efcee88d |     
    arc      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/9da96d124c2468f34cc60589f0ba48ad7d711cc5 |     
    arc      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/731abe155d54c2a5a13e455c667b4fb8e26c7b87 |     
    arm      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/1185907d5470945a107c3cc58339af20a38dd4bc |     
   mipsel    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/b371c42343449322deae953bf13a38a1123fe881 |     
   sparc     |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/eb82ac2bec6f7be99bd56604ed54f65434670c0c |     
   x86_64    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/8244a24f829152e98427d843e0894ae582c88c51 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fb51ab2e4b974909e66694a52ed579838077050f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a03325aaba562ae2277d1641f597226e91bc8e84 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d31dbb5213a755944444315b0e79b55b542912d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/805bc8e9be405bf753a19241c268927a14d770fa |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e199d44d3abf9ca6f5eddf778dfa31ea388ed3af |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/79eef74093a309936b094816a95a66acd037db6c |     
   x86_64    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/7a2792d60a191ba55bec7d3b9e2d5b3ef146bf87 |     
    arc      |       xscreensaver-5.45        | NOK | http://autobuild.buildroot.net/results/afa01e16bd890b519ee6b1488aa4d33d7033a6c2 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/54162006a74eb981c87408f248d7a4069a5700ad |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 pixman-0.40.0 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
        glib-networking-2.66.0 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                qt5base-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/9d52020d68dd115714e81e35d6f6272deb775dbd |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/1a40cb915d27841091a7b3a10f305aaa459686fc | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7ba60672858ec07f9b843dfd5968ea5aeb8c342a | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d9574c75dc236658ab3730ade4f40671cbb7fcb |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/06c30b59aa6e3d7e2d851560d19994a9d013c6d3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/19f23a477f43513f733eb4ab58047304a231747c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2710dc27760c84fb7b3dd2d413294ca766ab802a |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/bc386dc55eda8905d31f2cdadff98bf6a844cf68 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8f735747dc64934dc6a85bd4e39e38e08ca90a7e |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
  binutils-arc-2020.09-release | 1 
  gobject-introspection-1.64.1 | 1 
               host-flex-2.6.4 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
       python-matplotlib-3.0.3 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e5345b8e8307b97646091564bc287962d48261f5 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0fe631959bb2b876fa25678277e7a7074f454333 | ORPH
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/c0ceec070b7b2dcaff6a3c7d2f711d6a7fb3f812 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/57f0fdddd224e5437539cd51df38a7daae96d735 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3dc05f00107c168318f4f9e9435c5f1d74ec7952 |     
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/57d529d77ca9fe32cd04a358035898ea05560351 | ORPH
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/09845b4cb2f3751ef80d5a8dcee6bb33fc24847c |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/7d720bdd1c3560ed4925055208494b845f55c35e |     


Gitlab CI results for 2021-06-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343422806  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423227  |      
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343422808  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423096  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423098  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423099  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423101  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423103  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423104  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423107  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423109  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423110  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423111  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423112  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423113  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423114  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423116  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423117  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423118  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423119  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423120  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423121  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423123  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423124  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423125  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423126  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423128  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423130  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423131  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423133  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423134  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423136  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423139  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423141  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423142  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423144  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423146  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423147  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423149  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423150  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423152  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423153  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423154  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423155  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423156  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423158  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423160  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423161  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423163  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423165  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423166  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423168  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423171  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423172  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423174  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423175  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423176  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423177  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423178  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423179  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423180  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423181  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423182  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423183  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423184  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423185  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423186  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423187  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423189  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423190  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423191  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423192  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423193  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423194  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423195  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423196  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423197  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423198  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423199  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423200  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423201  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423202  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423203  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423204  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423206  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423207  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423208  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423209  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423210  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423211  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423212  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423214  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423215  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423216  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423217  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423218  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423219  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423220  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423221  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423222  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423223  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423224  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423226  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343422870  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343422968  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423011  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423021  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1343423022  | ORPH 



-- 
http://autobuild.buildroot.net
