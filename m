Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C4C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E900141879;
	Thu,  3 Nov 2022 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E900141879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anhmdLCLoWnK; Thu,  3 Nov 2022 21:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA301410B0;
	Thu,  3 Nov 2022 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA301410B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B78E1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328FB40BDA
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328FB40BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dMUiNiWr-QV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2950140C1C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2950140C1C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A11087BCC; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d8312153ef4760865dc2fe0f612e82a3515637c
X-Git-Newrev: cedea0649dbd80a8bcf09874c48fb5298616c6f1
X-Patchwork-Hint: ignore
Message-Id: <20221103205514.1A11087BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-reentry: bump
 to version 1.3.3
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
