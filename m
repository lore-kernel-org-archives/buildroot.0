Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C32C02194
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E97D6066B;
	Mon,  3 Feb 2025 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uswlBfAryA9B; Mon,  3 Feb 2025 13:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B79606B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B79606B0;
	Mon,  3 Feb 2025 13:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1A71A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ED234083A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Am9M_SReV_s for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2CD840817
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2CD840817
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1896F82E77; Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:34:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 860377204f720ccf5bf3d8a4c2a9db6fe5a4e6e0
X-Git-Newrev: 3a9a06832baa27875647deeadfb4d234608ddb79
X-Patchwork-Hint: ignore
Message-Id: <20250203133832.1896F82E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump version to 10.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a9a06832baa27875647deeadfb4d234608ddb79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update.

Release notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.10
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.9

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index d29f49fd28..34f6419bf7 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
-sha256  d8dddf9f971a8d9ff828f33d8fa9f6d9a892a4a1429d230e9efb2be97dd0e313  dhcpcd-10.0.8.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
+sha256  abc307c63853da3199baa5c1e15fd5ede9d68d068b2a59ca14c5a6768e9cc3b7  dhcpcd-10.1.0.tar.xz
 # Locally calculated
-sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
+sha256  224b37cd1ef1365bd2ac9eaec9f32fee94e85dd40f95461ebcb21e758357ac1f  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 48a418d4ad..3a4b0e10d7 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.8
+DHCPCD_VERSION = 10.1.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
