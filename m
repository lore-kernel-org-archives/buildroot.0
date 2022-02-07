Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDD4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA2860AFA;
	Mon,  7 Feb 2022 07:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROGrzUA-zKxF; Mon,  7 Feb 2022 07:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D25460B97;
	Mon,  7 Feb 2022 07:36:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD1D1BF9A4
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4975860AFA
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJThAqk3wWJY for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92BE260AA3
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FFB4814A4; Mon,  7 Feb 2022 07:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:32:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb2d17921bfb1f34601f1f2fcf27aa89a88a9591
X-Git-Newrev: 91a0425d066fd073c8dd9907b902010162d5954b
X-Patchwork-Hint: ignore
Message-Id: <20220207072828.6FFB4814A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ofono: bump to version 1.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=91a0425d066fd073c8dd9907b902010162d5954b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=1.34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.hash | 4 ++--
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 02245a46f4..7edef0eb80 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b  ofono-1.31.tar.xz
+sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
 # Locally computed
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 57d6cab470..b7a2a923f9 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.31
+OFONO_VERSION = 1.34
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
