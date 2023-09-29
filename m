Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E15E728E2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F44D83CD5;
	Fri, 29 Sep 2023 20:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F44D83CD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mNt1udrZPFq; Fri, 29 Sep 2023 20:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910D083DD1;
	Fri, 29 Sep 2023 20:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910D083DD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91A651BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650214146F
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650214146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id It5kFoI42zPj for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:01:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDB7D41365
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB7D41365
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB4F6835DD; Fri, 29 Sep 2023 20:01:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 21:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f1d81aa98090b22daf40fddf13ea2a3fd10eb82
X-Git-Newrev: 17256dac8f97d8b1de84b5777630b4036f9a768e
X-Patchwork-Hint: ignore
Message-Id: <20230929200113.CB4F6835DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-plutotv: bump version to
 20.3.1a-Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=17256dac8f97d8b1de84b5777630b4036f9a768e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 36a9dd4187..0c56c8b6b4 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d38a6bf4debc442849d01faedadcccb1b07debe850cd3c9a5789508233d22256  kodi-pvr-plutotv-20.3.0-Nexus.tar.gz
+sha256  11505556200029a48a293e97f94e0469a5f78580d0e56d5d0a1da05d61f0f5b5  kodi-pvr-plutotv-20.3.1a-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index b05c452854..fadb47efaf 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 20.3.0-Nexus
+KODI_PVR_PLUTOTV_VERSION = 20.3.1a-Nexus
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
