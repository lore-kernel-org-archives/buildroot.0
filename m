Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AE9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C151400F8;
	Sun, 16 Jan 2022 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWS7Gca37x7g; Sun, 16 Jan 2022 07:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7464840424;
	Sun, 16 Jan 2022 07:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 770311BF576
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 07:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72EF04035F
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 07:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfxN5F6nNZSw for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 07:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 774014035D
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 07:08:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 18F781C0007
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 07:08:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Jan 2022 07:08:52 -0000
Message-Id: <20220116070900.72EF04035F@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-15
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

Autobuild statistics for 2022-01-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 58  |  8  |  0  | 66  |
  2021.11.x  | 30  |  4  |  0  | 34  |
    master   | 115 | 55  |  0  | 170 |

Classification of failures by reason for master
-----------------------------------------------

      host-riscv-isa-sim-1.1.0 | 10
                  rygel-0.40.2 | 7 
                       frr-8.1 | 5 
                   gvfs-1.48.1 | 4 
             bluez5_utils-5.63 | 2 
                     mtd-2.1.3 | 2 
                nodejs-14.18.2 | 2 
               pcsc-lite-1.9.5 | 2 
      qt5webkit-5.212.0-alpha4 | 2 
                rtorrent-0.9.8 | 2 
                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.18.3 | 1 
                freeipmi-1.6.8 | 1 
google-breakpad-7515ab13768... | 1 
             ksmbd-tools-3.4.3 | 1 
                libglvnd-1.3.2 | 1 
               libupnp-1.14.12 | 1 
                 libv4l-1.22.1 | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.3 | 1 
                mongodb-4.2.11 | 1 
                 opencv4-4.5.5 | 1 
               php-apcu-5.1.20 | 1 
                 powertop-2.13 | 1 
               pulseview-0.4.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3f04df1b394b4b4707775f6bca8a6dee1b92367c |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/3076accd1738f88bda4b4c1040f4a720e3e60a3a |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/3f09bceb4988b61d8d8db1c4a91828c66d0725bc |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6631348b0500e297832b30ce3dc47838945899c9 |     
   x86_64    |         freeipmi-1.6.8         | NOK | http://autobuild.buildroot.net/results/5354f7231cf08bf762e7d86fca874ce63d9a116b |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/10fbdb17e1b11c1cc4652a7f8860cd6a570560be |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/30f84f949367794bb8cabd4d7d6e6ad7a5287295 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/96c36ea64c1c8009d003c85a5fa35c62c8a4c015 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8a945fd8873256a0108c6bdeec2b08c09c4c8c6a |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6515cc7cce49ac91372f41813ed68ce356003199 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/9d9608456e3016e6918b6a0e71846623309583b6 |     
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/d703792607bb52e81efaf5ba6a0bd53b438400c4 | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/126471bbd80b2b00a49635a73d69a554ae2c8b70 | ORPH
    i586     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/d81c60adf9cb56b242bb1e60552ff5019feffcf6 | ORPH
  mips64el   |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/8e6fbf48c83d92861e650ce22a812001aee51ce2 | ORPH
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/632f14d4a9980d28d0b1eb1104e2fa8a60727958 |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b2d69ee063782ac1a0bab1832f53e92e3fdd1b65 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3e04528eeb05b3fb5f49645b837c5bebc3b13eb1 |     
    sh4      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5f5fd961c5902e6e63e97f06d917359aa4f4a703 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4837aba2025d540eb423af6b3a1e3092ae53c481 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/753450247f18e6ec6e532bbe286a435f2fb4a5e4 |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/35024daa51f80dfdbddbcb2ab607e8d656634cb0 |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5395fb39ba0a1127a64345631c85addfb84c936f |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/855b66b86d979cc922b947da932b0e2388481263 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6af0710e3b4fb72e9208eaba23a84378e4f4c9c2 |     
   x86_64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/c3f0279eac744888412da9970431c45872c6d8f9 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/2ca1a96233c998807c5525a2b6ba77747e6c0760 | ORPH
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/d144c7b9359559df0f366be57d8336941c4e8134 |     
    arm      |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/6e71769ab6539e0ca5350be34fda940b4e67ee8c |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/bf2036ebcffa0956b71aca6221e73426e56d4817 |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/eddbe414cfa07221c89d9bc0a23b3622cf0dc39d |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/f428ee92e28669721bf7960bb11483d90545bfec |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/2ae5017a4bfbfd892a070ac47a8ff3a5fa658f4d |     
    arm      |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/9409ebf6517db87672f3f4df5909a8ac4abfe8af |     
   mipsel    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/d302653549e9365c2ad4292c1e24d7e73485af51 |     
   mipsel    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/a004d6139acebc3f8fa8957c437130584fc1bb8a |     
  mips64el   |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/8185c9a7d593f0dae78d69a7637895185cd4deb4 |     
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/bdada9a881996704626e542efa052ddcadbac3f0 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/7fbf83eb66c841a484943109c1f6df7ab4d25bdb | ORPH
   sparc     |        php-apcu-5.1.20         | NOK | http://autobuild.buildroot.net/results/efa3b4406f87a1e9521b66f392a6fa19ac01f0cd |     
    or1k     |         powertop-2.13          | NOK | http://autobuild.buildroot.net/results/e9ec8a86237f186254b9b4f4650d1e2a8fba984d |     
   x86_64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/ec72723d63f514da5001f97e048db899f3844516 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/351529f7d928e28fa2db22c6297dc70d21db562b |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/5604555279f99ba0221dd8d0baf9ab4d7cca3aed |     
    m68k     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/204381f47359ebe0d43ada1ad2a3bbc78bc3f2e7 | ORPH
    arc      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/63493e456f0e4f87cb8fb03f2d3498460b24a11c | ORPH
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ac1d02637f69b3858067d2f0cf68e3c3717d6bf4 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6fa76fd24e43d80095480b5c9157473dca5d890f |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/27d96a09309f3666149299cd3043d0cb4e29185e |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/572d980f9f60fed45e0f722429b65cb0934be415 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/edfc7e088274415311741318cbb7099af75e101d |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/768b98327b70ffcf9a6e6827033a133b74c57cbc |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/99bd2b4ba871502a6df5db2aabc8c87f9b7226c3 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1581ee81ab4194083b714cd1631247a655f216ba |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4ddb9143bf60921cbfbd3268d467a989a4f648bc |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
  gobject-introspection-1.64.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    rauc-1.5.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1cb28988579e8267fd5781b3f232a65531abe4dc | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/238862958dba1d6b7b576cbe0ebb0c9deb2845d8 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16543b1f38b1c4a79e8d53f9043c5a3d6d249afa |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4f319738882f053c46eff747d0edc4f035dfdb4a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/804da91d362a7e9f47b1b57a5938c015583119dc |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/24229bf032e11856a23f750c46796d8acd2aceeb |     
  riscv32    |           rauc-1.5.1           | NOK | http://autobuild.buildroot.net/results/15375cc1eb4f4a4351f9e15f163f3f59053a00d9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e0f352099102a21185b990d857bdd2419b7529cd |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 
             kismet-2021-08-R1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9019ca0e05554649775b78ea6189eb7500138620 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a2d13f21109888f387021cfc3adbe6e92ccf33f8 |     
    m68k     |       kismet-2021-08-R1        | NOK | http://autobuild.buildroot.net/results/54845d7ff2e6866fb54dad5b6b9f3d65afbd6530 | ORPH
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a27d6e7dce06085b6a411d3b47b360d7fbcabc9c |     


Gitlab CI results for 2022-01-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083640  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083642  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083643  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083644  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083647  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083648  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083655  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083656  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083657  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083660  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083662  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083664  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083667  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083669  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083671  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083672  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083675  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083679  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083680  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083683  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083685  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083687  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083689  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083691  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083692  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083693  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083696  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083699  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083700  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083703  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083707  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083709  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083711  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083713  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083715  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083716  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083718  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083721  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083722  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083723  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083724  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083725  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083727  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083728  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083758  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083760  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083761  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083763  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083764  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083765  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083769  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083771  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083776  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083772  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083774  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083777  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083779  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083781  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083794  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083828  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083833  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083852  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083854  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083859  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083862  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083864  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083868  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083871  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083874  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083877  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083882  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083893  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083907  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083949  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083973  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083986  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083991  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083992  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083999  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084001  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084006  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084007  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084011  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084018  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084022  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084024  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084028  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084122  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084135  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084136  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084144  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084147  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084152  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084154  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084158  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084162  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084166  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084170  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084174  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084179  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084185  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084186  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084214  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084219  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084225  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084235  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084237  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084239  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084243  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084248  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084251  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
