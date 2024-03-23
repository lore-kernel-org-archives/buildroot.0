Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0837C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B02041989;
	Sat, 23 Mar 2024 13:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdUq5f3Kl_7Z; Sat, 23 Mar 2024 13:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2A941A2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B2A941A2A;
	Sat, 23 Mar 2024 13:50:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEF841BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6965A40644
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zrwg1xfQsLp9 for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3873D4064F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3873D4064F
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FADF8285C; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 14:38:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36902b51314d93ba2e7283d605738a38aba9d0bf
X-Git-Newrev: 756fdeb76dc4479c9bad42e33c58c60c7150379c
X-Patchwork-Hint: ignore
Message-Id: <20240323134948.2FADF8285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: bump to version 4.14.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=756fdeb76dc4479c9bad42e33c58c60c7150379c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Omit 4.14.4 since it was broken.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 4689a994de..23c292d659 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.3/shadow-4.14.3.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
 # with key A9348594CE31283A826FBDD8D57633D441E25BB5
-sha256  6969279236fe3152768573a38c9f83cb9ca109851a5a990aec1fc672ac2cfcd2  shadow-4.14.3.tar.xz
+sha256  cba74bc7b05d89c015afe23131f9159ece38779d40a8af4cf162852e6e85ca23  shadow-4.14.5.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 1e7ada6148..2092903b2d 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.14.3
+SHADOW_VERSION = 4.14.5
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
