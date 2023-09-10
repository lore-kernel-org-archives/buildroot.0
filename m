Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD06C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFDE60BF0;
	Sun, 10 Sep 2023 19:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFDE60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yj87VnXWjfC6; Sun, 10 Sep 2023 19:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ADA06077D;
	Sun, 10 Sep 2023 19:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ADA06077D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F32941BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87F6408E0
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87F6408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iREt_2kIlAii for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:09:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AADF4085C
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AADF4085C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16A0586B7F; Sun, 10 Sep 2023 19:09:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 21:09:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8e9314a03d24906aef738283381dea501a4a584
X-Git-Newrev: 530ea784f1c7ef8176b46245710016ec7bce89dd
X-Patchwork-Hint: ignore
Message-Id: <20230910190937.16A0586B7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: bump to version 123
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

commit: https://git.buildroot.net/buildroot/commit/?id=530ea784f1c7ef8176b46245710016ec7bce89dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

polkit runtime tests are passing successfully with this version bump:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/989945901

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index ffdc2a7568..5eadc89753 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d69656d60800835c3d7d1f0a8362b32e1ae3ace2875a35bb624296fc52d5dc4  polkit-122.tar.gz
+sha256  b69278f6ea0eac406350c45f5720e2fe5e4beaf9f53c16d9902e025965418864  polkit-123.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index dab5d542eb..f58dbe43de 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 122
+POLKIT_VERSION = 123
 POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
