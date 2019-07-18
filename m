From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-17
Message-ID: <20190718060057.8E1392039E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  11 |   1 |   0 |  12 |
   2019.05.x |  19 |   3 |   0 |  22 |
      master | 121 |  54 |   2 | 177 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

            qt5location-5.12.2 | 1 
                suricata-4.1.3 | 1 
              wpewebkit-2.22.5 | 1 


Detail of failures
------------------

microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/d3c5d86d81a06e9c6bb1deb8a54cfa9faa37a9db |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a34371a794ab0635e2674ab514f37b10c449a994 |     
      mipsel |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/3e7feb717c3ed107d1910dcd67ceb92e9eae64be |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez_utils-4.101 | 9 
         xkeyboard-config-2.27 | 9 
      tesseract-ocr-legal-info | 4 
             bluez5_utils-5.50 | 3 
     glibc-arc-2019.03-release | 3 
           can-utils-2018.02.0 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
           tesseract-ocr-4.1.0 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  dnsmasq-2.80 | 1 
                   dvblast-3.4 | 1 
                    efl-1.22.2 | 1 
fs/tar/tar.mk:35: /data/bui... | 1 
gmrender-resurrect-33600ab6... | 1 
                gnuchess-6.2.5 | 1 
                 hiawatha-10.9 | 1 
                host-libsodium | 1 
            host-mfgtools-0.02 | 1 
      intel-mediadriver-18.4.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  libssh-0.9.0 | 1 
                libvips-7.42.2 | 1 
                       mongodb | 1 
package/tesseract-ocr/tesse... | 1 
                    proj-5.0.1 | 1 
          qt5multimedia-5.12.4 | 1 
                       unknown | 1 
                   vlc-3.0.7.1 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/37859fe8cf51daea1a3c81f6c76fcda8bd35f153 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/64e300d11e5187c24845c6568d001793b000245b |     
     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/fe7d99a0bd0239a5e40eb473ce888952e8f7cd2a |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4532453bed72acc7253a8be100ada2415fcdab9b |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/01b35c680a893ea38078ebc8782ec4fa253e274d |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1a6a65e85c125b4a3f7233cba77bef864f458ed1 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5f86ebb276a5562ae81d1b3ae56935482ec00749 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4c1137580196effbfce8e9f20882234f4cfca147 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c0aa0568b66e5a1f2e7f45354ce81b2f3934ad53 |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/90dbd4e710a6638a9cdccce33b6ddb11361c2477 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6ec059e16f8c9063386342eb8553d3493fc07fb5 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/772677b9a968869d7a80e82f28167b2620692ffe |     
         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/c7d831acbb9c158af6871763e9c37a599809a4ba |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/76b5cff1b6169bd07f9b00bdc2f6a9b9d52023a6 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/946e621724593ad4515110750a1ebfe11b07e80b |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/fe5465ae2552ce16cc4e3e90be6bd42c8d2bcc4d |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/fa80b558d2df9e02e2997d57ac0e3be63881c5c4 |     
        mips | fs/tar/tar.mk:35: /data/bui... | NOK | http://autobuild.buildroot.net/results/eddc878ef899da6c58858dbaab17f6452cf005f7 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/aeea4bf1e60604cc7504da393d553e74dd0b0327 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/15831b0c8a68ba60521d22c50c4f5d8e0f423a6d | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/dcb2d1138fabe004ebe0df9e2d7a8875ba1e8344 | ORPH
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/92014ba66ebb7702ee805b5c9cd872c752866ea2 |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/be11c97d2545d350a9662761a8c070dcda74d88f | ORPH
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/396f3ec849229eea9298215fbb1e1aac9f48c677 |     
       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/cf430380d7bc9d2632ce80a68e41f92f94b00cbb |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/20e96d02e211ef9dff1c362bf83a469bedfe6f8c |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/4a5124263610d49569cbac3fc8ac7d6d28b942dc |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9e6dcc6167db85dded43cf43f3ab45c0c84fa5bd |     
      xtensa |                   libssh-0.9.0 | NOK | http://autobuild.buildroot.net/results/fd8567354917e062bd4615fc421e4894463ec6da |     
         arm |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/fddace8f5d6516442217bb65543eaee86a183a2a |     
         arm |                        mongodb | TIM | http://autobuild.buildroot.net/results/98a79c061de62d191b9c35ec59f19e14993543f1 |     
    mips64el | package/tesseract-ocr/tesse... | NOK | http://autobuild.buildroot.net/results/f4220728c67c72fae72491c21fe0a0504e410155 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/86e3f2f627a2a2cdfd0ad0f4c9d9251a13c43453 |     
microblazeel |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/055154d73fd11ea57588a455b39922f5f233ea40 |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/f2ebe3b33d8eca16a7770eddadf4a7e298c8c418 |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/e62bb3ffb1b7d2604d11b62d8a87f83bb5b3c704 |     
        or1k |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/a11ad8d7ccb13ac8f11d0d3ca8642e364f71a149 |     
    mips64el |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/bdfbafa105ddf0b9b9399d94b557d318ad587d79 |     
 powerpc64le |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/0ea7af2bc89a59bdf926a07635eb7b91c72247ff |     
     riscv64 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/3aa1daf5e00a8fb3b79c323784f92c05c2820446 |     
       sparc |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/f3c70d89d3533464a6da38e01e4644f7231c5a4b |     
     riscv32 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/0d4f850ee9e6ae7f14f41a6a094c1f4eb4736ca8 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/c0f79538024f987ce8ed3b88e84242ce83e01604 |     
      mipsel |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/0cb0576abc3bf1aebeedf058ca1ccbe7746a63b8 |     
   powerpc64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/c2497a0861854363ddfd00bbdd0a54640777b702 |     
      mipsel |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/8a17449a59cf88b33831823ce9f3bb4ffb28001f |     
         arc |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/b9dd31535360af6abade95323ab346c23309afdf |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/4575fde8c09052a3f2e3a1cd0b9e96bd59ac2ac2 |     
         sh4 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/fa86fab4538dfc5abbfc15ed85d7cedfe240e46b |     
      xtensa |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/8aee25fabbcd3bf4bebba6f0ae480f797846898e |     
    mips64el |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/588eb23a04e21bf217962ba99134d0c03da927e4 |     
     aarch64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/5e2e747e8386ef303a7cc96809f66b8a8c4d4c6e |     
     aarch64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/ee8498c40eaeb3e1b51d05ec548e0517724badcb |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/f95b6981c64fd580f6d44009ef0989c547314745 |     
 powerpc64le |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/b4097c69580f3b3eb7a0b2c7fbeb678edef5d5e0 |     
    mips64el |              xscreensaver-5.43 | NOK | http://autobuild.buildroot.net/results/080cd0f138feac4ddbae0266ba0a46ce84b39505 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    ofono-1.28 | 1 


Detail of failures
------------------

      xtensa |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/79ec6827efcc8dd9c6522754f4ebd3e6a882a139 | ORPH


-- 
http://autobuild.buildroot.net
