Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86763C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406814095A;
	Mon,  6 Nov 2023 22:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406814095A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ES8IPtMqZEi; Mon,  6 Nov 2023 22:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B2F840E46;
	Mon,  6 Nov 2023 22:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2F840E46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4A671BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8884813E3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8884813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBJgKHAihXN9 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE43180C53
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE43180C53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC1AD86B77; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:12:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43d1d468b778052908a4d6caaa467c02aa3fdf17
X-Git-Newrev: be5d04e91a6681f4d6d2460bf3321c57d163cdff
X-Patchwork-Hint: ignore
Message-Id: <20231106222016.DC1AD86B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssutils: bump to version
 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=be5d04e91a6681f4d6d2460bf3321c57d163cdff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index cb989131a3..d93135a989 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  b01ea364e79eada181c3ae46d69249af  cssutils-2.6.0.tar.gz
-sha256  f7dcd23c1cec909fdf3630de346e1413b7b2555936dec14ba2ebb9913bf0818e  cssutils-2.6.0.tar.gz
+md5  11707e5da7c40bd98e5b4998489f10e0  cssutils-2.9.0.tar.gz
+sha256  89477b3d17d790e97b9fb4def708767061055795aae6f7c82ae32e967c9be4cd  cssutils-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index fff9e393f3..be5be30eee 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.6.0
+PYTHON_CSSUTILS_VERSION = 2.9.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/43/d5/505d96b7456fd334f8b963c05bd9425dacd317e209bb9adf103613339325
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/b4/65/a054545c81eb87af898d664043578b8444ea3ded656db3da8f9d9fa21334
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
