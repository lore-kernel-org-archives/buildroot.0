From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 08:00:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-21
Message-ID: <20180922060029.66607208B1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   0 |   0 |  27 |
   2018.05.x |  18 |   1 |   0 |  19 |
      master | 193 |  82 |   3 | 278 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 


Detail of failures
------------------

         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/65fb2d8ffdead09d816eca2ef230cdc589c561d1 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 31
 Makefile:708: target-finalize | 9 
              ptpd2-ptpd-2.3.1 | 6 
                blktrace-1.2.0 | 5 
                    brltty-5.6 | 3 
              e2fsprogs-1.44.4 | 3 
                host-libsodium | 3 
                 lvm2-2.02.180 | 3 
                 gadgetfs-test | 2 
              glibc-legal-info | 2 
                   netsnmp-5.8 | 2 
          synergy-v2.0.12-beta | 2 
               boa-0.94.14rc21 | 1 
                  boost-1.68.0 | 1 
               bootutils-1.0.0 | 1 
                 dc3dd-7.2.641 | 1 
               domoticz-4.9700 | 1 
                    efl-1.20.7 | 1 
                flannel-v0.5.5 | 1 
                      gzip-1.9 | 1 
          host-libsemanage-2.7 | 1 
                   luvi-v2.8.0 | 1 
package/glibc/glibc.mk:134:... | 1 
                  samba4-4.9.0 | 1 
                  screen-4.6.2 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/a984f9960ed202f8bbac7f71b86d46278d1ad941 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/c56628e28a1e5ba92d7ec860fcde50025bdd7436 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/2b1626b173cbaf82d16567a8c784b150bdb275bb | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/6164b6891b2122f0aca7fb81947a17b5a872dc04 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/21a5c1dbf51f94fd0d4ae0d934d728fec8869a2d | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/8d1c7a380c4f31f6eff7d5ae2ed8ca1a89222ad3 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/1db0200c29da752b28a9d65264d7d7acfdda16ce |     
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/e2fe8b2324e26747aeb4ba7808f16c82ef526f87 | ORPH
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/7ed63d8a1a37e5a8818dbbdc3eeed7c7462b3cc2 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/395db4f57227512d97833b9e3f2e0a4c1c6cf9c9 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/fd45f92d403652b21267e6f0567d969a790b5c3e |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/75865eb39a8c19f9bbbcda3924880581d615d23c | ORPH
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/17f283347fb8c0ff9163facd67a0e475e8503036 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/256de6295e8624eec454a2f844a2d41332e5cd40 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/766c5e0a94973c3c57ae7ae251973fed24049819 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/6248ae79ea7ac25c19f180b2f95504db48879ae3 | ORPH
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/95362a40862b110903b799ef5674981e085a8f1b |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/134adb32102e1e410ee501a2daf712915db8b3b7 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/aff2ceea4ca6554413aadb8997352801ebad2e86 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/4fa778040d9868df651e7296f6704d2615740247 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/7e3112da30f95f7342f73988fe760acdfd2e892a | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/0fc2489ee295d76a193d32b067c0b378c107fa87 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/7c27db0b6d8deb4f8aad174e4e14988538f7a63e | ORPH
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/d0623e60a125c4d918942f5d8b80ce2537c96b74 |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/280371051ea6134d68b3b750b82a0811e09d7902 |     
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a4ab74f78a45a70411cffa5c9c796691e5517d13 |     
     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d95af75367bd5b8f25be4259d267214df417f6d6 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/a13443e154d0e6a015715c67b2b608e2511c1724 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/547e0cb983701f9762a4ccd5913d2c6f2a92eea8 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/f63570bd4a95cc6feff2f6595d29f9b165092eed | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4d448467a6a944233b9a37b6dd65cf6a426bec0c | ORPH
     sparc64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e5fa5b1f838c3be0eb46139b1150dd39f1752574 |     
     aarch64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/174ffca214b4e011d1c54f9bfc49463412723214 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/739191f796e97e3ad0d9ade394c0d84ef9ddaa0a |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f2e640796001185749506d0caba09952f40e4c93 |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/1a1ddaf94d9b66ead8e509f3286bf99b3479bc37 |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/7ea58b0909ea1871b3735f8671686ce0eece2e7c |     
        or1k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/bd4dfa8b64456d89f283e009aee04029bd6b8c69 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b4b84d3959942262ed146e27da695e4c0d88c929 |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9638b75703a63bd9a141ef6b64a9a1e65391273b |     
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/859213725bad3861722ffdbeab5a4b3a7ba1ebf1 | ORPH
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c86d8cf45c302ea029c46d572e5019c38b0a9618 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/41ee432625a60b5d9c8e2f0fae7fe9dc9a89dc0d |     
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/372948f2b5a476cae00636390b92e8edf6e9d15d | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8bd163f0537dd09b8845d47bc4c7257b8b2a7f3f | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0fb7ded066e3e86b20dc596e51a6aee0f7fbcd89 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fe09c64b2138e7d8ab3559c0519413f3ef68a6df | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cd7af139dd9ea5f18a79e7f73d50921e17e4c255 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a98a1d954ac0bc57f35f178a1caa4db20fd87a57 | ORPH
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/2c9364bf68981a4332caca28b72b026cac56d194 |     
         arc |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/ddfbe6ca6103c2ef3198fbfca3442a970bbc59be | ORPH
       sparc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/d4524fea86d0ae05fb7d87605b3b0932173753a4 |     
         sh4 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/fb68db92e3b5af57141d231cfa4e082f44e293f8 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5bd7893a7dacc0132fbcd7781b9d45b6930a5203 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/24f60f0c04d4bc645539fcb49553c93bda48b8b5 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/6a8c689c5b9a2ae665261779a57cbea9f590899a |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b49fcda1e1d61531b9e957cd36c167fd8d255db9 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/30add1b713648e7d2bced1dbffc1753dde1f043d |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/32887745143a794a10d8097d7d19a8a917d2a1d2 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/07946be7dfd17a58536b537bb50cb52d3af74ff1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/4713aa3014fb7026e99e2944824a674eac5b3814 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/bc29e65e24ad8e496df0e8e35911000941fc11ad |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e6f033162f53b0185c0567eba0154f7ada3bef05 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/b1ff35e8548cb16177a59ff23961c93a0456a45c |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b5bea9dd545632b235424c59928741275371b5a5 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/973e2ee3d3ae3b298fc261366bb76db4726f67dd |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/df0e64d1a09f904ff5ae02bd71d9f867d0cb6ea0 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/7968d17eeb95bf9ae07e91b493758ec0d1093f76 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/5807e7e391d20be8f0aab7232f0a07e453726b5c |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/73c45c708d085a10e60924aa4bde25ff97b0c207 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/68259ea62925496be69a9e0e3413b37ee9609ced |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e03215daf17a39865a0273773e3c4cd1b2be1dc3 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/19a5cb17c510ebcddb2da459a92cf7a745c11083 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/d2a15a9ebe2d2deac2f24b329db3e6625b17c94d |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5e0f2c44473203b3521747437910e3536642a38c |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/907c653fd6cbed6e10a771c7c8bd2b198b551283 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/250e50fd87a8ea323310d28882d51cc4e5ae1c94 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/181bcda4d270215e05d3c1a2ea9b6ff5bcf69290 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e7271058a3879ae8eebe9f3aa6a33a2ebed7fa0a |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4089aee817088c81686af06e191074e7d97300fd |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9960022abaea0858e03af0d351c0392bf6d204f2 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/cc1771931749ac93d4a3b7c8a134baa12ce7891e |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/50f5c64d93075e7a116e89b42cde1f7cf67b3be7 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ab4b684f6f993318559f0ab0656e3f4b2e2a37f5 |     
        mips |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/fecc36e173329146dd45c3ec025c89b6c93a901d |     


-- 
http://autobuild.buildroot.net
