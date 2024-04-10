Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F99CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4564D60EAF;
	Wed, 10 Apr 2024 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7wQg15sZYZN; Wed, 10 Apr 2024 21:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D9460ECC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D9460ECC;
	Wed, 10 Apr 2024 21:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9172F1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8DBE40359
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wr0NQ5xgEd39 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B1D94058D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B1D94058D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19F8585F9D; Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa4c77b4a886e0d85ee38f2edc99eb3f33fed663
X-Git-Newrev: 1b6e6b563305a0469d6e3216cafa82c1b81ce82d
X-Patchwork-Hint: ignore
Message-Id: <20240410214521.19F8585F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: bump to version
 2024-03-25
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b6e6b563305a0469d6e3216cafa82c1b81ce82d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index b3d6d2c569..fba2f7a109 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3ccec54462a8668142a9c2b2ddfffe4e0434feebe6caf6a7de6812dc8713c37f  rtl8821cu-5b39398e2de146edeb76716420f3288f508bea61.tar.gz
+sha256  c04741129e815c30c51e509012d1a21e4f6d568c211921e6bc46e1adc3d4d4e1  rtl8821cu-0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 8cb8ea710b..39aea1d7a4 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 5b39398e2de146edeb76716420f3288f508bea61
+RTL8821CU_VERSION = 0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
