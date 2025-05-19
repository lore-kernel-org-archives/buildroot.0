Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215DC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DDD821E4;
	Thu, 12 Jun 2025 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTPR6gLPcPwR; Thu, 12 Jun 2025 08:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B3B82184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B3B82184;
	Thu, 12 Jun 2025 08:39:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EDEA1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F053E42113
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAxgPmuA6LjX for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6562A405BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6562A405BE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 631DE82D97; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 19:02:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd0975b9429975aa9362d3be502059645e7b7810
X-Git-Newrev: 5ef0bfa759bf7b9cf8d9b5097200665054b1c864
X-Patchwork-Hint: ignore
Message-Id: <20250612083827.631DE82D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump version to 10.2.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ef0bfa759bf7b9cf8d9b5097200665054b1c864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update.
https://github.com/NetworkConfiguration/dhcpcd/commit/e143ee18f4e2312e0254002dd27bf1da8bd95f27

Release notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.2
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.1
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 34f6419bf7..d820f5e47a 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
-sha256  abc307c63853da3199baa5c1e15fd5ede9d68d068b2a59ca14c5a6768e9cc3b7  dhcpcd-10.1.0.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
+sha256  4137a382d1a203bffdf8e757bbdfd0032433d06e5c69a3785b88b83251f89616  dhcpcd-10.2.3.tar.xz
 # Locally calculated
-sha256  224b37cd1ef1365bd2ac9eaec9f32fee94e85dd40f95461ebcb21e758357ac1f  LICENSE
+sha256  3aeab006b01c1573b42d4440d7edad0adfe61ad05848ca82e02e745424a2b4fa  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 3a4b0e10d7..10707158d9 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.1.0
+DHCPCD_VERSION = 10.2.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
