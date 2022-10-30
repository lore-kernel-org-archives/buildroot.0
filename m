Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C15FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C16140399;
	Sun, 30 Oct 2022 11:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C16140399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kPoz1EMU8pc; Sun, 30 Oct 2022 11:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D18402F7;
	Sun, 30 Oct 2022 11:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D18402F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E03C31BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA544035D
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA544035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMUTYisXRfrB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C46DC40357
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46DC40357
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C000887470; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90d8ca33ef27b3b47999aa0c2c5a499afe362752
X-Git-Newrev: 94c6ba6c7085cece40619a2cab2d93dc54b2a412
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.C000887470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: bump to version 3.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=94c6ba6c7085cece40619a2cab2d93dc54b2a412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/thom311/libnl/compare/libnl3_6_0...libnl3_7_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index a0f1388528..8a1bd56780 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz.sha256sum
-sha256  532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009  libnl-3.6.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz.sha256sum
+sha256  9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939  libnl-3.7.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index d3bd185093..6896188f4d 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.6.0
+LIBNL_VERSION = 3.7.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
