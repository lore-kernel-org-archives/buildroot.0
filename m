Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979B2CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6E3607B3;
	Sun, 12 Oct 2025 16:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFhrJrPnTG0K; Sun, 12 Oct 2025 16:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992C460664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992C460664;
	Sun, 12 Oct 2025 16:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06719BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D7640D19
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsEddJd5Ag5F for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2D940D13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2D940D13
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0500686ABE; Sun, 12 Oct 2025 16:49:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 18:46:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0f10eed1fd271ca65826cde5287e4a1c7c3f8ed
X-Git-Newrev: c5ce3417f4f67ba4573008ef0efb6700ffef2f22
X-Patchwork-Hint: ignore
Message-Id: <20251012164948.0500686ABE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/which: bump version to 2.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5ce3417f4f67ba4573008ef0efb6700ffef2f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://cgit.git.savannah.gnu.org/cgit/which.git/tree/NEWS?id=3e2c8f8acc3a333b66b06de234bc9324c6fe5500

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/which/which.hash | 2 +-
 package/which/which.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/which/which.hash b/package/which/which.hash
index edea4e5e34..b7784fdbf5 100644
--- a/package/which/which.hash
+++ b/package/which/which.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad  which-2.21.tar.gz
+sha256  a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73  which-2.23.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/which/which.mk b/package/which/which.mk
index c96e893756..c914c66839 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WHICH_VERSION = 2.21
+WHICH_VERSION = 2.23
 WHICH_SITE = $(BR2_GNU_MIRROR)/which
 WHICH_LICENSE = GPL-3.0+
 WHICH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
