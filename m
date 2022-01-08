Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C45C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8011817EB;
	Sat,  8 Jan 2022 09:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwHSj3k9QNvx; Sat,  8 Jan 2022 09:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E311817B5;
	Sat,  8 Jan 2022 09:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD6851BF3F7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD65817B5
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPkTIjwB05gf for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6841817AD
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:00:11 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout03.t-online.de (Postfix) with SMTP id 7C6621B8C;
 Sat,  8 Jan 2022 10:00:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n67Zz-3cWQq10; Sat, 8 Jan 2022 10:00:03 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55022)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n67Zz-00039l-Ch;
 Sat, 08 Jan 2022 10:00:03 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:00:03 +0100
Message-Id: <20220108090003.837129-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641632403-00010BFA-B9953E83/0/0 CLEAN NORMAL
X-TOI-MSGID: ea2cfdb7-f0c6-41b5-866b-09c4755f1f48
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: bump version to 1.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to whitespace changes in upstream commit
https://github.com/exfatprogs/exfatprogs/commit/7e30487e6d92f98e1ab91b037f5285453359ec9a

Release notes: https://github.com/exfatprogs/exfatprogs/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exfatprogs/exfatprogs.hash | 6 +++---
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 4dc18cd4b6..99f57c9deb 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.0/exfatprogs-1.1.0.tar.xz.sha256
-sha256  69e2cf6430fc1d083c6ae0aea5eb80bf1b8e9775ed833bcd8331aef0fcacaf85  exfatprogs-1.1.0.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.3/exfatprogs-1.1.3.tar.xz.sha256
+sha256  3dbd74b60eec18d2c68d57be4a872d7baa4f7d848e669e31159452ef5245b809  exfatprogs-1.1.3.tar.xz
 
 # Hash for license file
-sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index e10acc9e5f..2911d21f4f 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.1.0
+EXFATPROGS_VERSION = 1.1.3
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
