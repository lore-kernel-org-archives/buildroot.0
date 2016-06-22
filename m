From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jun 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-21
Message-ID: <20160622063030.5486A102DF6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-21
===============================

        success : 174
       failures : 110
       timeouts : 1  
          TOTAL : 285

Classification of failures by reason
====================================

                   efivar-0.23 | 13
              host-libxcb-1.12 | 8 
                  boost-1.61.0 | 7 
                   ncurses-5.9 | 4 
                flannel-v0.5.5 | 4 
                 gflags-v2.1.2 | 4 
                   fwup-v0.8.0 | 3 
                    owfs-3.1p1 | 3 
               libsigsegv-2.10 | 3 
                    pppd-2.4.7 | 3 
              e2fsprogs-1.43.1 | 3 
               libdvdnav-5.0.3 | 3 
             bluez_utils-4.101 | 3 
tvheadend-8e637f9f903f6d820... | 2 
       gadgetfs-test-undefined | 2 
      kismet-Kismet-2014-02-R1 | 2 
              libarchive-3.2.0 | 2 
                   taskd-1.1.0 | 2 
          libmicrohttpd-0.9.50 | 2 
                    lftp-4.7.2 | 2 
                   libxcb-1.12 | 2 
                     vlc-2.2.4 | 2 
                cifs-utils-6.5 | 2 
                 jack2-v1.9.10 | 2 
                     xen-4.6.0 | 2 
                   jamvm-2.0.0 | 1 
                  multicat-2.1 | 1 
                directfb-1.7.7 | 1 
                 mplayer-1.3.0 | 1 
                 rpcbind-0.2.3 | 1 
                     dtc-1.4.1 | 1 
                 mesa3d-11.2.2 | 1 
                mongrel2-1.9.2 | 1 
tstools-08f6be304040e7b8476... | 1 
                  connman-1.32 | 1 
                blktrace-1.1.0 | 1 
                mono-4.4.0.182 | 1 
               libcap-ng-0.7.7 | 1 
make[7]: *** Waiting for un... | 1 
                collectd-5.5.1 | 1 
                grantlee-0.5.1 | 1 
           libfastjson-v0.99.2 | 1 
              libdvdread-5.0.3 | 1 
                  libvpx-1.4.0 | 1 
               linknx-0.0.1.32 | 1 
             stress-ng-0.06.02 | 1 
          chocolate-doom-2.2.1 | 1 
                lmbench-3.0-a9 | 1 
iputils-55828d1fef3fed7f07a... | 1 
               netplug-1.2.9.2 | 1 
                beecrypt-4.2.1 | 1 

Detail of failures
===================

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9cb692e1be4efaa2842966970c2e8004b6d2c0b4/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c7a738220345c31e74e1ccb89b8576caa0464073/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5bb524a58575d57de1006ffa70be17ca713e7730/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/248ad9be93ca5bb1986a97a3dd065fa8438ecd9f/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a6c1d531a580c5a9bb4b6259d2cc09d6efbce152/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/217c7f2ab876cf928a494fa148ace8e57136e63f/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9f445f907ff685a2662fc484825721444b4fb89a/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ad29593578a71f9f47f0d1b4ce2f84ce340f28b5/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/33938c7dc584eb36e0b9ce48740bb6ec6f6fb4ed/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/6934cadbbe7faae580106f1a8d23565d08bc564b/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9c3e26a94297c72cece02c77ae16d10e5308f929/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fb6bda24c4db8f81181d3d3c153c78265757b358/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/4a03d6ed42e9d46a2f5700e0d54d77df2ff6ff96/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/60e305c69debf35f68ba8d184553f1af37f9afe6/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/c7a39864eecdaf6962c0ad7e026751c1074bfa67/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/0b2f8c57aa406138161f3fe40d3303465d34a80c/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ef26e25949283d45c268e7e9b7c5c71aaf2a2800/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c1cb54be3f00ff693fec648e372b6cf92e9bf6a6/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/5a9dfe2a9cf745e96d70ff22c94ec46a484372cc/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/513a8e2e63feac8b68a720ea39724f1192818e89/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/68c233ccb94983276db107e7ac73a79658eba9cc/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/362f3d34c70c53d47b5e402ab35f94ffa16644c9/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f07874d0c13e701d3b45aade37c35a616592e57e/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/73283288d5e08ce0428f83caf7d594fb6ef0ea93/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/da41236d0599728c07df04d0277baadcd030ec4e/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4e239bff191b1d5755a8766fb024656d632b830c/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/21100fda54c29fb2bc44b8cfba99109e04a13ea2/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/dd90aacd375e191259be9f1b8a110e585457a449/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d7f95f2efe232b08e6356d917e173bd95c536007/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/625be364ae3b382d6d819d25a47a220242f9193c/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e7c7e31e1c261e0b6747b14e6794b37ced3b6ea7/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/5092195940cba75c7df54263d5642c7075530508/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ed00deed4609aec584105bee867f38da328033b2/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/06d9a07d3e1ed8480ebf06071f0e47322c5c97ef/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0bd1cfa18b206268c831de5fe03a54ad88d258df/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f9d55074ad440c75a888c2ad6a7e4b7a95ad31c5/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c6bc143a7103c4ad81006eebb3b6db3bca371042/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/94103e677c80afcdab3379adfd7948d31c7cfe0b/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e534fd162a6d0ef728b987f83fd1c1b61565de57/
      xtensa |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/96a53b3ec666bd09f09c8a3e5b31eff73e3dd0fa/
       nios2 |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e0bcfaf9dd36d4992e507d18afeb1cec56048987/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bdd8137973c37824f6aa9261ee307f6ed21b9166/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/4c34e97de9257c71e606d8732c7f7bf92ffee0dd/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/a46b2a91cdf51782a73d6e7630cea7148c7be498/
    mips64el |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/b201bfc11bf395c613edee5f6ea6dde0cce94d53/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/214a571dd77830578b164695a493aeb82c682c00/
      xtensa |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/93e6dc6bc3a5d7be1b443da151985619428ca1e7/
        i686 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/24d22eef76343e8b2c7feeb36e942040129a671b/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b74869bb3d3a0b14290e78464abe45fffef98b9c/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/7319e1f5f6ba59b3b0ad946294c45dc257f23883/
     sparc64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/1e55dc04c1b468e16f8891253848764739948d16/
         sh4 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/730f805b0923c9d88087d8f17ecc6bc69f80abde/
     aarch64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/cf23792d8586125e1a2bcc59c9ff3820cdcc2eb1/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d346252d2148b463beabd83838ec25338eb88ce4/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/2f9c0989bbc55d53cbab7ca0e8c0fd181eaa734b/
     powerpc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/fc90a886ad10979fa3f58f6be56eb4038b27455e/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/0204377fe3dc655da6247acecf01d9e53f589f4e/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/96c401532614b91a3977935f2abcbc34945e170c/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8ef4c56538563a0800653597ed641af9e9d4455c/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/02bc8469380dc0ec879f1a4f835d20a26bb91cf0/
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/92e079931355935d6f43e125f859542f3a99abf0/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/5c9c537e633c209e0a21f68bc98a5959bf3a3bd2/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ed607f727a3a4820a7a4067be9566121138d18ee/
      x86_64 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/02772eb30acb3ca2fa39d3cab93bc1c50ac1193d/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/8c06db434797687d1a54c0bd524b1430f4d45460/
         arm |               libarchive-3.2.0 | NOK | http://autobuild.buildroot.net/results/36fa2ebf7d88cd488c7adb5d41322d3f3b55d1b0/
        bfin |               libarchive-3.2.0 | NOK | http://autobuild.buildroot.net/results/a131a54372e26cc12b9263f335636768c0bbab22/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/189e09bf1cd8d0dd1ec10b97e5587fb587deac24/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/04f424084fde2bd08d2af2cd49690cb975cc63a9/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/8b6757aa91923ccf11b5ae4a504687f5fc98ddc5/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/32f85c2fed10d2b5eefc58424b1dde89597cc498/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/13f7e1c702922ad8fa6ea289f16318cd3d070f32/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/938cb0b734040dd22aac116349bfd7ba718026b9/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/726d6391603e6ed6c6fdfcbc9d2807238ecb686b/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/cbb80290e196b2d6ea2449444afa56de6c9929c2/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/1d698b4ac9f36d8aa85b34ec77940d26f530d54e/
        m68k |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/482ddcc2770ba95fd914c238b51a7a9da870d5ab/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/631f115befd9a2102a758479134afad7baabc63e/
         arm |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/d8176532d47fbd8f18ca735171fbecb10a029aac/
         arm |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/752e1e9740fc1261bab1b6f69019d228ef55d418/
       nios2 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/3eae468bb1cc382b734380d4323095e683839659/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/50a160e1b1d6f50e1db784d92fab139d419d6162/
        m68k |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/6a1761070199249aec8a31acb7371ca5fa3b103f/
microblazeel | make[7]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/c7ea74dafaf71a0995b9c4ebd9e776188722cb00/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/069f7f6169fc3ee4fe2417999a1e5eadc4770b9f/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/b9d826947ca6b4a67320be8d16975d35006ef914/
      x86_64 |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/9394588c0cd1db0fb86952dcc472c33fa7d149ee/
     sparc64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8e17ecee437b7615f0448a3885bdbaa1bb038a4b/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/bb9156afa8b743b1b641e52215041c4546285c57/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/1c643eb7a4a892b06daac3c6a0dd637b3f6eb7f0/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d98281945b5794fd965ec240d0b89c8d4a30d61d/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/0e809e30a435d718f1cca752fe5ae902d75ceb07/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e9308c74c63646b68a424a7039a111ecf3db5631/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/0e9f3a2329076bc5599003d4f38d7f6adb3b74f2/
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/5e125baf6bd01d006a0259c6411df6bcd83a4c64/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/39da1db5d34bd24642554d0adc90094da10c0b3c/
         sh4 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f0e865ec62a1aea4a970caa65d369dba7b4bfc72/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/fcc0fb3fc48cfd911714e28daed241cfcc5024d9/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/4ab7b59c9777e2dc4e927ac95ab390b701bd73fb/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b2c11e47c5a1e5fa8909ab83711560ab40f68db8/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/be804fd1a3e9c0638d5d152889fba99b7026310e/
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/df350a4c6dab4eeff723fdc22403618cccc5ca14/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/6ebbde2db9037df6979e62434c0a54bf4b5ace32/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3e0b800edc44da3130a80a8e6e75340acc9526d3/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/8d8df89f972c9706f8edecec291139b649251e0e/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/dad98a96894c89bea5ce3a0ef675988d8b390466/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/e81b1d1b6983c5f0dd67de3e7a7d8eaf4c62bcb0/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a0b9a834b7fb32e1425a476b89918c519fb661b0/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2e3707dd1bc866bb0232e536f394147652d5aa9a/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/2c7c6576a7d43ff1d3df4d67f97b37cfcb5bc228/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/6ed8734b653d31142f4eab6f28f3bcb765663f40/


-- 
http://autobuild.buildroot.net
