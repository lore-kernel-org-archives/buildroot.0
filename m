Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427B5C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:39:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77D260FC3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D77D260FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A215A400DE;
	Wed,  4 Aug 2021 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3URm_7c9J8gD; Wed,  4 Aug 2021 14:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDCD40642;
	Wed,  4 Aug 2021 14:39:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7D01BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C35E60620
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iXFDZnQFrDq for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:39:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F82360606
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:39:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27ED28B563; Wed,  4 Aug 2021 14:39:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:36:01 +0200
Subject: [git commit branch/2021.02.x] DEVELOPERS: update email address for Raphaël Mélotte
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ce1eb3f9070d0ed0a6b58fa10eef239e5cedf099
X-Git-Newrev: 472a3ffe4aa756b1e9fc59043dbf68faa0638834
X-Patchwork-Hint: ignore
Message-Id: <20210804143911.27ED28B563@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0504539802690406651=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0504539802690406651==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=472a3ffe4aa756b1e9fc59043dbf68faa0638834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fade40dfc36a2ca604f12add79013b047eae59fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 332bc7437a..522dde4b3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2207,7 +2207,7 @@ F:	package/nanomsg/
 N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
-N:	Raphaël Mélotte <raphael.melotte@essensium.com>
+N:	Raphaël Mélotte <raphael.melotte@mind.be>
 F:	package/jbig2dec/
 F:	package/python-boto3/
 F:	package/python-botocore/

--===============0504539802690406651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0504539802690406651==--
