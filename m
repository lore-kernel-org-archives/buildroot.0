From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Jun 2017 08:31:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-02
Message-ID: <20170603063122.2529E20F3C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-02
================================

      successes : 209
       failures : 189
       timeouts : 0  
          TOTAL : 398

Classification of failures by reason
====================================

                    exiv2-0.26 | 35
           uboot-tools-2017.05 | 35
             ipsec-tools-0.8.2 | 28
                 lcdproc-0.5.7 | 20
              gettext-0.19.8.1 | 15
           imagemagick-7.0.5-8 | 13
         host-gettext-0.19.8.1 | 12
                 libiconv-1.14 | 7 
                   bdwgc-7.6.0 | 4 
          host-doxygen-1.8.9.1 | 4 
                ejabberd-16.01 | 2 
               iproute2-4.11.0 | 2 
                poppler-0.55.0 | 2 
              swupdate-2017.04 | 2 
                     vdr-2.3.5 | 2 
               wireshark-2.2.7 | 2 
           erlang-jiffy-0.14.8 | 1 
freerdp-17834af7bb378f85a3b... | 1 
               libupnpp-0.15.2 | 1 
                    mpv-0.25.0 | 1 


Detail of failures
===================

         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/c36eb90719c5013af2b86b29e1c138553729b8be | ORPH
        i586 |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/87bb38031e18f71df4a126d54ccc70ef9624da47 | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/d63ee2d03421cc671455be553ab35ada7ff78267 | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/d8f97fd92cd971a0d125f983765ef27c5ac87acb | ORPH
     aarch64 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/44cb646adb9147e143a264b4af857c6deb902eb3 |     
      x86_64 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/656db73ee1521fc51532a13284f1b5fa6d97318a |     
      x86_64 |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/28892ac045b14ed897453d92f11f55b1dbac47f5 |     
 powerpc64le |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/f71338d56321d53c858f85d6633e5ac8643ba40f |     
 powerpc64le |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/cc13d490cfdf835e0fe13f1f4446525084ca7e15 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/95fc8d66ade46725af2464295e95e78f052c4cbf |     
      x86_64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/f2b2f8a1d7169874c1816d669bd8c36fffe83f7c |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/f95210efd9db8f35c1bdb9e1818b48054bdc37a6 |     
 powerpc64le |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/2f2575ed6a29a8e6ef038ee7a85454d8628917f5 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/81938cac1845de86dc0618003d0e30028d038ebb |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/f11b19732966e3c1a04bf6c3ae5170e5abb6f16e |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/028b05f1d26f58839f5ca70a4e086c72a043431f |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9c45b823be9a9528d1224416a83c75a34f110ddf |     
     aarch64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/fbc29d7dab3d60cca4d10a0cfc765fbb41df726e |     
      mipsel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/e39bfd2ae3ff5fb7fefadd733a5fb08dd940c6c4 |     
   powerpc64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/8d2cfbf86a59f7abba61e4ed5737673e0f5e872b |     
        or1k |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/ccbf2dbe71121f9e206ab50b148202320cf187ad |     
         arc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/016c5fa5c4f504ebfc9fb055756a8999e4ab584d |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/ed8540dbd2e21cc992d98868c77eabd2f7483ce7 |     
        i586 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/bfe4986d98e69058b57a9c2307b0231cc0d4d147 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c28bde88389e47737dbc9463da128adc978040ab |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/17d1584eaf9ea9e7681a13faad36354e1d7b98f0 |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5b3ae00325566c5a05c6b630e3316289321f2f69 |     
        mips |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9f26a6a278aeeb87872edce81dd357953dc8ba03 |     
      mipsel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/da25c5c56ac3d231cc29778242461001c0ba1893 |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/8ef8ae8820c126b4c0b2fb8c185833d283ac3c9b |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/a3a7b2a65b84aae152f3bc7c799ce468856cd07e |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/cd8ca193c5aac10627dd21a34043e258b1a86dfd |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9aa99384ce355912220d4b9d618c79eeceb3f600 |     
        or1k |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/7a01b43a08d3f1d3ef2573d065ec5295ccb1873b |     
     aarch64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/941891c9820a2e27bea7ccc450869970815d750f |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9b7e5b226730bec994c6692a24595147ad6df4b5 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/55b37db550deb9b0bd92f4047611fcfd766593be |     
      x86_64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/469bc732e95597b62ad2dd9d0d7a8fe8ac0379cb |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/0549d86b205337fc4592f8534537ab00ec562b8b |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/a12bb2029d94668f2d4b568c43e2da73db7c1ffe |     
     aarch64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c0c64a96173bfbc20d5e20c591ae7e47108a47df |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/13bce14a9f4900c773d98ff014b3d0cf957e1e8a |     
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/59077f8c4e06fd976b85a6da302fe9809753d536 |     
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/f2d5e1de22a2ba4661be28d6ea982f58d1c0ab79 | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/0ed771174cd24ff4950482e823905d117e12fd15 | ORPH
    mips64el |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/fe4aae14f4c0ae7e68689ed979a24185f4bdba46 | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/48ddada7a62686fe91e7a9daaac16dff853742b5 | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/41cafbaec2ca9b17c691b877d4d650aff1946c15 | ORPH
      x86_64 |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/aaaf2b18f340d5656841fdc3f2dbf12edda1fbb1 | ORPH
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/dcd0b907885380aae8e5ea6c28b78e53e4a264ce | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/5679194566d0d60411c0844c54142bb3fc548b06 | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/d0141a37396b31a2028799eee3597ef9b17e9233 | ORPH
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/2b7d67f29b49e728ea8802aa008943aa89e48a10 | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/bb5b29faccf39f8823c6ae856928d472052e35a9 | ORPH
      mipsel |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/b0a9beb9d0bf2a733887757c72508b3d84a45d38 | ORPH
       sparc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/38197b1c8a756d5b6ab708a70aaf04efc4500e45 | ORPH
         sh4 |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/1f2027a6ff63461356043f8b9cdb0761701e970b | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/50bb971363b795fd7934409d656d87b1d5f834e2 | ORPH
        i686 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/ba1444709523c59393aaaa3710e9933bafacc6b5 |     
        i686 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/f27b90f4b8afa0d6dcdf5e3d1423f023e510db30 |     
    mips64el |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/03d7dff6974cb53ca0dcc59048e69a83a1978e61 |     
         arc |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/13b14e4dddc702bccd0e67ff0adad318298fe06a |     
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/cc14a24ceebe98dd32a701d56e29d010f6bba91e | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/14fa909a15d5573d05692c7bcbc61deb837cb845 | ORPH
    mips64el |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/cbc3243496e5552fbeaa7fd9b8b108ec57b3c657 | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/5e21a6f01ced32ec3e0d32c24a55302688996567 | ORPH
      x86_64 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/3af0ffb3447d3c718c39198f51f941603fab9fce | ORPH
        mips |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/3d118017d498d4dfa00ce705b6512eca13be9096 | ORPH
       nios2 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/bd186ed437fc23cd4fac92f61bde32f9d530c127 | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/16cd4c0fd92250f1f78a72034fc99b972436572b | ORPH
      xtensa |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/fd8947841d3355f2565f526ea280149a82a9390f | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/4465d9edcb940a6670cdd0a8990ab56059ed31a0 | ORPH
    mips64el |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/5fcfc244eb0f79358ea213dd8f545e37a4fe9024 | ORPH
microblazeel |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/e683f54fbc1bc9867fd394021a7acd7ce2b8553b | ORPH
       sparc |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/a4df2649b9d812732ca6d1850bc828db7591a36f | ORPH
     powerpc |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/bb9a605db1fa0e60e596662128251f9b1057d4de | ORPH
        mips |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/cc90fbb0ae491c17b1a4b36e4f16c7fcbc025b5a | ORPH
      x86_64 |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/1c46c056afd6a492674e35626efb68a25616cc7d | ORPH
    mips64el |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/3393e633ad67a7ced9c96155fe49141601ea5388 | ORPH
         arm |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/6b31869b3fd958e9ab1a492d961a5259e17bd2d3 | ORPH
         arm |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/ee2387f50a6edbb029d016db949aae96e32f454a | ORPH
      x86_64 |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/10bda573e2048a02e690bcb36a5904cf40300d7c | ORPH
         arm |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/2dd330ef92382b3bbb0366be9b64d2f065d25c38 | ORPH
        mips |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/8d94627ccce15ae1f348a7a9f54621b2b5a74321 | ORPH
         arm |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/6ab7e3edf220f0b9a314285bea44fd9cec7a7864 | ORPH
         arm |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/860e6f2c211a1c0f535401f844dba67123dd8c09 | ORPH
      x86_64 |            imagemagick-7.0.5-8 | NOK | http://autobuild.buildroot.net/results/1644454ca5b3a8f41c4596d51a6dd74489e526f5 | ORPH
        i686 |                iproute2-4.11.0 | NOK | http://autobuild.buildroot.net/results/823f0dbe17999c07134fac5a0620e3ad15362204 | ORPH
        i686 |                iproute2-4.11.0 | NOK | http://autobuild.buildroot.net/results/a797a6e3d193fa70abd59411df21657a1c0a45d4 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e81ef890ca67347f3973bd046721d65d2ab3c172 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/7255d4d1ff2f58fef69113edb540cf24da691b1d | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/60d2865a5d1e382d26003529bb3260cdf1dcac06 | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b02ffb39411edef381823c1a554a93115a6ff40a | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fd677dba049fdef9f66e2cc6546b1cefdc522c3f | ORPH
        mips |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/99ffcd8ce674734c3bd133821f6966d9faa859c7 | ORPH
     sparc64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4d712ffd38490b4d903d4deddd16fc6bed6ec600 | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/92a88ca54550fc6e8bcd9af7f1961a7998485027 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/36102f4385fd1fcac16110b64421eb215a788bbb | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/843e0de7cb2b37710fad7d8ad52c51d47d12c3ef | ORPH
      xtensa |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5c1e80d4dd57dac73345e08702af4c3fbc55f8e0 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/7b27167025c281e269fe025c2a23089be1cf1a06 | ORPH
microblazeel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/77d3c2321ec746adb4d6f23f1dea3f565edad17f | ORPH
       nios2 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/406eb06586af444a205caf393c2cc3614f565278 | ORPH
       sparc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8014f7c007e12949594d7246eebfcd54c6843e8d | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/3fb8ae9a65445ad7d4e0deae272abbe51203b244 | ORPH
microblazeel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fe44bd5a57db52da5dcbbea305ee96cfa48307b5 | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/6cccd821d0ca45c9d0edb2a5c875a69663d5dcad | ORPH
         sh4 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a555d03aed319867983fd9fa49ca673b68be234e | ORPH
        or1k |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/782d221e8499fe511c9de7c698a8693c26a203bf | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/18573292835925b3aca0a60066ce8003df8a7910 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ae8f6179cf0e877ebd3c9f1f238180f322a3ee99 | ORPH
        i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/6a5a31fa57c890be5e3e5f20159b706e5ee0b367 | ORPH
      xtensa |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5c1a82efb8b0281de2cd309519051ae69e1c9286 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/53d213b49c33e0c69e5e9356fb98cf41937920f0 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/73dc15c3995f5ab9860ed54b2b1933cfc4150d39 | ORPH
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/dfc4fd8aaeb9c6feb7bbd4473e4ef0b68aeb0bb1 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c6bc363e3d2fab3bec5901c22b2971737965c223 | ORPH
      mipsel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/36d90f9345e3db9ae2de675df82ef9b168cc4fd9 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/346dde03b7d57b45c04c527e1fc4fc898c829fe8 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/1e977f5ecd37f612cd5511e9bc335a9a916a91a1 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/25ebc619c00b238b159395d9a95b3f8c25803394 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/ded59b9801c2869be6c4fb152e617cfc69b7c15d | ORPH
     aarch64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/850a7bd9a17e9014a731204fb42b5fc63b1008f6 | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/eeaec70cdec2929c3bcf0a11b189004dc3b091fe | ORPH
   powerpc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/4c59b63a4972ffc03fa2d6bd8e14fc763f45af9f | ORPH
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b64481eab815fe816f7cfa353025da453594c3c8 | ORPH
microblazeel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/fd7cc62496f0f53e5abfbccfeffaae4f8c299f84 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/0585c336ec88103c889780b215a5b2c9812e8b6f | ORPH
        mips |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/93672a52aa830aa51284202f4cc0e335b03d5787 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/be5ff2b80a1ca4910b65ef25a8509154306efd11 | ORPH
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/56be47526299412c9d25f81e2aef7e8c2996b3fe | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b379101b4f146c354a5151201e36a7d33dfef3a6 | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/70e689987343f3d8996717dc724faa20d34e0b5f | ORPH
      mipsel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b85f620c9e6df556cb97cd4ae195fc8383a0468e | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/77c44f05c67f64a7228e3d25f2c48d87b406aa60 | ORPH
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/797688740af7b42d39a3173457d5e9ceaca1cbb2 | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/6aa405838ecc295f96698d916db9c460c18fedd3 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/0cb9c07358f6c35e13e83a34b84a123391e6ddee | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/bd64905a6e2e5bb476bf9259afa03221d69fdd80 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/0190466b63d847d122abc5740d27ea96b56f1091 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/73b484e3bfd2da08366f325893837975c2924289 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/3a734c2a472c67b0891156ab24ab94d71c226633 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/ef11d07c994ce8ef08b512f0d3ece0ea0e4df5c1 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/2bb2b69b858fac0ab23c6f9c914e1a02fd6135b3 | ORPH
        i686 |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/b94ee0b2cee4fbfc83fde615beca16d8805e8c4d |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/61217cd84f28da0836b284e1bfc4611fc0ea19bb |     
        i686 |                 poppler-0.55.0 | NOK | http://autobuild.buildroot.net/results/f27380e803be50e066be1659a8512fd74d1fa6de |     
       nios2 |                 poppler-0.55.0 | NOK | http://autobuild.buildroot.net/results/557b9b386863b6c865bcca86a2b87c7028700ec4 |     
      x86_64 |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/dba54b00c81f62d957a8c189dde39ba0db8864e6 |     
    mips64el |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/e6179f515589a42a9aee16b54b897ef9111e7f4b |     
     sparc64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/c2b29c7efc69bf74f2671691ccf896b97a3cc79e | ORPH
     aarch64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/103bb9f328a1a5d787e914fc69a7cd576abc1735 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/499ab63530e4b4091085a0e0e91cadd5b166f2fe | ORPH
      xtensa |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/36f44f93a688b07ef45d6b743da9a92ffd6d0c0f | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/bb870680e8b4ec00bc2a95e57d0b5ec751f7105e | ORPH
         arc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/df7fd6dea3de626f170f613c9f842545cccc3a3b | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/cff0d284ce21060fa2fea9c325b1ba5db879f2bb | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/96b2e1f91becd72b3e8013f293d67923c5d0bfca | ORPH
       sparc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/09d1781bc6c65e8b900175af924945ace00e833c | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/c952e51647db214aafd9460e1f5f922812832aaf | ORPH
      xtensa |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/eda247e28914e5c506c0fe4c40e64a38c81e6b13 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/3781a48878e1b1e822baea8965078978ccdd5e2d | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/7e4f7eeb8605c60eff0e43f324cfaea1c6d0ebe6 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/48ee4aaa480af316d881ae2bbd53541cab1c87e7 | ORPH
        i686 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/65214dea77518cbad82215853cedc09109df6fdc | ORPH
microblazeel |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/2e1a9e86a249009b3e1d6e86ac6eb60c598c8381 | ORPH
     aarch64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/fafa38ede5f3ea1841da28bbd9f706e094158d34 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/d6da03d74eb9d120bdce5f61f322951684f1eb12 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/56e2dfa1703a9d914e2b4456046495ae0406def0 | ORPH
     sparc64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/acbf53d3c55e9c0edc6afaf9aa12b9c64173dc26 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/10198febae362c533e29ab77434d7b85953a072b | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/ad2fc55835caf02b33ce8f1918f6c581297ef1ab | ORPH
        m68k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/0695850ca944d4a99d013b7771166ddaabc25ed6 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/46f28fb36a2f608916d129e4f8e7ecc5dbd79524 | ORPH
        m68k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/7c6f4123a88a77d628d16e37a5d8bdbcfd2f5610 | ORPH
      mipsel |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/60bcd0c8c1021f7c1a6cdaf73644f6ec5185dd15 | ORPH
       nios2 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/e4d8826f88e61aecd22c825fa3828b4450987a73 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/15317b6d821ee58e79eef7c2dbc1ab0c1e0c22ce | ORPH
         arc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/2341dc2ad1dae59fe286fad830b660f44232d285 | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/198beec174199322dc67f726b7f3513bf9344d53 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/f3d2bc7e3478ae5af63bb2688a6182562bc2a33a | ORPH
         arc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/8d67c55c7c0c342784d6da31d383bcab7d881a88 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/5c98b7f801eb607067db0a8407c8d6a4ad61ee44 | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/64bf1ebf5b90285f7adee8efd708683d907f1e0b | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/d9a55f77ab62e53f3cc257643092453752b9a201 | ORPH
        sh4a |                      vdr-2.3.5 | NOK | http://autobuild.buildroot.net/results/c6ce6ca1986f2b82ff03e55dc650484f858b7e32 |     
        i686 |                      vdr-2.3.5 | NOK | http://autobuild.buildroot.net/results/20887b7161d895c2348c29f91e3d4b3f1c6f25e0 |     
         arc |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/5cfbc387017769aa6bcaa0a8b9f3ae91ac22bcfb |     
         arc |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/fadef0284b84bdaaad02a424471398616873bc7e |     

-- 
http://autobuild.buildroot.net
