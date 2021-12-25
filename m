Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7827BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BFA0400FB;
	Sat, 25 Dec 2021 10:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-LSm2zfNl03; Sat, 25 Dec 2021 10:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2932E400FE;
	Sat, 25 Dec 2021 10:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B10541BF83E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9155540104
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvtTZbEWZ09q for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2AD5400FE
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4663E82AA5; Sat, 25 Dec 2021 10:47:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 11:52:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ee5f48c54eafa69692055292c5e47ce36b1815d
X-Git-Newrev: fa360d506122f7083aca836696d72b0467656c30
X-Patchwork-Hint: ignore
Message-Id: <20211225104744.4663E82AA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpdclient: bump to version 2.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa360d506122f7083aca836696d72b0467656c30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.20/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 882a588a88..8219183c87 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.19.tar.xz.sig, sha256 locally computed
-sha256  158aad4c2278ab08e76a3f2b0166c99b39fae00ee17231bd225c5a36e977a189  libmpdclient-2.19.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.20.tar.xz.sig, sha256 locally computed
+sha256  18793f68e939c3301e34d8fcadea1f7daa24143941263cecadb80126194e277d  libmpdclient-2.20.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index a880980a3c..2103ef163e 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).19
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).20
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
