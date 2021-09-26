Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4186AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097E760F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 097E760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E8740300;
	Sun, 26 Sep 2021 21:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQUGzGEF9ALA; Sun, 26 Sep 2021 21:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB31B40361;
	Sun, 26 Sep 2021 21:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27E341BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F094402F2
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfDGYwwpXG17 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1746140300
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 937D58D2B3; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:16:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 659ea506090b2f8149075e5ac5e61f529b34966a
X-Git-Newrev: d1677b8e96337d66f63cb77bcfbc7c5824a67bd6
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.937D58D2B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiozipkin: bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1677b8e96337d66f63cb77bcfbc7c5824a67bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to linebreak removal:
https://github.com/aio-libs/aiozipkin/commit/5712878b214d87a2c9b5e95bed30d309b5ea099f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aiozipkin/python-aiozipkin.hash | 6 +++---
 package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
index af07285c23..356d83786f 100644
--- a/package/python-aiozipkin/python-aiozipkin.hash
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
-md5  7be9acaa48d4d4dc14abcc79edfd6c16  aiozipkin-0.7.1.tar.gz
-sha256  aa99984832225378d900a5cd0d4e8e89af7ec9f359612c2e311f55b9039ed501  aiozipkin-0.7.1.tar.gz
+md5  0e98374ea561e4e4e589ffabc0ba6471  aiozipkin-1.1.0.tar.gz
+sha256  bf46a065f87ba51eeb49fed756e285c7faa560f89e0c7ad4bc891d5ae4b5364d  aiozipkin-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index e351dbacfe..37812f2752 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOZIPKIN_VERSION = 0.7.1
+PYTHON_AIOZIPKIN_VERSION = 1.1.0
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/9e/33/120925f90470b7f52f46e2b9f71caf2514e389f42b3ed3b62f6389baee95
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/0a/46/5f328fb8163163f0d4401a1c07585cdf567e56305cb12ce54c9bb62e3f74
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
