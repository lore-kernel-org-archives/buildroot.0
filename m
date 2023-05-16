Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDD4C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 12:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5570341C54;
	Tue, 16 May 2023 12:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5570341C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfYdk0zRTinH; Tue, 16 May 2023 12:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D030A40B7D;
	Tue, 16 May 2023 12:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D030A40B7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 999DF1BF2F2
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC4E415A6
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC4E415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5b7TN8ZGwLg for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 12:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACF0414C8
 for <buildroot@buildroot.org>; Tue, 16 May 2023 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ACF0414C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 694DB8677A; Tue, 16 May 2023 12:50:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 14:41:42 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7ce01f03f24477d8cb5a1d2ff3f7f1876608e06a
X-Git-Newrev: bd4d2ece38579906352bd75b813a73b1c20ace35
X-Patchwork-Hint: ignore
Message-Id: <20230516125021.694DB8677A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: add Julien
 Olivain for package/openblas
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd4d2ece38579906352bd75b813a73b1c20ace35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The package has been orphan since commit ee58353 (2018-12-22).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 90ffab4011fa42492e12335a93ce749d60d8190c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bab2ededed..5421f76bd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1707,6 +1707,7 @@ F:	package/kexec/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
+F:	package/openblas/
 F:	package/openmpi/
 F:	package/perftest/
 F:	package/ptm2human/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
