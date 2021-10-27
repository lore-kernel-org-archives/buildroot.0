Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D1AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC530610A5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC530610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF07C606E5;
	Wed, 27 Oct 2021 10:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsCYDfnoQ3Tc; Wed, 27 Oct 2021 10:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C876064E;
	Wed, 27 Oct 2021 10:05:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 721C81BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E723403DF
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5iCNlf3Eu6e for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 10:05:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B364F403AF
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 10:05:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6419B88F99; Wed, 27 Oct 2021 10:01:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 11:54:15 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a1549d7138caf3067809b4c532b30095703fe5b6
X-Git-Newrev: 89588d3b3b3ae8e82e22c9ffbf0ade4d1b6841fc
X-Patchwork-Hint: ignore
Message-Id: <20211027100154.6419B88F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/vim: use LICENSE
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=89588d3b3b3ae8e82e22c9ffbf0ade4d1b6841fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Use LICENSE file which is available since version 8.2.0105 and
https://github.com/vim/vim/commit/c838626fea42ed5924ee6084d87d1b37b2d7b0ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1f5ed26e1851e752a254d23101b0e97bbe2e5217)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 1 +
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ce04e5cf5d..8dad275f49 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index f1ed3c342d..a94dab4bd7 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -22,7 +22,7 @@ VIM_CONF_ENV = \
 # GUI/X11 headers leak from the host so forcibly disable them
 VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
-VIM_LICENSE_FILES = README.txt
+VIM_LICENSE_FILES = LICENSE README.txt
 VIM_CPE_ID_VENDOR = vim
 
 ifeq ($(BR2_PACKAGE_ACL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
