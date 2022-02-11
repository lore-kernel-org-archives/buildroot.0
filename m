Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 09:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7133A830A7;
	Fri, 11 Feb 2022 09:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtiyFT9PpGAt; Fri, 11 Feb 2022 09:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD85B82FE4;
	Fri, 11 Feb 2022 09:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B35881BF3CE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 09:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B056261C19
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 09:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKnortghEGOG for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 09:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A33CE61C16
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 09:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5189482DDC; Fri, 11 Feb 2022 09:03:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 10:10:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 362b2822eea66b0775d9eba94d22c85939d2c8c9
X-Git-Newrev: a3529b8020a8c8b61d9eadc455f38ce892a7c6f3
X-Patchwork-Hint: ignore
Message-Id: <20220211090341.5189482DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-generic:
 remove useless carriage return
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3529b8020a8c8b61d9eadc455f38ce892a7c6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8723da214a..fbe37f9ca9 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -316,8 +316,7 @@ not and can not work as people would expect it should:
      13:45+01" see "man cvs" for further details).
   ** +git+ for retrieving source code from a Git repository. Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
-     source code is cached as with the +svn+
-     method.
+     source code is cached as with the +svn+ method.
   ** +hg+ for retrieving source code from a Mercurial repository. One
      'must' specify +LIBFOO_SITE_METHOD=hg+ when +LIBFOO_SITE+
      contains a Mercurial repository URL. The downloaded source code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
