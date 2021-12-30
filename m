Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1928C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8336341506;
	Thu, 30 Dec 2021 15:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87z0AIZLq9RM; Thu, 30 Dec 2021 15:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E518C40994;
	Thu, 30 Dec 2021 15:44:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6C341BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B25829DC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8vHu97FiH_p for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:44:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A68829B1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:44:39 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout10.t-online.de (Postfix) with SMTP id 5571C10756;
 Thu, 30 Dec 2021 16:44:36 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2xbW-1Mgmsz0; Thu, 30 Dec 2021 16:44:34 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43654)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2xbV-0000Pn-P0;
 Thu, 30 Dec 2021 16:44:33 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:44:33 +0100
Message-Id: <20211230154433.2775052-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640879074-0000BD0E-C6250B5A/0/0 CLEAN NORMAL
X-TOI-MSGID: 252cb9c4-4a58-4fc6-b67f-1f2cf0b79315
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to
 0.9.75
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
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2021-12/msg00052.html
https://lists.gnu.org/archive/html/libmicrohttpd/2021-12/msg00056.html

Changelog:
https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index c9d4d25c78..7f95e78a6e 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e  libmicrohttpd-0.9.73.tar.gz
+sha256  9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb  libmicrohttpd-0.9.75.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ef9f114494..f75178bc0a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.73
+LIBMICROHTTPD_VERSION = 0.9.75
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
