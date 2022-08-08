Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E7C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF6D60E22;
	Mon,  8 Aug 2022 10:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF6D60E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toisGOHtZxAr; Mon,  8 Aug 2022 10:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC7160E1A;
	Mon,  8 Aug 2022 10:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DC7160E1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3001BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8423813FD
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8423813FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkDbk34a0q_J for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:45:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB1C813F0
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB1C813F0
 for <buildroot@busybox.net>; Mon,  8 Aug 2022 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id 7AEB91F003;
 Mon,  8 Aug 2022 12:45:14 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EVUbh-OuTHB; Mon,  8 Aug 2022 12:45:01 +0200 (CEST)
Received: from linux-es2v.suse.de (unknown [81.95.8.244])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 450041F002;
 Mon,  8 Aug 2022 12:45:01 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Mon,  8 Aug 2022 12:45:00 +0200
Message-Id: <20220808104500.3423-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.12.2
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index fa9148ed0f..3ccba06202 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5da0a4e12e383393614376f8b47f8b91703c8fc5a564aacfc9db6b98d6a6a9bf  libstrophe-0.12.1.tar.xz
+sha256  b3c79b6deeafafc0f622ba3ee3ca67e9a8e7d75edb102588c6b6f52b38c9fa4b  libstrophe-0.12.2.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 7a349a19d4..43d55592fa 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.12.1
+LIBSTROPHE_VERSION = 0.12.2
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
