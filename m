Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70002ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C13784141;
	Sat, 17 Sep 2022 18:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C13784141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xt8d7fLSfxwp; Sat, 17 Sep 2022 18:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F477840DE;
	Sat, 17 Sep 2022 18:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F477840DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF5BD1BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB42B840DE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB42B840DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUfc4TSrDLPd for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE87F840B3
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE87F840B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEDF184611; Sat, 17 Sep 2022 18:54:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:30:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a5389f579de7938f74babd18edd80a272e65d3a
X-Git-Newrev: a8879b592311a2b1f4c67e74e95ff9e24b3fbc6b
X-Patchwork-Hint: ignore
Message-Id: <20220917185415.DEDF184611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: bump to version 2.9.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8879b592311a2b1f4c67e74e95ff9e24b3fbc6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.snort.org/downloads/snort/release_notes_2.9.20.txt

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index ac098564aa..a807d051d9 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  b0350425e0c1e9c044c25aa13b47edf8  snort-2.9.19.tar.gz
+md5  b52cdf14e97ef953c800c3ef123beaa5  snort-2.9.20.tar.gz
 
 # Locally computed:
-sha256  b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7  snort-2.9.19.tar.gz
+sha256  29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84b4981c  snort-2.9.20.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 41f450541f..8ce8ed5fa6 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.19
+SNORT_VERSION = 2.9.20
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
