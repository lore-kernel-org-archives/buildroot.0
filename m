Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123F5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A875E405B1;
	Tue, 28 Dec 2021 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qbyhtog69-OD; Tue, 28 Dec 2021 22:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF3B7405AE;
	Tue, 28 Dec 2021 22:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 743571BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620A84088E
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gqsa8qcM2l-1 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:00:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C112D4088A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9220A82AFE; Tue, 28 Dec 2021 21:54:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c14af6676b0bca165af17e71e5c1c4ef2a3cb93
X-Git-Newrev: 1ff5f838f056b4b4889ae0fc241ded46f54250b2
X-Patchwork-Hint: ignore
Message-Id: <20211228215437.9220A82AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: bump to version 3.1.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ff5f838f056b4b4889ae0fc241ded46f54250b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/snort3/snort3/blob/3.1.18.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index c31e258ef2..0ba4505a83 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4f7852898eaac48a7cfaff61c79a3c3a5a86a54db9d2a7d5b758297bf52f1f12  snort3-3.1.6.0.tar.gz
+sha256  6e45c16b1815d832b5d6edcd2b705e7838e25c76bfd54b3e86c55ecba6de420a  snort3-3.1.18.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 7495ab9b0f..6f15ce3c92 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.6.0
+SNORT3_VERSION = 3.1.18.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
