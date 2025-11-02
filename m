Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3563ECCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB8E1417C1;
	Sun,  2 Nov 2025 13:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3Sa9PIVOua9; Sun,  2 Nov 2025 13:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7EF41789
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7EF41789;
	Sun,  2 Nov 2025 13:46:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C46E12A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4C3E41756
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzMqgxT2f6gA for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE61416F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DE61416F2
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:46:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24AC0839F1; Sun,  2 Nov 2025 13:46:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 14:12:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6957b5c624491be611df2541b2b9c5d4c17c1808
X-Git-Newrev: e68414dc61b84d0f69c1ed1bb30bcd3d67473eb4
X-Patchwork-Hint: ignore
Message-Id: <20251102134610.24AC0839F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.128
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e68414dc61b84d0f69c1ed1bb30bcd3d67473eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2025-November/003639.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 22fb8a039d..357f7d1366 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-October/003634.html
-sha256  051aeb3e542a57621018ffc443fb088dd69b78eef0ce4808b604ce0feac9f47f  libdrm-2.4.127.tar.xz
-sha512  2b1e9bdc864d1d8b890763a5154708bd44ee0cab5cb9156a7ec473d1d83b9fae7f4f66f660a68a3d1839ecca010163439c9991d9360f9be03be7ed8823a73ec6  libdrm-2.4.127.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-November/003639.html
+sha256  3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac  libdrm-2.4.128.tar.xz
+sha512  b80e6be1c9d0427e1c3ffd018213d7230333f037498cf98819a8a6c50d923ad3472002044e010ca9dc646ef79dbca241bd47eaa992014cb7063b31cdb84037c7  libdrm-2.4.128.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c2350dec57..ae0129fa48 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.127
+LIBDRM_VERSION = 2.4.128
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
