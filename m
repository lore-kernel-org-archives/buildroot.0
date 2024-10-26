Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6AFD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF29F6069B;
	Sat, 26 Oct 2024 14:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH8fRKRs36D6; Sat, 26 Oct 2024 14:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E58B0606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58B0606A7;
	Sat, 26 Oct 2024 14:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04DEE5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98A34014C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeGHikdyTAz1 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6ECA40311
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6ECA40311
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0C6F83C0E; Sat, 26 Oct 2024 14:38:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:36:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5207e5dab7530541c4dd106959f7d1ab1645e065
X-Git-Newrev: fb4d73973b7bae6c922ea88c18b24e09a11b6e7b
X-Patchwork-Hint: ignore
Message-Id: <20241026143809.B0C6F83C0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: bump version to 2.13.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb4d73973b7bae6c922ea88c18b24e09a11b6e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 7b9ffc5d47..ed6c20e948 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.sha256sum
-sha256  0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138  libxml2-2.13.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.sha256sum
+sha256  65d042e1c8010243e617efb02afda20b85c2160acdbfbcb5b26b80cec6515650  libxml2-2.13.4.tar.xz
 # License files, locally calculated
 sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 068ce157d5..8a5d703da6 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.13
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
