Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CAEC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D306460BF2;
	Mon,  5 Jun 2023 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D306460BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRGzlt5EGQ-H; Mon,  5 Jun 2023 11:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2AA60DED;
	Mon,  5 Jun 2023 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2AA60DED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A017E1BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 274C682137
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274C682137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x001huitGbOB for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 461B982138
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 461B982138
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A2786C77; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:17:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9f9fac6fb485a20a15ae5e8f1d620da2742e4c05
X-Git-Newrev: e8f4288e61cf56dbeac2b5afaea4c2c80f5519dd
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.43A2786C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xfont_encodings: bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8f4288e61cf56dbeac2b5afaea4c2c80f5519dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003355.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 75d404bb2902cf891f76e8b21a913355d117e514)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 6 +++---
 package/x11r7/xfont_encodings/xfont_encodings.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 6da1080576..80d4a48c40 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003189.html
-sha256  77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26  encodings-1.0.6.tar.xz
-sha512  2d52486996939401121bc858ba23031f70eef857760db8da4c84f083e981868e4bc7a8c2ab6d59274a0cf95f592a0dbfad47bce6c9299bb45d115b48abc39134  encodings-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003355.html
+sha256  3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4  encodings-1.0.7.tar.xz
+sha512  dc72982b14e5d89fe1eff1ab11f308796c89255a06337d8cd6bf65757f11dd0a5478b41d844793213db8fe9638389734f148abe9df9fb05027ea563dacde6ba8  encodings-1.0.7.tar.xz
 # Locally computed
 sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index d499b421fb..7825f4117e 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.6
+XFONT_ENCODINGS_VERSION = 1.0.7
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
-XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
+XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
