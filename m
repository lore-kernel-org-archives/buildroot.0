Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D83EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7ACE405B1;
	Mon, 21 Aug 2023 22:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7ACE405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GyE-rbuWPtv; Mon, 21 Aug 2023 22:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E0E4011A;
	Mon, 21 Aug 2023 22:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E0E4011A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27F451BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22A56112F
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22A56112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjidjwOFuadD for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:04:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD7016112A
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7016112A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 999AE8602C; Mon, 21 Aug 2023 22:04:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:04:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2423d9f16b26e54e0e40fdcc01cc43a629561340
X-Git-Newrev: f1a048cc0a2a33bc72a9cfa1930274d19b9951e3
X-Patchwork-Hint: ignore
Message-Id: <20230821220446.999AE8602C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mawk: bump version to
 1.3.4-20230808
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1a048cc0a2a33bc72a9cfa1930274d19b9951e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mawk/mawk.hash | 2 +-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 69761f77df..0a31675ac8 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,2 @@
-sha256  7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237  mawk-1.3.4-20200120.tgz
+sha256  88f55a632e2736ff5c5f69944abc151734d89d8298d5005921180f39ab7ba6d0  mawk-1.3.4-20230808.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index c4a486215d..d747f887ce 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20200120
+MAWK_VERSION = 1.3.4-20230808
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
