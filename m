Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FAECAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C109140A8E;
	Thu, 25 Sep 2025 19:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-wW0kUwbSS4; Thu, 25 Sep 2025 19:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E947340A92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E947340A92;
	Thu, 25 Sep 2025 19:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D21199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B834E840ED
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWa8_tIzc8ow for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF20840E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF20840E8
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E88458643D; Thu, 25 Sep 2025 19:31:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c368b33378c365c30a847b40634071d26ac02f0d
X-Git-Newrev: 702ae953447be24e434125e1dcaaa32e78e1977e
X-Patchwork-Hint: ignore
Message-Id: <20250925193115.E88458643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: bump to version 49.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=702ae953447be24e434125e1dcaaa32e78e1977e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.gnome.org/GNOME/sysprof/-/blob/49.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysprof/sysprof.hash | 4 ++--
 package/sysprof/sysprof.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 5084ee2b11..d68981d31e 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/48/sysprof-48.0.sha256sum
-sha256  1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18  sysprof-48.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/49/sysprof-49.0.sha256sum
+sha256  ff04139637785c841948862087a4323b981680d942296409321b574fcb282878  sysprof-49.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index f64f6d7120..92c840b795 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 48
+SYSPROF_VERSION_MAJOR = 49
 SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
