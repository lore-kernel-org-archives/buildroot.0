Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C58CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DDB40C89;
	Sun,  5 Oct 2025 14:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIKUr5x63ecC; Sun,  5 Oct 2025 14:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA2D409EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA2D409EA;
	Sun,  5 Oct 2025 14:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62107909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 543E540A31
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm1OJTajK0dk for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB36409E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB36409E6
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87E22868D7; Sun,  5 Oct 2025 14:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 16:42:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56091a581854a501bc9384536d18cbbf1e86b659
X-Git-Newrev: fe329c8f9e0b4e6d8a26e7adff5a2a9cdc26ac7f
X-Patchwork-Hint: ignore
Message-Id: <20251005145251.87E22868D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: bump version to 2.14.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe329c8f9e0b4e6d8a26e7adff5a2a9cdc26ac7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/

Updated license hashes due to upstream commits:
https://gitlab.freedesktop.org/freetype/freetype/-/commit/8d18acba8c476267bbb7ab9f24c977d233d2f831
https://gitlab.freedesktop.org/freetype/freetype/-/commit/2adb53616a1fa5369e55f9b17ed19f8812c16c83

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 10 +++++-----
 package/freetype/freetype.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index fcd99319cd..2c6ab20e19 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/
-sha1  2437819d11c1205e81141735dcb0a36c0d541e96  freetype-2.13.3.tar.xz
-sha256  0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289  freetype-2.13.3.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
+sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
+sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
 
 # Locally calculated
-sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
-sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
+sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
+sha256  5a5ee54c5001bbad1cdc1a57cc3dd4c42199b2da09d39c7ee41fab002d02967f  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad8cd00ec8..00743fe358 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.3
+FREETYPE_VERSION = 2.14.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
-FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
+FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = FTL or GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
