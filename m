Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8753F418A1;
	Wed, 21 Dec 2022 17:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8753F418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXNY5jxd5l1B; Wed, 21 Dec 2022 17:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF2C4189C;
	Wed, 21 Dec 2022 17:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF2C4189C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 988B91BF95C
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7384B60B01
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7384B60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUIke5SxadHS for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EDD9606CB
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDD9606CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AED886C31; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:20:26 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5efe767420aed5aa88b56a37316720812adc642f
X-Git-Newrev: 9f4f004edc849c764b1d10101d1404fc61b83927
X-Patchwork-Hint: ignore
Message-Id: <20221221174143.4AED886C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libmbim: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f4f004edc849c764b1d10101d1404fc61b83927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index 1e2b1771eb..c14b7f4bee 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -6,7 +6,7 @@
 
 LIBMBIM_VERSION = 1.26.4
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
