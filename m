Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B3EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07AEE40414;
	Wed,  2 Feb 2022 10:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhmrGEUlbl6u; Wed,  2 Feb 2022 10:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CD340447;
	Wed,  2 Feb 2022 10:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1981E1BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B188831F1
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id td8hbQM8tAzr for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEF6E83365
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AC32A822ED; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:19:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fae4cddea023b008b59f99986f8aaef9d1cb562
X-Git-Newrev: ecee383549b66787cb857f02a89717e004b951bb
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.AC32A822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.29.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecee383549b66787cb857f02a89717e004b951bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 1f9b546c23..df0bdf980d 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  4a894b3cd108432f7636849b4026b771  fonttools-4.28.5.zip
-sha256  545c05d0f7903a863c2020e07b8f0a57517f2c40d940bded77076397872d14ca  fonttools-4.28.5.zip
+md5  7fc490291991da874911fed1e743362d  fonttools-4.29.1.zip
+sha256  2b18a172120e32128a80efee04cff487d5d140fe7d817deb648b2eee023a40e4  fonttools-4.29.1.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c5c605161b..d5c4cdf8e5 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.28.5
+PYTHON_FONTTOOLS_VERSION = 4.29.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/ce/1b/d4cd86f4e6cbd54a3c4f807015b116299bcd6d6587ea0645d88ba9d932bb
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/2d/4c/49ba863863502bb9fea19d8bd04a527da336b4a2698c8a0c7129e9cc2716
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
