Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768F5C77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 14:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D521280F26;
	Sun, 23 Apr 2023 14:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D521280F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_JxHGxbNl2R; Sun, 23 Apr 2023 14:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278DC80EAE;
	Sun, 23 Apr 2023 14:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278DC80EAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28DD11BF346
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 14:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F007460625
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 14:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F007460625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ejYqgH0ZcWx for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 14:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43D4E605B1
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 14:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D4E605B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF7484494; Sun, 23 Apr 2023 14:43:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 16:43:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5b1d830b8713393d63227caa09064aa594e15cb
X-Git-Newrev: e538824692822cab06c44e6b70e9ae3b92d4c920
X-Patchwork-Hint: ignore
Message-Id: <20230423144327.2DF7484494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email address
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

commit: https://git.buildroot.net/buildroot/commit/?id=e538824692822cab06c44e6b70e9ae3b92d4c920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cd882b579..d9e95a3d05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,7 +538,7 @@ F:	package/syslog-ng/
 N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
-N:	Christian Stewart <christian@paral.in>
+N:	Christian Stewart <christian@aperture.us>
 F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
