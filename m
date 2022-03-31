Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A84EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 12:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBBB183F8A;
	Thu, 31 Mar 2022 12:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWjwVJKOXsWL; Thu, 31 Mar 2022 12:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F038483F65;
	Thu, 31 Mar 2022 12:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3E031BF3CA
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2A5860BFF
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNOU9ZSakOTm for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B194612D0
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B77F86089; Thu, 31 Mar 2022 12:06:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 14:15:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 363284a04df1e4117e9789ee6b0eebbc3fee94c0
X-Git-Newrev: e8d1f9e2bfce5b766f0a69c9d89c03658d9d5d0f
X-Patchwork-Hint: ignore
Message-Id: <20220331120606.3B77F86089@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/matio: Bump
 version to 1.5.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8d1f9e2bfce5b766f0a69c9d89c03658d9d5d0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4047e10ed6e20492bae572d4929eaa5d67eed746)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matio/matio.hash | 6 +++---
 package/matio/matio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 55e57338c8..4dd05dee07 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.18/
-sha512  c43e562a101348d64139a056f28bce37c59c6667d701200255ccf9d8b6adf7a92ae9c11c8d921ec8a652cdc81c5de9ab247907279c54c52905adfd65bc3fb90f  matio-1.5.18.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.21/
+sha512  b00bcad807e6a7e10afa656eb77a0e3e9fb08d9cecc3e94ba41ef91ce60367d6686e6d387a874bbb83eb2f895d4a97caac554a70e7f5f6f5cb750052702d411c  matio-1.5.21.tar.gz
 # Locally computed
-sha256  19494e9c9154a5e3f834e99d65fab0653b84280df7c98d1886a98d2bd28369c1  COPYING
+sha256  69143d4a8f1933022bb909327df1ce812dd2420ed57949812dd8f370856bf2a1  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 0ebba13435..236466d4d9 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.18
+MATIO_VERSION = 1.5.21
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
