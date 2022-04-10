Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2063C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C9C60BA4;
	Sun, 10 Apr 2022 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LzEnxMjyVZx; Sun, 10 Apr 2022 21:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6AF60D72;
	Sun, 10 Apr 2022 21:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E72C1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D00D60A71
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvMXX0S8FgJt for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B05E60746
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE0A6838CD; Sun, 10 Apr 2022 20:55:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:03:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 892d6562d6ac6d53d29b7719d5bfc2f1687ffa8d
X-Git-Newrev: 38a9dd649f0f559c0f438becb1e506950bc7a99a
X-Patchwork-Hint: ignore
Message-Id: <20220410205517.EE0A6838CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cog: bump to
 version 0.12.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=38a9dd649f0f559c0f438becb1e506950bc7a99a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2490cc30525f2249f319b73176d13305be152b86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 839b12e619..00d3a4e191 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.1.tar.xz.sums
-md5  25a80a5a8a52b8873933a128151b8928  cog-0.12.1.tar.xz
-sha1  3b9f67bc23cd9e3db2221366d6cde4ca0b06b811  cog-0.12.1.tar.xz
-sha256  23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91  cog-0.12.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
+md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
+sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
+sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 2f6ef402fb..f2ca0af93d 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.1
+COG_VERSION = 0.12.4
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
