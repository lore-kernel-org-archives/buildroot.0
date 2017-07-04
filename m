From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-03
Message-ID: <20170704063047.62D8D21FC4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-03
================================

      successes : 120
       failures : 134
       timeouts : 0  
          TOTAL : 254

Classification of failures by reason
====================================

               skalibs-2.5.1.1 | 61
     python-cryptography-1.7.2 | 21
knock-258a27e5a47809f97c2b9... | 6 
                  cppcms-1.0.5 | 5 
       python-smbus-cffi-0.5.1 | 4 
                       unknown | 4 
                kvazaar-v1.1.0 | 3 
               libsigrok-0.5.0 | 3 
    azure-iot-sdk-c-2017-05-05 | 2 
   cache-calibrator-legal-info | 2 
                  cc-tool-0.26 | 2 
                     gpsd-3.16 | 2 
                  libzip-1.2.0 | 2 
           python-pynacl-1.0.1 | 2 
                  bwm-ng-0.6.1 | 1 
                  dbus-1.10.18 | 1 
            devmem2-legal-info | 1 
                     efivar-30 | 1 
                   flann-1.9.1 | 1 
              gettext-0.19.8.1 | 1 
           host-doxygen-1.8.13 | 1 
                libepoxy-1.4.1 | 1 
           libmemcached-1.0.18 | 1 
                 libpqxx-4.0.1 | 1 
           linux-zigbee-v0.3.1 | 1 
                    mpv-0.25.0 | 1 
                 sngrep-v1.4.3 | 1 
                   strace-4.17 | 1 
                   zlib-1.2.11 | 1 


Detail of failures
===================

microblazeel |     azure-iot-sdk-c-2017-05-05 | NOK | http://autobuild.buildroot.net/results/1ad1c02eb866dd9a1b586308b11b4242f4321355 |     
        bfin |     azure-iot-sdk-c-2017-05-05 | NOK | http://autobuild.buildroot.net/results/fd0a1f71fec062a530bcffe95e501095657c0d50 |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/07301d43a0ab75a7e2c63484760de42a25da1a49 |     
    mips64el |    cache-calibrator-legal-info | NOK | http://autobuild.buildroot.net/results/e1b3dee917f5ab3961f3dea006720431444d0ef5 |     
      xtensa |    cache-calibrator-legal-info | NOK | http://autobuild.buildroot.net/results/53f6ea245bad653bff4299067eefceea08a60b4e |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3aab02a7700389e00555c63e3bc3c635d99dcf22 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1d670e042ab7e7bf0818a097bf06dbe931f68235 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/29ac945fcc227fbce59a28a232b53340e10552d0 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/16a78ac253c5837c7425ceff763a340d58d62262 | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/67c316fd7099d6f0054cd38df7049a0bc86ab338 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b605cde3f184b1ad4bfa05c249c5825a0c059c31 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3243fb9b280a12770e62b67058e03213d914124a | ORPH
         arc |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/2c5094fea20f99bda7852999be22950bda4d5c67 | ORPH
         arm |             devmem2-legal-info | NOK | http://autobuild.buildroot.net/results/1c69c77d7b378f6f76790fb5ca0078d0db0c40f8 | ORPH
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/aa1e5ac5972ab84c94e3c28d21ef6ff918029f62 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/08299a9dcfa7a6af57aefd9124062f9bcf19c1e2 |     
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/b343c514f020869f4ba0ef8ef1b3b16aea341392 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0bc4a69d8740ff6b9b55b4e05f03286d41cba798 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/75fa91b5b22a2238677b31149168b5ebb2f73812 |     
      x86_64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/839d6b230d3535ae1bc1d1302f9e27f74387d95f |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/76171367412947570bc95cc22515767085e24f34 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/ddbad733cda87da8d1a01892d00ceec3acb3d2ec |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/734ab515480ff411c1c38d07ff58500301da87c7 |     
        i686 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/852c33e7a1f409cb279fbac2d868a6ec93b7e4b1 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/abacafef4231f265476df756e5c945209423e7ba |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6153d96d19a4fe4f21c4c1e56bfc64daaf614a3e |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/76e4495fceb74f3e843574e06e11a57ae3671988 |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/5d140ed95e292f73b6770a5e5be717df844e4830 |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/1d9209505431a63d394ecf8208fce4eefb99a136 |     
      x86_64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/221f1b27d3daaddc10f59350f276659553aa174a |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2447d3da1482d277a0cad806a03aa8700a5288e5 |     
        m68k |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/0c247d040538f0f90407cb5dfef6e3a82e500bee |     
    mips64el |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/ed675ec96ead1702e39c8c91f01f6afc92d8831b |     
     powerpc |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/4e694a6a756f7437021b88f498f6d88492ce0f61 |     
      x86_64 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/672e00df8028471db4849d9cfe2207ba3bc4df0a |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/c87c671c34d173992af4c93e5a76905b46a2e0ef |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/affae2699038c45289b12b8c80778a549f19e9b1 |     
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a7d38d72834b94291eaff159da277b11e2f9d63a |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/29389e4dab7a0d51dbb5a644afa659b92c40dab4 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bd10294214c3b2484ba18686b7d7a2cfefd8b933 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/97e48e9c73d3588757d73f1bc2e4cd0777265493 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a9f74828364970ccb9fad46e298b38c2eb7ea126 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/95b1c39fa7288e28c89d0ce07018114dbadc44f1 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/76702c309598b51cb00c7a1459f4ddb0af4afc40 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/60e976c2bfe6b1424d4deed672121b31b2d7908b |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e4a024c77b2d154cf0e5c3119eeeb75847b90cde |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/530e0e7595c69db3bbf5e815bdf03c3a49545f79 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/629e6f77754a09fca78c2f81009b63b242d2caf4 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/20874930bb65304ad36aae1f630e5756ff9804b3 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e11df5b4a8e30abaa258d79bc0b525ed2bc2444c |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/871b909237fdec0f96fdbeb195aba66792c9ecea |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7a52e0c96b66555cd42e655e54816b5609d8fe40 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5e4525b1b56589e5d4acd086728999de79f1e7c3 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3c8d479da3de73f10464c59e283f7d55bd74ff2c |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4c49651710500407748bd2e973b2df5b6eb737af |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8b66764b0aa678a185a30024c50646824df1f3e4 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/697717b009d64a16479e8a66d87cdfbf534708b6 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0491d99136c853dc558ff5f2f6809fe6cf97279c |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/993542c9e91b8dc621127cad28536854d9c4356a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9f10c5c758fc563a4da4466b711f1107a222d389 |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/702eca8b258390636e362eb9b3b3c6e91099cae0 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/38da0b9b2fbe21d792f8a60220bf7daee3a800ab |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/b113d7bd7ea2f07ea4efd70309f86f927bb282b4 |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/3a421bca48f0989ad1a99e6259268097a1451943 |     
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/8899af473b29ba02246fb1d4e354ab379521f24f |     
     sparc64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/a40cfa86bb6566e097302e2618b0823e76458ca0 |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/023d71356376bea13d16c43898a0347e41cd19b9 |     
        i686 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2660deabf904911535c01162b98d0f56fea4918e |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/eed2b224b055f8e136ffc3d5178f74304f0fa25f |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d7ca88ad09d44332222033228c7c33dc8bd4cc93 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/4ead9064a07498c9dd4f96b7c2f7696a09975df3 |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/871d9f8b3dbfe232a95937f7ae250ca4abcd4376 |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2a1e42820baeeff3c21165e6f80b4e28ba8994ca |     
     aarch64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/05979684e2bc8ffd0367338ab6e84ee908064bb0 |     
         sh4 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d2489813ec10e42e1f07c64b4a9eb45d7d74df16 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b2b9f65bfd6aa0d9b16144618d8bfb8ab6190146 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/507ea7a7dea059ac5a40489dcf361fc999877d27 |     
        m68k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/c4fc4ff85af5f8996d45322c895caaee684f4b1e |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/425f0f3ad5afe63160ea2011aa0494d84d73baa6 |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/cdcb7a3295929513c6fb757ebcf3e739a484f66f |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2696e097f24c6a3223da56c16e661d4928cc392b |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/ffb9faa0dee073177a7556979a0c92716368cc27 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/93a5873f6cc896373d8fc1f80d3fd3d70dc54520 |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a2a9c32e8450251332285cd17bfcefd323de710c |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/6f6466f985caa01d062d11b7a5b9856c68857903 |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/379bfc4fb29a4486ca7317e26251869c8da6b4b9 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/470ec8b79edcad28a7e200a0f8a061a61ba98390 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b071f5c81bcae09504274cdead29d4e4b65e8c41 |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/feb663f4d155cabf5578720d5ba56c80ab44392c |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/26e8ce56f45c548867c556118330437568b13833 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/6a81aad2f0e4b068db31f0428464a19b0fee60b8 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/c56d34d6e3d52795e910b4baf926c4e9d5d94a60 |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/36234e09b033784462228d886c800934a299cee0 |     
        or1k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/196a9f15248873a8e2b6bdaca1b5d6bcba10ab98 |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/e6de29ee2c82c3c00e0c9fc5ba613b8ce95f959f |     
         sh4 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a27ef342b4c23ee9c7e88cbe12146c80165eb786 |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/cb1e5251169a07568e2bffd0b18ef837f5fe4bae |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0e301b4892a7d27a93a5718b53081499dbd06dea |     
        i686 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/1f60e9ebd2ab1b436578ee20823d010277fb178e |     
microblazeel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/923db1c04ce5817fc1fee20395158110b9c85a6f |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/47bd95830f72cd5c9542e33b4010ff84ef29f8bd |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/60ab905b216930610d58229f2d559cbb909183cb |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/4da18311902d1cad49528bbebd33c5d82e19dd93 |     
       sparc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d2963efef1154d10a1b25e66dd581d99b29129a3 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/27e364afcfa59ba862dc1153db7c22b0f2f1b0bd |     
         sh4 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b081d7c370d72c6d39dde069179a7e07b595b241 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/ff39c442da36f4b6437e30dce52241d94985a24c |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/bcd5bd1efce758624ff4947159fcf6eeb3a0c7e4 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a358bf62c02760c1933c164cf5511278ccc4a88b |     
        i586 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/26fc2aa5ea3abf6420a63ae7afad35f301cb48c1 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/7243f0a6df86542ac95f58319addb891a2aeeaf2 |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/ff8c099f89ab127fa449446db94b6b8e9e0898b2 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/3837ad7ac17b8dde48bd4ea9c86b2a752ba381a7 |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/881eda85496fae56852ffcc523c91767df104b77 |     
microblazeel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/914833fca2d6f377cc020635cd815647d123e666 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/e14aa3625f83608632963c36324937cd76761038 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/8ece238dc542c8d3ce4edf50d67f33aea4899c5e |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/29b4b404e99938c4b6f7d417ead3304ec571f54d |     
        i686 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/53ef673898408f2e38feb9137d6bde8f4b8047a2 |     
        or1k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/8a5ddb963b563a542d5fb6658436e055d2402a52 |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/24516f0eebcd97206a2d196e9f4d3c82c3a13b6c |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/02672a719f532bab5e25b98af819ab0156cfae80 |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/40c059a39f0e3641195dbd3a7a4fae6e5d1676b5 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/da16d4e91b1c501b3acc11ef62fe1ef2a9dbf84f |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/95c777b42fac4098d4e71badbb5403bbe1408d17 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/828f3be9469a012fe4bcc579b52ed0c3fa2d9d46 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/88079fa7ed115f1dbb6f50e15c39c21a3fc703ea |     
        i686 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/eafe489024734ea9c65c5ec7214e42807672e65e |     
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/37eb70ffa2342ec9013c76ff8b11cea4d742c7b8 | ORPH
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/df442b5d7b3fcb9ead1f29cb8b88ad18a0867d21 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/f473caf147441b10fc4896eb5c6f148821ead4d6 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/677226f6b82c0c8124a78e8e9d2236b271664998 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/821eae7add252e3711ed069a2d292a04427fa43b |     
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/281f059394f16d435260df678f1063ad725441c1 | ORPH

-- 
http://autobuild.buildroot.net
