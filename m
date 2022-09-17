Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B23C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3635760B19;
	Sat, 17 Sep 2022 19:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3635760B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwLILJ_VQBxe; Sat, 17 Sep 2022 19:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7E160AC0;
	Sat, 17 Sep 2022 19:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7E160AC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB6451BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77674011F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B77674011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEyW9snzJ7b6 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB9A40119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB9A40119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D47D84636; Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 21:27:53 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: abc9c24de9536fd028680781915310d3942fa9cd
X-Git-Newrev: bb7d7c21d698d7e7f8e012fdcb0cea919c2fae9f
X-Patchwork-Hint: ignore
Message-Id: <20220917193046.8D47D84636@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/vim: security
 bump to version 9.0.0292
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb7d7c21d698d7e7f8e012fdcb0cea919c2fae9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix CVE-2022-2257, CVE-2022-2264, CVE-2022-2284, CVE-2022-2285,
CVE-2022-2286, CVE-2022-2287, CVE-2022-2288, CVE-2022-2289,
CVE-2022-2304, CVE-2022-2343, CVE-2022-2344, CVE-2022-2345,
CVE-2022-2522, CVE-2022-2571, CVE-2022-2580, CVE-2022-2581,
CVE-2022-2598, CVE-2022-2816, CVE-2022-2817, CVE-2022-2819,
CVE-2022-2845, CVE-2022-2849, CVE-2022-2862, CVE-2022-2874,
CVE-2022-2889, CVE-2022-2923, CVE-2022-2946, CVE-2022-2980
CVE-2022-2982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 782a1526f829a02e163eee609d6f38f1347dc9eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 62b11fea7b..f06d084cb3 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  86aa403632beea5827f305e471a245d14ee9c79072f67ce8e9536169a1deaad9  vim-9.0.0008.tar.gz
+sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c3308b4542..5e7c34abbb 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0008
+VIM_VERSION = 9.0.0292
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
