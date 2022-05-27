Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90C7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD1A61661;
	Fri, 27 May 2022 09:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6Z8vWFPzKx6; Fri, 27 May 2022 09:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83A8461649;
	Fri, 27 May 2022 09:54:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BDA71BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558D441342
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Aw8jw4CAspL for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:53:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C62841336
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94E4E86667; Fri, 27 May 2022 09:42:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:51:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 71592236f74768720a05e76fccac4a4a286f4693
X-Git-Newrev: 7eba7e046fd770f4cad86dbe22595affbcd02c95
X-Patchwork-Hint: ignore
Message-Id: <20220527094200.94E4E86667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ffmpeg: bump
 verson to 4.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7eba7e046fd770f4cad86dbe22595affbcd02c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;hb=refs/heads/release/4.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8cb49dee480f23cc2eb2169bcda62cb84b7673ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index abb397f872..8669a060d0 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02  ffmpeg-4.4.1.tar.xz
+sha256  af419a7f88adbc56c758ab19b4c708afbcae15ef09606b82b855291f6a6faa93  ffmpeg-4.4.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5a79faed47..82d229903f 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.4.1
+FFMPEG_VERSION = 4.4.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
