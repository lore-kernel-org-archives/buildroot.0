Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A313CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 20:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC366167A;
	Wed, 15 Oct 2025 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9Z0EoIcLW2I; Wed, 15 Oct 2025 20:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C4CE6060A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4CE6060A;
	Wed, 15 Oct 2025 20:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD97FC8
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC2C80B69
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvvCTxo3QYjG for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DE680D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09DE680D57
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0561C87140; Wed, 15 Oct 2025 20:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 22:05:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b3c1f1b0fd55031862e5a3d08bc6159a9e1f5a9
X-Git-Newrev: 31ced13e5df5469f1aeca3f8f2d4da1dc4096a78
X-Patchwork-Hint: ignore
Message-Id: <20251015200619.0561C87140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump to 0.13.0 version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31ced13e5df5469f1aeca3f8f2d4da1dc4096a78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.13.0
https://github.com/DPDK/grout/releases/tag/v0.12.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 0c036b05f6..248c375710 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7bd7caecc3451aea3462a86c31d2ee953a9b7789975b5522dd5f09204558f99d  grout-0.11.0.tar.gz
+sha256  6d1ba4fda3fec6cbc5d4f4d48fe2435fabd36b27540a439a01a44361f6998971  grout-0.13.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 5abf265f19..07ea585a01 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.11.0
+GROUT_VERSION = 0.13.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
