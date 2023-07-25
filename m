Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99480C41513
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48054418F3;
	Tue, 25 Jul 2023 21:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48054418F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRYZwEOV5CmP; Tue, 25 Jul 2023 21:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3E041902;
	Tue, 25 Jul 2023 21:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3E041902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECE71BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 737CB8202B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737CB8202B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQl4Y5077j_d for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E22B8208B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E22B8208B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C6668349E; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73cfad4ed9881f66ab388b20aab91bc5cd2a4d6c
X-Git-Newrev: 4b285598e8287033e3b751e174523000d52a8ad0
X-Patchwork-Hint: ignore
Message-Id: <20230725211501.7C6668349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libatomic_ops: bump to version
 7.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b285598e8287033e3b751e174523000d52a8ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libatomic_ops/libatomic_ops.hash | 4 ++--
 package/libatomic_ops/libatomic_ops.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 32a0795a5a..c6de93fb4a 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b4b0072bdb6780e2331db4fadba7e423fde25c71b1f0eb04859cc1eba59c2c2c  libatomic_ops-7.6.14.tar.gz
-sha256  636c2bf07975765ab9aff17f7c9b6beb9540378f45b5a1b21691d14ea804f0ff  doc/LICENSING.txt
+sha256  68c5970b11297056c8e5c63a73f26621a8eb8c667a5fe9a2b3e3ff6c0fbb3177  libatomic_ops-7.8.0.tar.gz
+sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 1b34d3b788..0c72b1725e 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.14
+LIBATOMIC_OPS_VERSION = 7.8.0
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
@@ -15,7 +15,7 @@ LIBATOMIC_OPS_AUTORECONF = YES
 # by the GNU General Public License. These are put into a separate
 # library, libatomic_ops_gpl.a."
 LIBATOMIC_OPS_LICENSE = MIT (main library) / GPL-2.0+ (gpl extension)
-LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
+LIBATOMIC_OPS_LICENSE_FILES = COPYING LICENSE
 LIBATOMIC_OPS_CPE_ID_VENDOR = libatomic_ops_project
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
