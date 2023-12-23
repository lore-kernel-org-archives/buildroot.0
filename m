Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B30C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7B28219E;
	Sat, 23 Dec 2023 20:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7B28219E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BK-SiJNuViDg; Sat, 23 Dec 2023 20:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2B782195;
	Sat, 23 Dec 2023 20:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB2B782195
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 040921BF388
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D17B6417FB
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D17B6417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsF8TMImTgYU for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:11:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C95E40591
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C95E40591
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECEBF823A2; Sat, 23 Dec 2023 20:11:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:10:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33153b0ac965371bd79d4b1aa53b31fb05d5edaa
X-Git-Newrev: 216e4491357ead1711e8021335491439a316af40
X-Patchwork-Hint: ignore
Message-Id: <20231223201129.ECEBF823A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl: bump version to 2023.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=216e4491357ead1711e8021335491439a316af40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/onevpl/onevpl.hash | 2 +-
 package/onevpl/onevpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl/onevpl.hash b/package/onevpl/onevpl.hash
index c9ca1e6c04..328fa94487 100644
--- a/package/onevpl/onevpl.hash
+++ b/package/onevpl/onevpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5  onevpl-2023.3.1.tar.gz
+sha256  978398c7bb1665a6ad7a1a15cc57dc0204608e56c88436e376b717320a9e63fd  onevpl-2023.4.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
index 601e121a55..1a580d0636 100644
--- a/package/onevpl/onevpl.mk
+++ b/package/onevpl/onevpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_VERSION = 2023.3.1
+ONEVPL_VERSION = 2023.4.0
 ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
 ONEVPL_LICENSE = MIT
 ONEVPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
