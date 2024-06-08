Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919C3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F795427F8;
	Sat,  8 Jun 2024 07:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKMszIhF3pOT; Sat,  8 Jun 2024 07:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBCF4275E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBCF4275E;
	Sat,  8 Jun 2024 07:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89AF1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3C09607AF
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pqs9ZI7VhCcl for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBEB60743
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FBEB60743
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0953B87D85; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:15:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9862d0c271ae08c26c37b12e8cf69afc38c68136
X-Git-Newrev: 1669a9efc0ac16f9b3c4a1cb816055eda43af3fb
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.0953B87D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/redis-plus-plus:
 bump to version 1.3.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=1669a9efc0ac16f9b3c4a1cb816055eda43af3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.11
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.12
https://github.com/sewenew/redis-plus-plus/compare/1.3.10...1.3.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee2a9a5e4167dc86511568bd5b136f00d099481f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 1d88365bc0..4cdc176025 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  85d9d9ff84c873c4a14bd28bee569a1f311285fad8d4f2fb0e472f65d4bb842a  redis-plus-plus-1.3.10.tar.gz
+sha256  26c1e45cdbafe1af4d2cf756957b2268baab6f802b53bcdd435864620e2c03c7  redis-plus-plus-1.3.12.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index a286e2de33..167d8bfa01 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.10
+REDIS_PLUS_PLUS_VERSION = 1.3.12
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
