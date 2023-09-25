Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C3CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B02C81501;
	Mon, 25 Sep 2023 14:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B02C81501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMEsaOiLXNeL; Mon, 25 Sep 2023 14:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E48882011;
	Mon, 25 Sep 2023 14:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E48882011
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE201BF5B4
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05B21611DF
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B21611DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5NzDGD0Fzot for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCEA161188
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCEA161188
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB3C187723; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 15:59:23 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4bec4ef23ff94e864550234af66de39e495a0cae
X-Git-Newrev: 20ffaad8b6ad7e961b33bae0e4124049b82adef8
X-Patchwork-Hint: ignore
Message-Id: <20230925140304.BB3C187723@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/expect: update
 Kconfig package URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ffaad8b6ad7e961b33bae0e4124049b82adef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The old expect homepage URL [1] is now redirecting to [2]. This commit
updates the URL to the new one.

[1] http://expect.sourceforge.net/
[2] https://core.tcl.tk/expect/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 579896c2f240c927767b68979b12bf4747199a16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expect/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expect/Config.in b/package/expect/Config.in
index 5557f4aee6..67dfe643b2 100644
--- a/package/expect/Config.in
+++ b/package/expect/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_EXPECT
 	  Expect is a tool for automating interactive applications
 	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
 
-	  http://expect.sourceforge.net/
+	  https://core.tcl.tk/expect/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
