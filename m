Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E785FC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 18:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A451E80E60;
	Sun, 14 Jan 2024 18:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A451E80E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhOVkf_K4AC4; Sun, 14 Jan 2024 18:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1934C80E5A;
	Sun, 14 Jan 2024 18:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1934C80E5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 572E61BF593
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE0D60B8D
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE0D60B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQViklPCiN8D for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 18:30:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7755A605AC
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7755A605AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 615DF86153; Sun, 14 Jan 2024 18:30:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 19:27:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1ddea7db1039c68f3b3ad42fe6b97c0ed0c32e5c
X-Git-Newrev: 365d08e8a158b106e5a68e770506b440a820cedf
X-Patchwork-Hint: ignore
Message-Id: <20240114183012.615DF86153@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/duktape: add
 DUKTAPE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=365d08e8a158b106e5a68e770506b440a820cedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:duktape_project:duktape:2.7.0:*:*:*:*:*:*:* is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/DEAF95D7-0DAB-4025-8C5A-9CCF80D75CF2

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e8edf25ac86615b701378eef1d937cd1f3df9a47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duktape/duktape.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 674c5e9323..9b5fb65f06 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -11,6 +11,7 @@ DUKTAPE_SITE = \
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
 DUKTAPE_INSTALL_STAGING = YES
+DUKTAPE_CPE_ID_VENDOR = duktape_project
 
 define DUKTAPE_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
