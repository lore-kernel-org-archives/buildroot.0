Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575A7C3ABDD
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19A5F60E92;
	Sun, 18 May 2025 21:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqelne6sRRvS; Sun, 18 May 2025 21:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4812560E8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4812560E8A;
	Sun, 18 May 2025 21:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 644AC1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34A334111D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fDjpfhYNzqV for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742A041131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742A041131
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64A3187393; Sun, 18 May 2025 21:06:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 23:06:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5cd550cfda9f1d2171525bf9df438ef4a1b2059
X-Git-Newrev: 8a5bab93642fa8ce4649c82fddf63efd4c60a9b8
X-Patchwork-Hint: ignore
Message-Id: <20250518210657.64A3187393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smartmontools: bump version to 7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a5bab93642fa8ce4649c82fddf63efd4c60a9b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.smartmontools.org/browser/tags/RELEASE_7_5/smartmontools/NEWS

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index b4e18f9002..ecc2c9d089 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.4/
-md5  178d31a6ff5256c093227ab45a3f52aa  smartmontools-7.4.tar.gz
-sha1  b0d7c9ca80768059607b92bf4e373e2822300d3f  smartmontools-7.4.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.5/
+md5  38c38b0b82db7fc4906cdd50d15a7931  smartmontools-7.5.tar.gz
+sha1  9b0ca96931d6184da34d68bbe9a785713f5a8474  smartmontools-7.5.tar.gz
 
 # Locally computed
-sha256  e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d  smartmontools-7.4.tar.gz
+sha256  690b83ca331378da9ea0d9d61008c4b22dde391387b9bbad7f29387f2595f76e  smartmontools-7.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 18a1417681..557aec1efd 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.4
+SMARTMONTOOLS_VERSION = 7.5
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
