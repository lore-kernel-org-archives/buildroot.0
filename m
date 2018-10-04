From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  4 Oct 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-03
Message-ID: <20181004060019.4331A20802@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   2 |   0 |  19 |
   2018.05.x |  20 |   0 |   0 |  20 |
      master | 141 |  70 |   0 | 211 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/37e7cbb5fcd22fef2c1b32f8163f7855574ce3b5 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0cb3c976c3c59329224ad1c3bb1d5f145e476674 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 30
              ptpd2-ptpd-2.3.1 | 8 
     linux-firmware-legal-info | 5 
 Makefile:709: target-finalize | 5 
                blktrace-1.2.0 | 3 
                    brltty-5.6 | 2 
              glibc-legal-info | 2 
             util-linux-2.32.1 | 2 
               findutils-4.6.0 | 1 
                   luvi-v2.8.0 | 1 
                 lvm2-2.02.180 | 1 
                  mender-1.4.0 | 1 
                   netsnmp-5.8 | 1 
package/linux-firmware/linu... | 1 
                qt5base-5.11.2 | 1 
                  screen-4.6.2 | 1 
                    sox-14.4.2 | 1 
                     squid-4.2 | 1 
              traceroute-2.1.0 | 1 
                     vlc-3.0.4 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/ed063a98a818de09a4b8e8b689b8efcb5562f5a8 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d7dd10be63b5938906c604e0596499304320f7e5 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/451aec850a996d854adb3905fd17351bedf4294a | ORPH
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/839d392aebc7c21907b63fa739df361d497db876 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/94b7d4337ffe5655c7f7f9e5540f01356bfb5f1e |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/fafb6da9492f14b05330ad35543b1179a479f21b | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/28abbbdc7984a5d9cd27490950d65a752873a0d0 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/bf441ebb4b811c8e8965f8b88219a863d463d54a | ORPH
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9fdb81cbf76859c57c82a9a9afa9f805b1fe7662 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/e6d11fc12f1d8fcd84386329a218e7eb34dec761 |     
        mips |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9765f9217d6e91960810960a263e4dc90c8b20c6 |     
     aarch64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/f1e1fdd7273d20ada03020388e5ff37ea7069379 |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/289795c82c60e966f433a5d00017d68cde6809d0 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/f68cafd7ef1afcc7caca8e832afe761c68ac4390 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/83a108d065b3bb23f1aade0247511be18e7ada39 | ORPH
microblazeel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/1d46e36a5ed1beae32918a4829a1dca0ef741960 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/d51cb3b761b9593613a3e55b7bbcb88abe63ff09 |     
         sh4 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/cfc9f0d0128b6b5d54a172be5f32972f1b5e81e1 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/50d1a3fc53f5fae912c8810271838ce982eeb104 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/c873f5c1ef1747677ba85bcc31f4368c851a04f1 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/6c4bc47ebbd1a85c0c257a470f73efa3a8d5a9ec |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/26d5f340db55b68370190d03b1455d6d4a8adb4c | ORPH
      x86_64 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/bc39229c49db4984355a484e904064e006ce7748 |     
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e98592e565ed24ea15fa645cb38d430dcc03eb1c | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/54d1546e07be5ce92deeda19887758773275f718 | ORPH
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/15251d1228017e4c1669b0b61d7259902fd393b6 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/dcb57e54b0c90055a3e1a5bc3bd3752ede68d88f | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7b587d5130b0ee9578404cbbabeea3157f93441f | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cf729b5fb661215c72722a0c8b67fe4624f0ec9b | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/05ce0aefb967b1c0193a260aee490479bfa06b40 | ORPH
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d15b5b0f1b0279043015f09cd97643a5cf98da8f | ORPH
        i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/27271c02aae1458300e31f67ec6caf423471c82d |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc | ORPH
         arm |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/df0aaa1a246c62c80624f6883e95ed53bd41fedf | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/082d5f88b5287c05edc325a9713d050d738bbc7b | ORPH
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/20af5f1ecead4c658ef560a7574609c7b02e8c20 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ed343235808adc7f454c49058b1297b2310e466a |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d43bd48aed4e5b5469ca7b6f6ce6eb82710f86e2 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4f33a46b69145f3a6c29af627dbf593674268ede |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/470415eb8c3ca22277ff5d7f8d740544a7069dad |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/82b5e2319f9c357a7b58ac28627bdb2935cf5868 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/b4277fab14380dcb9e559a99d66b6966bbdbcc70 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cda38160405ef3b87ba8d0aca42f7e60785005d1 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/94fcf4e654cbdadb2ccfd7c6f37374d1ae318a12 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/dbc712f9c191950ebe0ae6e71564d27244133624 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/0985683a8faddd1ce435e81e3d197f402cee25ab |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1bf97816e511629c53c23ef810fa3dd2fc064be2 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/dafb8595c66d033bf182109c3027b17efb6b691c |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0488d31f8cf720f82e94f3f2fd5ec71422901078 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1108ddfb4f81e59d9495d3d1a62b2325a5011a4b |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e05e5ba2ced3fe0922c1875769dc88d8b3187ded |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/d78269c63611d8ad2a17c4b1ce90c5ebaf3fe642 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5aa58622d33779e83ce55d1479ec01f0d4b483b7 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/a8939e3641d75c70ee0e7a3896e21f69ccde837b |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/bbb572244f326a377234c27254dfdc33ad79936a |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f581e7c1bd6dd5f265180c088301c80a2607371c |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/759ef66441dfedd29f63f0946bdc79535ae78659 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/870eaeaccdadba4793e63ae1c1ab7f0a2487f10f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/00f0b5bee4ba7d01bcd2b135080718db33735902 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/60d210a2164c6c5df2ba15c5899846f3961784b2 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/28d558c595d343485e3cbffdaefd86f1e584a959 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/a8cb2aad645d1e0b29bdd7a16edff9244e1ffc1e |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/40d549c44fe52354d28451b7a52c80f1c6eda2f1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/89585c7c4f3b93ce109dda30ea77b3ed31c51a1f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/3af05db6fbe75e0a787ecb01daf258b4b52853ff |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/285adf4ace0f4f3984745db405884d20855e04b4 |     
      x86_64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/ea5e16b5fde1b8680590d6e4c917d659483a8ec9 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/6237a03b923b5b18583308cad59058c78fc9775b |     
   powerpc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/5232de52792a94435b49feafd33694ebae446086 |     
     aarch64 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/200c8666f3d78c5e277c03cc45b134de00016a5c | ORPH


-- 
http://autobuild.buildroot.net
