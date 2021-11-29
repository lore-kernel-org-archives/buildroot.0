Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5602C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2CAE40461;
	Mon, 29 Nov 2021 21:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nrCKerGKcFh; Mon, 29 Nov 2021 21:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1DC5405E0;
	Mon, 29 Nov 2021 21:36:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC0321BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D8B40461
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rlf786_1a6g7 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B1A405AE
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7AD599126E; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:34:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 225a43f01da927c15a4f45a1ba7c62ad17724cbe
X-Git-Newrev: 8669ddda6298d75b86d34be871ae76edef5eeb62
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.7AD599126E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=8669ddda6298d75b86d34be871ae76edef5eeb62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
a3883964a3468a226fffe01f69a361621a3819a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/resiprocate/resiprocate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index b31712b41b..58b942465c 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RESIPROCATE_VERSION = 1.12.0
-RESIPROCATE_SITE =  https://www.resiprocate.org/files/pub/reSIProcate/releases
+RESIPROCATE_SITE = https://www.resiprocate.org/files/pub/reSIProcate/releases
 # For complete details see https://www.resiprocate.org/License
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
