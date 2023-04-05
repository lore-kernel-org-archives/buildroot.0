Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36519C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C8F6144C;
	Wed,  5 Apr 2023 20:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C8F6144C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwYroebcvgTV; Wed,  5 Apr 2023 20:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0442861448;
	Wed,  5 Apr 2023 20:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0442861448
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38AC81C2BD0
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5870A613B8
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5870A613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDc8FfOrwjH5 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3541061425
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3541061425
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22E7683949; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 835d7780310fa94a036c93e85ae26923356ad586
X-Git-Newrev: 402e06a02f8a4c97c621eac827a56118423337f7
X-Patchwork-Hint: ignore
Message-Id: <20230405203540.22E7683949@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openpowerlink: bump to version
 2.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=402e06a02f8a4c97c621eac827a56118423337f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/blob/V2.7.2/revision.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpowerlink/openpowerlink.hash | 8 ++++----
 package/openpowerlink/openpowerlink.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 2d8683f09c..b6ae8edcd8 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.1/
-md5  04524d1b1f9946176dce0ccb0eecf537  openPOWERLINK_V2.7.1.tar.gz
-sha1  4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd  openPOWERLINK_V2.7.1.tar.gz
+# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.2/
+md5  80a64b0a2c2dec1e7aff22a06000b3d6  openPOWERLINK_V2.7.2.tar.gz
+sha1  09dcb5bd7cb9d59cb9e60230ae09c558996be25b  openPOWERLINK_V2.7.2.tar.gz
 # sha256 locally computed
-sha256  d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd  openPOWERLINK_V2.7.1.tar.gz
+sha256  2cc660e0f8a939bd65c9f46176d18882dbe1017cbb2567b414a8a7c9af41a356  openPOWERLINK_V2.7.2.tar.gz
 sha256  348e31e9e5094104463d58d33abd31049fdf209afbc12ea7abb7fd4b4a147429  license.md
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 46dc3d10cd..c8dbb66d05 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = 2.7.1
+OPENPOWERLINK_VERSION = 2.7.2
 OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_V$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
