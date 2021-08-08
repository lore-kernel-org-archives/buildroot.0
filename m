Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8118FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEC460FF2
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EEC460FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0978840261;
	Sun,  8 Aug 2021 09:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKmwJZ6I8JUi; Sun,  8 Aug 2021 09:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BBCB40200;
	Sun,  8 Aug 2021 09:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D21E21BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAD6682C2E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBkyLM-f6GAF for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1023E82D0C
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF0278D215; Sun,  8 Aug 2021 09:54:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:52:55 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 158a411fdaa95fa9eb1acfa5e2420993d69761aa
X-Git-Newrev: ef695ddfac08299a20e8818263e81c49fc544c63
X-Patchwork-Hint: ignore
Message-Id: <20210808095453.BF0278D215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Giulio
 Benetti to libfuse3 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef695ddfac08299a20e8818263e81c49fc544c63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add myself as libfuse3 package maintainer.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 344101ddb1d4531f7d41e4e1206b581804b86bb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24d50a4078..3b18c56837 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1024,6 +1024,7 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
