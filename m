Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638CDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D6A84113E;
	Thu, 29 Sep 2022 21:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6A84113E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXJRipU2rfck; Thu, 29 Sep 2022 21:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3593B410D5;
	Thu, 29 Sep 2022 21:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3593B410D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDBF1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BECF140018
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BECF140018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkNQjxlTXeV8 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CB9410DA
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CB9410DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D91CF86617; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:40:44 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 5045f1bc5157d897f85d9536ee1414c6964da578
X-Git-Newrev: 71d77cda325780c1b95cb27601400587eb35ea67
X-Patchwork-Hint: ignore
Message-Id: <20220929212136.D91CF86617@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/uacme: bump
 version to 1.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=71d77cda325780c1b95cb27601400587eb35ea67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de34ba06c568e06f95f5d4c4ee1b673669c95b68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 4ae85c1c5c..f62463029a 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  36027a587256cbaa86650cec2a5b3eb000480e1150bd83941565661b392625ac  uacme-1.7.1.tar.gz
+sha256  e7598e794f5ec414d993c4f2f7df39e7c72f26e41302b875ddaf040d8103ec5f  uacme-1.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 84e0105762..2482259411 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.1
+UACME_VERSION = 1.7.2
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
