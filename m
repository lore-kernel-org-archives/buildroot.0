Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB59FC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADEB611B0
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AADEB611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8499D83C02;
	Fri,  6 Aug 2021 21:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7VEiHdBon4i; Fri,  6 Aug 2021 21:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D313183C01;
	Fri,  6 Aug 2021 21:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11EE01BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B37534055E
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFUdN_xwkw6w for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A04240470
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CA12688212; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:39:02 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: e5c5675b11aff7dfc11c39bb3ee3dace7bb10118
X-Git-Newrev: 65877d94831e3bd1389bf593f9518c4aa7a8386f
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.CA12688212@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 docs/manual/resources.txt: add link to lore.kernel.org
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

commit: https://git.buildroot.net/buildroot/commit/?id=65877d94831e3bd1389bf593f9518c4aa7a8386f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e789e96bb869b7b1e3e54a262399848214c6313)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/resources.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index 374cdef94e..e621b6b069 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -21,11 +21,9 @@ http://lists.buildroot.org/mailman/listinfo/buildroot[mailing list info
 page].
 +
 Mails that are sent to the mailing list are also available in the
-http://lists.buildroot.org/pipermail/buildroot[mailing list archives] and
-via http://gmane.org[Gmane], at
-http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[+gmane.comp.lib.uclibc.buildroot+].
-Please search the mailing list archives before asking questions, since
-there is a good chance someone else has asked the same question before.
+mailing list archives, available through
+http://lists.buildroot.org/pipermail/buildroot[Mailman] or at
+https://lore.kernel.org/buildroot/[lore.kernel.org].
 
 IRC::
 +
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
