Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B1AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AB0403CC;
	Sun,  9 Jan 2022 20:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c09OLGLRmk6k; Sun,  9 Jan 2022 20:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAF9402FA;
	Sun,  9 Jan 2022 20:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55D8E1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 518E260BB6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KD9lGRtEchD1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:38:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9382760BB5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:38:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 54E6E82156; Sun,  9 Jan 2022 20:32:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:37:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb588f078045082e48ebcf8e62f486888ad2956b
X-Git-Newrev: e7f3b75d59bd3ae480fe99fc435ae0c715f9f204
X-Patchwork-Hint: ignore
Message-Id: <20220109203223.54E6E82156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: bump to version 6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f3b75d59bd3ae480fe99fc435ae0c715f9f204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project moved to GitHub, hence change the download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avrdude/avrdude.hash |  4 ++--
 package/avrdude/avrdude.mk   | 11 +++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index ec43355451..1c7758afcd 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2a09913450c6457c3fe8d43d5141de579d4e57d67e593e7399a4cd3768cc60f9  avrdude-r1450-br2.tar.gz
-sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
+sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-v6.4.tar.gz
+sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index ae623a7929..5bbbc4e8c2 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = r1450
-AVRDUDE_SITE_METHOD = svn
-AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
+AVRDUDE_VERSION = v6.4
+AVRDUDE_SITE = $(call github,avrdudes,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
-AVRDUDE_LICENSE_FILES = avrdude/COPYING
-AVRDUDE_SUBDIR = avrdude
-# Sources coming from svn, without generated configure and Makefile.in
+AVRDUDE_LICENSE_FILES = COPYING
+
+# Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_CONF_OPTS = --enable-linuxgpio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
