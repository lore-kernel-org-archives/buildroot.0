Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0103BC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABB88132F;
	Sun, 29 Jan 2023 15:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABB88132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dL9phZJO2yLd; Sun, 29 Jan 2023 15:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D946A81359;
	Sun, 29 Jan 2023 15:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D946A81359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3295C1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C296410B0
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C296410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GZmXyYK4yAy for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 15:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23CB2409BE
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CB2409BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08E6688078; Sun, 29 Jan 2023 15:34:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 16:32:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b535fd2a093eca5e8967a5c8004da55f7295d101
X-Git-Newrev: 696b190e02fbb7f76c8865fa883e51514a7f0dcd
X-Patchwork-Hint: ignore
Message-Id: <20230129153417.08E6688078@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ttyd: bump to version 1.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=696b190e02fbb7f76c8865fa883e51514a7f0dcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index a2a933b63a..85bd71ba2d 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  edc44cd5319c0c9d0858081496cae36fc5c54ee7722e0a547dde39537dfb63de  ttyd-1.7.2.tar.gz
+sha256  c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099  ttyd-1.7.3.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 085511b5fd..d17e21d60b 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.2
+TTYD_VERSION = 1.7.3
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
