Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5381C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7477F82CF1;
	Sat, 21 Jan 2023 13:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7477F82CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsLxdEtkvZ8s; Sat, 21 Jan 2023 13:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0D782BA7;
	Sat, 21 Jan 2023 13:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0D782BA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2EB61BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BFE041C96
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFE041C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71555uRnA4FE for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78DD041C9D
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DD041C9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6644586946; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:52:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 695dd042dbbe3eb3ccffb812b8dc38c2aa7202be
X-Git-Newrev: b0d9d97b3434e41879046c0994dd1b5708c46007
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.6644586946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdk-pixbuf: switch to https
 download
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0d9d97b3434e41879046c0994dd1b5708c46007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 23a7c3fc05..c3953e15a6 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
+# From https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
 sha256  ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b  gdk-pixbuf-2.42.10.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 561e191569..e041d2cbde 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -7,7 +7,7 @@
 GDK_PIXBUF_VERSION_MAJOR = 2.42
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
-GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
+GDK_PIXBUF_SITE = https://download.gnome.org/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
