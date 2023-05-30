Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF37BC77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6070D4173C;
	Tue, 30 May 2023 19:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6070D4173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elucxmSEUqvt; Tue, 30 May 2023 19:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD9141726;
	Tue, 30 May 2023 19:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD9141726
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBFB1BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7577381EB5
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7577381EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41AlUnDy9bAY for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF8881E99
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF8881E99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D66586A93; Tue, 30 May 2023 19:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:27:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 23ac9f2a6e121eae576b9adbb565aafb1a1d3966
X-Git-Newrev: 2317c7775b5237559e907fee28dc4b3bc253e8ee
X-Patchwork-Hint: ignore
Message-Id: <20230530194424.7D66586A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/atkmm: bump to
 version 2.36.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2317c7775b5237559e907fee28dc4b3bc253e8ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6d7e5e2b63d138ac902e21644256d9fcbae686ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 9e2bb2830c..08cf86b3df 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
-sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.2.sha256sum
+sha256  6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079  atkmm-2.36.2.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 7ceb87b047..8afd058643 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM_VERSION_MAJOR = 2.36
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
