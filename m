Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B4460C2D;
	Wed,  9 Mar 2022 22:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWhVVGI-vlSA; Wed,  9 Mar 2022 22:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7576C60FB4;
	Wed,  9 Mar 2022 22:40:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72E701BF4E7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 697544171C
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X41YVWLV_oTW for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:40:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A1B416D7
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41A2783A8D; Wed,  9 Mar 2022 22:31:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 23:39:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11a3989dbf7ac2535fac04b24ab3d959da3686b3
X-Git-Newrev: 5030d7f4ea5004b24025eb93d421ddadb0f8ee06
X-Patchwork-Hint: ignore
Message-Id: <20220309223137.41A2783A8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pdbg: bump version to v3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=5030d7f4ea5004b24025eb93d421ddadb0f8ee06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pdbg/pdbg.hash | 4 ++--
 package/pdbg/pdbg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index df7ba314bf..f859930dd6 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5b721fd5551591cd5626ccf72c8d9096d902de4da10324097a37b4763815f0d7 pdbg-3.4.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
+sha256  7bdbab4e14b8cf50dbf6242955e46e58882c37b1a52671d9e6f3073885629dfa  pdbg-3.5.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 5a5cfbc62d..871bf953f2 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.4
+PDBG_VERSION = 3.5
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
