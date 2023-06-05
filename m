Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771CC7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096D940278;
	Mon,  5 Jun 2023 20:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 096D940278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGHEQt8X7oci; Mon,  5 Jun 2023 20:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E044051C;
	Mon,  5 Jun 2023 20:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E044051C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7DCA1BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B107D40156
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B107D40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9VmRz1HIn2M for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A409A400B8
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A409A400B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F85C86CA8; Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:23:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 13e4f1942cb2aca57edf5b2b7514d491690e8eeb
X-Git-Newrev: 96bc3c58cd0132ff5bae5b7f30b3dc9495e6f04d
X-Patchwork-Hint: ignore
Message-Id: <20230605205922.8F85C86CA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libgeos: bump
 version to 3.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=96bc3c58cd0132ff5bae5b7f30b3dc9495e6f04d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Changelog: https://github.com/libgeos/geos/releases/tag/3.11.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ee348693531d581ad57a0c605dbebd8fba673ca3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index cd0a4e0330..54f53d19de 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d0eb3cfa9f92d947731cc75f1750356b3bdfc07ea020553daf6af1c768e0be2  geos-3.11.1.tar.bz2
+sha256  b1f077669481c5a3e62affc49e96eb06f281987a5d36fdab225217e5b825e4cc  geos-3.11.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index c6d470dc97..5a7932bad2 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.11.1
+LIBGEOS_VERSION = 3.11.2
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
