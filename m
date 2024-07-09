Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFEFC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BDE40308;
	Tue,  9 Jul 2024 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFOwFqu90eyz; Tue,  9 Jul 2024 21:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1105B4031E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1105B4031E;
	Tue,  9 Jul 2024 21:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47BFE1BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3555760F4E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJGT08fpfyss for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7195260F1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7195260F1A
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CB2F84493; Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 23:34:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14388ca1b695a808c329fac8bd3470f17193785f
X-Git-Newrev: f61dccf9a83e305ee8ba897e03fb6a6b90351a36
X-Patchwork-Hint: ignore
Message-Id: <20240709213457.5CB2F84493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2024.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f61dccf9a83e305ee8ba897e03fb6a6b90351a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 13964351f6..ac28acb1f4 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c8af1e964d0123a7d4bbba981170eff723db87dcd37e5881c584ffee54194d1a  swupdate-2024.05.tar.gz
+sha256  2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2  swupdate-2024.05.2.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b36aabb1e7..75e4af5db4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.05
+SWUPDATE_VERSION = 2024.05.2
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
