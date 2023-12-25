Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9AC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 460C440636;
	Mon, 25 Dec 2023 20:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460C440636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Tlbf3s-4C9n; Mon, 25 Dec 2023 20:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34880405A0;
	Mon, 25 Dec 2023 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34880405A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C846F1BF951
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F2F60774
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1F2F60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g87_cYc-mR1q for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:45:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F1C60773
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F1C60773
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0E698349A; Mon, 25 Dec 2023 20:45:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:44:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1edafc4b483e82b045d3a0cc9cbbd000d6183ac7
X-Git-Newrev: 814e7fcacfed75c2bbaa83dba160bba7f36dd9ac
X-Patchwork-Hint: ignore
Message-Id: <20231225204516.A0E698349A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump to version 5.4.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=814e7fcacfed75c2bbaa83dba160bba7f36dd9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 92bac40463..3d93ad6b5e 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.4.tar.gz.sig
-sha256  0b6fcde1ac38e90433a2556f500c065950b9bcd2d602006efc334782bdfe6296  xz-5.4.4.tar.bz2
+# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
+sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
 
 # Hash for license files
 sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 42fee82e80..547959c743 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.4
+XZ_VERSION = 5.4.5
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
