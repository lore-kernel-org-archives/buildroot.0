Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4444C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922E8611B0
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 922E8611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 603E960B5B;
	Fri,  6 Aug 2021 21:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvH8DOpBzzW6; Fri,  6 Aug 2021 21:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20E060B58;
	Fri,  6 Aug 2021 21:06:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07B0A1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA60402C6
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNDYKGcVwVil for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DB4D40558
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D415A8C701; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:39:04 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 65877d94831e3bd1389bf593f9518c4aa7a8386f
X-Git-Newrev: 9c286c9a8fe62af7efb3474604e5ace70b7622ac
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.D415A8C701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 docs/manual/resources.txt: change pastebin site URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c286c9a8fe62af7efb3474604e5ace70b7622ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

code.bulix.org no longer exists, suggest paste.ack.tf instead, as an
example.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a954d441218daa6bbafb74d30539e6b14f193b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/resources.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index e621b6b069..e90a49b2ab 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -32,7 +32,7 @@ hosted on https://www.oftc.net/WebChat/[OFTC]. It is a useful place to
 ask quick questions or discuss on certain topics.
 +
 When asking for help on IRC, share relevant logs or pieces of code
-using a code sharing website, such as http://code.bulix.org.
+using a code sharing website, such as https://paste.ack.tf/.
 +
 Note that for certain questions, posting to the mailing list may be
 better as it will reach more people, both developers and users.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
