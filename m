Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7A2C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E794B83F65;
	Mon, 19 May 2025 10:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsHM7BTX12uv; Mon, 19 May 2025 10:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278098213D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278098213D;
	Mon, 19 May 2025 10:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFEC5E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F8694101D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMOztXjI4LYQ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC9F4187D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CC9F4187D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18969873D4; Mon, 19 May 2025 10:40:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 11:33:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 595dd3ae885ba9d3688676ca542111b2b227f191
X-Git-Newrev: beefa78b4998c66b41f0d7b62bf693297970e45d
X-Patchwork-Hint: ignore
Message-Id: <20250519104001.18969873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mawk: bump version to
 1.3.4-20250131
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

commit: https://git.buildroot.net/buildroot/commit/?id=beefa78b4998c66b41f0d7b62bf693297970e45d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://invisible-mirror.net/mawk/CHANGES.html#index-t20250131

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mawk/mawk.hash | 2 +-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 3dc2359c82..7f81c93a3a 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,2 @@
-sha256  a39967927dfa1b0116efc45b944a0f5b5b4c34f8e842a4b223dcdd7b367399e0  mawk-1.3.4-20240905.tgz
+sha256  51bcb82d577b141d896d9d9c3077d7aaa209490132e9f2b9573ba8511b3835be  mawk-1.3.4-20250131.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index 1a5e80ae8e..f9f0623904 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20240905
+MAWK_VERSION = 1.3.4-20250131
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
