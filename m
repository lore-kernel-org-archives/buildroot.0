Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94489C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24CE5430DD;
	Wed,  1 Nov 2023 11:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24CE5430DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4vLJ2L5oQdn; Wed,  1 Nov 2023 11:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60D0640156;
	Wed,  1 Nov 2023 11:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60D0640156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEE041BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D54A38493E
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54A38493E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id javdP57l8dpF for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3606884937
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3606884937
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22E048631F; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:25:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 111986f4350cdbad6f1c4f4d21944447d53ac831
X-Git-Newrev: 0645cb39e0ce3af743190e587812a5bd4c1f4b24
X-Patchwork-Hint: ignore
Message-Id: <20231101112613.22E048631F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: bump to version 1.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0645cb39e0ce3af743190e587812a5bd4c1f4b24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Sway to version 1.8.1, which brings a new release series to
Buildroot and can be built with wlroots 0.16.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sway/sway.hash | 2 +-
 package/sway/sway.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 6dfa71730f..86b6581f1c 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,3 +1,3 @@
 # Locally computed, tarball verified with GPG signature
-sha256  0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84  sway-1.7.tar.gz
+sha256  73f08fd2cf7948e8af900709efe44eae412ae11c5773960e25c9aa09f73bad41  sway-1.8.1.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 802371c827..19f90b8b00 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.7
-SWAY_SITE = $(call github,swaywm,sway,v$(SWAY_VERSION))
+SWAY_VERSION = 1.8.1
+SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
 SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
