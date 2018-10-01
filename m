From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  1 Oct 2018 08:00:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-30
Message-ID: <20181001060028.AAE1820A90@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
   2018.05.x |  31 |   1 |   0 |  32 |
      master | 200 | 103 |   1 | 304 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-cramfs-1.1 | 1 
host-vboot-utils-bbdd62f9b0... | 1 


Detail of failures
------------------

        bfin |                host-cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/2d54df3047f33f5199467d3fbd111c5a34f3c8bd |     
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/65ac098ff0be313a830194bb36126c24290461d9 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 


Detail of failures
------------------

       sparc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/e67c785bae13fc98503f536204bc58e9cb8833be | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

linux-firmware-44d4fca9922a... | 22
               target-finalize | 22
              ptpd2-ptpd-2.3.1 | 10
 Makefile:709: target-finalize | 8 
                haproxy-1.8.14 | 7 
                 lvm2-2.02.180 | 4 
          synergy-v2.0.12-beta | 3 
                blktrace-1.2.0 | 2 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
              ghostscript-9.25 | 2 
                   netsnmp-5.8 | 2 
                beecrypt-4.2.1 | 1 
               boa-0.94.14rc21 | 1 
                    brltty-5.6 | 1 
      docker-containerd-v1.1.3 | 1 
               domoticz-4.9700 | 1 
               findutils-4.6.0 | 1 
              glibc-legal-info | 1 
                   gvfs-1.30.3 | 1 
                  host-go-1.11 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                 mesa3d-18.2.0 | 1 
                    pppd-2.4.7 | 1 
                qt5base-5.11.1 | 1 
                sg3_utils-1.42 | 1 
                sqlite-3250100 | 1 
                sqlite-3250200 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e4aa14d21dee2f896e15e91ae8d4f793bf5528a5 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/1994c12d6a72a68845bb4543956bdc1dd5e565f1 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/e09ac3dc0da09e5e8f4ac3e49ac1ed3f62dafb4c | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/be4b7fd6948350be513a91e994c1a9b9d8b5a896 | ORPH
         arc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/b754c7cf04283656812b54a682d0d1179463f22a |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/8423d9ade9d2040edc80a226e9071450ad90565a |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/f5b98a0f55efc1c91553aa4987aa789edb158056 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b5a2dd309b378f52d6a9fb7d702fd264c484823b |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/999c39c08dfb0d4c929b6a189d3706cc863e14b6 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/ff0bcdb4b31f7fcc26ba79fb4499811e3ca7be33 |     
        i586 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/2c130e47401e29e9cb93394c78713b4eb3eb8c54 |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/bf0b4002b8f55e60b34f5cd951d409385102cac2 | ORPH
         arm |               ghostscript-9.25 | NOK | http://autobuild.buildroot.net/results/d04ad017bf06a442a7397f935959994ba72824e1 |     
         arm |               ghostscript-9.25 | NOK | http://autobuild.buildroot.net/results/5d1cf1faa454c3cdbab83fbac1a77326d2e8a755 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/32bcbff19072ad3da654a417f9bc57d0e99ae6a8 | ORPH
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/e428dff94e6840bfcebe32f44706ae6260135b39 | ORPH
     aarch64 |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/60dca589abd7e2b97bca34dc0545eb2fb54565b7 |     
    mips64el |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/68057df731d1c2215bb7e7222f65089acfa3800d |     
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/261d4292506129ba4ac10569197286c58964a05b |     
 powerpc64le |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/bf444345427b6092714cd791b0b611acb85be197 |     
    mips64el |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/d78eddfb54f3b61cd70be3af1e33e91c192afe71 |     
 powerpc64le |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/a29e016a9822dfc7ef30ecfffd66e0648146c26e |     
        i686 |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/8e06e477647e6fd62d58911f65a0ba95c68155bd |     
        i686 |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/d9d3f46fa23804256466c907007b825a55c514db |     
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1d1982bb9b26450834baeeafb5a69257b8f0f0ff |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0a340f2356a9686916dc495e6fab79fa0a55cf76 | ORPH
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/8f6116799dcf9991e5e5253b404506b1439e0a7b |     
      mipsel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/74086f93efb578846d31ca1b0b9568a0ef1dfcf0 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/87f49426842d22f3319ca531b1d8ae471f19c160 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/981ef1fe1e76b02649f2e6bacbcff69ec16fcd36 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/9e4083603268bd9edb6bf92cd4df30ecb9b3c8e1 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/03a32362d6d8c41955e57949471908df8460f354 |     
  aarch64_be | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/9a0ad1649c4d6444aba400bbc1c72b738b15f138 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/09a161a1ff727219452dcf80c1acda79aaaddf80 |     
         sh4 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/424a0d077a7bb17ab21c49b5e690b5271b1229ce |     
       sparc | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/82f9f61878d77fbbd2d70ca9c24a2b1f5fc641f5 |     
       nios2 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/6f50ae01d9348830a8119335e131f236055f7cbc |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/54e37ed5dd9a5333930f34608ced559586ef2651 |     
         sh4 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/a055c617e070aa6c7db8c7d85ac186c86a6e69c8 |     
         arc | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/c6282ebfa2d5f549734c939378f7a762c056f5fd |     
microblazeel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/2d4ebce2df703d27e8e91c4e31b1929f45df3d37 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/dc1eb2a77a72a1bba2c4a9a60d113d3966ac9407 |     
       nios2 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/d630ccaa77d91c820bc5fbb66f021d1301f2c1d2 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/2db730c53d696a0eadf48b689b2aa36423c25d8c |     
   powerpc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/7991db22f6214c7c456d60790fe29553aafc1144 |     
        i686 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/91d1d5c136a86470870c39d78a07e67224b59de5 |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/a1dd3cebc515b613ac345e8376b95f21fe21a7d8 |     
       nios2 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/c892aee9be704a580f7efe676ef76a67f28b7f32 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/05a0fb81ff651bdce75a0e1b3459db2f00172c4f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/6a6e02a5e6d4c77bc968c3825f64fb98fed637a6 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/8a3ff34a3684ef3683a213f1833989fee3a0e406 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1aa628c355facb486cece3388984aace400e396c | ORPH
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/eeb854e83a1b9fe10f966eb7b3c8709a986401fc |     
  aarch64_be |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/490abd822e627147439ba44ae25cfc2a5b90d3e9 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/59574063fa9ab49a536002cce562c6bc9f66844e |     
     powerpc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/2f654d6a994deee310e8b560ff3ffde9edbd016e |     
   powerpc64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/e03c6cf2b36d0f37ef2d1868fd75932823bbc173 |     
         sh4 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/3c35cc8b9e93dd9977d730cb7dce90355e549e94 |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/75ec47d8e3d53e85f223fcbc372fb5fe78072a13 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/6999f7b6a0236694bb27d48644d1b0809e540c8f |     
        i686 |                  mesa3d-18.2.0 | NOK | http://autobuild.buildroot.net/results/5aac9e9cad789da11b05cbf5d2a5e3f3cf8f1614 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e31c5edcfe5699cc84b4e128c4c5cb6e9c2c912a | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/af97f235dbe63559c67fca1613313c51442995e3 | ORPH
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b9aea2377e753f355cd3ea2cc44d30cf9c71d3b7 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/43f4e8476a1628f4e975ff65bc3976388f20fc68 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7e1d035e850cac63110984d35fbdf5f72e5eafa1 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5802bb65f7b4075e0c31e3033b3ab00b529c5efe | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/71ae81efdeb3af41b92d9fe0903b137a92102290 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0ea42cd2d3de43a9647144c4c433bd193113e356 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6fcf25a6ab51750285c04da30a3d42f83b6d629a | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e4dddf41098798b4d6979dfc1aa574592a562d5d | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/00a5018951363a087019a958960a064224b7d076 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/89655747f78a05dae0b649a37e17dc497e74f2b5 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/145e360235abe4c23465936b27f65cf8b5104e54 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/e7f71faf16976ba2686fb9826a6389094a3d9a55 |     
         arm |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/1d396e85d35f40478b4b09b4ff80eee395a2e3c2 |     
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/70b1582edcb787746e4483e80b27f86ac781f0fa |     
         arm |                 sqlite-3250200 | NOK | http://autobuild.buildroot.net/results/a0e4ae4175009b2f361c19dcdf043422f64bce90 |     
   powerpc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/99562804f4021514bb5319f24fadfc79292267b2 |     
         arc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/710ed85daf22050f4b5900073b250c830daac429 |     
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/655834127d37b364f52835af3bdcb2cba52aaada |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3b30b0056da9d3e5bb628a39335ed46116ab7697 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/bc76c21ef38c0730ed2945703fe3ab58f706c205 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/00464232dc43652448aac0b454e64b07e92d874d |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ad9c504aad4cb1e1302d8fab6c6619d37ed20430 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/910dd5324a1187e686e608f84ef2982be951cc80 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/3f22686b488517647c78716b80c6b6f38b5a9050 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/429d5961b59fc5c9130b786b16a1a0de70450a57 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/3f20b67be5cb18b7e5810ffdb4cbc58f4c69d98e |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6bf6286e4facca53e9e2606d99f0585f1e474837 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/9e59bb87514d7b3ad0b66a79f8142ed2bc05f0d1 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/9e5e237dd874c4fcf0d9bb50445ffce98b17d124 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/e03ac8e711d035f617cec2f59f6a5d47f6c17b17 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/330bbb0d1c85ab1b20117c1124b5fc547e0181a7 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d88d79fcd4d73b651479f23911b46fce548e4319 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/ae7a70f66ec4e68b3ea9a3be0fd82dc08092308a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/5988da0754139052c2c57ed2688687b1fbd76a66 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/39acbf241074812ddb785385dfd9dd36757f4b9a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/61804368f9734b5d3fe269b93aded082c41125da |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5080575b58cb4da932c33abb14edb36702f487e7 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2da2f041f24143375cbd21816a855f55777d2408 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/4e3fc041a0ca1a27f5719456c3057c0bad95e134 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/731cdf5de4b90608cd3132340c2089f8166ba85d |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/4260c9e610cca99e87859d5f3ec325df317dfaba |     


-- 
http://autobuild.buildroot.net
