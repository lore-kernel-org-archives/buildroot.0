From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jun 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-03
Message-ID: <20130604063006.93F7552C0FE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-03
===============================

        success : 71 
       failures : 150
       timeouts : 0  
          TOTAL : 221

Classification of failures by reason
====================================

             host-libftdi-0.19 | 22
                   bzip2-1.0.6 | 21
               logrotate-3.8.4 | 17
package/sunxi-boards/sunxi-... | 16
make: *** [libbsd-legal-inf... | 12
                  libbsd-0.4.2 | 9 
am33x-cm3-AM335xPSP_04.06.0... | 6 
                    acl-2.2.52 | 3 
                libtirpc-0.2.2 | 3 
                   mplayer-1.1 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                  aespipe-2.4c | 2 
                     git-1.8.3 | 2 
                  zeromq-3.2.3 | 2 
          host-protobuf-c-0.15 | 2 
               wvstreams-4.6.1 | 1 
           xlib_libXdmcp-1.1.1 | 1 
                 cairo-1.12.10 | 1 
                      qt-4.8.4 | 1 
               audiofile-0.3.6 | 1 
               libsigsegv-2.10 | 1 
               pcsc-lite-1.8.6 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  dhcpdump-1.8 | 1 
                tvheadend-v3.5 | 1 
                       kmod-13 | 1 
                libiscsi-1.6.0 | 1 
                   ptpd2-2.2.2 | 1 
                 nodejs-0.8.22 | 1 
                  webkit-1.2.7 | 1 
                keyutils-1.5.5 | 1 
               alsa-lib-1.0.26 | 1 
    enlightenment-0.17.0-omega | 1 
             bluez_utils-4.101 | 1 
                openssl-1.0.1e | 1 
                 qt5base-5.0.2 | 1 
                   icu-4.8.1.1 | 1 
                 libnspr-4.9.6 | 1 
                valgrind-3.8.1 | 1 
               libglib2-2.30.3 | 1 
                  iozone-3_414 | 1 
                     pcre-8.33 | 1 
                busybox-1.21.0 | 1 
                cegui06-0.6.2b | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/8c68caf3c769c8479f6bdf00c1e97a21121d1ece/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/f638ce9001a4e66e6429e463ceb361a49b7bcfc6/
  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/4e537ed8751825bd3cf9d59c70eaf3035eb182e2/
      bfin |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/9f3f85a024791cdc6b10e3e40cf41707eb074447/
      bfin |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b9cb5889421151a1976e673bc3a9ef844a3fadf5/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3c183d4693055ba6467593c3dd4647791fbbdde3/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/768111f418b74ca5188bf149d05c96ddc5a7b602/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/9c96bee268b203b02a33bfbb79496d7f4c57fd0d/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/0ab770fa59e02124f271584debd8a6e1229b6fe4/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/fb04da636fb0070153ffe6d2e8ef837b0d6af6f0/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/2de4f6adff236cf1723b793a99e8fbf77313a510/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/6da45376c85869ea979874b48d05eccc4f3761af/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/664be0ab5952a4f5792e6622505347cb9212b10b/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/530f797133f9e8595d1a39ba809dbcee0234ff0e/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/b3566395c17d8253ceae614a514ce74e408a6f6e/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/b095120596979c96f04874b2f8ead80ecc8ed33c/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/a92400aad8d10aaa0c852f24bc762af837e4fd64/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/6c51560becd39089d6b5e7134cc0a524c9dd588a/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/bd1fa7a3d1b0299bdfde6241016250ae8e2a8e24/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/2d5443b2e4baab29bd73ece2c906d25c57ee971b/
microblaze |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/52fdc485d101850dda1c4c13a154f13a5a97189e/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/4d1a7de620c820b9c29f107c1d52bf145cb83ca3/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/f76863a5cd400906a7f2f95db591c23267bf9c5b/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/6187371098e3d7d485558749472161d601b8d7c9/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/a392ebe075d7b9fe7d4dc278d16c2b6faea5c06c/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/011939a42dd0d54c0b639cf58021d76f4ad35c50/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/4c5474244f951457bf8026978cf62bc6a9c177a3/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/aecd12c22be2566204c79ab14d2a022700243d52/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/bd7878f2eb56483cbf61c9e074a25de50a1cafee/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/cf32c503306c63b779526c72bfc8a8c2617959bf/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/de18aa727c0bda39f85a94e0f7d50d4a62a356c3/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/be29a511dcdc17c85218411d4bd2c9e4a186ed7c/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/10eda99dd19c170f779c72e70c19bb6ef4e932d0/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/87fb00d227e8e6be377a6789cc8660313f878c32/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/c5078cca3a261d1748fa33149659c6b4e61cf55d/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/fec7d5474741deff4733a7ff67ff299338d87d32/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ceefe6c9587db84feb5222c8d0f2489e5741c25a/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/b69e10a6ca8ff362c5099a31a444ccdb4378c2c6/
      bfin |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/eaf6371552d8029352a5779c7133b024b0b489fc/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/52d4f4b298979ad0fb4aa4f8d71127befe84954e/
     avr32 |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/a5b1bb708d62a9e296f05899f0984087fcf9e2ce/
       arc |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/08f5ed4dd35ad1ce06dda7577aae87b9aa7069b2/
    x86_64 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/7d94a3e5f60bce94b0660ab22ca4158ae45fe6f5/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/07755de9030f24c71c2b9b4f6450e41da7954dd7/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/0ee488c1b8f5efb2ec4ea93e3f4e8bda646ac6f5/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/f6cabfd6683f0daf9b3239e034f931e8f0c28388/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/555e34474afa851cc4ef651a9cc98b7e2df6e063/
    mipsel |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/995e456a417e2b5c75938f6f25e0cc30fb45b145/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/a8731de13b71b5160a9eef870c79b5a9c98310e5/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/b2ef9cad783d631696ff8768d314b46044c55b36/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/7f22c7a801dbfa992464406e7ac0a61adac97a4d/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/3e17ff8bb01d062f0c0c23767afe5531628b9f59/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/bea0ad3a82d5460532fc05d52cdfef052e9b4280/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/6c64f4265e6e32fb46d15f90aa9181551cfbb533/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/9e3cb87dff94ccf287afcf8e63c310bc97dc24a4/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/109b497839e01fa7ea32a4aef1fa2d8732f1f34f/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/7a8816015a5ba3a7942fbe3a965ceefb1eb21c1b/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/72977706e8afe8e2a856e748ed7bab6209cf4015/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/b3857ed8cc0ed2e1a950aba98ff616dfb6110afa/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/5437f0c7e6fb2a90c0e24c70e229b71323ee19cd/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/be6121ca46b93bee9c31cdb1f14e37462e62be81/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/5141f8d7cd70f620a1bda5fd04582e43cd2c5ed0/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/d9471c41d839685ae194da73ccc37a27506a8818/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/55c609ffe33015f3b03c3a19f9bd97e83e932b79/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/50db74fc6cb41ce566e87ee1f6071d5d9d928bd3/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/1c8a9362ad659c271af5853af49afac5f2f4c549/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/868b4fbe9eca68fc6e32381242627730a6debcfd/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/e9505c69e5a4186743aed521e0c27e9eef38f00d/
       arc |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/d610492c22542be1e0190f32a89a39f1b929c3a2/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/8dbab2a49a5aa9cfd7dbeeb916a1cb1fb979c841/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/7a2a7c866f479e94073f106e5884c9f4fe8c0c37/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/d714d699f5b3fb00d23aa306c2fab0ac9b06c30d/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/f44fb1e8499e9b004dd52b1a9ea71bac2e58f3fd/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/e8ffc699c54cb1c132c103b74eb622723942fc45/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ccd2f3fe69a3e0321685daf95f85eca5ba2d64cf/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/4a790c69ae6360b091f38f261995582998bdc391/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/b405bb4bed5f38399c36374407d51ea2e27ddc4b/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/a27c871bfa5515a6ad7e86425240197695a83d5d/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/c9c01f9f2c4fda9af346a146a3d9788871887db5/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/03fefa57f27c0fc29566270c573cd7e5d22bcf93/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0e6d8f8b70a59898522816b09b5a3daac17c3fdf/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/17cf8343bf0367acf069f8579a02dac294c58502/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6fad528f86ca61958d381fe63d16d44dcf66c4bd/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e689f2cb3c8356c9ceaa32b1fa1b164953bf75c0/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ad826b2d9d84587af4a5c0cab32d5d5ed1f72e59/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/cdee8acbdb3a11d605656dd69ef09d2e090b512d/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/39940796acba8962ad1769d2b3464c38803fb586/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/77928d0617f8f155932f62d00affeeb6de0b96bf/
      mips |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/7c8237bc678addfbe52ee61383ac079618e1d9a7/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/37fa6ba3afcb88b9f734797ed7894e3fc18a0a1b/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/cc934aadae7344ea3a8ef9160d89e366634bdf8d/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/b84c34cad2c5d343579a2bc9c8b5e9f8acbdd2d8/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/768b58c539ac773344930bbbdf8aceeb3b50a000/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/453cbc27b002359079d3f9c06a1ce607065a9538/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/8ebb6d2fe2301a9b6fbb2783f66e9d430efb5291/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/639c158f366d8b7509c4f2da3c4ab22152505cba/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/a3e48cc03c0af5b9c84320741d0bf3f7d8639f15/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/38cb61e2185e1dc17a78f4ef069046ac79d35c6a/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/815e2759f4961805d768efe79f0d83d13b16e706/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/52d35e528b214bb660360729a91cf464372bf4ce/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/eb120d2b736253296ab6274738412264434c661b/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/e7e669596e15d1973c3f946504d3088c39b44d68/
       arm |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/c3ff3b192ae9acdc955d5ba837a0efbf1139d102/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/1684765d8687fcd3cfa3c8dddd5d812fa051a6ea/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/2b14b885b757e342afdafc78010cb837b5a5a4e6/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/b1e96a201a40bed434ddc9381decf0ad33bc9012/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/90e97d19c3c0ef0ed732fba9b9158ff9cebb7106/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/1bd6da04c60b781651d219079afa157539db01ac/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/6063dbebf0a87bc854563b5d876bec81542b057f/
   powerpc | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/c32243606898d6d01e09d56f3fe9963a8146ffde/
   powerpc | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/a468009224ef88b6656a85ba3f6d919bddde1af8/
       arm | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/8a0635bd72969ed35165fdb66a4a8dfeda088e73/
   powerpc | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/6f8089dc44da220be18b596adde3d7071dec0fff/
      mips | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/b01e398f44142a60568bc7e3094c881cd1413fb5/
   powerpc | make: *** [libbsd-legal-inf... | NOK | http://autobuild.buildroot.net/results/7f5908c75be6430fc4a720f69ac4b2effa155103/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f36c8027fa7dfdbce23edb877d97a9bb9f8d0247/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4489a8edf9edec1dab7e231e22cb28d7e18e07c1/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/45546467139f5c2038f3c89c8b6851505c3a2f21/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/352190dcc6276f96de8e68bd1ef4b5b294d75c34/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/d734a2bb3840672ddfe49c92d10d458de0ada8b9/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/aa3d19ac97c9c72cf1d4161e88a433c3669a971d/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/0bceb85337f43949762eac6b9fefa5443893870a/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/23b35d8c0b6bae550ce7f7b888227adcf44fa14c/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/41d7386a68b1c49dd08a34d810cb249261328e03/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/a5733e00796bfad1d71c509987b446f944f54e10/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/d989bad0bebc08029b1c489cd0a650d776a0878b/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/e4cad8cb3715578322a2e312cdb4460621ed5f5f/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/9ba14cc57c52d8ffa460252f57a5ad5d59c469e5/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/56420c7afd03788fe2e4c92647b8e496aa86e537/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/e443985e79fed6f57e422ec41e5fc6401a921038/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/772e87b918ae88c4e851fc87d75d20bc68cae470/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/2c3065a1f015b76e19ae8ec4b540575ac86cc2ae/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/81c08f39317887b941630f092ab9d7c02cc19724/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/6a650716345c68c2df8b283c4029da8fa16eb5f1/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/b4fd67a2e2992a1efd1e247f3af4250ade4f0511/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/e6c560ebb2cbc8c92832f36be1c47b84ba4f1f6e/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/c8105566f99c3ae799169effb759c627b4ac6eff/
     avr32 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/1214e4abc67feefc2b46f3937b1856e1cce8ebe3/
    x86_64 |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/abdd0503035b24e45e24ac65d69d4eb9e13dcc9d/
       arm |                    ptpd2-2.2.2 | NOK | http://autobuild.buildroot.net/results/a79f4f0ae01cae49da508e4b17e47e334ec2aa34/
   aarch64 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/0102d515ee2a110bae34df5a6263c5cca636433a/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c7ebd6797611588f82f35e917cd115dc926a2d4e/
  mips64el |                 tvheadend-v3.5 | NOK | http://autobuild.buildroot.net/results/2e678f610bd63a7218eabd90219a509e55a4b014/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/dd2910f96199bd7fc1450f9c8b6680fb7d9a79d9/
   powerpc |                   webkit-1.2.7 | NOK | http://autobuild.buildroot.net/results/d7c9a3ccaca4f386bff136a969460a09c7910336/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/82253f57500481ebc13835b8d30a353f444fe4cd/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/5bd7c95bc1ac41410287a7ff3d7ed01aaf106ad8/
microblaze |            xlib_libXdmcp-1.1.1 | NOK | http://autobuild.buildroot.net/results/a365b42cfa810b8b5602094b9021e1930f4d9b50/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/c353f5d1e91048f76e535bf29a1afcf8a4126085/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/3c94f5f1dcb56984cf703fc34a2e040ceb18a274/


-- 
http://autobuild.buildroot.net
