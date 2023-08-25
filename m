Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DBEC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA6F417BF;
	Fri, 25 Aug 2023 14:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA6F417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_yhBS90ilXj; Fri, 25 Aug 2023 14:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E22B94019E;
	Fri, 25 Aug 2023 14:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E22B94019E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C25921BF357
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C9564019E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 14:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9564019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znyNq-0N4sjb for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 14:50:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD4840025
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 14:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD4840025
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD79C8632F; Fri, 25 Aug 2023 14:50:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 16:39:25 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5bf4f3e5169c0eaed0593edd4f5bf2495c3ed5f6
X-Git-Newrev: 6989c715643793b7a65b80449d4b58bbc9584c4f
X-Patchwork-Hint: ignore
Message-Id: <20230825145054.BD79C8632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/cryptodev-linux:
 bump version to 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=6989c715643793b7a65b80449d4b58bbc9584c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Changelog:
https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS
"* Fix compilation issues against Linux kernel 6.3"

Fixes:
http://autobuild.buildroot.net/results/9b9/9b9ad744d8a37fc46726461551a2dcb3c26a1341/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 947cf4125e87eaa193de37d3a3fc5fcb885ad531)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d649e8934a..300aa3bcd4 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938  cryptodev-linux-1.12.tar.gz
+sha256  33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5  cryptodev-linux-1.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index d0c3bc5218..4704a75bee 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.12
+CRYPTODEV_LINUX_VERSION = 1.13
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
