Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F29C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AF660EE8;
	Sun,  6 Aug 2023 19:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39AF660EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErfKZNz3deM8; Sun,  6 Aug 2023 19:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5C460E85;
	Sun,  6 Aug 2023 19:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C5C460E85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7DB61BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB3A813FA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB3A813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 517M8s7mR5qf for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F152813C5
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F152813C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB62845A9; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 19:29:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aa17849e8ba216022fff15f2fafb669317c4b237
X-Git-Newrev: b1c4e46c1ebdd2b200fc67acd0b59de238499106
X-Patchwork-Hint: ignore
Message-Id: <20230806192335.7CB62845A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-seco: bump version to 5.9.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3145270838215763157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3145270838215763157==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b1c4e46c1ebdd2b200fc67acd0b59de238499106
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The COPYING and EULA files have changed, with various changes, mainly:
 - update to copyright years
 - switch from ASCCI double quotes to fancy Unicode ones ("" -> “”)
 - reflow the license text
 - identify new third-parties and their conditions

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index 378c24bc54..e02e30886f 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
-sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
-sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256  c3bd761f457e939035b01a0ab36e79064a2a1bc6c3cdb3cd847f7f38df0964df  imx-seco-5.9.0.bin
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 987f24658d..3788f1e404 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 3.7.5
+IMX_SECO_VERSION = 5.9.0
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 

--===============3145270838215763157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3145270838215763157==--
