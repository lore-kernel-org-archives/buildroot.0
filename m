From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Jan 2020 07:18:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-28
Message-ID: <20200129071810.E1BD32039D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.11.x  | 18  |  3  |  0  | 21  |
    master   | 79  | 77  |  1  | 157 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 12
                   mutt-1.13.3 | 7 
                apr-util-1.6.1 | 6 
                 libnss-3.49.1 | 5 
                    parted-3.3 | 5 
           host-doxygen-1.8.17 | 4 
          libpam-tacplus-1.5.1 | 4 
                       unknown | 4 
      host-uboot-tools-2020.01 | 3 
                oprofile-1.3.0 | 3 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.14.1 | 2 
                 mono-6.8.0.96 | 2 
                    olsr-0.9.8 | 2 
           uboot-tools-2020.01 | 2 
                      bash-5.0 | 1 
                bitcoin-0.16.3 | 1 
                  cairo-1.16.0 | 1 
                  cc-tool-0.26 | 1 
                 exim-4.93.0.4 | 1 
                     host-llvm | 1 
             host-pango-1.44.6 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.3.2 | 1 
                   mimic-1.1.0 | 1 
                   p7zip-16.02 | 1 
                qt5base-5.12.5 | 1 
               qt5webkit-5.9.1 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3a31eb76691720f265f9db5e0c6ddac251553e4e |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3f16aab41942f29d69f530c0ae35a06be1345178 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3bb2c80e298528f47ab9742f9282cb08bca1bf00 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3d027aebc9a5ddd0d9c1d4512bb9df382bf5c963 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/65634fdfdbcd9311f90733016102c50027b444ce |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/90d22f6f8340604d50fe4140762c315c3600b328 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/37a6b023fefa0829e6f49ccd266d25902f6f0648 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/5ec25926a3795e7e74b13f8922c7dfb6fbfb3287 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e26e23334b451db7f1c24a01f9e1e4db940ffcf0 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e6a075b825ad70b6bc16f47ab0c1df275967a9eb |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0f952f4cd1edd84ed7457727fefc0c72ed7e3b82 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0ac7ae69af806ec2246a339e5edce2df2f8c01a3 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/16237c6b37d48dc47706915da3560da473032bd4 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a2f36804c6496f3bd9ef93a5877c51a1c601f1c9 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/026d84b22d8666d559b46e9b7def8aaebd381cca |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3903cea81de83745a8d372b443d16d218d835f1d |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bd198aac0564c8ce47d3ddfb2cc49809b2822568 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b3a34139e5d39f6f09b9ff30b670d78ce36470be |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2571d9135717f428ebf3ab10e6320a3a6e768cc6 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/821d9ae774cfa395f306f19b7b36ee329da6385f |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/1ea55c6bbb1feef6e28435c9dd8df14252b7d3e1 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/779fb3345ce8d80c18a2fdeca0d9fe83f3ddea87 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/ac57ed3c268d2d6a46b5aca3efd74f871570ef5b |     
 aarch64_be  |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/bbf78752295d8e57797895777f882e451b92a935 |     
   x86_64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/70dfc24ab42079001a977cbd868ddf2c8e150fa2 |     
  sparc64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/6ec1a9da03e645641b11cb2a7d7fd3141af24d0e |     
    or1k     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/428e8a8c60d3e4b6ea90eeb035ecce04d666a389 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/65f178894c7ce54f7c188e5fa940bac42f6dfdd3 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27aca10dc915e6792bb02e90c1089ec01551b37b |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/b047d06338f9d2ba0ed53810edab2f277e324641 |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/1fe5ed8dc882536b14618dc06c7926e0e0ca982b |     
    arm      |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/2b49ee482c56dd627918fe8589b8c99da75b225e |     
  aarch64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/d01c34cb2a41373a1fa7777519f53340c08e88ad | ORPH
  aarch64    |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/db3783f98365aaceb121d2c711dbc9922c080f0e |     
   mipsel    |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/af89e360d034407541ef8264168c42f4b9339927 |     
  riscv64    |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/0ca1b5c2d4750ab61fbd19f9860383ac28183eda |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/15b180a93ca42b3d74e4fc88cd056c6c2c704db8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/a4d5ae36169d6d4184b8973bff8b8bbe6512e3fd |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/107d30aa83ab481a20ae29432ed2f11d9eaeb80a |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/aa93eaedf3415208d193b9c4fb2e619cdd994dd0 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/b4d2d970d1766a75f5ba35b32d74e37add02ecdc |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/95bfb69b18660253df50a9f55b31b99552659c2e |     
    m68k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/311aa9532bc6a1aaabf920506a94de8e96ab5a8b |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/9289688574f4080588f1aeafa993259ec903e2e3 |     
    sh4      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/02da9c77a14e299a70669cad1215afb5a140ffa1 |     
    sh4      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/42626257f8ea1777a0b4ae8d9cb901525c1618fb |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/a335c3aa9901de34c5c4f408ba5b147d231c841c |     
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/f0920f205b0ee31190868ad238c73ae85f58548a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ce464c471f63a40363b7c5301169ec0d4dc456fa |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/6b262b1d7cd8db952e38ea2cac2cfe2d40d14cb5 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/adb13bfc31ec5daa6a2d9cc803365bd110bfe124 |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/3e1e238a068cf21382f48c0d3e9330c0bf889fea |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/47ebd41220f0ad2d44808bf00f6968c995a86ee6 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8dacd83898f07fb5afda6d8c1e731409055b12bd |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7a834c538737b0446623b09c8d0677cce09b1091 |     
  sparc64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2225001f5fe0f334e8afe3d3a16c9a533fc030bd |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2d1f3aa18101ad864378c2fd1e3128c023ad7a76 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/663d97c664cc54afdb14dfec3a40e161e7fce1fb |     
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b92186918cac08c5e2761825299758301068d646 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3d03a0f0158f070cfe035af212440439361d7cf0 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/8a1cafed843e0b06ad34107e7ad3b108793cd559 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f470d49ed8c961cae6350e947ebe816ba2ea2526 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/db5483d37a273d619eae37d8f27569e597cb7e0f |     
    arm      |          p7zip-16.02           | NOK | http://autobuild.buildroot.net/results/1ce4ef1da5a26f6bcd002ceb6fe100596a473c0f |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/1792cd2a162b9a208a803352765c09a615381d23 |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/ae0b87aa693a381603e01edb0cfebbc1c33a49fd |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c0e0c2c63d3522472b8821b02ba00080eaa5d770 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b20df79c65a5db768e5a364d6b9c5018a6777384 |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/910a3b56e9b2195f900a3da3d6ba9525c823919c |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/65bad1297d8ca5f445fe19dbc2ee3b9ac810e822 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/21952a2ecf79d050d856366b239449b917b267a4 |     
  aarch64    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/40089e837878dbadae8c065df04325cc3ab79a1d |     
  riscv64    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/a9605cc4bcee514b7cd9a809a6fec57608e600fc |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/127ad6b9fe1a4db4a8288601e56136658762d4b6 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1f002e4a1f53d44c0f1dfe6bc883f1d5562be9fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4a32e4c2f05b3265ad79cbbde35571d3d6ba87a6 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e3ca2ffddf7d71e9ce250f5e71323a29af5ea2ba |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/fb151b145d2f9d01447144cce9fe8a0c63e783ac |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                haproxy-2.0.10 | 1 
               host-llvm-9.0.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/3b4e8f4c6528ca199676af0cd757c6f2c3a72ee0 |     
powerpc64le  |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/3e94e08a2b9ae45f38432beba38ff701006760d2 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/8ef1f6862fe7207de118114c9dcbdb750824fda2 |     



-- 
http://autobuild.buildroot.net
