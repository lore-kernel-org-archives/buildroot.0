From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 06:26:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-20
Message-ID: <20200521062641.986A5875D9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  5  |  5  |  0  | 10  |
    master   | 91  | 51  |  0  | 142 |
     next    |  4  |  7  |  0  | 11  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-gnupg-1.4.23 | 4 
              host-grpc-1.25.0 | 4 
                       unknown | 4 
              host-audit-2.8.5 | 3 
               host-efl-1.22.3 | 3 
              host-erlang-22.2 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                    mpv-0.29.1 | 3 
               collectd-5.11.0 | 2 
                 gnutls-3.6.13 | 2 
           libusb-compat-0.1.7 | 2 
               protobuf-3.11.4 | 2 
                qt5base-5.14.2 | 2 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                   cvs-1.12.13 | 1 
                hiawatha-10.10 | 1 
                host-gdb-8.2.1 | 1 
              ibm-sw-tpm2-1563 | 1 
               libgtk2-2.24.32 | 1 
                 mesa3d-20.0.7 | 1 
                  ndisc6-1.0.4 | 1 
                 qt5svg-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                 samba4-4.11.8 | 1 
                 xvisor-0.2.11 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d297a08246948c460a59cdee2c4c288a75336ccd |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0400f5da1fea466dba9ddb94db8ae48457f45b70 | ORPH
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/8402f68f71b1b0816a3a20c21c5270b90213c89c |     
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/b97a7e778c49875ef50f1a86d286cc3fcaee8b8a |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/d435eb00501bd23313e99e789a45affc3c951f9d | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b08725165eb033d32700066628312233130a5ebf |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/3535dba7780ee8b1d1e99597166fe95ab49fde9f |     
    i586     |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/d095ae9e0734ebe7bbd7baa925d1b9f2df979e38 |     
  riscv32    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/998bebbd2ad1b07e84fabdd5f1fe05fc1bf3f406 |     
    m68k     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/a585e55a15fbf937a3d626066e46c6e46c763760 |     
  powerpc    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/2f1158053073646bdb19be3043c1ae8eb061e8fb |     
    i586     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/f5ad62a1cc5ac54044cc0897c46d4e7c9cc5307e |     
   x86_64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/355ddc84d94334aa9ffe2bf7630f0a02966e0a07 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/b812021b0a6277108ed3f3bd32acb59a38b82b2a |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/89ef6003ae276372b347d040e57f3adf8ae32e53 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e07e9cd47389bb8280eb85c786bcecd28d23dd2d |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8af281631490bbcb917feaaf4cb10971c65cdc69 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/ca204bed044ffa3c23311e74c91ba0de5bcf76b9 | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a69d48546b137ee7f9e2ad7787a02f5295ef1b14 | ORPH
   sparc     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/c71cae56c85c619fb46d55bfe43a6b7328e74ca2 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/3547d39a573122b47a682444adfe175e5ec7a3f0 | ORPH
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/18d98acfee13be9c93b707ce98ef57f13eb6b70f | ORPH
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6438518aedca0fb172c9fc7e4285d48dd06ddc9b |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0baf21e74ee5e45fe0f7e29fe97070ee8b81b925 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/068b2c43d3b02a442e3a580b3827932b960797a8 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aeefe9ac4672f1884a19458b9c527090d50fa332 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b2d2ef457564db11a597513546a812808e99705a |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f63a45b8dc25e2c3a67f99f2bf84e2b2937d8667 |     
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f7e0da2fd2b40f944a4f312f6294b48828a6495b |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e0338bab90a4a8cd461de43c213e41f49f98791e |     
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/7f36fed5edac2b6f45ce0bd8360cefef0e36fb9c |     
    arc      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/ead149d519a49d434c3192d734bd5296243b876e |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/e1656cd56e374d3077950106ca819ce3f9828b9c |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/0742de308629a8489a3859bd290176369a0551b1 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/38c3ee444bfb5b36aef427fa364bfb13b3a67a7b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9d608c15bb325f0cab120c03b9b3a04a1bfaf31d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a67b85fb7d889bee992ab2c94da70cfd5743b840 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/430640000e22c7b4b08180b029a085a587a5a786 | ORPH
    arc      |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/688c56419d87f4a6e1e33313d4d9e9e026518c23 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/75cae595277969b8f49e4205b85ad790fdcdab58 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/dbb3487aab2ed542d93c15e3209a03876f2728ed |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5f1b7638c60df83547d8c69261825390c56dd7f7 |     
    arm      |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/824b3acddead38917c871b4ae3ba8da49ddee6ff |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d65c4dc331950a7fbc40c6ed22da468116301716 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/d985fd04a0f2ad85a9e07f2b45b397dac6365360 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d404451d9b9bae18ed12562455f406821b8ece2f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7a68d83487aa31ead5c04ea26864298927f55040 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/96a0a6086fbdc07fc0963f63e1ec64ecfd1318f4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/346ee3d62a9f5250be7e91dc965b37e0dd5697ae |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/67fa02ffb377b19cb7dc1aef6754d3d4654eda97 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/669c26246df125a36ddbb631dc59faeb038b6148 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 2 
                 mesa3d-19.3.4 | 1 
                qt5base-5.12.8 | 1 
                    squid-4.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/f48e260965caf79ee405f181b3db99d423f84888 |     
  aarch64    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/cbd85994f60363b4306164bee6acbed177e7b466 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/e25ca0031f9867b06d9601bb26af175f436fb778 |     
    arm      |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/4b4593d70e2c1a1a890829b7d6a379b4f717aa42 |     
  riscv64    |           squid-4.11           | NOK | http://autobuild.buildroot.net/results/5d8700b667972ad1a8f56b6258a36cc318548a8e | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 1 
          host-checkpolicy-3.0 | 1 
             host-gnupg-1.4.23 | 1 
           host-openocd-0.10.0 | 1 
             host-squashfs-4.4 | 1 
                      tio-1.32 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1bc961267d56e15d5898d4b385142fe6ff86aa95 |     
  powerpc    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/8c33b4d2c533a325601c3f5f39f30267c218d15d |     
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/ffea548095dc903846d069d06bc738088967fb03 | ORPH
  riscv32    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/5fa49c9e547084d09416351d7f2f49fdd11ab54b | ORPH
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/a01e4192562e56b4cb7bb88111febc1e8eb2daa7 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bca08e8ee3dcbbc948b1446c18b0746e63bad120 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3614fa9e2c9a23b63878687b3e0729a4b3a6c05c |     



-- 
http://autobuild.buildroot.net
