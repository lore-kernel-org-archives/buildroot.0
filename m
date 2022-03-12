Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2451C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717638247F;
	Sat, 12 Mar 2022 17:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJzi3wSSem2X; Sat, 12 Mar 2022 17:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE7F82456;
	Sat, 12 Mar 2022 17:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4231BF966
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E8F84023D
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C217WHi_biVb for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D17C40488
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 75CB682AA4; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90a3e71cd2b10ec254ff7e5c9a01342c9d53730d
X-Git-Newrev: 07b070be39f9c51592c85fb76cd7af00539abc19
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.75CB682AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 9.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=07b070be39f9c51592c85fb76cd7af00539abc19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index f3ca8e6014..88a5d7cada 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  c5af6e413d2fe9247cf16ce25c816b14  Pillow-9.0.0.tar.gz
-sha256  ee6e2963e92762923956fe5d3479b1fdc3b76c83f290aad131a2f98c3df0593e  Pillow-9.0.0.tar.gz
+md5  8deffccb4f402df154fd2fd504d8487c  Pillow-9.0.1.tar.gz
+sha256  6c8bc8238a7dfdaf7a75f5ec5a663f4173f8c367e5a39f87e720495e1eed75fa  Pillow-9.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2f2e817882..901876e0ee 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/b0/43/3e286c93b9fa20e233d53532cc419b5aad8a468d91065dbef4c846058834
+PYTHON_PILLOW_VERSION = 9.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/03/a3/f61a9a7ff7969cdef2a6e0383a346eb327495d20d25a2de5a088dbb543a6
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
