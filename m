Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16847C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0C9408BC;
	Fri, 26 Jan 2024 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0C9408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnFmcYnSn8zH; Fri, 26 Jan 2024 21:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B8143753;
	Fri, 26 Jan 2024 21:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B8143753
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8931BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 820A742157
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820A742157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyLsvCzuLKdx for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF64E41FB8
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF64E41FB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92397865AE; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 22:26:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39acca7349f6b757a83788dd5e385e61c3e29680
X-Git-Newrev: 81d35de1ba925cbf7a51b403d05f164a4bb5e60f
X-Patchwork-Hint: ignore
Message-Id: <20240126212947.92397865AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: bump to version
 2024-01-21
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

commit: https://git.buildroot.net/buildroot/commit/?id=81d35de1ba925cbf7a51b403d05f164a4bb5e60f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.8.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 3d7a1be9d1..b3d6d2c569 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5226fefd72d2dd2b8048a8d836f731139ddcb9a34eab68e9b07acee6ee5d8553  rtl8821cu-eb52ece92607394ecc22e96b41671ec3e5b1fa30.tar.gz
+sha256  3ccec54462a8668142a9c2b2ddfffe4e0434feebe6caf6a7de6812dc8713c37f  rtl8821cu-5b39398e2de146edeb76716420f3288f508bea61.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 8f344d518f..8cb8ea710b 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = eb52ece92607394ecc22e96b41671ec3e5b1fa30
+RTL8821CU_VERSION = 5b39398e2de146edeb76716420f3288f508bea61
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
