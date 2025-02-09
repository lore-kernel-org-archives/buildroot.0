Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873B3C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 08:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C69280F12;
	Sun,  9 Feb 2025 08:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZhnxjXPhuTZ; Sun,  9 Feb 2025 08:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5077C80F19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5077C80F19;
	Sun,  9 Feb 2025 08:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A83A7199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9772080F12
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qIZNLNKVL4S for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 08:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE01280EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE01280EB2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:40:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDC4F873A0; Sun,  9 Feb 2025 08:40:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 09:37:27 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1e3f5d4245f94273ffe5a6406dd5b4e8ee986b61
X-Git-Newrev: 40746d26e9f828c1530b36ea11d2ad5526eb7060
X-Patchwork-Hint: ignore
Message-Id: <20250209084013.BDC4F873A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/freetype: bump to
 2.13.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=40746d26e9f828c1530b36ea11d2ad5526eb7060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

For release note, see:
https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 52162f01299ab5170f9b9c5482c459271f1fd981)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index e7331d5ba0..fcd99319cd 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
-sha1  2d8d5917a1983ebd04921f2993a88858d6f72dec  freetype-2.13.2.tar.xz
-sha256  12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d  freetype-2.13.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/
+sha1  2437819d11c1205e81141735dcb0a36c0d541e96  freetype-2.13.3.tar.xz
+sha256  0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289  freetype-2.13.3.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5032414d63..ad8cd00ec8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.2
+FREETYPE_VERSION = 2.13.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
