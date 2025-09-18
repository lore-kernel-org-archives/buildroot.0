Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF7CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D27260B6C;
	Thu, 18 Sep 2025 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBNwm4mzZRv5; Thu, 18 Sep 2025 20:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0944A60B46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0944A60B46;
	Thu, 18 Sep 2025 20:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B969A1E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A97C660B46
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBqNlY46K_QD for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 20:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A9F60B34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A9F60B34
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA9E785CC8; Thu, 18 Sep 2025 20:00:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 21:51:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e94b305e1e248cea18e2b44dfe45cdc8dd2b5a59
X-Git-Newrev: cbc1dbc8895e92d51dd7c0c93c704fc5312fbd3c
X-Patchwork-Hint: ignore
Message-Id: <20250918200057.EA9E785CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acsccid: bump to version 1.1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbc1dbc8895e92d51dd7c0c93c704fc5312fbd3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/acsccid/news/2025/07/acsccid-1112-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index e5fe669ceb..25f894c577 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.11/
-sha1  75d3d17fb9d9ee7d0b291b460e2c6eb3c71654c5  acsccid-1.1.11.tar.bz2
-md5  0bbbce89a934861b7c5b003da962f1d9  acsccid-1.1.11.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.12/
+sha1  6d9aa64b195e1b4d72a9b032f8ee70ad0798802d  acsccid-1.1.12.tar.bz2
+md5  34bf40daedd3428c07f9937d4ec43129  acsccid-1.1.12.tar.bz2
 # Locally computed
-sha256  2fcda6ed1f5d2f07e202b51f9a600a61c83e1a73a96f51ed0f9e4f781c9c1282  acsccid-1.1.11.tar.bz2
+sha256  28f6075a5494a568ce2fd8666c489f6f4a51599b44fbc9390e1ddb48d3ccc5bd  acsccid-1.1.12.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 93cca8e09d..3be1379552 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.11
+ACSCCID_VERSION = 1.1.12
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
