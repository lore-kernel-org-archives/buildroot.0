Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98872C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355ED60E7E;
	Tue, 13 Sep 2022 12:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355ED60E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kj0GM8vuKVL6; Tue, 13 Sep 2022 12:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5691360E6B;
	Tue, 13 Sep 2022 12:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5691360E6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADBAE1BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89CDE40A06
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89CDE40A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtPGY4su-4um for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6119401A2
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6119401A2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B37F883568; Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 14:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0ee83d10bd8902c889b773b25a6b96d880f2fad
X-Git-Newrev: 24261a1762a0017cba8128935a37280c7b876468
X-Patchwork-Hint: ignore
Message-Id: <20220913123955.B37F883568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 9.0.0453
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

commit: https://git.buildroot.net/buildroot/commit/?id=24261a1762a0017cba8128935a37280c7b876468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-3037, CVE-2022-3099, CVE-2022-3134

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index f06d084cb3..0c6b720dd1 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
+sha256  b90063706a2a9ee234275e0dd4b71a11e24867c33203c432fd6e9799fdc3bff9  vim-9.0.0453.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5e7c34abbb..3f1985f036 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0292
+VIM_VERSION = 9.0.0453
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
