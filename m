Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20F4C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 19:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F6370271;
	Fri, 12 May 2023 19:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F6370271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfxurJRB4Ojg; Fri, 12 May 2023 19:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265C570269;
	Fri, 12 May 2023 19:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 265C570269
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADC8C1BF8B4
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 19:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 875F08471A
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 19:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875F08471A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLXrvSMKJFYQ for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 19:04:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 579688470B
 for <buildroot@buildroot.org>; Fri, 12 May 2023 19:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579688470B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40F4B8642F; Fri, 12 May 2023 19:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 20:54:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
X-Git-Newrev: 3668c1f381a1f48593c03142cb47f4e24b742e98
X-Patchwork-Hint: ignore
Message-Id: <20230512190447.40F4B8642F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to version 2.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=3668c1f381a1f48593c03142cb47f4e24b742e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Release Notes:

    https://fluentbit.io/announcements/v2.0.10/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 0caadcd56f..d60531438a 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  393ad4a6ced48c327607653d610ef273843085a17b6e5c8013877abdf31e6945  fluent-bit-2.0.9.tar.gz
+sha256  aad5176cb4dcadacacd379ca43160074c6690012d37c4749536ac3b977d50495  fluent-bit-2.0.10.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 8ba16399bb..319815f056 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.0.9
+FLUENT_BIT_VERSION = 2.0.10
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
