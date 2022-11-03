Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA1C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739B481D0C;
	Mon,  5 Dec 2022 11:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739B481D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmzF1NTCM8no; Mon,  5 Dec 2022 11:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD55817A7;
	Mon,  5 Dec 2022 11:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD55817A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 420BE1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 048B641676
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048B641676
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrqDyyuHoL16 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA484163E
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA484163E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 088B785BA3; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d8312153ef4760865dc2fe0f612e82a3515637c
X-Git-Newrev: cedea0649dbd80a8bcf09874c48fb5298616c6f1
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.088B785BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-reentry: bump to version
 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cedea0649dbd80a8bcf09874c48fb5298616c6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-reentry/python-reentry.hash | 4 ++--
 package/python-reentry/python-reentry.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
index 522b936118..1d6ff0e217 100644
--- a/package/python-reentry/python-reentry.hash
+++ b/package/python-reentry/python-reentry.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reentry/json
-md5  398c1e5bbda657aa645c8d2d38afb63f  reentry-1.3.2.tar.gz
-sha256  c6667e59aeabbb4d122aadc2170102a270e6a811d16a5431c5c3b91fabd7cf02  reentry-1.3.2.tar.gz
+md5  30b57a189bb3c319c0552a2f3105d34d  reentry-1.3.3.tar.gz
+sha256  6343d83245e5047c9f8db0702ec1a7fa8210bd553f0ab643212572f6fce2c3ff  reentry-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index ec33c17452..5808eee4a2 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REENTRY_VERSION = 1.3.2
+PYTHON_REENTRY_VERSION = 1.3.3
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/a0/88/eb0c107c19227a2292ed11711034a3d80c0dc1368d2b3ebeb3fe7b936a8e
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/95/20/e820a29014f1cb662423d7001dc09a9ea5280083ea300f0c5efe5cae238b
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
