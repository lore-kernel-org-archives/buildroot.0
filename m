Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192EBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E7660606;
	Sat, 27 Nov 2021 07:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqTk8JmaBPtf; Sat, 27 Nov 2021 07:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 308D660608;
	Sat, 27 Nov 2021 07:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F89B1BF267
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 07:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 012B8402AF
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 07:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klRUBELpWwSO for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 07:59:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 832D6402A6
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 07:59:26 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 575AEC0014
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 07:59:23 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Nov 2021 07:59:23 -0000
Message-Id: <20211127075929.012B8402AF@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-26
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

Autobuild statistics for 2021-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 60  |  8  |  0  | 68  |
  2021.08.x  | 56  |  6  |  0  | 62  |
    master   | 85  | 30  |  0  | 115 |
     next    |  8  |  5  |  0  | 13  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 14
libdbi-88b8477d57153b9f736d... | 3 
              host-erlang-22.2 | 2 
                log4cxx-0.12.0 | 2 
                 wavemon-0.9.4 | 2 
                flannel-0.14.0 | 1 
                host-go-1.17.3 | 1 
                libnice-0.1.18 | 1 
               linux-pam-1.5.1 | 1 
               luasyslog-2.2.0 | 1 
                   poco-1.10.1 | 1 
                    qemu-6.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/d9b934d668ba6a187b63736548e51cc4b88b8db8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fd7ba6cd917a34415330cb61186462f38c929f98 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/007fc01e34ec7b35f275f6445fde4515045952ee |     
  mips64el   |         host-go-1.17.3         | NOK | http://autobuild.buildroot.net/results/7ff15004c02d827b74acf1a87391c63ede5aa165 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/cab6e8b961a0d36b14dff760e29af77ea16614a6 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/22e76bb98fca50a0ca170166c5324b64acf500d7 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/77164646204c7b1bbd434a45f3e6e2ad203b6f4f |     
  riscv32    |         libnice-0.1.18         | NOK | http://autobuild.buildroot.net/results/3088ef32b03e0bb984291b1227b187f1ff816eb7 |     
    arc      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/387d1793336b25af6cd1376dc8a92719f8f4abd5 | ORPH
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/acf5a8c2a2ac56ce9ebb656ebc34362b7332a791 |     
  sparc64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/b72f35f45aaf1af006edb01aa6258f16db4c7462 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/7cff3e2d1251133e6e34910623b5f8a93d888216 |     
   sparc     |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/eddcba8e74c23ea041f2d95de57196107f5af8a3 |     
   x86_64    |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/fb169024028e78b5605a5aef11bf7961f2609774 |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8e26478af01fb45f36bb88f002b20f4e7d6371d1 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7da2e51d895000b42b7275bf903d08c5cde8db91 |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f9f6912260741f0211e784e82eff3aeb2ef89069 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3440c22f7c64b572ed840f3cba244b1547299149 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/cb298cbf5bf665d39a3a7bf671cf1408d981cf27 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1039a4805546c9a9facbaec4b028c8491a78ff27 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ad61a9b1e542ca4f8429c2f9a6dd28bd479ae9c2 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d313ae6ceb5ed8042490dc39062812642b970168 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2eeba242c455d3f7ad544753813a60b95e845ea3 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c12f2c39bb2b522d298c35f3ae8ea05f51288b66 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4efd8fb1294857ddf3169c358b0065acd341f263 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1e2b4b78ae97428dc7de16d823f47961e3e692ac |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c0cd33d3bf81283c379509e630519544ff486182 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a47f34b36e389df4692f06927dbc2247ec29c41f |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/18cb1665a85c1dea626a00186df172f581430812 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/20e489e3a07be733e65ff9b1e273a29d29631331 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 7 
               openldap-2.4.59 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4619df7e87936bfd9bd18dc73b8f6b238f55301c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61c2e6143b5e1bcf60d83ac2112a528d15ac7eed |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5a235f16898eb2a384ed8a723c53e46461f7559 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b23d3a0566a70b5304dead00562ce90453c40dcc |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc4dac0b5b6fa75631e788c3729520e20faaad1e |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/af596ea44361c298f795ba5bdc8028b36d9afe20 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b31eac966b5cd53e301e84a1414b08565b7839f |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/79bff89dbb100207841b9d57a88894fbebd1346f |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 3 
  binutils-arc-2020.09-release | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c560f2db4955f62786f5617f8af2bff5f9f6053b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a33b08d28ac1879879d896fc2db2439d04c69621 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/08a6f44e3cf410842690cf9dab2e57adff005323 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ce470ceba68a7f9663a8afdce37bf20b1ab1a454 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/702647ab2e0be2d8e4a8de9531c27cbd9510c503 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f20399d5e5a5826f0b9abd2d84613893519ba5a3 |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 1 
           host-sg3_utils-1.46 | 1 
                   mpd-0.22.11 | 1 
                    qemu-6.1.0 | 1 
          refpolicy-2.20210908 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2685fb00883e6936e24ca1f17b693e6e1c13c9fa |     
  nds32le    |      host-sg3_utils-1.46       | NOK | http://autobuild.buildroot.net/results/05b85df17e1df6e696e92cfef763fff07348e8a3 |     
   xtensa    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/a1dcfe3e7745f0ca7b0bc59532e4a4da36fb2b8f |     
   mipsel    |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/c41d9f61e31854e63719289f7af76c695aa5a847 |     
   nios2     |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/3d7ab72c011886814f11e447e21c99c7de5b0180 |     


Gitlab CI results for 2021-11-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269509  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269513  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269515  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269516  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269519  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269520  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269525  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269529  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269530  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269532  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269533  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269537  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269539  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269541  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269543  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269545  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269550  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269552  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269555  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269558  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269563  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269565  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269567  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269569  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269571  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269574  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269581  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269584  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269586  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269589  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269593  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269597  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269598  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269603  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269606  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269622  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269626  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269630  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269632  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269633  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269634  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269635  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269637  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269639  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269643  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269648  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269671  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269672  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269674  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269679  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269681  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269683  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269689  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269687  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269688  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269690  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269694  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269697  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269703  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269706  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269711  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269713  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269719  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269720  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269724  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269726  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269731  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269735  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269737  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269749  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269753  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269757  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269759  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269760  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269761  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269763  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269765  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269768  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269773  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269797  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269817  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269832  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269829  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269840  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269842  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269851  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269852  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269858  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269872  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269879  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269881  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269883  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818269887  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270007  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270016  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270019  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270036  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270040  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270042  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270043  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270049  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270053  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270056  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270060  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270063  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270065  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270078  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270079  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270084  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270095  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270098  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270100  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270102  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270105  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270109  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1818270112  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
