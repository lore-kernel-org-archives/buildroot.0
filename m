Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEB4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6C860EB4
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E6C860EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FF5402A5;
	Sun, 26 Sep 2021 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGToApIswfpA; Sun, 26 Sep 2021 20:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F028D40347;
	Sun, 26 Sep 2021 20:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94B871BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DF4401AE
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSAZeQSMFphH for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:05:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8378340109
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0F7F18D2A9; Sun, 26 Sep 2021 20:02:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:56:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f5f9618d86adc3aa021680f87c842926bebe3af
X-Git-Newrev: 109ea1a4a2f9154c5d9502ba814a09e1e1bbd9f5
X-Patchwork-Hint: ignore
Message-Id: <20210926200256.0F7F18D2A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beautifulsoup4: bump to
 version 4.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=109ea1a4a2f9154c5d9502ba814a09e1e1bbd9f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, use two spaces for hash file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 6 +++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 8b8c51de4f..665c142d53 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5	be03d778cf61cf6734a480e2010d6657  beautifulsoup4-4.8.1.tar.gz
-sha256	6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09789931  beautifulsoup4-4.8.1.tar.gz
+md5  e754242642253dd31d249d00358d552e  beautifulsoup4-4.10.0.tar.gz
+sha256  c23ad23c521d818955a4151a67d81580319d4bf548d3d49f4223ae041ff98891  beautifulsoup4-4.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
+sha256  a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 6364a36677..f729d1051a 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.8.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.10.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/86/cd/495c68f0536dcd25f016e006731ba7be72e072280305ec52590012c1e6f2
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/a1/69/daeee6d8f22c997e522cdbeb59641c4d31ab120aba0f2c799500f7456b7e
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
