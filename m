From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 01 Nov 2020 08:12:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-31
Message-ID: <20201101081217.BB43E87926@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 43  | 10  |  0  | 53  |
  2020.08.x  | 35  |  7  |  0  | 42  |
    master   | 189 | 136 |  0  | 325 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 22
              asterisk-16.13.0 | 10
 host-libabseil-cpp-20200923.2 | 6 
      libabseil-cpp-20200923.2 | 6 
                       unknown | 6 
                  boost-1.74.0 | 5 
        host-sentry-cli-1.57.0 | 5 
                   libcap-2.44 | 5 
                  luajit-2.1.2 | 4 
        python-m2crypto-0.36.0 | 4 
              sigrok-cli-0.7.0 | 4 
      spandsp-3.0.0-6ec23e5a7e | 4 
               pax-utils-1.2.6 | 3 
                   sshfs-3.7.0 | 3 
                  zeromq-4.3.3 | 3 
               capnproto-0.8.0 | 2 
               collectd-5.12.0 | 2 
               domoticz-2020.1 | 2 
              micropython-1.13 | 2 
                minidlna-1.2.1 | 2 
                openblas-0.3.9 | 2 
                rocksdb-6.10.1 | 2 
                    wampcc-1.6 | 2 
                  autofs-5.1.6 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
                    bird-2.0.7 | 1 
              bitcoin-0.19.0.1 | 1 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.5.2 | 1 
                  dnsmasq-2.81 | 1 
          fuse-overlayfs-1.2.0 | 1 
                 gerbera-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.7.2 | 1 
                host-go-1.15.3 | 1 
              host-guile-3.0.4 | 1 
             kismet-2020-09-R4 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libupnpp-0.19.4 | 1 
            lttng-tools-2.12.1 | 1 
                   mimic-1.1.0 | 1 
                    qemu-5.1.0 | 1 
         qt5declarative-5.15.1 | 1 
            qt5location-5.15.1 | 1 
                    quazip-1.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
                  sispmctl-4.8 | 1 
                suricata-6.0.0 | 1 
               util-linux-2.36 | 1 
                    vlc-3.0.11 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7b709172d8d565df42d126fbaee7c11fcbebb6fe |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/52ca88c4385bdd26177ee1485da5812fb290a58e |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ac71173356410b4d5de997b00290b74949752b55 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/06835552880e7876442b660fffa1e5875b3433b7 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/dbf9c8f21076f95e2dcab058e4b2bffab1b96ad1 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6db806dd0f4db3604c15a346cc3a91b2d2657e87 |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4ca4e9430776821d0a8def5c18398f475b36b7eb |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/86917508382274e075bf42e0997bc3c5ca6e9cc5 |     
    i686     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0bcb5fb5aa9a37ef05c356934022d82a42dbe8da |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/077bc508b364478508dc04ae44bace1b1354ab5d |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/049c74ec7ecd194db538c69b0fc71a6222739d13 |     
  powerpc    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/8bc5a791367f6aef936bf01f86c18e98013e3489 |     
  nds32le    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/aa2717cb71e8de85657482edcd14db7d9a556f08 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c3be2d1049281790cd825295203a8d6c7297d314 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/afe40e563d147347fbfb4c2d088e96384642a420 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5f417e490ad23ed9c92ad394bfa0383d693caf4f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/49e3bd003215a955b50135d310ab70c4c6086da1 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/01242dfbbfcbffbd8bf3c512ff709eae0e24c73d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a84382c8648f1828a55a50174b0fc506ec161019 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/50880abe2a0f09cc068a72b99781480969d23c9e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/98c86cafeec84522d01f43dbb5a0a3f44817fb0b |     
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/525abe0a5cca81ff517c9c07c092d85160c7eb62 |     
  powerpc    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/e5b56a4c6145c7f56dfcb58c84938d8445076811 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5c61a94088a74cc0ea627438c4eb6906a9d5481a | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/064fd549a3d11dc3df0c78af80a402fecaf89213 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/906bf8167b2cdbafe8b3b0a6fd2ff8abb8d8a475 |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/79b18d17ab66558dc14032adcd7135b0ed452039 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/10c3d17860807330ceb7bde593209ebe148a7299 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/a4d93ea2313f11d96ba9b562ffdac221b1ce51c7 |     
  aarch64    |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/055ab0433857efd94b8ab8d0e5a870f9053b5161 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/35160a15954b4bc13fa7eb4f76b380c38f6c67cb | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f52c36b400bb43ca85b99b7761432bc701ce05a6 | ORPH
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/f797cb7fe8c7e96fb2639f18b66ffc122f2e5c43 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/0817f534fa8d5d144eb7432033672132e0485c3e | ORPH
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9f734afe8899a48f278681a6fa22e98c1d51209a |     
 powerpc64   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/352e567e37d7000d8f003d7d24945bd3d41ddaca |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9471d226da604eb4db01ef67b04910e1db83bca8 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/38b6e20316edea622a5175c7e373b704ccad779f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/be6da9575cba519c13a3d06ea281ce96634df78b |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/1456f61930f13bc54dd032a039b1b867c2d8770b |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b2831de4bcec4193e752fdf4388ad686f1910cf8 |     
   nios2     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9a9299e44db291c7fcf4e4f017279671b4b7cc5c |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/09eca2e715dcfd2fdb070cd4229dbf0a2e86cfcf |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/3927571295e8399823ad0778e114567324fcc0c9 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/18ea27daa1ab064cbe351953ce5749342267c62c |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2543ac07d68aa1e88695c105c86a0bb38df5baa3 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4374ebb0dd48d32d290ec4e4febf1a90d7856e98 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/6d2ae7b02bbb7f670197f6b65ab4da3a7261b9d7 |     
 powerpc64   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/85ef2b5c45d2f76cfa75c0cf789d0a7b4cbef6ab |     
  nds32le    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8843d3dc86c3fada0e05681b039767eb063744fc |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d6157e0489c4899db8ea7331afdbc93fa708cefd |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/1da2f68efd70f61e3e2e6cd745d72468b89c8674 |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a04359b8c0183c1019629c60e045dfa697dc02d5 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f30a8872da0fabd9b9963b109932031503ccfd57 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b0bab2412208ec6bc7708b55327d9b8ce6ef70a7 |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d33293bfb2f8d558efa2d83e5cb71226d3e65c7f |     
  mips64el   |         host-go-1.15.3         | NOK | http://autobuild.buildroot.net/results/595383f349a09585f62c9b5e60749df67e5ffd7b |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1d81159567c3c7b1de90d466ad5c6a31b9764461 | ORPH
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/afe438ec1dcca8ef54474c98087118ebffa93e4f |     
  riscv64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/07774a4c4685a3a86c88cb38dc031a73cca729f6 |     
  aarch64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/e871ba5c9b2ea9eb6b7a839685a234e0a4edfe4c |     
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/fca101b49ef45fd96d14585e373a105f4d251723 |     
  mips64el   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/33618cae04286f214398073b719253b57040a513 |     
  aarch64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/6d0a4716e817abef548ee33848c6238aaf281f11 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/37f085fc109f038c2d9f37c7600f43d8abcb167c |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fefc092501892b84aff97a0bbc7c4a1cc38a8e6 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3f4e4ab190deffbe1f0b01d0a96b2331e9720f0f |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/479bd7419a86742f511a98b323a06f72825f7bcc |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/175a0520489110eb34cb1ba655208e2e695c220c |     
    arm      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/2da5782e32ee9c0e2a5479d375820c21b071e494 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/976dabb84662c5a888e825a8487a96d9fd6fa9b0 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/c2e55ee00e7c5c1c563842715edce8c86eebfbcc |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/75044e1b353b5584d854260882c985b9aad66e12 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/3fa62f8af9c644a0978d2dc803e516c7e049ee4f |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/78d310b0387f742608e4136964522c91e315a8b5 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/5946c55b3750df0ddb86e106fcda26cc40cf2385 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/4a976dbe705efdc6b7eda9fc4255f7fcc19a7e7c |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/e61356439cfada410dea5a366c22d95a0d71c704 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/4a5746a5d19eb61a69413386fc702b2ded88b0a8 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/7aae214c391718a299dc5cf7540c6e7a50d4dbce |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/bd5f0899437150d2abc5b8113ff3cf55ff24e02f |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/02ca84a342916f6cebe0aefb920ec81049c0c7f3 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/debc86cbe7c927babbaa2febb754131b2bcbc4f2 |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/ff062424645132258d1770c58fc96256d658272a |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/c744324124cccfee6d474bfe8e1610343444a2cb |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/fd0bc71fdedea6564eaf110d8a8a68a756bd5fe8 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/f56a4e8e7e88ed479f9195366e3c942ab657eb25 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/f6651b0096933f5fedae3221887114be7bde4e33 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/a8594b6fa992f6a6d9487b7c1c07b391b0baf230 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/84e9c58768942a7692c774af749ed9b7e24bb4ae |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f5355961e4a425c511c380d6b20fa09ed747d4a6 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/68fa913d2dd9e6399e7f10250de7d895d1cf220c |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/a31f1c88ac8224507d39bcb233c76994236db4b6 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/c78edb96948dab783717430020bf32ddca630045 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/9889ec98eefcb055caa1cfeee9569dae7466a178 | ORPH
    arm      |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/613840edba8ea161bb900f3b56d8d3605961c78f | ORPH
microblazeel |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/78dd4013ed37d670c8ce799ceb19e892b2f48fac | ORPH
    arm      |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/4906371771a6a70d678c13b95678a79881fe68b2 | ORPH
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/49222a83e24d61be615c09c9e7750872688ac169 |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/c292fce1a1a8d290af0c38467f3aab1955a816fd |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/280b742e0e05620722035a9c9346326fc9b315e1 |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e38b2ac83261c518097cd3d27e665723527b81db |     
   mipsel    |           qemu-5.1.0           | NOK | http://autobuild.buildroot.net/results/293f3f27dc00b571c8e62d8a2702d15887d18c7a | ORPH
    arm      |     qt5declarative-5.15.1      | NOK | http://autobuild.buildroot.net/results/3ba557e5aff1def602427b27bc115002cd591a9c |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/6c5e2b827df563d206f7c9ef4d8f00899d7dc04a |     
   xtensa    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/0827254cbf7f189ffb3a2bc32eb7490a6d2eb255 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7f5a136d95d936de6390e141529200faf9eb0980 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/95fe9dd63fd598dc10a3de8b0f365b6cfdd0d738 |     
   x86_64    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/1a43e4a6f4f2114085c4c79c94981f5e917dda62 |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/c5a1a0e28f2dd379e1e3a2a9a9ec2b34b89da73c |     
   x86_64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/05e9b7db4d11d83c427467cbebb33d68ac2c07fe |     
  powerpc    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/4a8cbf2cb8dd597bcf80961bc14caf5e7f291479 |     
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/9d096f0ba06d58182d331b970447f71bbf4faca1 |     
    arm      |          sispmctl-4.8          | NOK | http://autobuild.buildroot.net/results/65bfe6e3a3e7e79e42d6338be85f24a4b1d14bbd |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/a39e33ad9ff86d18423e60fda7c4c952571e4420 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/e88e09174328c9012b3d568abda1595532ec6e23 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/89ff8484c4b23c0e96a9b00d2d138df3ebc7f340 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/93daf79ed262f20ed53d7a66b9b62f4adb9a05d6 |     
  powerpc    |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/ceea69e39b0a8f97a758c66eb38a51f1c7e8bdf3 | ORPH
    i686     |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/732700c936f511701827faa22fd1c00816cc5658 | ORPH
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/2dbdc579c55543175716d5f739cabe2ad0864ed6 | ORPH
    mips     |         suricata-6.0.0         | NOK | http://autobuild.buildroot.net/results/63bfa83b278e1af827411bcee38e6cdc1086a08a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b6320ef058e682380064bef21c94c66bd6c27c94 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/82385fe96008562fbe043c82e1ad325403a51062 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/092840c360fb1505581550b44b87f3e81e71fd0a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c865c56f1978720dcfbc3b0622e84d212855497 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a37867aa29716fae66eb86f5451ab5daef11435 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6198a94ab19af35132f9fdb8f60cbd360d335492 |     
  aarch64    |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/520e9f18015fe26f93eb26387524766440e63f23 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/e7358089e2e8306b6484f5ca853ba59ae7f99a33 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/d5fb3fcc997ab8c4a3c908a6dba7b307d314471d | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5b81f43eb0bc78b739a187903e7d44baa05208b8 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6504a8a331817a30bd5513e31fa10e82f033cbb7 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/ca5888ef6aa5efbb94640c1c94f7ee894d113548 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6e5997404545060a68e168fc4c05be07437f0a34 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/51220b1b82774e8f6f6ed8593c58d2e3c31a1531 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  cairo-1.16.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
          gstreamer1-mm-1.10.0 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.9 | 1 
                 systemd-244.5 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/65f2b5cd126e7d62e113044bdb499316157a5918 |     
   sparc     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/cca80853cce4c0cdb1c582e3d0de33a2c71882a5 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1d73efce836cf44c067be2440ff226d73ad798de | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c37e15eba8f81c344da56e6dc6075f484b50d202 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c59b42eaad3e1edc06372ca58092b1f15aa29a78 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/40fdceedc95c4b6a5b6462eea1309d7c95096ed5 |     
    m68k     |         suricata-4.1.9         | NOK | http://autobuild.buildroot.net/results/acb64aeca17b2b9179dfd06276507059a7cdac97 |     
 aarch64_be  |         systemd-244.5          | NOK | http://autobuild.buildroot.net/results/588962788b6b9ea0a413a3b4cec696655863f08d |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/802bb4f117178f5c43f5cead836426be5a89ba0d |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1c25817e878632b28b192de58ac19e9d2be1befe |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              host-grpc-1.30.2 | 2 
                   gvfs-1.44.1 | 1 
             kismet-2016-07-R1 | 1 
                  monkey-1.6.9 | 1 
                openblas-0.3.9 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/609e336762ca27f8acd3f3f37262f24d971cb63a | ORPH
powerpc64le  |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b1cd8fb3a2c7e461634ec7f4a285891278906718 |     
 aarch64_be  |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/fa8c3d50fdfc507cd9ad562e625d1ff8f55bd5d0 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/9dab8b57d91ce9011169e9d80b012b0801a9eead | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d61b4a4303fbed5558bd86fd62c46e4db497402c | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5feaecb2f07f43f92f7bead51afc5e0b30445bd5 | ORPH
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/1ee1fe41760dc51d1dfa2f40dcde6836d7e45d88 |     



-- 
http://autobuild.buildroot.net
