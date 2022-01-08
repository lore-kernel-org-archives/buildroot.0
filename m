Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8173C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 709DF40994;
	Sat,  8 Jan 2022 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRftEL5l6prH; Sat,  8 Jan 2022 15:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C142A405A6;
	Sat,  8 Jan 2022 15:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95C841BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDBFE81470
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6-CCyopoM8t for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E7F78149E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 88A0782DF1; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:49:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cb372e0851f149d2c0c70667be369a4c09a2bc2
X-Git-Newrev: 6afe7b1da38df60792302af82cd1069972c8613f
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.88A0782DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoundtouch: bump version to
 2.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6afe7b1da38df60792302af82cd1069972c8613f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit:
https://codeberg.org/soundtouch/soundtouch/commit/d11a3adb2daddcdfafac2d86ec8de3b3f41d2f78

Updated _SITE:
https://codeberg.org/soundtouch/soundtouch/commit/d063c0d9f9d29ef1f3302fbdee2f11f997bb2bce

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsoundtouch/libsoundtouch.hash | 4 ++--
 package/libsoundtouch/libsoundtouch.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index fe6a108e33..9de72521bd 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1ce96bac35779d3b752f4cc8696975b3d58f3deb9db47ffc45862767c2a2bdd  libsoundtouch-2.2.tar.gz
-sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
+sha256  6900996607258496ce126924a19fe9d598af9d892cf3f33d1e4daaa9b42ae0b1  soundtouch-2.3.1.tar.gz
+sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 8a0e807d7a..c372c32ac7 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.2
-LIBSOUNDTOUCH_SITE = $(call gitlab,soundtouch,soundtouch,$(LIBSOUNDTOUCH_VERSION))
+LIBSOUNDTOUCH_VERSION = 2.3.1
+LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
+LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
