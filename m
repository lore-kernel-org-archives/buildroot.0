Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DC0C4320A
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691DD61186
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 691DD61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404DB60B50;
	Fri,  6 Aug 2021 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkMTO0P5Y3iA; Fri,  6 Aug 2021 21:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CA460B08;
	Fri,  6 Aug 2021 21:07:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1F21BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA50F40551
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlmGNVemywlE for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73F53402D5
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C188786DE4; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:37:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7458efcaa144c15315e8ac62ab8b6261863a3763
X-Git-Newrev: e5c5675b11aff7dfc11c39bb3ee3dace7bb10118
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.C188786DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/cwiid: update url
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e5c5675b11aff7dfc11c39bb3ee3dace7bb10118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The project URL is 404. Link to github instead.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1431dbf9b6dd92a350b1eb59d04bc2d519b1c24a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cwiid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 9dab5d1070..374a91ffd6 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CWIID
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
 
-	  http://abstrakraft.org/cwiid/
+	  https://github.com/abstrakraft/cwiid
 
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
