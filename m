Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98553C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23C5E415F6;
	Fri,  8 Jul 2022 15:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C5E415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGdMsMDxL49w; Fri,  8 Jul 2022 15:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 298E1415DB;
	Fri,  8 Jul 2022 15:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298E1415DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD621BF41F
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 15:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ABBE6140A
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 15:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ABBE6140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jp4mwMMhixtr for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 15:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A907E613DD
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A907E613DD
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 15:00:54 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout08.t-online.de (Postfix) with SMTP id 3BBE1800B
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 17:00:35 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.9.36]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o9pT6-0V2sLp0; Fri, 8 Jul 2022 17:00:32 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45602)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o9pT5-0002nw-NK
 for buildroot@buildroot.org; Fri, 08 Jul 2022 17:00:31 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri,  8 Jul 2022 17:00:31 +0200
Message-Id: <20220708150031.1189738-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708150031.1189738-1-bernd.kuhls@t-online.de>
References: <20220708150031.1189738-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657292432-01434903-83DA146C/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f55cfb5-d99c-47f0-a6ec-16cdacd7a141
Subject: [Buildroot] [PATCH 2/2] package/stellarium: bump version to 0.22.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
http://stellarium.org/release/2022/07/07/stellarium-0.22.2.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index c742df464f..eeb47e2092 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  55b5915dfb616b9748e1c2d2de6150f7159cf36c  stellarium-0.22.1.tar.gz
-sha256  61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24  stellarium-0.22.1.tar.gz
+sha1  3661b4e8a94e7a520873fa22ddc79f39904eb1c4   stellarium-0.22.2.tar.gz
+sha256  31e965d32cafc0fbad212c7ef4efbeac988f909206013554e1fe35123ebb9376  stellarium-0.22.2.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 9c24263a43..769e7049c1 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.22.1
+STELLARIUM_VERSION = 0.22.2
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
