Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F689CCD18D
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F4260666;
	Fri, 10 Oct 2025 17:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezaZYjkD89C9; Fri, 10 Oct 2025 17:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6EF86064A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6EF86064A;
	Fri, 10 Oct 2025 17:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB82914B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CE0D6064A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO7Wixik_tuc for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3C560649
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE3C560649
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBA5D87036; Fri, 10 Oct 2025 17:42:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:18:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0549ed0ed1ce7b0b107ac7bd50ccf0496cf8172f
X-Git-Newrev: 8232215a8439c7e69569304b65a486bd266b34a4
X-Patchwork-Hint: ignore
Message-Id: <20251010174245.DBA5D87036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: bump to 2025-08-12
 version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8232215a8439c7e69569304b65a486bd266b34a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build with Linux 6.17.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 847a0d4fc6..42055cb194 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6cb82ae3c5c5cf783b9150035459ecb4a13aaa614d0a8bb3ab938d54f4feeb74  rtl8192eu-0a170fe9a9cd75ea4df3c209fa4a02f9858483e5.tar.gz
+sha256  19e1686d6841f572d3274c96e3e4b66544027d559f5d4da528d8c8510f7d34e6  rtl8192eu-ee928d5dc065f328043711c271eb54f008e6245c.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index ebd376c475..d96389edf0 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 0a170fe9a9cd75ea4df3c209fa4a02f9858483e5
+RTL8192EU_VERSION = ee928d5dc065f328043711c271eb54f008e6245c
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
