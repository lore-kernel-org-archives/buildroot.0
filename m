Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D93ACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D630241897;
	Fri, 13 Oct 2023 18:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D630241897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9KCmK82kSOy; Fri, 13 Oct 2023 18:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9100C4193B;
	Fri, 13 Oct 2023 18:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9100C4193B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C27401BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D2442068
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D2442068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iWAhwQxOFTK for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B907E41529
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B907E41529
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB6DA848DF; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:24:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e7f646b715649ab851b420af024d8cd4f60e8c17
X-Git-Newrev: 5d99a2a05054adef3b6e6a6a7aa9df7a3b84cb34
X-Patchwork-Hint: ignore
Message-Id: <20231013184633.BB6DA848DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python3: bump
 version to 3.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d99a2a05054adef3b6e6a6a7aa9df7a3b84cb34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes: https://www.python.org/downloads/release/python-3116/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 337485b232dd452937fd2f96de0a596c968f4b47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 1a0fee3290..39a16c1f71 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3115/
-md5  393856f1b7713aa8bba4b642ab9985d3  Python-3.11.5.tar.xz
+# From https://www.python.org/downloads/release/python-3116/
+md5  d0c5a1a31efe879723e51addf56dd206  Python-3.11.6.tar.xz
 # Locally computed
-sha256  85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f  Python-3.11.5.tar.xz
+sha256  0fab78fa7f133f4f38210c6260d90d7c0d5c7198446419ce057ec7ac2e6f5f38  Python-3.11.6.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cfe5e1ee6e..b9c5054a21 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
