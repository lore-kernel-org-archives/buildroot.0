Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A3DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B9E60B19;
	Sat,  5 Nov 2022 20:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B9E60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIWa5e4VdBhR; Sat,  5 Nov 2022 20:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D4960888;
	Sat,  5 Nov 2022 20:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D4960888
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEB8C1BF873
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 953DC4088F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 953DC4088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Stpda3FT4ipQ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:01:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E3C4087E
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E3C4087E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F36F87DDE; Sat,  5 Nov 2022 20:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:01:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c8a463a71c6ebaa34c339b1efc3e33c9306f450
X-Git-Newrev: cd2757bd76d2bc2411e67a27a25b8ab55d40bdb7
X-Patchwork-Hint: ignore
Message-Id: <20221105200153.5F36F87DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdk-pixbuf: bump to
 version 2.42.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd2757bd76d2bc2411e67a27a25b8ab55d40bdb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 35084a50ac..23a7c3fc05 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.9.sha256sum
-sha256  28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962  gdk-pixbuf-2.42.9.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
+sha256  ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b  gdk-pixbuf-2.42.10.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4a513effbd..561e191569 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).9
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
