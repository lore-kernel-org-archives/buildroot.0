Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AEEE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1284846FE;
	Fri,  6 Sep 2024 20:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-DjAEsJEIVv; Fri,  6 Sep 2024 20:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B91846E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B91846E0;
	Fri,  6 Sep 2024 20:01:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9204C1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E5C61114
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm3UcHv2XdnB for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE79660736
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE79660736
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A1086EE3; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 12:11:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f41a11c66e0eabf9832148e2f23b75f15ef4a7b
X-Git-Newrev: 71899d72204a9171203e8d3a45c4e6b2a5beddb0
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.B8A1086EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: bump to version 4.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=71899d72204a9171203e8d3a45c4e6b2a5beddb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadow/shadow.hash | 2 +-
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 1d83272cec..7155baff07 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
 # Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  bb5f70639a0581f9d626f227ce45b31ac137daa7c451c0f672ce14f2731a96ee  shadow-4.15.1.tar.xz
+sha256  b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b  shadow-4.16.0.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 59771b9182..f0a2b57b4d 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.15.1
+SHADOW_VERSION = 4.16.0
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
