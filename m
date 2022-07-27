Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6948CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14624168C;
	Wed, 27 Jul 2022 21:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14624168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhbWbbZDjsPC; Wed, 27 Jul 2022 21:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B56C41573;
	Wed, 27 Jul 2022 21:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B56C41573
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 703F71BF405
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58AF140983
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58AF140983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1xqdCWlGm0W for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94C9740487
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C9740487
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B1C6786741; Wed, 27 Jul 2022 21:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 23:12:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff3acfe13adce745b457c6c3c3e6a01ea0a64e52
X-Git-Newrev: e58e0d17c796f46c54b9cd86b12844756b917a05
X-Patchwork-Hint: ignore
Message-Id: <20220727210911.B1C6786741@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: updated
 copyright notice
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

commit: https://git.buildroot.net/buildroot/commit/?id=e58e0d17c796f46c54b9cd86b12844756b917a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pretty straightforward. Adds my name to copyright notice.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0fba7953c9..fe549ce1ca 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 
 # Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+# Copyright (C) 2022 by Sen Hastings <sen@phobosdpl.com>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
