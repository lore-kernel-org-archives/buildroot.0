Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671A1C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3F1B403AA;
	Sun, 30 Oct 2022 16:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F1B403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EholbXa8o9C; Sun, 30 Oct 2022 16:28:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 393D940198;
	Sun, 30 Oct 2022 16:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393D940198
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25EF31BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0163560A74
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0163560A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oY6i0H590Z8f for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4194A607FE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4194A607FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30874875A5; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:20:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f67480040b575fb225fcc2cd79c7a5408ef253b1
X-Git-Newrev: 79cfc6841943fed1428ea59747920d6b68962b9e
X-Patchwork-Hint: ignore
Message-Id: <20221030162807.30874875A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtr: bump to version 0.95
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

commit: https://git.buildroot.net/buildroot/commit/?id=79cfc6841943fed1428ea59747920d6b68962b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/traviscross/mtr/blob/v0.95/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtr/mtr.hash | 2 +-
 package/mtr/mtr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
index d6062ef08f..399799f49e 100644
--- a/package/mtr/mtr.hash
+++ b/package/mtr/mtr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea036fdd45da488c241603f6ea59a06bbcfe6c26177ebd34fff54336a44494b8  mtr-0.94.tar.gz
+sha256  12490fb660ba5fb34df8c06a0f62b4f9cbd11a584fc3f6eceda0a99124e8596f  mtr-0.95.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 07c58a1e93..d3e3b1a97a 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.94
+MTR_VERSION = 0.95
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
