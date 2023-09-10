Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2608EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276D660BEC;
	Sun, 10 Sep 2023 19:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276D660BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lyor2AAiWuFW; Sun, 10 Sep 2023 19:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7681E60BBD;
	Sun, 10 Sep 2023 19:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7681E60BBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2576C1BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B0FF40951
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0FF40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfUVr3QJ_rbR for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:07:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E948E40950
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E948E40950
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D676386B7A; Sun, 10 Sep 2023 19:07:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 21:06:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01a5adfc1594e6f11a874c70b03c84300b48948d
X-Git-Newrev: f8e9314a03d24906aef738283381dea501a4a584
X-Patchwork-Hint: ignore
Message-Id: <20230910190700.D676386B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: bump to version 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8e9314a03d24906aef738283381dea501a4a584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1] and [2].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=log;h=gpgme-1.22.0
[2] https://dev.gnupg.org/T6668

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 556f1d3b42..5c47db76d5 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  abe7db72760c0bb3e9c429b72dcc3c60bed023de  gpgme-1.21.0.tar.bz2
-sha256  416e174e165734d84806253f8c96bda2993fd07f258c3aad5f053a6efd463e88  gpgme-1.21.0.tar.bz2
+sha1  12f4c98ffa75bdbfc4934d38757f57ba718b5aa0  gpgme-1.22.0.tar.bz2
+sha256  9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71  gpgme-1.22.0.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 02d8462212..036103b7fc 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.21.0
+LIBGPGME_VERSION = 1.22.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
