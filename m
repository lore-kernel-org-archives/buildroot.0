Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16C4CA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971BC60628;
	Thu, 18 Sep 2025 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3pDPeJ5J01d; Thu, 18 Sep 2025 19:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B149E60AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B149E60AFC;
	Thu, 18 Sep 2025 19:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E1F273
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885A140B8B
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y04GoEKTZCmq for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 19:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC52540B8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC52540B8A
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9969C83947; Thu, 18 Sep 2025 19:43:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 21:38:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 426d7635c7e99af49c3cc24c122c95b1ed89c082
X-Git-Newrev: 2ad2eb4495ba260cdc71d5fb51f97d9ec2a6b1b8
X-Patchwork-Hint: ignore
Message-Id: <20250918194317.9969C83947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: bump to version 1.7.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ad2eb4495ba260cdc71d5fb51f97d9ec2a6b1b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apr/apr.hash | 4 ++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 7d231ee7cc..1d4ba31ab2 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-1.7.5.tar.bz2.sha256
-sha256  cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2  apr-1.7.5.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.6.tar.bz2.sha256
+sha256  49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32  apr-1.7.6.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index d5b132658a..1c7553a501 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.5
+APR_VERSION = 1.7.6
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
