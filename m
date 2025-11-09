Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2751CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D6881272;
	Sun,  9 Nov 2025 17:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnZJKUmo8oov; Sun,  9 Nov 2025 17:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B118127D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B118127D;
	Sun,  9 Nov 2025 17:51:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 427001CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2847B8127D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-8owrR1h25q for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C06F81272
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C06F81272
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B5068412D; Sun,  9 Nov 2025 17:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 18:48:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2eded963ee54173867914fee05785122e0f34ee8
X-Git-Newrev: fc31c07dbad287ec13e6ac7cb4ecb21648dd918c
X-Patchwork-Hint: ignore
Message-Id: <20251109175133.3B5068412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cctz: bump to version 2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc31c07dbad287ec13e6ac7cb4ecb21648dd918c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/google/cctz/releases/tag/v2.5

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cctz/cctz.hash | 2 +-
 package/cctz/cctz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
index ac78cd611b..6936921ac4 100644
--- a/package/cctz/cctz.hash
+++ b/package/cctz/cctz.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e1a00957d472044808a24a26f1ba020f36dc26949a69c214562d96b74093adb3  cctz-2.4.tar.gz
+sha256  47d2d68e7cb5af3296dc7e69b0f4a765589f1b2f4af4b9c42e772414c428b421  cctz-2.5.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
index 7f5d960a42..14b8dcea88 100644
--- a/package/cctz/cctz.mk
+++ b/package/cctz/cctz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCTZ_VERSION = 2.4
+CCTZ_VERSION = 2.5
 CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
 CCTZ_LICENSE = Apache-2.0
 CCTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
