Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0375C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85C37847C6;
	Fri, 22 Jul 2022 06:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C37847C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i04Ac_3Q4vXS; Fri, 22 Jul 2022 06:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96808847B8;
	Fri, 22 Jul 2022 06:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96808847B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 087BD1C2744
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7EBA60ED7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EBA60ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQEYEG2cQTQu for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED28760E9B
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED28760E9B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB351840F1; Fri, 22 Jul 2022 06:12:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:18:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2a01961719bec7dc1bb6be51dd885f3ff5dcdf25
X-Git-Newrev: a431164d4f2f0082faaf97f9813ef3ede20b3786
X-Patchwork-Hint: ignore
Message-Id: <20220722061203.DB351840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cups: bump to
 version 2.4.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a431164d4f2f0082faaf97f9813ef3ede20b3786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

NOTICE hash is changed due to a copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bac3eadda80eea6bac376571a2cfd51b91731f4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index b0e3654b3d..8308b7b803 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de  cups-2.4.0-source.tar.gz
+sha256  c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178  cups-2.4.1-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  a2a46d024e4d78dd2475d89f2f3d905578edfeca7dcb041e1d0ba079d9a87b48  NOTICE
+sha256  7a7bd639e3a8457ae40b0dcfb74ea3cc6a8132b06c726142e993625d33eb6de5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index e406d3bc64..298a6ed879 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.0
+CUPS_VERSION = 2.4.1
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
