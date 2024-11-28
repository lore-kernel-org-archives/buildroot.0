Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52B8D70DEB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609A940723;
	Thu, 28 Nov 2024 20:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afCcZ8UMhw_n; Thu, 28 Nov 2024 20:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A40F4071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A40F4071B;
	Thu, 28 Nov 2024 20:20:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB14A6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1228D40A35
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYnff6K40MtZ for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F48409C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15F48409C8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2E3D86584; Thu, 28 Nov 2024 20:19:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 21:19:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc77be28fc030f8583a4a7f9f724d0fc9543dba5
X-Git-Newrev: eb3bf58290852448af09616160b4c003403802a5
X-Patchwork-Hint: ignore
Message-Id: <20241128201959.F2E3D86584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libiec61850: bump to
 version 1.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb3bf58290852448af09616160b4c003403802a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/mz-automation/libiec61850/blob/v1.6.0/CHANGELOG

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index be662bebaf..3c23682c49 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a0f396a5e2249398f2432bb9698e3aecdb9de11b28e5af68f7fb8b14bc3b2f44  libiec61850-1.5.3.tar.gz
+sha256  0dd0adc7f13215e961d22511bcb1dadfdbdaab969f11a0d975775a6ebdff8099  libiec61850-1.6.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 276acce1a8..92b27dc5c2 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.3
+LIBIEC61850_VERSION = 1.6.0
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
