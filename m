Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69359C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D94360FB8;
	Thu, 12 Jun 2025 08:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUzidR7bdmsA; Thu, 12 Jun 2025 08:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552FE61B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552FE61B3E;
	Thu, 12 Jun 2025 08:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 400F21E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B1C42228
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwhpwKVYgq_O for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F5142118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91F5142118
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FD5480FF9; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 21:45:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe73ae0905d6cf4e5c980e702e6b6a209e5b15e3
X-Git-Newrev: 507160c281a25c30436fd185fc1ccf127e849ae6
X-Patchwork-Hint: ignore
Message-Id: <20250612083832.8FD5480FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/msmtp: bump version to 1.8.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=507160c281a25c30436fd185fc1ccf127e849ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://marlam.de/msmtp/news/msmtp-1-8-30/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 2aadb92700..4ac80bb1b2 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.29.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.30.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  13a78f3c6034b33008a7f2474fdddd0deaf7db6da89d0791d3d75eae721220d7  msmtp-1.8.29.tar.xz
+sha256  f826a3c500c4dfeed814685097cead9b2b3dca5a2ec3897967cb9032570fa9ab  msmtp-1.8.30.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 9073fffe76..c391ce8204 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.29
+MSMTP_VERSION = 1.8.30
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
