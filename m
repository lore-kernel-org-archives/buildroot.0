Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5DBC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205AF4086B;
	Mon,  8 Aug 2022 21:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205AF4086B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9xgYTNyNXkL; Mon,  8 Aug 2022 21:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45C440576;
	Mon,  8 Aug 2022 21:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C45C440576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD0931BF976
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B81F84018B
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B81F84018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgYJuWsRZHsa for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4DDE40180
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4DDE40180
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9F2558681C; Mon,  8 Aug 2022 20:53:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 23:07:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c83dc5451fb59ffa5cd40d30c4c532dd25e8333
X-Git-Newrev: f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d
X-Patchwork-Hint: ignore
Message-Id: <20220808205319.9F2558681C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gauche: bump to version 0.9.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest release
- Update hash of COPYING (update in year with
  https://github.com/shirok/Gauche/commit/09a3d4f9da52d8b3d9bc28a0ff2aa9c02e99190a
  https://github.com/shirok/Gauche/commit/2a4146798cdaceaf43764e1bf7b959b4a31bf995)

https://github.com/shirok/Gauche/blob/release0_9_12/ChangeLog
https://practical-scheme.net/gauche/gmemo/index.cgi?Release%200.9.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gauche/gauche.hash | 10 +++++-----
 package/gauche/gauche.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index dea23c1e33..65e7da9ee1 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gauche/files/Gauche/
-sha1  ad5e15021764b733ec913cca8b77c9a53d4ee997  Gauche-0.9.9.tgz
-md5  20d8ed835ae0bc97cceed78a71f9857b  Gauche-0.9.9.tgz
+# Locally calculated after checking signature
+# https://github.com/shirok/Gauche/releases/download/release0_9_12/Gauche-0.9.12.tgz.asc
+sha256  b4ae64921b07a96661695ebd5aac0dec813d1a68e546a61609113d7843f5b617  Gauche-0.9.12.tgz
+
 # Locally calculated
-sha256  4ca9325322a7efadb9680d156eb7b53521321c9ca4955c4cbe738bc2e1d7f7fb  Gauche-0.9.9.tgz
-sha256  13cb582677dbcdc5b34313c59b4a014e74ef2f5fd80e514a0bd98fd8a4e45bed  COPYING
+sha256  bc09c643a05e14d7ea8264aa737c5c14d60a20911a0309e7b27da231bbb4525d  COPYING
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index fe0a613a9d..7c43bd4573 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GAUCHE_VERSION = 0.9.9
+GAUCHE_VERSION = 0.9.12
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
-GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
+GAUCHE_SITE = https://github.com/shirok/Gauche/releases/download/release$(subst .,_,$(GAUCHE_VERSION))
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
