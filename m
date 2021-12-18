Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B8BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035EA42021;
	Sat, 18 Dec 2021 22:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhBCc_haphPL; Sat, 18 Dec 2021 22:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 673E542016;
	Sat, 18 Dec 2021 22:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205461BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF9C42016
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acTRHObM4mqQ for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F83241F5D
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:55:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CCBD77F9D3; Sat, 18 Dec 2021 22:49:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:54:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aab198fdd48de28905d16955fd8964fab3db3c42
X-Git-Newrev: fe48de513636941b4b3a7fb80a27953736080f30
X-Patchwork-Hint: ignore
Message-Id: <20211218224952.CCBD77F9D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenaptx: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe48de513636941b4b3a7fb80a27953736080f30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is GPL-3.0+, not GPL-3.0 since the addition of the package in
commit 1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenaptx/libopenaptx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
index 75a5532e96..c2f5fa2390 100644
--- a/package/libopenaptx/libopenaptx.mk
+++ b/package/libopenaptx/libopenaptx.mk
@@ -6,7 +6,7 @@
 
 LIBOPENAPTX_VERSION = 0.2.1
 LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
-LIBOPENAPTX_LICENSE = GPL-3.0
+LIBOPENAPTX_LICENSE = GPL-3.0+
 LIBOPENAPTX_LICENSE_FILES = COPYING
 LIBOPENAPTX_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
