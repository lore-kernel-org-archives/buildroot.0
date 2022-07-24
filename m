Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F0DC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1549410B0;
	Sun, 24 Jul 2022 16:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1549410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id as2bfvKRTawG; Sun, 24 Jul 2022 16:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF244097B;
	Sun, 24 Jul 2022 16:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF244097B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF181BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B55415F0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B55415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASth-pmgLzEq for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99111416A3
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99111416A3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 7297112DF8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-3I375B0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-0V;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:55 +0200
Message-Id: <20220724162500.2683871-16-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144CFA9-05FC35C4/0/0 CLEAN NORMAL
X-TOI-MSGID: b3cabd5c-376e-420c-9f80-1e0bf66fbc18
Subject: [Buildroot] [PATCH 15/20] package/x11r7/xfont_encodings: bump
 version to 1.0.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 10 ++++------
 package/x11r7/xfont_encodings/xfont_encodings.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 30dc92760b..6da1080576 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002998.html
-md5 bbae4f247b88ccde0e85ed6a403da22a  encodings-1.0.5.tar.bz2
-sha1 7ffec76dba1cfd5040c5b43ccfae930c83ddf92e  encodings-1.0.5.tar.bz2
-sha256 bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41774a31  encodings-1.0.5.tar.bz2
-sha512 920e49f0b3545f181a1574ca3280ac9adef1e68fe27566c195dd7013f728d355c0d759132789357fcf8fa7391fcbe1e17edf2bd85aa5611df5a4d99740011008  encodings-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003189.html
+sha256  77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26  encodings-1.0.6.tar.xz
+sha512  2d52486996939401121bc858ba23031f70eef857760db8da4c84f083e981868e4bc7a8c2ab6d59274a0cf95f592a0dbfad47bce6c9299bb45d115b48abc39134  encodings-1.0.6.tar.xz
 # Locally computed
-sha256 13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
+sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 06d9973813..d499b421fb 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.5
-XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
+XFONT_ENCODINGS_VERSION = 1.0.6
+XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
 XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
