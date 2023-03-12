Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4229FC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C21410DB;
	Sun, 12 Mar 2023 22:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C21410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBG1OzfpSL1h; Sun, 12 Mar 2023 22:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB55441295;
	Sun, 12 Mar 2023 22:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB55441295
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F47B1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7729160D51
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7729160D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGj1J3iO5K0A for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:16:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02F660B22
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02F660B22
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FBAC87067; Sun, 12 Mar 2023 22:16:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:16:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ef625e67645d7fffc7b0082bfe6367ec6eb883
X-Git-Newrev: 61ba55e9cce6884295e47fdf33554e6877bd0747
X-Patchwork-Hint: ignore
Message-Id: <20230312221654.8FBAC87067@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: bump version to 0.35.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61ba55e9cce6884295e47fdf33554e6877bd0747
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/mpv-player/mpv/releases/tag/v0.35.1

Updated license hash due to upstream commit
"DOCS: use upstream license files":
https://github.com/mpv-player/mpv/commit/7314253180e7c5d06bec6d1fed79ce92bff4b6be

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/mpv.hash | 4 ++--
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 0c7eb5f8a5..a09015619d 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  100a116b9f23bdcda3a596e9f26be3a69f166a4f1d00910d1789b6571c46f3a9  mpv-0.33.1.tar.gz
-sha256  a99d7b0625a0566271aad6de694e52eafd566db024f9516720d526c680d3ee30  LICENSE.GPL
+sha256  41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9  mpv-0.35.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index f9250070d1..e368b25736 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.33.1
+MPV_VERSION = 0.35.1
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg libass zlib \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
