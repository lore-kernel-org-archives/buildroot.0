Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B10C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA9940928;
	Sun, 12 Dec 2021 17:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3o9RZmc7Tng; Sun, 12 Dec 2021 17:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F8F342353;
	Sun, 12 Dec 2021 17:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB0B1BF97C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8621342214
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jbv_0dRfAdHJ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCCB421BE
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E38183657; Sun, 12 Dec 2021 17:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:30:12 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 23e66a3ffc3a652e7d77d2c6bc3f3dbac9cf5389
X-Git-Newrev: 401fceef78ee8933a33b4c92b41abfc663270fd1
X-Patchwork-Hint: ignore
Message-Id: <20211212173024.3E38183657@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libgdiplus: add
 LIBGDIPLUS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=401fceef78ee8933a33b4c92b41abfc663270fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:mono-project:libgdiplus is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amono-project%3Alibgdiplus

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 68e1a88ab92ca6fd2d0c9110893ebbed62ffbae0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgdiplus/libgdiplus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index be4a9168f9..97cb595c71 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -9,6 +9,7 @@ LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
 LIBGDIPLUS_LICENSE = MIT
 LIBGDIPLUS_LICENSE_FILES = LICENSE
+LIBGDIPLUS_CPE_ID_VENDOR = mono-project
 
 LIBGDIPLUS_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
