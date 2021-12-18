Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0E5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 06:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC91360EDD;
	Sat, 18 Dec 2021 06:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMFgOuM_uSbv; Sat, 18 Dec 2021 06:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977D960EE1;
	Sat, 18 Dec 2021 06:57:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBA5B1BF855
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 06:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A899940635
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 06:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2nBNQtUEeR3 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 06:57:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4605440010
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 06:57:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4B6F740002
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 06:57:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Dec 2021 06:57:18 -0000
Message-Id: <20211218065723.A899940635@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2021-12-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 78  | 10  |  0  | 88  |
  2021.11.x  | 31  |  3  |  0  | 34  |
    master   | 102 | 49  |  0  | 151 |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.78.0 | 22
libdbi-88b8477d57153b9f736d... | 4 
              host-erlang-22.2 | 3 
                log4cxx-0.12.0 | 3 
                 wavemon-0.9.4 | 3 
                       frr-8.1 | 2 
                      grep-3.7 | 2 
                libmbim-1.26.0 | 2 
             libmediaart-1.9.5 | 2 
                       unknown | 2 
docker-proxy-55685ba49593e6... | 1 
           host-harfbuzz-3.2.0 | 1 
                   iperf-2.1.6 | 1 
                 openal-1.21.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/9c3c7ab0fe56dfd76f76e82f7ceb9978e23356eb |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/a080fc15bae86ed5f0da59b9f6cbd9668930b606 |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/0896de0824f928731e32e7a275201fcc199626c9 |     
    m68k     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/74e1153b0a88445df91de98892349cb9ee0bfbf4 |     
    i586     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/15292bfb7c5dfe035ceeecf5a4063948852e374a |     
    m68k     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/86c8cd3905afedba36e112181865991c0613734b |     
 powerpc64   |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/03f965aafcc846b01ef3be2eac996757a33dad8e |     
    m68k     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/8d21fc8f1b1440d167486f025417a6f143c08fdc |     
  aarch64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/12b935fc214f71b9c1be554cdf6f40b69978a5a4 |     
    m68k     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/84ceb10dd23b0df87b01cd5185b7866a03b02ed8 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/2826bd9fb86e59a9251e129f83fee326bf4de39c |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/97836ceee685dc124f0cc7fd6b00071f4e2487d1 |     
   sparc     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/32a050933704f206a9a248d7d34d80c6231fd6f3 |     
  sparc64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/f31bcdb1fd7c427de282f85c3fbc7204a9fb24f5 |     
   xtensa    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/747103aa881a4182b6ce2367cb19565b2d4dd759 |     
   nios2     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/ade7eca616fbfbbe32344a9fccab47a6e0fe0dc8 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/a75ade045cbd315d6e1d5359e5533e1f3421af58 |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/657f5faf0a58d5c02f12b71bf84c5aeff4c8b1ac |     
  mips64el   |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/59df8cc032f24f51662711ea699249479d99d41f |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/bc6933191395ff5d99977726acaf39e34ac1185a |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/66d853fd0e17d528b7c3fab841d17b660517107e |     
    i586     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/e4195e7426bdd0d01db00c748062f58bc870484b |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/884331fc6af1bd6b44db304de803f55ba65584ac |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/37d2fc2fb1896aa237d1690eb3ec0aed38ef1958 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5b8bc213bbf2017a6c2fae86081dae60a7dc63fe |     
microblazeel |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/f300b1b5e958f096a9d58197a44dcf0c2abd3585 |     
    or1k     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/78142463ba8cc5f6c1bf15295095a271422294f4 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/af0b2dc6c723445866eada6db3ccc1fb20ec0645 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/90d3859d3e5f4ef3b2d67d0405e1a326721e8b0d |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e5696747c8d43f7832ac68ee191aeede859d1c6e |     
  riscv64    |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/60989ab63fc9d1c34c717d8b49497ca4db098515 |     
    i586     |          iperf-2.1.6           | NOK | http://autobuild.buildroot.net/results/09c3f7035d996c29184a570d114b9f51e724c441 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/00eee19ea33aa00dc9e59506ab496894978c3e8a |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b5db0926a986a15fca80ce3acb7b6a8c2faa0822 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7c2f6f121d9b7a6a153288aca3da6d6129176866 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/5aa4b4ced900c9efb7f155e9607f98b6269e3b34 |     
   x86_64    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/a4cf35db0efa3edcc456869df4c28427dc562d41 |     
  riscv32    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/eaa2ba54b9c74f07292d3cad4fa96c80e6079702 |     
  sparc64    |       libmediaart-1.9.5        | NOK | http://autobuild.buildroot.net/results/4fe2a978d9ce1fd6ab72d4964575c541ab94cf0c |     
   s390x     |       libmediaart-1.9.5        | NOK | http://autobuild.buildroot.net/results/189e12686b059ddadf84ced40efcd9875e5e1521 |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/bc583ab8dcf949675ae85ee3490a1e910a61eef8 |     
   xtensa    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/dc1a1a49b59bb159fa64deeb30debca9f9e4e3b6 |     
    arc      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/eb00407bab852a3c68a93b52a513acf298a8a35d |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/51a59ab1ece0f7465afe67366eb5a00f15747a2e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ac241508870856d27fed178f06f77cbfa7d9e9c9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/706a09b245880e99109a4cc99faffe83f458afc4 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0f7a4397252fbe73a84d843265ef7f610e5123eb |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a3fd97cdcb959253e011e32231e03d81d8d99153 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8e113b6260a545960348eeb9dfc5d11e0e793d67 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  gensio-2.2.3 | 1 
                  matchbox-1.2 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/480493376d153f841de3d42d0a850693b24bd1d9 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/86defb71791f5366dbc2cd0bc6c486907be491f0 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/24d97c8455ea1fcaf1fdf8b0f7561ca3a6e72a3d |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7bf2bc7d849e2567f2448c18fa6fa9e5da5d6b92 |     
    i586     |          matchbox-1.2          | NOK | http://autobuild.buildroot.net/results/2dbbf7d91588191b7982178a555f2faad97d2f72 |     
  mips64el   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/38aca89d060f020d10131a7210359028a38939e4 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/89f1eada41cd886b487b976518d4615b595ebac9 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2d9c54ba07b6744c7543b99a351a9ce2a5b4d109 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/88a0d757bd879011cca0120df0717531cb999483 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/00d40d15f09dde05d4516b0d6fb96f85d2d3b6aa |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
                host-go-1.17.3 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/747450ff17d0ec305c0f006b37bf99f78e158fb8 |     
  mips64el   |         host-go-1.17.3         | NOK | http://autobuild.buildroot.net/results/775da793a3225622f9110562ecc0c72b11d3c0f4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/157a2c028fd9ce4260a4f34fd1493563b7d75112 |     


Gitlab CI results for 2021-12-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153777  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153780  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153782  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153784  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153789  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153792  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153798  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153799  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153800  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153801  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153802  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153803  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153804  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153805  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153806  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153807  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153808  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153809  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153810  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153811  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153812  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153813  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153814  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153815  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153817  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153818  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153820  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153822  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153823  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153825  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153829  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153831  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153835  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153838  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153841  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153844  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153846  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153848  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153849  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153851  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153852  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153854  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153856  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153857  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153879  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153880  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153881  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153882  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153883  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153885  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153887  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153889  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153895  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153891  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153893  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153896  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153899  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153900  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153908  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153909  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153913  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153915  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153917  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153918  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153920  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153927  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153929  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153933  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153935  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153936  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153938  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153940  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153943  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153946  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153950  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153955  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153968  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891153975  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154001  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154004  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154028  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154038  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154045  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154047  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154055  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154056  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154059  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154062  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154065  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154068  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154071  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154075  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154078  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154082  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154083  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154084  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154170  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154181  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154183  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154186  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154189  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154192  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154193  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154196  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154198  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154199  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154200  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154202  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154206  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154208  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154215  | ORPH 
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154216  | ORPH 
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154217  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154225  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154227  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154233  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154238  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154240  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154241  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154242  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154244  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154245  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1891154248  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
