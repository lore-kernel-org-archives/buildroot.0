Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90531C7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 09:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC1B60E1D;
	Mon, 20 Mar 2023 09:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC1B60E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnqUlWI9BUav; Mon, 20 Mar 2023 09:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C31860E26;
	Mon, 20 Mar 2023 09:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C31860E26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5561BF424
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB93E81589
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 09:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB93E81589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1ajQN7nRZKO for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 09:08:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF8D81586
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 09:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF8D81586
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A36187568; Mon, 20 Mar 2023 09:08:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 10:06:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d39b2aed23dc822cfa56e6cc54fe605e0fd99d2
X-Git-Newrev: 31a0d92bf3362c3852e75191e6c8e6ac230e5dcc
X-Patchwork-Hint: ignore
Message-Id: <20230320090806.0A36187568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 9.0.1414
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

commit: https://git.buildroot.net/buildroot/commit/?id=31a0d92bf3362c3852e75191e6c8e6ac230e5dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-1127, CVE-2023-1170, CVE-2023-1175, CVE-2023-1264 and
CVE-2023-1355

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 4000beedc1..26bc913b8a 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  bcaf9b21ab00ab49de4f3bdfda1bcda82533ec16c412824226544a3fce6506ff  vim-9.0.1260.tar.gz
+sha256  c2bddf283a19c8714d7b21716e0a6a3214f9edb60b080f233cce4143fe228ff3  vim-9.0.1414.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index e3648bfab9..bb6d4a8d27 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.1260
+VIM_VERSION = 9.0.1414
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
