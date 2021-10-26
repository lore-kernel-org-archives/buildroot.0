Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5737760F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5737760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28D98403F9;
	Tue, 26 Oct 2021 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb7Wx09f9gJx; Tue, 26 Oct 2021 19:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C94540130;
	Tue, 26 Oct 2021 19:39:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2150E1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74C540560
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q39OV5TRTo0m for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 130DB40548
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2928688F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0f5c90244cf4b6feed603821b45f25a54cf3f12
X-Git-Newrev: 95706cefe5a59642fa682158f74a5671242c5273
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.2928688F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiozipkin: bump to version
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=95706cefe5a59642fa682158f74a5671242c5273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aiozipkin/python-aiozipkin.hash | 4 ++--
 package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
index 356d83786f..d1563b20bc 100644
--- a/package/python-aiozipkin/python-aiozipkin.hash
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
-md5  0e98374ea561e4e4e589ffabc0ba6471  aiozipkin-1.1.0.tar.gz
-sha256  bf46a065f87ba51eeb49fed756e285c7faa560f89e0c7ad4bc891d5ae4b5364d  aiozipkin-1.1.0.tar.gz
+md5  0fea8a200ab2a94fe9a2340a8cbf8512  aiozipkin-1.1.1.tar.gz
+sha256  9b82619d9ef309e72627a81ab3fda0c9b83e530844cf59f2e9a011e9a2a1293f  aiozipkin-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index 37812f2752..06ea9ef1a4 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOZIPKIN_VERSION = 1.1.0
+PYTHON_AIOZIPKIN_VERSION = 1.1.1
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/0a/46/5f328fb8163163f0d4401a1c07585cdf567e56305cb12ce54c9bb62e3f74
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/f2/fe/26a60a7c9e91c968eac5dacab2948ed931a676880a6878695ff281c72b8f
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
