Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE71C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDDF81388;
	Thu, 30 Dec 2021 15:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaEwzDvyEd-j; Thu, 30 Dec 2021 15:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF4A81342;
	Thu, 30 Dec 2021 15:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 260391BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22466401F5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDabiInuASen for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:52:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 538BB401EB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:52:10 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout02.t-online.de (Postfix) with SMTP id 94A724B8C
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:50:52 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2xhV-1TnJEf0; Thu, 30 Dec 2021 16:50:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43656)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2xhV-0001TN-Lp
 for buildroot@buildroot.org; Thu, 30 Dec 2021 16:50:45 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:50:45 +0100
Message-Id: <20211230155045.2893128-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640879446-0000EDC4-2DC3BBF3/0/0 CLEAN NORMAL
X-TOI-MSGID: 29675bb0-48e0-45ce-b6b9-b5974c187365
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: bump version to 2.7.0
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
https://github.com/JuliaStrings/utf8proc/releases/tag/v2.7.0

Updated license hash due to copyright year bump:
https://github.com/JuliaStrings/utf8proc/commit/8ca6144c85c165987cb1c5d8395c7314e13d4cd7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/utf8proc/utf8proc.hash | 4 ++--
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 2deff4e0c5..acc73903c8 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c06a9dc4017e8a2438ef80ee371d45868bda2237a98b26554de7a95406b283b  utf8proc-2.6.1.tar.gz
-sha256  fbc720fcc90fb44396985646f67e4d19be03e0c0539f7138ed9dc6efba49dc49  LICENSE.md
+sha256  4bb121e297293c0fd55f08f83afab6d35d48f0af4ecc07523ad8ec99aa2b12a1  utf8proc-2.7.0.tar.gz
+sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index bedd38ca53..707e553561 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.6.1
+UTF8PROC_VERSION = 2.7.0
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
