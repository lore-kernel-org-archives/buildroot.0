Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B37C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3434540AD9;
	Mon,  1 Jan 2024 21:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3434540AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijCZWlWk9OuL; Mon,  1 Jan 2024 21:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5941408DA;
	Mon,  1 Jan 2024 21:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5941408DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129241BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FE50813DF
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE50813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KimDtT6c3ucX for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:08:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41F51835D3
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F51835D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 148EF83B1E; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:05:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53630c2026fa8540bdee64ebf39352171adb5c77
X-Git-Newrev: 5328e02cf78a055fdfa81384780bd43771f34a06
X-Patchwork-Hint: ignore
Message-Id: <20240101210633.148EF83B1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: bump to version 3.9.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5328e02cf78a055fdfa81384780bd43771f34a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/thom311/libnl/compare/libnl3_7_0...libnl3_9_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 8a1bd56780..77d7781493 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz.sha256sum
-sha256  9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939  libnl-3.7.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz.sha256sum
+sha256  aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb  libnl-3.9.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6896188f4d..8fbea3db5f 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.7.0
+LIBNL_VERSION = 3.9.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
