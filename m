Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BCFC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9843940374;
	Sun, 30 Oct 2022 11:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9843940374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4kVZ7KukpZe; Sun, 30 Oct 2022 11:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E25402F7;
	Sun, 30 Oct 2022 11:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E25402F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE75A1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B6760644
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B6760644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkRfd6rG__TW for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4B43606EC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B43606EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A30A487471; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0a13b667b8587816734c432c2e691d4c3ed9763
X-Git-Newrev: 20348d48592e49542d7f97f31697271ca5873ba7
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.A30A487471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpagekite: bump to version
 0.91.201110
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

commit: https://git.buildroot.net/buildroot/commit/?id=20348d48592e49542d7f97f31697271ca5873ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pagekite/libpagekite/compare/v0.91.190530...v0.91.201110

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpagekite/libpagekite.hash | 2 +-
 package/libpagekite/libpagekite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
index 8716b991ca..2c2e5c9b59 100644
--- a/package/libpagekite/libpagekite.hash
+++ b/package/libpagekite/libpagekite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c812815aae6f100212b7d6f662370a0634151fabb59f028126a59c4083a6d26d  libpagekite-0.91.190530.tar.gz
+sha256  db835d49becebc00d462f2f47aefc1f1d3a4e0e096487cb3b4248134185df715  libpagekite-0.91.201110.tar.gz
 
 # License files, locally calculated
 sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
index 60b62f5cfd..bb235ba1f3 100644
--- a/package/libpagekite/libpagekite.mk
+++ b/package/libpagekite/libpagekite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAGEKITE_VERSION = 0.91.190530
+LIBPAGEKITE_VERSION = 0.91.201110
 LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,v$(LIBPAGEKITE_VERSION))
 
 # pkrelay is AGPL-3.0+ but is not built
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
