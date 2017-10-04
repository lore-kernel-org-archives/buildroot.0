From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Oct 2017 08:31:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-03
Message-ID: <20171004063109.A6CBA2093C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-03
================================

      successes : 235
       failures : 86 
       timeouts : 0  
          TOTAL : 321

Classification of failures by reason
====================================

                       unknown | 23
                host-mtd-2.0.1 | 8 
                    flex-2.6.4 | 6 
              lbase64-20120820 | 5 
host-squashfs-3de1687d7432e... | 4 
      host-uboot-tools-2017.07 | 4 
                     nmap-7.60 | 4 
                   evemu-2.7.0 | 3 
                openjpeg-2.2.0 | 3 
        wireguard-0.0.20170810 | 3 
        wireguard-0.0.20171001 | 3 
             dbus-python-1.2.4 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                libressl-2.5.5 | 2 
                 mesa3d-17.2.2 | 2 
         python-gobject-2.28.6 | 2 
           uboot-tools-2017.07 | 2 
                  cc-tool-0.26 | 1 
                  dash-0.5.9.1 | 1 
              ghostscript-9.21 | 1 
             lttng-tools-2.9.5 | 1 
                 midori-0.5.11 | 1 
                   perl-5.26.1 | 1 
qextserialport-ada321a9ee46... | 1 
                   tor-0.3.1.7 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/bdcb5e1a952cbb565360650fbe754f792fb86cef |     
        m68k |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/4550f646036137709ebe8971df15e1c144b30205 | ORPH
 powerpc64le |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/6b37501264addd92157b88b990dbf7265fd526d0 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/4e112d11125f107f2e410988309a59933a9e5229 | ORPH
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b1326ad59873445c9cdecda58d1c3a395203f627 |     
        i586 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/bd9547091dc1fd63de044dc3b9e8b1a5dda8c777 |     
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/9197c5e2daa4a05d979e1f53958d2482a1135026 |     
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/1e9668a09587482886137aa8ec14a5bdc07d5ded | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/10dc31c824a3f2c0ea4cac4b6b24bb1e6c6738a4 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/241773f8e2eafe4449c83f3eb2452c42d9734cdf | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/a3c7f66b712cfae0aadafecf2bb26f4dca7a9130 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3a0669a8bb9a77f92e7a998b6781b96f4ff65612 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/5a27202dbe3af1141d925115f66aab7c475a9dde | ORPH
microblazeel |               ghostscript-9.21 | NOK | http://autobuild.buildroot.net/results/61ad6814ad6722c2a280d09b59d0238b92f85c82 |     
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/85acf6148ba73a5ca67a6d3a4028032888ffcc59 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/ab28d8ab4091ebf23da721c475f70bf5abaf6a2b | ORPH
   powerpc64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/9f13ff335de51707cdf620cdd8201ff2f821a625 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/a87f9146725343b6e1601e3f01eec52f7a8d3051 | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/3000dcd8e15b34b577705371e4af86e284f75f42 | ORPH
 powerpc64le |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/d31581d2e60f35cf70312683df99c768e2ea8516 | ORPH
        i686 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/743d024f7546c6ddfa468b2265c7a9f024bfdbb7 | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/627e18e5074137089e7441254781b055ea1f456c | ORPH
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/d9c95231ac774ed71580754a15ebb3b121764310 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/f9479fbc49518820a7ada2f388a0cc0120e6d3ba |     
         sh4 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/4aa8298b18693aa053be6053db935d24182a4326 |     
        i586 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/55ab53a691d22e6e397b55053028cde3a3058bf2 |     
        i586 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/63824aef43ed6fcb674995aa60573a0f13ceb58c | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/aad1d2319aae09daaeeca8cf21dc1994c7460aff | ORPH
   powerpc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/00e5ea452b7f4c3a8cd2c17add6c74c424e438dc | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/0b2e0271e3ba12bb3481957cfdda00390411ab42 | ORPH
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/70a69a5d2ef5645749faa5d2b2e8d9423f24a119 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/144f7b14fbd4c612049c47431785bf47cb742f64 |     
      mipsel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/0ba721cd1a1ca5f9a6a4582f7358a37bf2d2fcf1 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/2ca55d0be83d6a0819ac31e7784510f33deca9cd |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/fed71e5c35578a149f8084d3d243f00c4eecdd50 |     
microblazeel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/ceb53e10ac665bf9a21ec68bb38793f65d8daaf7 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/eec53c0c58cebce6994579041af95214af6a4dbd |     
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/9d093b19872c891c89f54da152f0a329438b447d |     
        or1k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/d1ba4a32fdf2ad7a77bb831eafb4191a08cb0f85 |     
     powerpc |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/32423d94c5bd269566546e6b335d13bb70af5e01 |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/c6041bcd37fd3f7c857945699522c0448e7c063d |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/6adc4b75189a825558ad4b4994ae5491423d09a2 |     
         arm |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/e0e9f2fd5ef5d6aba564e4a8f66d2a022b3b4c5d | ORPH
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8691b58ed754875d641f5830ad96bfad19d03e1f |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/b351d30f43f4012c6db8a860705ecb593c066a86 |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c948381f1ed5440161ecd4631c637650e09aeaff |     
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/07ff1260355957b7a5cb5b131e8389b34f2455d4 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/be23c23798fa63ce39de3fc2e66a9a6089b13535 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fe61fbd7307fea1ebecdd695c5d74db5ee43b3da |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/afee7ee4b4293a25f74add1df910da2fd5f57204 |     
         arc |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/f14c7ea6336e66b8e98f04e768903baf39c92444 |     
         arm |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/993fa2d3816eb5e90eec04dbc78b6da5e880f30e |     
     powerpc |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/e04d0c57e629513a6a2af22d7b9526c2ee0bb927 |     
     powerpc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/1755f14fe13896a451fdf9bfc511770cae4ff988 |     
         arm |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/8e639ab8912e7d884fd8e6dbb1ca8b49451dd766 |     
     aarch64 |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/41bcd5cab3b81a3511bd18afead4d391077fa637 | ORPH
         arm |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/58c5a3de17f0187a4c7c457fb325bdf30b2c6756 | ORPH
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/b545085f893abe0086a7af614f4ed828a70a1d04 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/720a4b23a47aa6677bde4418f21e6b073a72ea51 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9f68b71db2a5ce72b2033c441de4ac9918f7fc2a |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/350de1d86904877d596c59bfac84aa584a9f1209 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/e88d600b6b3f67a322d4c45a74645d53fab26b68 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0c099d321e5eee37256dc7307a7161d928eec3b2 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9bfa28172744cc70b3de0b795942dc30166f8ec8 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/bb3a40a63590ae18239aeb2f2655a867a4259890 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/8978f7f069b75fe146608d9a1a32afb8eba78fe8 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b777b470f40b23a639b6d1c0eac8a16312aac209 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/039b24d67a087bb6cdddb632cb4190b7d81a4c3c |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/00060dabdc1dd07812f9bbf99a67010ca05fc301 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/4a0e2834f5e509404a64f9b256cd9ebf6c00a0e9 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/a554c51cdc4e1c5383cca130bae5d688252a25c1 |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/8301a305af54ea5edf70198eda0dca2765f10d54 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/14edf051d113a6ec54b61738748764adeac7ba9d |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/719667dd1478e9a5b23bb3b020280ac547a098ae |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5610b0229c2c1de930b6e72de7e303c5b20065ee |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/49d172845fba52042d81f7b1fa0194643b881cc3 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/c0e949eb83fd1c41b82587262b032914f5370be3 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/39c1fa61baa641a3fb36f268eb38def0cd745397 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/6df79aea959cb5d089538ff31406c02c6e0da097 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9eb7e6482f87850471483092f30402943497f829 |     
        i586 |         wireguard-0.0.20170810 | NOK | http://autobuild.buildroot.net/results/447305a7aa9010a079ab461070ad18d2b5e5e179 | ORPH
         arm |         wireguard-0.0.20170810 | NOK | http://autobuild.buildroot.net/results/8295a93cafc83a882db11fb2c9e919e642bcc907 | ORPH
         arm |         wireguard-0.0.20170810 | NOK | http://autobuild.buildroot.net/results/5b36eefc3ef03b209aea36261f54b9a66b8673ed | ORPH
     powerpc |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/7cdccbf7afdbd0d6011ae9d64ad02daf7632b241 | ORPH
         arm |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/0a534a70a6289faf5e27cbb51ed136ddd6d0c062 | ORPH
       sparc |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/b81079671523da1533c48e3fb35ef9f9edc3d591 | ORPH

-- 
http://autobuild.buildroot.net
