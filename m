Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CA7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D74A60EC0
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D74A60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F523403F7;
	Sun,  8 Aug 2021 09:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cosfKbSGTU88; Sun,  8 Aug 2021 09:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD37D4028F;
	Sun,  8 Aug 2021 09:55:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11F4E1BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 090F040389
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jP5sP874eh3 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28A7C40275
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6F2B83604; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:52:48 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 284cc0f838da859d1bd281690653e5354446bac0
X-Git-Newrev: c09c9e0ff71cbeae1159145c20c2e8d569a5ec03
X-Patchwork-Hint: ignore
Message-Id: <20210808095442.D6F2B83604@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: add Giulio
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

commit: https://git.buildroot.net/buildroot/commit/?id=c09c9e0ff71cbeae1159145c20c2e8d569a5ec03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Add myself as libfuse3 package maintainer.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 344101ddb1d4531f7d41e4e1206b581804b86bb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b84015216e..42b5becb7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1033,6 +1033,7 @@ F:	package/xapian/
 
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
