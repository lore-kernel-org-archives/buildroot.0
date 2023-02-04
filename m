Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F7C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A789477BF;
	Mon, 20 Feb 2023 23:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A789477BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXtSzMxkEN5R; Mon, 20 Feb 2023 23:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B39640114;
	Mon, 20 Feb 2023 23:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B39640114
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63C081BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E414178C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64E414178C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wC9jisJSZFos for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778DF4159B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778DF4159B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E8468648F; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 23:42:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2c3e8ea8b2107ac514baddaed97921112a90cb7
X-Git-Newrev: c392e8b76f73d2b8ebfba2117ed6b03d902b8243
X-Patchwork-Hint: ignore
Message-Id: <20230220205245.6E8468648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnice: bump to
 version 0.1.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=c392e8b76f73d2b8ebfba2117ed6b03d902b8243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnice/libnice.hash | 2 +-
 package/libnice/libnice.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 83b28a9ad9..cf6d825f83 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-sha256  6747af710998cf708a2e8ceef51cccd181373d94201dd4b8d40797a070ed47cc  libnice-0.1.19.tar.gz
+sha256  72e73a2acf20f59093e21d5601606e405873503eb35f346fa621de23e99b3b39  libnice-0.1.21.tar.gz
 
 # Hash for license files:
 sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 2b223bedd3..56ee35e452 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.19
-LIBNICE_SITE = http://nice.freedesktop.org/releases
+LIBNICE_VERSION = 0.1.21
+LIBNICE_SITE = https://libnice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
