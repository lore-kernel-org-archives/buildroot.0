Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB11EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F6C41E8F;
	Tue, 11 Jul 2023 22:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F6C41E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5-0K0eg7Pfi; Tue, 11 Jul 2023 22:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C60541E94;
	Tue, 11 Jul 2023 22:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C60541E94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53A9F1BF95F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3942841E8F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3942841E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZx25FGc7yfH for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:17:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38DDC41E8B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38DDC41E8B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23B2186E7A; Tue, 11 Jul 2023 22:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 00:01:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21764235cb7f7fb767ea4b5d825e39c711aee235
X-Git-Newrev: 314f62eda347ba02b4688ac94c6bab55b4a4d6c9
X-Patchwork-Hint: ignore
Message-Id: <20230711221744.23B2186E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 v24.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=314f62eda347ba02b4688ac94c6bab55b4a4d6c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v24.0.0 release notes:

https://github.com/moby/moby/releases/tag/v24.0.0
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.0

v24.0.1 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.1
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.1

v24.0.2 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.2
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 092ec989cf..b6729ab660 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f502eba135828ae52cefb12f1c74092c8865e39cb94f5daed0f3f6717a8d50a3  docker-engine-23.0.5.tar.gz
+sha256  f4bc7d7cc2ee3671371ae80fd624e61f0598e614b5c235012581f8ec1d593aa0  docker-engine-24.0.2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f904793aa2..8127689e9e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.5
+DOCKER_ENGINE_VERSION = 24.0.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
