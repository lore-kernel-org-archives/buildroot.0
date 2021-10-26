Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B6DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AED60E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75AED60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FC540513;
	Tue, 26 Oct 2021 18:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPXQGQ7vRKH0; Tue, 26 Oct 2021 18:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCE5404EE;
	Tue, 26 Oct 2021 18:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8881BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D10980F26
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ir4yHV3nNshF for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C36AF80DC8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE09488E94; Tue, 26 Oct 2021 18:32:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 255acdc143658aa637ce75f657b3bebee1d58c95
X-Git-Newrev: 1f5ed26e1851e752a254d23101b0e97bbe2e5217
X-Patchwork-Hint: ignore
Message-Id: <20211026183253.EE09488E94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: use LICENSE file
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f5ed26e1851e752a254d23101b0e97bbe2e5217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LICENSE file which is available since version 8.2.0105 and
https://github.com/vim/vim/commit/c838626fea42ed5924ee6084d87d1b37b2d7b0ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
