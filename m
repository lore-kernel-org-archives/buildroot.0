Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D622FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7666103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E7666103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CDD40401;
	Tue, 26 Oct 2021 18:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C75UQXmDtaQ2; Tue, 26 Oct 2021 18:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34604024E;
	Tue, 26 Oct 2021 18:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2866A1BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245B84021A
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYJrFxB2ZQOF for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA334011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:38:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B27288EAA; Tue, 26 Oct 2021 18:35:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:36:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5650439b922d020cfad1131e5fb536bce73eb845
X-Git-Newrev: 9d516547280fc087ce123f17bd00b282851ec052
X-Patchwork-Hint: ignore
Message-Id: <20211026183533.6B27288EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 4.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d516547280fc087ce123f17bd00b282851ec052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;hb=refs/heads/release/4.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index d841afd625..abb397f872 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909  ffmpeg-4.4.tar.xz
+sha256  eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02  ffmpeg-4.4.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b3ce4c0656..5a79faed47 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.4
+FFMPEG_VERSION = 4.4.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
