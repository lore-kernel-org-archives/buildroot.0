Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A12C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7E5340242;
	Mon, 19 Feb 2024 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drOw8If81tf7; Mon, 19 Feb 2024 21:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B767440359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B767440359;
	Mon, 19 Feb 2024 21:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3B1F1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9016F40359
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQ2LVhKpuYU3 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9951540242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9951540242
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8404F87956; Mon, 19 Feb 2024 21:07:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 22:06:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 613c817aefbaf5f62bf75437da61752a30348e8b
X-Git-Newrev: d8ea853b8c923103a32fbc5f5b4ec5e46407cd33
X-Patchwork-Hint: ignore
Message-Id: <20240219210711.8404F87956@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 254.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8ea853b8c923103a32fbc5f5b4ec5e46407cd33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index c0f4638803..e5588f06a2 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  1e1e42c597b4f992679aa964a0c5c23d970c58fed47aed65c11878b332dc5b23  systemd-254.6.tar.gz
+sha256  3d23003ea886dbffa5bc84ad72c6edcbde62d32dbdec506e308624e1da509cb0  systemd-254.9.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 528fe60b1d..c6b006d1fb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254.6
+SYSTEMD_VERSION = 254.9
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
