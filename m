Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3112AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8E584D96;
	Wed, 26 Jan 2022 21:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9kANvI_C6el; Wed, 26 Jan 2022 21:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3905A84D94;
	Wed, 26 Jan 2022 21:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4691BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49CFB41786
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SE5KbQPttrhl for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:21:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A31984177F
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:21:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 42E3382127; Wed, 26 Jan 2022 21:15:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:21:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 334a69f12ebc8fd23818f33d4dfb17f8864d95e9
X-Git-Newrev: 3e15bd8e51ba1b72a59140c84e59971d71086431
X-Patchwork-Hint: ignore
Message-Id: <20220126211500.42E3382127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/batman-adv: bump to version 2021.04
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e15bd8e51ba1b72a59140c84e59971d71086431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batman-adv/batman-adv.hash | 6 +++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index f81df11000..c098663739 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.1/batman-adv-2021.1.tar.gz.sha1
-sha1  27a0dc7cb74b868bc0ab52794ecedd0448f0fb61  batman-adv-2021.1.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.4/batman-adv-2021.4.tar.gz.sha1
+sha1  80a3e4d763b6bf35db6e561ed9d6775dc874d7c6  batman-adv-2021.4.tar.gz
 
 # Hash for license files
-sha256  5a989ba580897268373bd516b87b588061f344af773a0f6b038a3d8d2af028a1  batman-adv-2021.0.tar.gz
+sha256  cff7a2f160045fd0dbf1f1cd7e35e93bf489e81cb8b9501b3756daa391f3eb1b  batman-adv-2021.4.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index e58ac85bef..838f9b1851 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2021.1
+BATMAN_ADV_VERSION = 2021.4
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
