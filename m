Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249E3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D2B417CA;
	Sun, 24 Jul 2022 19:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D2B417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ylk1Gd66dWc; Sun, 24 Jul 2022 19:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1A1415CA;
	Sun, 24 Jul 2022 19:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1A1415CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9438E1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C927083EE6
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C927083EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uw7dBqKXHDnY for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303F183EED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303F183EED
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 70BA785CC6; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35bcf3018affc1431685035b49520622885b8e5a
X-Git-Newrev: 6f3368c6d1e260a016325028c0c9ee26b6e67ad5
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.70BA785CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_encodings: bump
 version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f3368c6d1e260a016325028c0c9ee26b6e67ad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 10 ++++------
 package/x11r7/xfont_encodings/xfont_encodings.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 30dc92760b..6da1080576 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002998.html
-md5 bbae4f247b88ccde0e85ed6a403da22a  encodings-1.0.5.tar.bz2
-sha1 7ffec76dba1cfd5040c5b43ccfae930c83ddf92e  encodings-1.0.5.tar.bz2
-sha256 bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41774a31  encodings-1.0.5.tar.bz2
-sha512 920e49f0b3545f181a1574ca3280ac9adef1e68fe27566c195dd7013f728d355c0d759132789357fcf8fa7391fcbe1e17edf2bd85aa5611df5a4d99740011008  encodings-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003189.html
+sha256  77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26  encodings-1.0.6.tar.xz
+sha512  2d52486996939401121bc858ba23031f70eef857760db8da4c84f083e981868e4bc7a8c2ab6d59274a0cf95f592a0dbfad47bce6c9299bb45d115b48abc39134  encodings-1.0.6.tar.xz
 # Locally computed
-sha256 13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
+sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 06d9973813..d499b421fb 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.5
-XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
+XFONT_ENCODINGS_VERSION = 1.0.6
+XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
 XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
