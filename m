Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C03CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0742285027;
	Sun, 31 May 2026 17:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVAKHPcg0jlE; Sun, 31 May 2026 17:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43BD85029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247306;
	bh=LRnoRX0Ilj/8FXuiwzatv31qPJ6BpjNuYLlX8SgK/+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bTJNKcRTVRdlgHqtA2uI8bPNumTSftEH1JUO59BDytULBAP8jimSuBcUMfqmXk1M4
	 ivRFa4dtA6qkY9GRhXdWZ/uXUGCISCJ0gGj+5sNNywDkuR7Svcl2NXfZbVWfjYPz8A
	 DVbeALnsAd/6oVIy6jSazwN72ivYXJEw7IaFr4FonvcgYdwZiDjWxcaU7dt2O9d6Oi
	 pCk58edeD4iddXkZ9kLRX5dvvU9/qhCRrzLUcc7aUZEIoI1fEJozi6cuaTttj5MoBC
	 ZPWtuiyvvLCnXaY/sHYmv380ANRWTBqOKlJxdU46MhXwdR+L+xgyt/n5GiRZgHA7YS
	 z+bMVKDKS9FQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43BD85029;
	Sun, 31 May 2026 17:08:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4867DF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45CFB405DF
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1ys4x7-DjRF for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6179640183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6179640183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0077876F0; Sun, 31 May 2026 17:08:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:07:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53941b55b2eb3a22d8e67cfa9853e9f74306d004
X-Git-Newrev: ec687c3b5cfc8bf9b2625f44710151c7b10bd746
X-Patchwork-Hint: ignore
Message-Id: <20260531170810.D0077876F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpthsem: update project URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec687c3b5cfc8bf9b2625f44710151c7b10bd746
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The previous site went offline, the last entry dates back to April 2026:
https://web.archive.org/web/20260401000000*/http://www.auto.tuwien.ac.at/~mkoegler/pth/

Update _SITE to the bcusdk project which depends on libpthsem and stores
the original tarball. Update project URL to github mirror provided by the
linknx project which also depends on libpthsem.

Fixes download error:

ERROR: while checking hashes from package/libpthsem/libpthsem.hash
ERROR: pthsem_2.0.8.tar.gz has wrong sha256 hash:
ERROR: expected: 4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01
ERROR: got     : 01d9027268f27aab3ca5c6c649a7f7a444db5bc889e496d80c8704e4e120346e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fixes:
https://autobuild.buildroot.net/results/0d9/0d9e957540d15302ac55bc5a2207db0c45279b37/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpthsem/Config.in    | 2 +-
 package/libpthsem/libpthsem.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index c2856c52fd..65dd8c0cc7 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBPTHSEM
 	  GNU pth is a user mode multi threading library. pthsem is an
 	  extend version, with support for semaphores added.
 
-	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+	  https://github.com/linknx/pthsem
 
 if BR2_PACKAGE_LIBPTHSEM
 
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index dfe25af319..0ddcb3ebf2 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -6,7 +6,7 @@
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
-LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
+LIBPTHSEM_SITE = https://sourceforge.net/projects/bcusdk/files/pthsem
 LIBPTHSEM_LICENSE = LGPL-2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
