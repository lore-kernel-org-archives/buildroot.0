Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84929C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FA940276;
	Sun, 26 Dec 2021 15:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awNn1xeu3xdW; Sun, 26 Dec 2021 15:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A23409A7;
	Sun, 26 Dec 2021 15:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBFD91BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4D760D79
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQzQFGPPSYEv for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:02:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FABD60DC6
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:02:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 35F7982976; Sun, 26 Dec 2021 14:57:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:02:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dde6b3b9dbffdb68c2ec724b8b142bd2dc07dc3c
X-Git-Newrev: 6c5173be6eebe47b5b198ad6dc56b8d360156e74
X-Patchwork-Hint: ignore
Message-Id: <20211226145708.35F7982976@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp: bump to version 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c5173be6eebe47b5b198ad6dc56b8d360156e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.4.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 9eb1eb467b..1825298f24 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.1.sha256sum:
-sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.3.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.1.sha256sum:
+sha256  899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c  gupnp-1.4.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 7ee67d3382..02d9b289e0 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.3
+GUPNP_VERSION_MAJOR = 1.4
 GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
