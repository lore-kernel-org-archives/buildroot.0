Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D876C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38FB6404D4;
	Thu,  8 Dec 2022 22:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38FB6404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGXLGSTM1gbd; Thu,  8 Dec 2022 22:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB6F40465;
	Thu,  8 Dec 2022 22:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB6F40465
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4921BF973
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D22EB400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22EB400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXO3pP4-o-1L for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EA8440145
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EA8440145
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id D9AF91ABAC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-325S440; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-2r
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:45 +0100
Message-Id: <20221208223817.1088619-39-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-D924D9D3-AAAA97D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 0d313c1b-f8ba-4179-916e-1c720d86a409
Subject: [Buildroot] [PATCH 38/70] package/x11r7/xutil_makedepend: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2022-October/003243.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 8 +++-----
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 079fa9ef8f..3a7496e1a4 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002985.html
-md5  b2ca7f2f21f1c04a88b6a254c19c9b68  makedepend-1.0.6.tar.bz2
-sha1  3f321f7b570ec98f1fabc441267d29347a2e1456  makedepend-1.0.6.tar.bz2
-sha256  d558a52e8017d984ee59596a9582c8d699a1962391b632bec3bb6804bf4d501c  makedepend-1.0.6.tar.bz2
-sha512  eb0e8ee8ab7515806d7d98a060cdcd392ec38e4225e5e05db26daa6651f185d0b764aab403edeea904d4d23211b1f7db20daeee6eafce8abe65225784ed0aa42  makedepend-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003243.html
+sha256  a729cfd3c0f4e16c0db1da351e7f53335222e058e3434e84f91251fd6d407065  makedepend-1.0.7.tar.xz
+sha512  fd575de737aa56ef8e475d1ddb7b2392e730ee1b23c0b853bbb21975b757c3fc56f94d57ecc5a784dceed2be653feb10909e86fd96fdc074b50fbbd0e27a19db  makedepend-1.0.7.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 18f8eb1f6a..b16bbe0978 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.6
-XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
-XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_MAKEDEPEND_VERSION = 1.0.7
+XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
+XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
