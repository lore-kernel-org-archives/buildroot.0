Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70890CAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC9D84082;
	Sat, 20 Sep 2025 11:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWnw2-Y4g5oA; Sat, 20 Sep 2025 11:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0F58407C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0F58407C;
	Sat, 20 Sep 2025 11:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23702219
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09BEF405AA
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_oik6jscutm for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F6C340479
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F6C340479
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:57:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35F7F85DD5; Sat, 20 Sep 2025 11:57:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 12:02:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90e8845b1393bc3042ea8c9edc1172f3951742fe
X-Git-Newrev: 35f7279ad355ab0760588f3bc850895db2a20521
X-Patchwork-Hint: ignore
Message-Id: <20250920115738.35F7F85DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 10.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=35f7279ad355ab0760588f3bc850895db2a20521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes log:
https://wiki.qemu.org/ChangeLog/10.1

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: fix license hashes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/qemu.hash | 6 +++---
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index a8b7d688e8..f4691af1dd 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896  qemu-10.0.0.tar.xz
-sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  e0517349b50ca73ebec2fa85b06050d5c463ca65c738833bd8fc1f15f180be51  qemu-10.1.0.tar.xz
+sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
+sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e54..0d1d154371 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.0.0
+QEMU_VERSION = 10.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
