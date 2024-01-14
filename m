Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1037C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 18:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1E080E6D;
	Sun, 14 Jan 2024 18:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1E080E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ffNkY7eIbGO; Sun, 14 Jan 2024 18:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC05680E60;
	Sun, 14 Jan 2024 18:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC05680E60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939D61BF593
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B92F605AC
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B92F605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzapcSYxpVko for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FFD4605A4
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFD4605A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F38186168; Sun, 14 Jan 2024 18:31:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 19:27:58 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 10023b762677cfb4b452dd7727ee286f2275387d
X-Git-Newrev: 0960917efa96efa818d39599ab785f7b7637029d
X-Patchwork-Hint: ignore
Message-Id: <20240114183122.8F38186168@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/duktape: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=0960917efa96efa818d39599ab785f7b7637029d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
