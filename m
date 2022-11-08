Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E6C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD0560E31;
	Tue,  8 Nov 2022 20:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD0560E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koOrBUYLrYqN; Tue,  8 Nov 2022 20:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A2660E0D;
	Tue,  8 Nov 2022 20:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A2660E0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5710B1BF3C6
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F3A60E0D
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F3A60E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO5DbxOOX1Qd for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A89560D93
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A89560D93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AB6481249; Tue,  8 Nov 2022 20:29:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:29:26 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: adef0f5a569a63382c650d18acae42ac1f70c274
X-Git-Newrev: b46ec8cc56861039da0df33152a18b8f3edc9d5b
X-Patchwork-Hint: ignore
Message-Id: <20221108202935.5AB6481249@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/jack2: bump to
 version 1.9.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=b46ec8cc56861039da0df33152a18b8f3edc9d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

https://github.com/jackaudio/jack2/releases/tag/v1.9.21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0a13b667b8587816734c432c2e691d4c3ed9763)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.hash | 2 +-
 package/jack2/jack2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index 6361473cf7..c98971ca1c 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  915ad2900992159bdb729b9fc4ea134b962ce32b2df0b384fee40a2c5808835d  jack2-1.9.20.tar.gz
+sha256  8b044a40ba5393b47605a920ba30744fdf8bf77d210eca90d39c8637fe6bc65d  jack2-1.9.21.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 9d6a3b6479..f7683304a6 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.20
+JACK2_VERSION = 1.9.21
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
