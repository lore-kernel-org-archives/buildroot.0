Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841CD8146C;
	Sun, 30 Oct 2022 18:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841CD8146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mB9Fla_jdbvx; Sun, 30 Oct 2022 18:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE49081465;
	Sun, 30 Oct 2022 18:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE49081465
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CADE1BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8787403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8787403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aD3y22sf413l for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:22:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EDF440018
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EDF440018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89B45875B1; Sun, 30 Oct 2022 18:22:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 19:21:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5d8582e37b8b7440a71d4cad68e85bebc4aec6c
X-Git-Newrev: d7619682552dd34f499e9f17b0234af53da743ec
X-Patchwork-Hint: ignore
Message-Id: <20221030182257.89B45875B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bdwgc: bump to version 8.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7619682552dd34f499e9f17b0234af53da743ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license in file README.QUICK remains unchanged, but for the
copyright years, some C++ instructions changes, iand a few small
typos/fixes.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[yann.morin.1998@free.fr: mention copyright years change]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bdwgc/bdwgc.hash | 4 ++--
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 4276939083..917089da08 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
-sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
+sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
+sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index cefa975998..e776fb7458 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.0.6
+BDWGC_VERSION = 8.2.2
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
