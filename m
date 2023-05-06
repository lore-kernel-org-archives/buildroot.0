Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7829C77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8750460A9A;
	Sat,  6 May 2023 14:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8750460A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF9Zt_iOvvc5; Sat,  6 May 2023 14:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E98607FF;
	Sat,  6 May 2023 14:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E98607FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0E2C1BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA236607FF
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA236607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T50UdZFWU-0Y for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:58:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5BC6606AA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BC6606AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A24A785DE3; Sat,  6 May 2023 14:58:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:58:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b1a980465452af44636b06197abe1835da9ed9f
X-Git-Newrev: 6d7e5e2b63d138ac902e21644256d9fcbae686ef
X-Patchwork-Hint: ignore
Message-Id: <20230506145824.A24A785DE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atkmm: bump to version 2.36.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d7e5e2b63d138ac902e21644256d9fcbae686ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 9e2bb2830c..08cf86b3df 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
-sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.2.sha256sum
+sha256  6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079  atkmm-2.36.2.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 7ceb87b047..8afd058643 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM_VERSION_MAJOR = 2.36
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
