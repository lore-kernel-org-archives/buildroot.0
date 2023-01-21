Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF93C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DC860B57;
	Sat, 21 Jan 2023 13:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DC860B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PufhQphZFIuw; Sat, 21 Jan 2023 13:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8634C61030;
	Sat, 21 Jan 2023 13:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8634C61030
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFF401BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DC8E4058E
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DC8E4058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT68bhimu7US for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3372E405C6
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3372E405C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2324A8694B; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39c25a288e0dd64157485dfebd83ef8ce8c1f2b0
X-Git-Newrev: 500f40bbc7a7657393dd308490afec3effee6dea
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.2324A8694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgee: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=500f40bbc7a7657393dd308490afec3effee6dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgee/libgee.hash | 2 +-
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index ea723481e4..f733bf34a8 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.6.sha256sum
+# From https://download.gnome.org/sources/libgee/0.20/libgee-0.20.6.sha256sum
 sha256  1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d  libgee-0.20.6.tar.xz
 
 # Hash for license file:
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 5ce56a2b3b..36eddef171 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -6,7 +6,7 @@
 
 LIBGEE_VERSION_MAJOR = 0.20
 LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).6
-LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
+LIBGEE_SITE = https://download.gnome.org/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
