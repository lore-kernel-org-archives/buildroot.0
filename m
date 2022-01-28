Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7AAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337B583F59;
	Fri, 28 Jan 2022 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwsaQT8Lj3dc; Fri, 28 Jan 2022 20:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6639583F55;
	Fri, 28 Jan 2022 20:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A24F1BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F5F41553
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0R_0uAs8G0-5 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D39C41518
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:46:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98D2F8230F; Fri, 28 Jan 2022 20:39:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:36:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a800c82206b287e147de5560d146a32f743dd1aa
X-Git-Newrev: 8e2ae214fdde95daf104ab8a72df25127a3f98c4
X-Patchwork-Hint: ignore
Message-Id: <20220128203949.98D2F8230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/luajit: add
 LUAJIT_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e2ae214fdde95daf104ab8a72df25127a3f98c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

cpe:2.3:a:luajit:luajit is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aluajit%3Aluajit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d91f454117fafad219948bf1ea86b0d6e2301f76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d2af69d1e3..1f45fb8af0 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -8,6 +8,7 @@ LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
+LUAJIT_CPE_ID_VENDOR = luajit
 
 LUAJIT_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
