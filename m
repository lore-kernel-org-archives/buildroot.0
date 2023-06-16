Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED004EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BEE6148A;
	Fri, 16 Jun 2023 08:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BEE6148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwh5mgpuvQ9k; Fri, 16 Jun 2023 08:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4EA61456;
	Fri, 16 Jun 2023 08:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4EA61456
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 204451BF5E6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0766340608
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0766340608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLTM7cc6e7Dv for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:30:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B1B401CA
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B1B401CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 467BB839E7; Fri, 16 Jun 2023 08:30:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 10:27:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89585576728ebf9362394ae6e26df595098f8bbc
X-Git-Newrev: 8ef7b2069dd6462508c3c61373fe2802761c4d63
X-Patchwork-Hint: ignore
Message-Id: <20230616083015.467BB839E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Update email address for Bernd
 Kuhls
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ef7b2069dd6462508c3c61373fe2802761c4d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56316201af..694dfe0bdd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -311,7 +311,7 @@ F:	package/taskd/
 N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
-N:	Bernd Kuhls <bernd.kuhls@t-online.de>
+N:	Bernd Kuhls <bernd@kuhls.net>
 F:	package/alsa-lib/
 F:	package/alsa-utils/
 F:	package/apache/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
