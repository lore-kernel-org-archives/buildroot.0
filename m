Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E416C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87A760AA3;
	Sun, 27 Feb 2022 17:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPH5JOSMAPEr; Sun, 27 Feb 2022 17:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E832360ABE;
	Sun, 27 Feb 2022 17:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 914821BF97C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8069F40898
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ghr7zIpRS-G for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:41:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B853640895
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:41:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 78B7C83235; Sun, 27 Feb 2022 17:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:37:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b7ed73bcda079346fb1858d4f8e8e5c193b5d517
X-Git-Newrev: b52ed0eaf493393d1646756f5b1ace27c18f9df6
X-Patchwork-Hint: ignore
Message-Id: <20220227173324.78B7C83235@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 docs/manual/adding-packages-generic: remove useless carriage return
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

commit: https://git.buildroot.net/buildroot/commit/?id=b52ed0eaf493393d1646756f5b1ace27c18f9df6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a3529b8020a8c8b61d9eadc455f38ce892a7c6f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 2201d4385e..0ae401de98 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -314,8 +314,7 @@ not and can not work as people would expect it should:
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
