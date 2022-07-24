Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A41C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B2C14169C;
	Sun, 24 Jul 2022 12:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B2C14169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sv1NuaWi25hS; Sun, 24 Jul 2022 12:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3110640B97;
	Sun, 24 Jul 2022 12:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3110640B97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BBF21BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7FDB81A9C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FDB81A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyRETwxSvydG for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AA1682438
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA1682438
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 165B485C29; Sun, 24 Jul 2022 12:06:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:19:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e75e76b3091fb6d4027fe154a69ab363e90f82e6
X-Git-Newrev: 4f245066b32a0207cd180b5cf050f79760e9cac4
X-Patchwork-Hint: ignore
Message-Id: <20220724120647.165B485C29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.34.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f245066b32a0207cd180b5cf050f79760e9cac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index ef75a54ae3..469fea9c19 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  02a4c1216de481ca881f92afba1c80db  fonttools-4.33.3.zip
-sha256  c0fdcfa8ceebd7c1b2021240bd46ef77aa8e7408cf10434be55df52384865f8e  fonttools-4.33.3.zip
+md5  197ad603c91d4c2909acf9e54c26e85f  fonttools-4.34.4.zip
+sha256  9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0  fonttools-4.34.4.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 5ee159d551..c35c538cb6 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.33.3
+PYTHON_FONTTOOLS_VERSION = 4.34.4
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/de/54/14376a4e5c1e7d2105a5be33ad5584b56e36753dc615506728a1489071cd
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
