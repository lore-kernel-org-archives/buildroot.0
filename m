Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F24BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A1140102;
	Tue, 18 Jan 2022 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeSEZLaoAGLE; Tue, 18 Jan 2022 07:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0246D40105;
	Tue, 18 Jan 2022 07:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 294A91BF327
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 07:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F4440105
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 07:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o29EP7oXWaRp for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 07:06:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D21D40102
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 07:06:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50588E0003
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 07:06:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jan 2022 07:06:49 -0000
Message-Id: <20220118070654.17F4440105@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-17
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

Autobuild statistics for 2022-01-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 63  |  9  |  0  | 72  |
  2021.11.x  | 23  |  3  |  0  | 26  |
    master   | 84  | 52  |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

      host-riscv-isa-sim-1.1.0 | 12
                  rygel-0.40.2 | 7 
                       frr-8.1 | 4 
             bluez5_utils-5.63 | 3 
                       unknown | 3 
                    bat-0.18.3 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.3 | 1 
              cryptsetup-2.4.2 | 1 
                    efl-1.26.0 | 1 
                  gensio-2.2.9 | 1 
google-breakpad-7515ab13768... | 1 
                   gstd-0.13.0 | 1 
                 hiawatha-11.1 | 1 
             ksmbd-tools-3.4.3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 mesa3d-21.3.3 | 1 
               mongrel2-1.13.0 | 1 
                   mp4v2-5.0.1 | 1 
                 opencv4-4.5.5 | 1 
               pcsc-lite-1.9.5 | 1 
                 powertop-2.13 | 1 
                qt5base-5.15.2 | 1 
           tesseract-ocr-5.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
xdriver_xf86-video-mach64-6... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/beb00fc8b71bcd2db87cbdc8e5029fe28c782abd |     
   x86_64    |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/74763096f8eb9bf0bd4226dcd257fe6a0cdd5094 |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/5641c78eb9df313c44f2b17de9dbbfece26b3c0c |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/715e5d0ac525406b698b015b5b306f3366a51c11 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/19c82963d6e3655f897bcae54e82fbf5887e46fe |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b91864dc5b4c33a1a29ee34036e6694ca81b9e13 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/dea76eebc09e62989dc117767478d144c8789464 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/bd70dd1e5c6b045fc3a7da6b0cbf6de22d6dcbc6 |     
   x86_64    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/479aeee2ad138787119a16577233ff4d3ef0582d |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e6089331b8f3df3678aa5102df5e5bb3668c7637 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/bdac99f54d365f883e9a4272e3f03ebbcd8c4473 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e94fd48210d95ee216c45f68c714ba67515c6cc8 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/40ceb52442bd6589f740eee7521a8fb2fac13da4 |     
    or1k     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/deccd3694d5250f51e7b75b93f151ada0dc59b8f |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/5d9cd3eda611b5fedcdd6f5d0c21596ff6de59b5 |     
  mips64el   |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/2f04f53df280a7d931615d8898687f5a5bd54803 | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/1ae8ff6834074e07904aa6a8d358804e7117439e |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/66e3127c8c7db3a0dc7b808ea06b4ae9cb3cd49e |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6d6587a3e81a282d226efbcf3579fc5ceda51db5 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a0c12eef60097367366a81aca98fe82d871c67bc |     
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1e77b711034972fca198251db29df469cc199c25 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/ff2f711655d335609d325b09b38be1fda359db60 |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b9315e68e616320c31b63594a62fa01b84506316 |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/ee5813ef9e0d467ab39962df2183dab70b6e9825 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/87979167940393416a78301c94f6cd7a8f719cab |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8a79ffcee4ae595f95f34bbabbec32f25ccde387 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/ec1a394b4c9ba315b916ad84d2372ded55044a32 |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7d69f16ae0f4bf9d87cf7acbb371c97242c70ec4 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/56e34478f3c5739c8967754d9fa2565310c88b0e |     
   xtensa    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/f205f5edcc774623a60f4fb4e6f2c2854310ed71 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/45b575f36753a0984da9bb106a7baa957ea554cb |     
  mips64el   |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/22487776f35e73bb6ae47b114caee6475d730028 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/de324b733e09057c87352220069fe65f6e535eb8 |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/86b477f1c1d38ff418f638ee0770dd827bcadbe7 | ORPH
    arm      |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/3d77a828adc254b112ad2e5ce214d3e892b2229e |     
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/225151602eb240f20355982e596670919cf4cb33 | ORPH
    or1k     |         powertop-2.13          | NOK | http://autobuild.buildroot.net/results/e9f0deaeb09402a8bb601e616a615d1aa09bdaf6 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f026a0e6f14c9c948cb7771ed7020ef4aa24672e |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/47ddeb8cf5547091d059c348c7f754cf5a3650cb |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/384e4af1db8a962e148825e681c5ce27f7b477ab |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3646635c6a53da02c78be7fce7899b34fdc33b91 |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c4199a4788f6af996e8d31239f6ae9c64eb3b3a0 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ba1ef2ca6e581e5bb05b018dc9ac928c8beaee73 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/03be40d80dc7961abbdc6f3d323cafb0518bd36c |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/18413e663d9081386e26726ac3ca246074a70060 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/b3ee6065bbf1d67007c17f650898b5c6a7ed6f99 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5bfc759b6a5cfcbb78d4a72c7b3318f491f4d5cf |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/21e773353abc8eee13c8e708bdc5032647692f86 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ea47650902b1004569e74fdb0b51b25a04f2e12 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a08d439d16128ad285d0bff5c6169bcedeb2ae3 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/59136d64244cb08f870781fa09013a56c3d93dfc |     
  riscv64    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/07a00bfb9c755a748232025f630d54424117169f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
               apcupsd-3.14.14 | 1 
                 mesa3d-20.3.5 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4b04a12ec6663a2aae0d6c293c8137d180947fc5 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ce29083f8e24799424659fdc7ecc98473c074fca |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa2b833b4c14ad580b5dcbcccca488d117424a6d |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6f7b981e4d357c27ff57f079e038a0b2bcae5e59 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/63bd0633d30fbb5022f7ffa180d2f84c257d949a |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cdf7e22668b99a8f615b5fc82f1ba146bfe7d28b |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/668ce7624ababf1edd3da35bbe5b265cf7983a40 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1c95d309e0455acbca15d366a44accba2804cc72 | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/31b51516efb0fdaf8226f0ae0203e038cc7d329d |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                  acpid-2.0.33 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                libmbim-1.26.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/509a5c704210e248e6df25657270067499c163f0 | ORPH
  riscv64    | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/696b9e8e53b14fc148641226530f84c75ba37d00 |     
  riscv32    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/e3fc37860a19b6ee3afc97863243a5cb6fb69d42 |     


Gitlab CI results for 2022-01-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1981078627  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1981078848  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1981078849  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
