Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6702C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C604610B8;
	Wed, 20 Dec 2023 22:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C604610B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqf8GgjF2Ajx; Wed, 20 Dec 2023 22:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5066109D;
	Wed, 20 Dec 2023 22:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5066109D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 758981BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA456109D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA456109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqMt-Q0ma3q0 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 883FD61098
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883FD61098
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7784B87CF3; Wed, 20 Dec 2023 22:38:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 23:38:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
X-Git-Newrev: e59346f7db276852d40618ec04fd012bedf2e245
X-Patchwork-Hint: ignore
Message-Id: <20231220223856.7784B87CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutempter: fix license
 information
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e59346f7db276852d40618ec04fd012bedf2e245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the source file:

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libutempter/libutempter.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
index 44b0dc38b0..d51f70049c 100644
--- a/package/libutempter/libutempter.mk
+++ b/package/libutempter/libutempter.mk
@@ -7,7 +7,7 @@
 LIBUTEMPTER_VERSION = 1.2.1
 LIBUTEMPTER_SITE = ftp.altlinux.org/pub/people/ldv/utempter
 LIBUTEMPTER_INSTALL_STAGING = YES
-LIBUTEMPTER_LICENSE = LGPL-2.1
+LIBUTEMPTER_LICENSE = LGPL-2.1+
 LIBUTEMPTER_LICENSE_FILES = COPYING
 
 define LIBUTEMPTER_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
