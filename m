Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514E1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54D1829A9;
	Sat, 15 Jan 2022 10:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thBOsQmuOrsj; Sat, 15 Jan 2022 10:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B8482980;
	Sat, 15 Jan 2022 10:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6777B1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E444013A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNLM6drqIcQI for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F9C40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:15:26 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A4A78240103
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1642241723; bh=UO/LqyBsYcXHGsIt6upK51pLx3tptmKzOaIFyyG6oLs=;
 h=From:To:Cc:Subject:Date:From;
 b=SDA/XC3WJT+YEpHn7CnBDxWCIwR4g8gqFxle7oNz/eAifieS9zwx27ySn1utW20eu
 yx/gquSXvNZEegfhY7lr2HdZKOLaSKj331fee6we3JoVXXv5VaMMCxLN8zrDqWWh8+
 fteWl4lmiOzPcC+iL0xkqYk30gkLcSP8iihM+ro7fftKpd6PEwPPe+mDrVk6p/kuP1
 /grJbr/dfPswGze+uQWiBKgsSY4msNB5NasKpiZPyv3j40qhhioKl6o0OqR2AyjSMK
 w3BTq7sKHhZmRrt0wyv3xYwqpkPIaQxZGLH97MIyMm3iUYWUL1hfxYLeuwNRXqI3UP
 +eaPrc3/AR2iA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4JbYvZ6mByz9rxS;
 Sat, 15 Jan 2022 11:15:22 +0100 (CET)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:15:23 +0000
Message-Id: <20220115101523.2932-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.8.8
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 package/multipath-tools/multipath-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index ac41e4815b72..f063848681ea 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7c5962be6068c78d5256e8fc979cf327988f7560705bb9cc25b508c50ca997c0  multipath-tools-0.8.7.tar.gz
+sha256  ff45ddb18a1effbfbe5712f513dd3b7146c68141091fc1c2489af8d6197026ef  multipath-tools-0.8.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 3d8095b0b093..eecfe3900233 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.7
+MULTIPATH_TOOLS_VERSION = 0.8.8
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
