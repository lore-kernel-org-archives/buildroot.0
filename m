Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C46C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA4640289;
	Mon, 27 Jun 2022 20:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA4640289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgOXf3KZ7ssY; Mon, 27 Jun 2022 20:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D37340612;
	Mon, 27 Jun 2022 20:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D37340612
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF24E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96E260E4B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96E260E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-wjj-e9QLw1 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19C6460C28
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C6460C28
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D8031875B6; Mon, 27 Jun 2022 20:31:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:40:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c833abf4d8339516b17b82baa35c4d6683119e36
X-Git-Newrev: ff4c9cebfe18b5beb7d3f9571223a22996ee90c9
X-Patchwork-Hint: ignore
Message-Id: <20220627203135.D8031875B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbpfan: bump to version 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff4c9cebfe18b5beb7d3f9571223a22996ee90c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/linux-on-mac/mbpfan/releases/tag/v2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbpfan/mbpfan.hash | 2 +-
 package/mbpfan/mbpfan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
index eafd313b4e..9195692d52 100644
--- a/package/mbpfan/mbpfan.hash
+++ b/package/mbpfan/mbpfan.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  52a3a79d99f775fe90917a0958e527ea14ff5b83d010164bd91f7cc3ce046b6a  mbpfan-2.2.1.tar.gz
+sha256  f690e9302da4cf97e582606614d91e1ee4ac495a4939aec7c0b3468c8988eb67  mbpfan-2.3.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
index 2455b0a4ca..52d823cbdc 100644
--- a/package/mbpfan/mbpfan.mk
+++ b/package/mbpfan/mbpfan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPFAN_VERSION = 2.2.1
+MBPFAN_VERSION = 2.3.0
 MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
 MBPFAN_LICENSE = GPL-3.0+
 MBPFAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
