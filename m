From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Apr 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-11
Message-ID: <20190412060043.397F087EBF@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   2 |   0 |  23 |
      master | 154 |  79 |   2 | 235 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

       host-python3-legal-info | 44
            python3-legal-info | 13
                   netsnmp-5.8 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
                host-go-1.12.1 | 2 
                       netsurf | 2 
              qt5enginio-1.6.3 | 2 
                     gdb-8.1.1 | 1 
              ghostscript-9.27 | 1 
                      gzip-1.9 | 1 
               host-llvm-8.0.0 | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
                  linuxptp-2.0 | 1 
package/python3/python3.mk:... | 1 
package/python3/python3.mk:... | 1 
                 python3-3.7.3 | 1 
            qt5location-5.12.2 | 1 
           uboot-tools-2019.01 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/074520b393accc133c586c3be8d37005c6d3632d | ORPH
microblazeel |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/1c8880dda9f42db658e144292859064d272ad0d2 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/f7505b4733ee88b0cec40e764dec5f95bf67bd51 | ORPH
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/23ca6b0d5c76e16e4c11b20f987e8776564e3b49 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/4512d180e36256a95f95142952dcee61d3c11ad2 |     
        i586 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/0c046a1b57a4f0b992333003d41062e1b256eb0d |     
     riscv64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/68f3ff82c5a50cc3691f8b5f1541c4950e2ec8f0 |     
    mips64el |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/905bb1b1e2e93ce87808e0fbb53cf188a5909757 |     
    mips64el |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/aff223737bd636c9f575080850955ea214c34313 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/6ae971cd4d70bf1117a9739bef1df1d19f13af37 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/1c1742fe2f7eecf2cda02f85e18dd477e001e3bc |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/a33d8ea90455facc43b4a46cd22637e12ee0c192 |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/692a0b15c2a3916f9b03b2a8323ecf1a736cd0da |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/5835e7aa287b1e984210489974f5ead641c2fa0c |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/664e74ab2f9207728c708328006c2557db63faf1 |     
     riscv64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/479806caf9272821e7e1ccfab39aebdb284ad9f1 |     
      xtensa |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/d030c28fdb1347672fd51c895a5337ba4e32e2d4 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/90c096a07dc914bfc15fad3b0e151a1ec9aec1a6 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/f24dc72105e85cd9e2dbc0a6bd9142b968183925 |     
     riscv64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/76f5be8c5cc73540e604ad8a53b5de395983a8a0 |     
     powerpc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/ee6c59fb4bac3f759eaa030c977916021dd3496d |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/d1808c0a369ba8f3de66614dd1e70307e655223d |     
 powerpc64le |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/fa42dc51ecb90d988cd98c768ef48638a2f0c0bc |     
     sparc64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/067ba577f3aa7a9aa30b1ebe3ce9f9ad07afc165 |     
     powerpc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/2b3e47a6591ba930c6e04448c92da72d958ae4d3 |     
     riscv32 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/f40bfb6b2c1d8751551b6babdb04d687470b3107 |     
     aarch64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/947dc020156e4efe04b995106e50a7c3434eabbe |     
microblazeel |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/b687a69fcf1d8c2f44a8cbc2d65dc4dbbf7d76ec |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/fc6b68ca257f4e473a9efa8ac3712a286e024cb7 |     
     sparc64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/9c8449aaade39527fb43be189017be7ba5ca01db |     
     riscv64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/52137b4c1cc69032821a561a80ee48d27c79b9c1 |     
       sparc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/15e3aaaa46e845a0d24a3a3b525c8a971cef1f98 |     
        or1k |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/ac9a30914094fd0e5b654097c059356dcc429956 |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/1b5f18af8795469f524ee7b0c9c4d73c167ec6fc |     
     riscv64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/5da3d0a07d8294e03cead257b91563c5c9ab83c5 |     
     sparc64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/89e58e32a81de11546cc05b3736d082174afd15a |     
      xtensa |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/d7d0805675c68736c0856a0bfe96c4ef019c6579 |     
       nios2 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/7e8980c110b347164d050309c87e932889ecb924 |     
  aarch64_be |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/679e5e819e12e1212713a2028291230004ac764b |     
      mipsel |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/c46ed772e7aedb172ccaa7f45a2714b3d4d36a67 |     
      x86_64 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/dafc99d694c54423f91acc9e04f6b2505b96b403 |     
     riscv32 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/9b09f40f4bf9264ab28cc01d4ae5dc404be79c91 |     
     riscv32 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/12e6f1016adb45effd2461822a7f06abf3d8355d |     
    mips64el |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/741c1d7ea94ff875420af0bd417dbfe737487750 |     
 powerpc64le |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/ac74c35747cdca176f0e66c8a0c87832d423eebf |     
       nios2 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/2d6a11a538572d8ac06833024a210f6e09744970 |     
       nios2 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/21fc4ec361af3fa79b80d26b38df39df81108c18 |     
         sh4 |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/30958298a0e01f34eb4369a8a1eee2791e54bace |     
        m68k |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/0f62e9e73356a2cd67111edbfe2fcd0a1be91778 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/84250d69f4e6606baadd1649f59c34ba772f26a0 |     
         arc | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/8517fe8fc197769285babf4c0915423d98c64d9c |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/2df8c6a57cda5a0b6a6b13fe90d409267a19d864 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ec1c5c6398209016976d1e166066da314baf207b | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4a32bfc89ee07c3070a9463f36a9d6384665d5d8 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4468eb1517496fe5f95aba3046fe9fecb43faa1e | ORPH
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/7b2c079ede7fae443261389cd6a23bae068f91d8 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/76504b44b0115494f320045529620f73bddcda02 |     
         arm | package/python3/python3.mk:... | NOK | http://autobuild.buildroot.net/results/b1834361982102d20a06b1500c8ee95302cbe58b |     
    mips64el | package/python3/python3.mk:... | NOK | http://autobuild.buildroot.net/results/c1c634bc806ccb6fa0a607e2b481555cbdae5755 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/329129a9b70fa8265e9d7e95ec8dd444db7e0d36 |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/70da5a71d3ee8fff18cc07b9755438917e43d058 |     
    mips64el |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/82f44fb41e4083e1b7111dec51cdc2199f69a245 |     
    mips64el |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/45dc2cc5032c9579895267c9c9f52a787d8a28f9 |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/ae458c004bdd788f88c58bc91fafa083e938704b |     
     riscv64 |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/dfa45bc2b52d5418db3ea428638ee208f48f2a57 |     
       nios2 |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/b50bfbbc634a3e643648f9deafff06892af83962 |     
      mipsel |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/537a29cec22a69f080b9ff9b2cddbdd18d952564 |     
       sparc |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/6f8c849822c22e3a1dcfa4d134f386c86bf0f328 |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/0f51be78edb09f993a54b9e9b69474ac18ce80bd |     
      xtensa |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/b0cfce6588cd1a0daf345cb92d480408c723f9ac |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/615286c1b71a74279e156b05c6e34694bf9ea5de |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/4c6bbcf0722898d9b7b62d8930b833ab445c82d5 |     
      x86_64 |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/19c230ba66d599c6fdb3304d0d2b1997ae0492c1 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/dbdd4ac82ddc08b72aa096f43bce2c8b44e8e1e5 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/0fd07ba38cb86b75d8b47e9c0a02aa52e037e332 |     
         arm |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/d9c6cde423630a2495d2f5ba976b63034dacb7a1 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/96c35d1864d1fa56a64f06132de17aa6460d4006 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/522cce7aaa21ec0cf4ca5c42c4fce75c66dde9cc |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ed0b14744106dc9b346fba3361d858ce36723816 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/1e36e25a323671b2794aafdccd10c168e4e50743 |     
       sparc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/3d2a0de008447db67fbd372d68fa49d4548d63d4 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  linuxptp-2.0 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/4d192b01ae5cc5cf9a0a392142dd8cf8b53e332e |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/b1ba73f466c656be318e5b65c366bf7a4e0f4967 |     


-- 
http://autobuild.buildroot.net
