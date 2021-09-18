Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14182C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:02:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688E4603E5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 688E4603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED2E84209;
	Sat, 18 Sep 2021 07:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3uzd-URl04S; Sat, 18 Sep 2021 07:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238858436A;
	Sat, 18 Sep 2021 07:02:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36EA01BF957
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2527F8436A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wghYuD6h6JkG for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 07:02:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 791ED84209
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 07:02:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7026C100007
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 07:02:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Sep 2021 07:02:08 -0000
Message-Id: <20210918070214.2527F8436A@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 42  |  6  |  1  | 49  |
  2021.05.x  | 44  |  1  |  1  | 46  |
  2021.08.x  | 44  |  3  |  0  | 47  |
    master   | 196 | 48  |  1  | 245 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 12
                      fio-3.27 | 6 
                    atk-2.36.0 | 2 
                 diffutils-3.7 | 2 
            erlang-jiffy-1.0.6 | 2 
                 libfuse-2.9.9 | 2 
              libxcrypt-4.4.25 | 2 
                 mesa3d-21.1.8 | 2 
               pipewire-0.3.35 | 2 
                  zeromq-4.3.4 | 2 
                 apitrace-10.0 | 1 
                apparmor-3.0.3 | 1 
                  botan-2.18.1 | 1 
                   delve-1.6.1 | 1 
                    ffmpeg-4.4 | 1 
              gnuradio-3.8.2.0 | 1 
                host-go-1.17.1 | 1 
                host-odb-2.4.0 | 1 
libcamera-e355ca0087cd93ef8... | 1 
               libgpgme-1.15.1 | 1 
               libtheora-1.1.1 | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 
                 opencv4-4.5.3 | 1 
      qt5webkit-examples-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/02fc166c65f0ca779aee803f24181e299d1d5cfc |     
   xtensa    |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/4ae4e862dfb2d0752057ede6f1e41181b37f3f1a |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/724957eafa2f886cd55d423d946deeab4f6eabed | ORPH
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/50ad3523b7a247d3eda1994268bec43df057aadb | ORPH
   sparc     |          botan-2.18.1          | NOK | http://autobuild.buildroot.net/results/ea2d0de8bae1bbdd236b874a2ee6f10716394270 | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/acc7742b47f0cfc37cf1bb9f69810bfae5d01c2f |     
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/28c0767710fc052497b3c6c5e032b63a9208605b | ORPH
   s390x     |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/90b3bbd7172e054f7a8214dcb7ef4ee80183e8fa | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0b883167ffb76af309ee61e128fcf7f983f9d7ef |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6044db49b6cc211a578a1733c44146cab9cc3123 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/bafbb6d68d5aa135aab47746fb9cceffb81a700c |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/e16ee24e6d4c6a261ca28a05385a6adfec4f6d2d |     
  powerpc    |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/6b7bd66394a36be549bf6190c9d3ff86756f8829 |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/25738f0a49b253375d5bad6a900ee56f0a24fd89 |     
   s390x     |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/584938fffd552d1729aa0d9fd8cc6a272d8d667d |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/419277c69d6f2797f4b9ca194a6376d366bd7a99 |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/b0ec93e6c73635073e3373851d2e708c19358713 |     
  sparc64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/95ceffe789351328c54b2c8bedf87c785d143748 |     
  mips64el   |         host-go-1.17.1         | NOK | http://autobuild.buildroot.net/results/6b8dcfb5cc13e05210c7f0ce5dd42244824ebe5a |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d319d4efa144bb1aa3ce6f0a2fc7f5cfaccfa706 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/371b6bf57f3a5f52b23a50f3360d28f98694616c |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/420a6bb59b45c679588659b869eb1f22cdb71b60 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0a7673bbe8bb6ba18fa269c816042bff0320c558 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1c8b53319e4a846b43531df48f52e77b23dc57dd |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a37da8ee2186bcab574eaafba44e2e5f69324345 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5faea86814028bf78cbea64afb8b2c4bb36c68fc |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8396685bfa6c5b72fce9a2a8d7ff4c4a39d7a3e5 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/11f450a309938007cec3160ff20d3015664dbc12 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0a35457a888966e55d1e254d361f72b752b7e54f |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3d3534783fd490e0443c24eaff3f81b78d15c98e |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6eab4433678e356b43282505e9577f9ef4766ba6 |     
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/461dea38ba207b452999eca6860f7b71f233e08c | ORPH
 powerpc64   | libcamera-e355ca0087cd93ef8... | NOK | http://autobuild.buildroot.net/results/f92b187ed4d927a19e69c89937ac19e22e45f288 |     
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/dd5098661c9a5812f543e6a09d718f4af2bf2168 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/1ff3c109321674fc01fa74aa707a4e74c084d42c | ORPH
   s390x     |        libgpgme-1.15.1         | NOK | http://autobuild.buildroot.net/results/d90ea465be73916f84d54a4c0d2121f692fe58d1 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d1718d5eea0ec6aed196f79526dcdbf7fd3dce46 | ORPH
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/851a12ff5228f223da1edfebe9e4e516bd7e1d63 |     
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/4766bfce9813b7f321369ec45298d16cd6dc251a |     
   x86_64    |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/29c7733aa7d80f2f3edf16eb3273496fcf437aa4 |     
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/62d8ada0b88130d4dea5db59ee83f33a076970b3 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/d299eea603b34654b71513c0c3d48dfb2704d7fc |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/02ca0d6355fe59fffecde2d71c9e41cdea90f191 |     
    arm      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/9db3749d088753e2273d611cd7a9c187c9f05301 |     
  powerpc    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/00c37e63e2418d7ea4d49d218719827e407f140b |     
   x86_64    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/808a020d1bda15ce1a261e09bf3d639eb29feaa9 |     
    arm      |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/bf0538a32a2040d9a99ecf99b1e33aa1e7c016da |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c64bebad6cd0fa71ab53f5e63a52fcadc3a3c910 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0c1b1293e31d0e28b4d2910833268614215eb072 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
  gobject-introspection-1.64.1 | 1 
                     host-llvm | 1 
                 libcoap-4.2.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                    mpd-0.22.6 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/64d4839fcf3aa44d70bcb10425ec7f227688a2f8 | ORPH
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/5eda6160d7ee13e4a093f8fbf707b7b6a085e7dd |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/056c9b0101178cf001d327f5f2ea78d65e2efa1b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/46e2c29e69f02b80eb38e5a649796eda3f72f827 |     
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/d4a8d889347ce5d67df4460efdfc285d696ec918 |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c2051815616f2e10b3547a5c3a230b5e66c965fb |     
    arc      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/b0ba7d8a3a56a9c7b173f045daad6c2386180d8d |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                     qt5webkit | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3e2da6dc86b5f0fca5fb64bda0c8f57860be2dc |     
   x86_64    |           qt5webkit            | TIM | http://autobuild.buildroot.net/results/32e962cf28fa0810d810511796238e8aa3033616 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                    ffmpeg-4.4 | 1 
              libxcrypt-4.4.25 | 1 
               linux-pam-1.5.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ca7fd675a3f4a202c6dfb33b6acdeb3013992db7 |     
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/b7e6016a1f4ea01aefef86dce6f5ad4eb79a3b2c |     
    or1k     |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/7cf773e0ce3f0f715498ee26198061e351baf6a7 | ORPH


Gitlab CI results for 2021-09-17
================================

Detail of defconfig failures for 2021.05.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001942  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001965  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001967  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001968  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001970  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001974  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001977  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001985  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593001986  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002013  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002015  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002020  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002027  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002071  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002075  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002078  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002079  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002107  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002151  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002153  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002163  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002162  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002185  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002187  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002193  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002195  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002255  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002260  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002261  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002263  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002264  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002289  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002291  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002292  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002294  |      


Detail of runtime-test failures for 2021.05.2
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002320  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002700  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002701  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002703  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002704  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002705  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002706  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002707  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002708  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002709  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002710  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002711  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002712  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002713  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002715  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002716  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002718  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002720  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002721  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002723  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002724  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002725  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002727  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002728  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002731  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002733  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002735  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002737  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002741  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002743  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002744  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002746  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002747  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002749  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002750  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002751  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002752  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002753  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002754  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002755  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002756  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002757  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002759  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002761  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002763  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002765  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002767  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002768  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002770  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002771  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002772  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002774  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002775  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002778  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002780  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002781  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002783  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002786  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002789  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002790  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002791  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002792  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002793  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002794  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002795  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002796  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002797  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002798  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002800  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002802  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002806  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002807  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002809  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002811  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002813  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002815  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002818  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002819  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002822  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002823  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002825  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002826  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002827  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002830  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002831  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002833  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002836  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002838  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002840  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002841  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002844  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002846  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002848  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002852  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002855  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002857  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002858  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002859  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002860  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002861  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002862  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002864  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002865  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002866  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002868  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002869  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002870  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002872  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002873  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002874  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002875  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002876  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002877  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002878  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002879  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002882  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002883  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002884  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002885  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002886  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002887  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002888  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002889  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002890  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002892  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002894  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002895  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002898  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002899  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002902  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002903  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002904  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002906  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002907  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002908  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002910  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002911  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002913  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002914  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002916  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002917  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002919  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002920  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002921  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002923  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002924  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002926  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002927  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002930  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002932  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002933  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002935  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002937  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002939  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002940  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002943  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002944  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002947  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002948  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002950  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002952  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002955  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002957  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002961  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002962  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002964  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002967  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002970  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002973  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002975  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002694  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002695  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002696  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002697  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002699  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002668  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002687  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1593002688  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248798  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248800  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248803  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248808  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248831  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248835  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248836  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248840  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248859  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248876  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248877  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248878  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248883  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248915  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248932  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248936  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248938  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248997  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249065  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249069  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249066  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249074  |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249073  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249079  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597249157  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

