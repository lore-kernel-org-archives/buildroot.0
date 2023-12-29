Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A0DC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EEBB436B0;
	Fri, 29 Dec 2023 21:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EEBB436B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oX3yNNx16wyO; Fri, 29 Dec 2023 21:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF8CA436AA;
	Fri, 29 Dec 2023 21:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF8CA436AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19CE51BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD4143543
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD4143543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ti2nr1S8xDmM for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778384369D
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778384369D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 756DA83912; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:14:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 885cda7e0d67eff56bf803e85185f9f86f02120f
X-Git-Newrev: 397bb854299c3548d83e5ff53d6c8d3fddc7331c
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.756DA83912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/empty: bump to version 0.6.23c
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

commit: https://git.buildroot.net/buildroot/commit/?id=397bb854299c3548d83e5ff53d6c8d3fddc7331c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYRIGHT (update in year with
https://sourceforge.net/p/empty/code/ci/203ac90eaf90c01bc210697b8dcef7836d27b802/)

https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index cc74254a7a..5c7daa0052 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f581d560e1fa857f5304586e3c2107b5838bcf11dedcccec4a7191fa9e261b69  empty-0.6.22b.tgz
-sha256  db6b65f5eaf782a92715887ac107f3477d64016301a66194a92312b13ff89be1  COPYRIGHT
+sha256  8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd  empty-0.6.23c.tgz
+sha256  6433f4490a82b80ddac37f24cebfe8f3cd7de5686ebb9737281d47997a9941d6  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 91d9476445..24135b2f8d 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.22b
+EMPTY_VERSION = 0.6.23c
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
