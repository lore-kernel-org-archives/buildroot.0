Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA7AC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F6C84129;
	Mon, 19 May 2025 10:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMYvknLREqKW; Mon, 19 May 2025 10:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6F784126
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6F784126;
	Mon, 19 May 2025 10:49:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6BF1BF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA70441918
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQNu3D50_8zi for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DFD14192D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DFD14192D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67A14873D4; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 10:08:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 992b6783931157a809ed8435b08c2d21f380cc01
X-Git-Newrev: 2a7823a7fe2a1859ff8cab2d92a22a69003d62db
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.67A14873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsemanage: bump to
 version 3.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a7823a7fe2a1859ff8cab2d92a22a69003d62db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License sha change is due to white space cleanup on commit 5969e99.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 4d1b2161da..78067b3ede 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  e166cae29a417dab008db9ca0874023f353a3017b07693a036ed97487eda35b1  libsemanage-3.7.tar.gz
+sha256  7b39127b219cc70bfd935a4af6b0f2ba83d4b35c916f253c7e942c23ab490f07  libsemanage-3.8.1.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
+sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index cf9e9c46fa..21ca9fd3f9 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.7
+LIBSEMANAGE_VERSION = 3.8.1
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
