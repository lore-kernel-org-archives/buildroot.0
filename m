Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB20C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0993F60F3F;
	Wed,  8 Dec 2021 08:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cr61gN87t4Um; Wed,  8 Dec 2021 08:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A3160F1E;
	Wed,  8 Dec 2021 08:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE1F1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C34640A05
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDh8vT4dDCBr for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AC8A40A01
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A3EC81839; Wed,  8 Dec 2021 08:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:36:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: eadd5e3c688fae052244dd7e8c838c539d7c01c5
X-Git-Newrev: 18a413f1ab82c3c2e0c9b279835a3d9899b1b23d
X-Patchwork-Hint: ignore
Message-Id: <20211208083455.4A3EC81839@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/glorytun: replace
 BSD-2-clause by BSD-2-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=18a413f1ab82c3c2e0c9b279835a3d9899b1b23d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a479fdd86b57ce9fd239c250c09229b78272cc43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glorytun/glorytun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index d128ae835d..389c7a07e4 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -7,7 +7,7 @@
 GLORYTUN_VERSION = 0.3.4
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
-GLORYTUN_LICENSE = BSD-2-clause
+GLORYTUN_LICENSE = BSD-2-Clause
 GLORYTUN_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
