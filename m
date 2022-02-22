Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA1AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECB6409C1;
	Tue, 22 Feb 2022 16:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7yzcVWtlhYj; Tue, 22 Feb 2022 16:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399CB401EE;
	Tue, 22 Feb 2022 16:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4C71BF3CB
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A1984021E
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIFcuR7-S9RE for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76AD540204
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84412837EA; Tue, 22 Feb 2022 16:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:39:17 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a0ccc8d268eafa07f654c27684eb3354c25c510c
X-Git-Newrev: 64f79776487a8573192e7477b96ff95655e1a097
X-Patchwork-Hint: ignore
Message-Id: <20220222164020.84412837EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lm-sensors:
 update LM_SENSORS_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=64f79776487a8573192e7477b96ff95655e1a097
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update LM_SENSORS_VERSION to make it match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 521afeab9b7c0b07a849355e8b1c1fde0965c84f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lm-sensors/lm-sensors.hash | 2 +-
 package/lm-sensors/lm-sensors.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 0ca07b7e69..c941043343 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
+sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3.6.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 8975efaffa..1bf27fc25a 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3-6-0
-LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
+LM_SENSORS_VERSION = 3.6.0
+LM_SENSORS_SITE = \
+	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
