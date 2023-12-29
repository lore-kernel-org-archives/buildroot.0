Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7836FC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BE1C4369D;
	Fri, 29 Dec 2023 21:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE1C4369D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLlFfxwUUl_2; Fri, 29 Dec 2023 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F1BF43646;
	Fri, 29 Dec 2023 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F1BF43646
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE0F11BF239
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19E0605BE
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19E0605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwRm3z0d4Clp for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A09605B3
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A09605B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0497F83912; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:13:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90c3ed83164deaece8b136d98ce0d82954f892c5
X-Git-Newrev: f78086f6694d6ce1504b91a2854397b39ba37eb7
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.0497F83912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpdclient: bump to version 2.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=f78086f6694d6ce1504b91a2854397b39ba37eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING has been replaced by BSD-2-Clause.txt and BSD-3-Clause.txt:
https://github.com/MusicPlayerDaemon/libmpdclient/commit/0fbe45a419a8a826c8b55741ddf2ad92adcfd63b

https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: licenses is a comma separated list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmpdclient/libmpdclient.hash | 9 ++++++---
 package/libmpdclient/libmpdclient.mk   | 7 ++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 8219183c87..626c383402 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,6 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.20.tar.xz.sig, sha256 locally computed
-sha256  18793f68e939c3301e34d8fcadea1f7daa24143941263cecadb80126194e277d  libmpdclient-2.20.tar.xz
-sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.22.tar.xz.sig, sha256 locally computed
+sha256  eac15b82b5ba5ed0648af580221eb74657394f7fe768e966d9e9ebb27435429f  libmpdclient-2.22.tar.xz
+
+# Hash for license files:
+sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
+sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 2103ef163e..371bc20dbf 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).20
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).22
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
-LIBMPDCLIENT_LICENSE = BSD-3-Clause
-LIBMPDCLIENT_LICENSE_FILES = COPYING
+LIBMPDCLIENT_LICENSE = BSD-2-Clause, BSD-3-Clause
+LIBMPDCLIENT_LICENSE_FILES = \
+	LICENSES/BSD-2-Clause.txt LICENSES/BSD-3-Clause.txt
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
