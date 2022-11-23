Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8413D81E40;
	Mon,  5 Dec 2022 12:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8413D81E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clUtoGZ7F1hD; Mon,  5 Dec 2022 12:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B008881E02;
	Mon,  5 Dec 2022 12:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B008881E02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AEDC1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD1A540616
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1A540616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BV70n3Naj3Kq for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D459D40613
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D459D40613
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D170285B9E; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 09:23:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5ebfbdbdfc370cd7ef5b0fcc6c8640f1ee23eb6
X-Git-Newrev: ccf1ee9789b74ff9bd4f0c196eeabbb2e4e5b0d2
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.D170285B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sscep: fix empty line at end of
 Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccf1ee9789b74ff9bd4f0c196eeabbb2e4e5b0d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes check-package warning:

package/sscep/Config.in:9: empty line at end of file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sscep/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 8907578062..4b9039c9b2 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -6,4 +6,3 @@ config BR2_PACKAGE_SSCEP
 	  (Cisco System's Simple Certificate Enrollment Protocol).
 
 	  https://github.com/certnanny/sscep
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
