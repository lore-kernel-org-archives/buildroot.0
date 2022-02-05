Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B744016D;
	Sat,  5 Feb 2022 23:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrtT6DJtauzy; Sat,  5 Feb 2022 23:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C62E14010E;
	Sat,  5 Feb 2022 23:00:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFF31BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAEE860806
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNyHh627c5bu for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:00:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D3BE6079D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F03B482A80; Sat,  5 Feb 2022 22:53:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:59:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85af8e22c62dc9e378f27c59dc388c8d7394a91f
X-Git-Newrev: 3b0d174166dbc68a3c688da63eb9684390981895
X-Patchwork-Hint: ignore
Message-Id: <20220205225308.F03B482A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: update spacing in
 hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b0d174166dbc68a3c688da63eb9684390981895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sha1 was using just 1 space.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ltp-testsuite/ltp-testsuite.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index bd648cbfdd..53429fd59f 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/linux-test-project/ltp/releases/download/20220121/ltp-full-20220121.tar.xz.sha1
-sha1 211935e901afea1010ec4f70369b782fbee93ed4  ltp-full-20220121.tar.xz
+sha1  211935e901afea1010ec4f70369b782fbee93ed4  ltp-full-20220121.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  ad002520616fac52362229ea0f1bb9d304fc03ff0096ccb5b1820cee9fc8413a  ltp-full-20220121.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
