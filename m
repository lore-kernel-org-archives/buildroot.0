Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A14CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B52ED83DBC;
	Mon, 17 Nov 2025 21:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C2M-JtT87i0; Mon, 17 Nov 2025 21:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C27483D6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C27483D6C;
	Mon, 17 Nov 2025 21:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B0ED5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 930AB83D3D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jr5_1y32_4T for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5931B83D3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5931B83D3A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46F4784AD3; Mon, 17 Nov 2025 21:07:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:03:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80764d7208efe860bb35f146ea4962f15e21936f
X-Git-Newrev: 0bf0d305914ce90297162bd21a4524f4223dcb82
X-Patchwork-Hint: ignore
Message-Id: <20251117210721.46F4784AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.129
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bf0d305914ce90297162bd21a4524f4223dcb82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2025-November/003642.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 357f7d1366..e2dbbf18ee 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003639.html
-sha256  3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac  libdrm-2.4.128.tar.xz
-sha512  b80e6be1c9d0427e1c3ffd018213d7230333f037498cf98819a8a6c50d923ad3472002044e010ca9dc646ef79dbca241bd47eaa992014cb7063b31cdb84037c7  libdrm-2.4.128.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-November/003642.html
+sha256  5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc  libdrm-2.4.129.tar.xz
+sha512  3ee702cc4a578e9ab231caf8a84700e4dff6f3da70731610121ac2c3390f42e42ad144ea61c53582e3a8adfb1d6bf8254993c5c6eaf85a51421e26d51d341cd4  libdrm-2.4.129.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ae0129fa48..c499632f6c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.128
+LIBDRM_VERSION = 2.4.129
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
