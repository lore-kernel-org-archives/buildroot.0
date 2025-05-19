Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C057C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12DB660733;
	Mon, 19 May 2025 17:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LV-3X5M2OSp; Mon, 19 May 2025 17:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433AF605D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433AF605D5;
	Mon, 19 May 2025 17:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E8DD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0460A80DE0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbRrZQf2WhCo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B3B80D1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29B3B80D1F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:06:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAC2487457; Mon, 19 May 2025 17:06:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 19:02:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd0975b9429975aa9362d3be502059645e7b7810
X-Git-Newrev: 5ef0bfa759bf7b9cf8d9b5097200665054b1c864
X-Patchwork-Hint: ignore
Message-Id: <20250519170641.EAC2487457@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dhcpcd: bump version
 to 10.2.3
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
