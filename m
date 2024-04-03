Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE620CD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582F341779;
	Wed,  3 Apr 2024 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55TXc3J8wZBR; Wed,  3 Apr 2024 19:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D17641848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D17641848;
	Wed,  3 Apr 2024 19:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 721C91BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E65D8226A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4AeAyuYb4pP for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A52082254
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A52082254
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E8E6846C5; Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:44:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eedba64ab217a5b15dffe77565ffc129f1097ac3
X-Git-Newrev: 4dc75394511b3eb82f49952a49b6b5e1d49cd75f
X-Patchwork-Hint: ignore
Message-Id: <20240403195106.1E8E6846C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libidn: bump to version 1.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc75394511b3eb82f49952a49b6b5e1d49cd75f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.savannah.gnu.org/cgit/libidn.git/tree/NEWS?h=v1.42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn/libidn.hash | 2 +-
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 837424d93e..65201fdfb5 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945  libidn-1.41.tar.gz
+sha256  d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723  libidn-1.42.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index e1a357de1b..c7b8b4941c 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.41
+LIBIDN_VERSION = 1.42
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
