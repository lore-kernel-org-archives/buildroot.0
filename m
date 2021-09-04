Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8B0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 07:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3716D60EC0
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 07:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3716D60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4AC6400BF;
	Sat,  4 Sep 2021 07:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kTvJInV09_A; Sat,  4 Sep 2021 07:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3D3A4011B;
	Sat,  4 Sep 2021 07:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99B391BF312
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 07:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D698426D7
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 07:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tu22cjt2ZXMD for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 07:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9EAF426D5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 07:03:16 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A5D666000B
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 07:03:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 Sep 2021 07:03:13 -0000
Message-Id: <20210904070318.7D698426D7@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-03
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

Autobuild statistics for 2021-09-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  | 15  |  0  | 49  |
  2021.05.x  | 41  | 10  |  0  | 51  |
    master   | 193 | 21  |  2  | 216 |
     next    | 57  | 16  |  1  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                  zeromq-4.3.4 | 4 
            erlang-jiffy-1.0.6 | 2 
                harfbuzz-2.8.2 | 2 
                       mongodb | 2 
            qt5location-5.15.2 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
              containerd-1.4.4 | 1 
                    ffmpeg-4.4 | 1 
                host-go-1.16.7 | 1 
             kismet-2021-06-R1 | 1 
               linux-pam-1.5.1 | 1 
 Makefile:740: target-finalize | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/465a7c0ccdd6cf5878b76f99f07d729e71815f6b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ce8d3f7cc50897d497778645e01aea4c57deffcf |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/fd5521565a550a0120f9455c73fb50887935f3cd |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e8b1e75d54cd803a7ade8b862c03a45a6a3e198f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/47c5198b8c8e798e497768a8e6ba8927908eddcf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5a5b0c4bc50df786c684f1f4cd8c73a236a1419c |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/b5f4d47845adacb9ad99a4dcb0af62baf6afe4c7 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/80f6087bcc8921fadd8b3f7e1c037718d51e627a | ORPH
  mips64el   |         host-go-1.16.7         | NOK | http://autobuild.buildroot.net/results/2f3d4d1f5d0ae2a5df41cccf1d24c8ee7a1a5fa6 |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/1b97fa92939457a6560a960539f20b10aa6707f3 | ORPH
  mips64el   |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/97349c4a3304b232c74811772d7b6b29b1a743dd | ORPH
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/8b35ca6910dfd881953968f8d88ac842d57c9262 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/dce86f71591b93a123fca5a32f22879ce82ceb23 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/de5d594702785073b2000ee58925cc78fbe7d815 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c266327823d2411dc8b83c62a2c5ef17129aa219 | ORPH
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/03e4b84c9934cae2f676cec34658635ef57d848e |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/a444f580ffd1c87d374e238361f5f31a90c3004a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e81dc37c7d3d08bb0bd1baa2e4d9500bc9468482 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/48881ac19409d5113641da57ed5094463be8b87b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/97763ba808aed5568a3ac6f39d9e139e8fa2dd0e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/de556d69ddb5e1b56386f58a8e8899570e143628 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a05b398ec4ae0a0de2be1863ed4fbf0df67a1953 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d1102b1d1569287014f224862d4534a3c8cfeb70 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
                       unknown | 2 
               cutelyst-2.11.0 | 1 
                 dc3dd-7.2.641 | 1 
  gobject-introspection-1.64.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-go-1.15.15 | 1 
                 libcoap-4.2.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/9d6113e34f4efcf641f05ab41a6a89ecf8ce39ad |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd3569ffe025bfdf484c24bd9d95eb3348a7eba0 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/51c6586a0ed16d7f3298a9e1a9c417dc71bff470 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3751da2935eab5e2679791aa4acc5cfeeb31bfe0 | ORPH
  mips64el   |        host-go-1.15.15         | NOK | http://autobuild.buildroot.net/results/b16c3450f483168754de2b66be9ad54256ec43e4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/25997fda0627f7d32cb230b3cf6f2c048b0a0af6 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b6026466408074780a0d38da163d831a387afa7 |     
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/662ed5268f59cf43bc6cfcd424ce11c0f9962eb9 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/40ff068a9e4150623426dceea6abed8f394dc714 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/54a0b607d47b6ea31e4abb33263aec3d4dc84d8f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cfe54f1bf53311a3a587b8febf44b1ac0b0a06e0 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/f8fb6ebd3752dd56ba39d69bf43abb08f32b2722 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/650fa7bdb7b89c572e2730486344dbe58babda2f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8abd9aa002325205e21f4517b6a59405dea957f2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/529808877b8b31e74e740529eddef7f67a5dd21a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
           python-pybind-2.6.1 | 2 
               belle-sip-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
               luasyslog-2.2.0 | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/2a0c38ba04d7121be23e9bb3e67f913ed05b325c |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/74f615c02ca670fdcd72558f59af9048da33a120 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/973f4ad4fa53028d16cdadcd19c95f0f898e5e5a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e89fec7ee2e839448cccdd00d146768e70663fb0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efb93d90ddf20fe21e7eab525c242252d5ea95bd |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/09fa6dd9844d6d4694801ec59434dad7a56bf290 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4bac5fbf36f6b6dccee58ea15e5b165c72e499a2 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/dfd5dff06061cc92d1553bc049189fa0bf895163 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/3f3e6f6c1d0753d74c34a18bdfc81691e5b1d197 |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0b1a648ff1eef8ee1ac49decc069e37b1fd9fcb7 |     


Classification of failures by reason for next
---------------------------------------------

                    ffmpeg-4.4 | 2 
               libglib2-2.68.2 | 2 
          refpolicy-2.20210203 | 2 
                    atk-2.36.0 | 1 
                     fmt-8.0.1 | 1 
              gnuradio-3.8.2.0 | 1 
  gobject-introspection-1.68.0 | 1 
                       mongodb | 1 
                    mpv-0.33.1 | 1 
              supertuxkart-1.1 | 1 
                       unknown | 1 
                    ushare-2.1 | 1 
xdriver_xf86-video-mach64-6... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/5af2278cced2a339e28d48fe23d03d65e3c1b67c | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a460d2c09bf12af3da66c7c543468616405349a0 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/28ef57b93df366fee5d093487c5c68877a614a64 |     
  powerpc    |           fmt-8.0.1            | NOK | http://autobuild.buildroot.net/results/1c06c27d70aae8bdb39ae43fbe74896e536293c6 |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/8ad95b208bfc203e8041c8c583b4218610767d01 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e0eef3f4d79982ad96d6459f665f3607feb70cd5 | ORPH
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/7984b04266cc32512f844749aec6b1e739a1057d |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/3061f4176566a003db49cdf3148aee8d2e73e63b |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/d0515f740cef3b716f2319c2dab8c92744e2d663 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5119d255268706a607721bb608d4ae89af437a95 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1c3eba42edf46dc9096bcf8a5ab461ebc9796c08 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/41eacf3ef491d78e1d23d417432ae384a141470c |     
   x86_64    |        supertuxkart-1.1        | NOK | http://autobuild.buildroot.net/results/28123f73af6168f33039dc0f1830902cb7b5110b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed3ca805741fb86f73b4c95b53f10eaf4834138e |     
   xtensa    |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/ceb8d1ebcfd8dc64dd67ceb9979af88974840550 | ORPH
  riscv64    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/47e3cd5a08fc57e2eecb78c88f7e47cbc6a40588 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2008ae8b3c8f36477c55b949f86abab0452f1012 |     


Gitlab CI results for 2021-09-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555640897  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555640960  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641072  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641079  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641081  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641172  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641216  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641234  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1555641296  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
