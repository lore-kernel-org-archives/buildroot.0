Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438CFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD04140556;
	Wed, 21 Dec 2022 17:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD04140556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkHkMFYRqBfk; Wed, 21 Dec 2022 17:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 200B54050C;
	Wed, 21 Dec 2022 17:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200B54050C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0D41BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49F7440516
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F7440516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxujUhcrCX4M for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:42:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859F2404A3
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859F2404A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7639386C47; Wed, 21 Dec 2022 17:42:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:20:58 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1e08067884625c80870daa9a986620b65e8ad793
X-Git-Newrev: cd43980688b619b612635f43ce6a3cfec343258d
X-Patchwork-Hint: ignore
Message-Id: <20221221174250.7639386C47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmbim: fix
 license
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd43980688b619b612635f43ce6a3cfec343258d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libmbim library is licensed under LGPL-2.1+ since at least version 1.8.0
and
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/25cc3ed88d25b17c18fb32f46f96b560834387d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3b31a39fdffbf738789885f6e318131055e4b9b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmbim/libmbim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index eba5f0a6e0..4f6c0641e1 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -6,7 +6,7 @@
 
 LIBMBIM_VERSION = 1.26.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
-LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
+LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
