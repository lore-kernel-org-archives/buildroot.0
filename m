Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3505B4091F;
	Sun, 11 Dec 2022 10:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3505B4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0GmfHWL5NfX; Sun, 11 Dec 2022 10:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304D94091D;
	Sun, 11 Dec 2022 10:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304D94091D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62E941BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DFC1404C9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DFC1404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9OirJENBVCK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:33:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FBAD40128
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBAD40128
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ED3485FF8; Sun, 11 Dec 2022 10:33:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:33:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5449ea7d20e76242661434b5324c7474c2c96938
X-Git-Newrev: 6987b92da510a8c8b9534a22506850c163d0f035
X-Patchwork-Hint: ignore
Message-Id: <20221211103358.4ED3485FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: bump to version 1.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6987b92da510a8c8b9534a22506850c163d0f035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes:

https://github.com/containers/crun/releases/tag/1.7.2

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crun/crun.hash | 2 +-
 package/crun/crun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index de61310e08..2b21800f02 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  acd24012daa951cf1674b20b2d5f87975d5d6c8e8c80bfe12e4cffa3495cae67  crun-1.5.tar.gz
+sha256  f669ecd3d1895dcaa8425eabb707c06eb3bdb5ae5201a50a423c3cace36c4a05  crun-1.7.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 65f166e657..8c9993993c 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.5
+CRUN_VERSION = 1.7.2
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
