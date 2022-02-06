Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E93C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3775B40289;
	Sun,  6 Feb 2022 15:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FQm69KGZUgn; Sun,  6 Feb 2022 15:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215EF40270;
	Sun,  6 Feb 2022 15:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77E8F1BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D5740272
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5p5N1Sb6TlWt for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:35:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CBCC400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:35:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D0A08829FB; Sun,  6 Feb 2022 15:27:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:29:08 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: eb7af923b23a444d3e79c8e7131ed6a03a8b2d9c
X-Git-Newrev: f0b03fb9423652804aa5b16a8789a453527b7ba9
X-Patchwork-Hint: ignore
Message-Id: <20220206152743.D0A08829FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/log4cxx: change
 download URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0b03fb9423652804aa5b16a8789a453527b7ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- change download URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0876da5ea1a9bd74737a4ccef2995f124368bb86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cxx/log4cxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index e799b0fb16..7612774583 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOG4CXX_VERSION = 0.12.0
-LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
+LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
