Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BCDCCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD45583F9F;
	Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAjbScNCXc9n; Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6442829FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6442829FE;
	Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC0CE160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B279083ECF
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiRSLxSdn5rc for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1070829FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1070829FE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E19EB87A0C; Thu, 30 Oct 2025 08:22:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:37 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 026d492b3ea35c3e5d1551eec95cde8b65a6aa75
X-Git-Newrev: c352644855242b50c569415f18c1255bd5873af1
X-Patchwork-Hint: ignore
Message-Id: <20251030082227.E19EB87A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/iptraf-ng:
 security bump to version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c352644855242b50c569415f18c1255bd5873af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This bump includes the security fix for CVE-2024-52949.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2024-52949.

Release notes:
https://github.com/iptraf-ng/iptraf-ng/releases/tag/v1.2.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8111bdcab1854815fedfbc5ac822758cb107541a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iptraf-ng/iptraf-ng.hash | 2 +-
 package/iptraf-ng/iptraf-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
index 314d5cee29..cadb436de1 100644
--- a/package/iptraf-ng/iptraf-ng.hash
+++ b/package/iptraf-ng/iptraf-ng.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870  iptraf-ng-1.2.1.tar.gz
+sha256  75fd653745ea0705995c25e6c07b34252ecc2563c6a91b007a3a8c26f29cc252  iptraf-ng-1.2.2.tar.gz
 sha256  4e49bef38f621aac4a870da4b30011c7b7abc7256b218daec1c425b08448ae1e  LICENSE
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index 044630be41..1558bd1cd6 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTRAF_NG_VERSION = 1.2.1
+IPTRAF_NG_VERSION = 1.2.2
 IPTRAF_NG_SITE = $(call github,iptraf-ng,iptraf-ng,v$(IPTRAF_NG_VERSION))
 IPTRAF_NG_LICENSE = GPL-2.0+
 IPTRAF_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
