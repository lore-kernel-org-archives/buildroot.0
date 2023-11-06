Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE32FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FCA40E46;
	Mon,  6 Nov 2023 22:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FCA40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3JyNsr9cb-C; Mon,  6 Nov 2023 22:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8A842083;
	Mon,  6 Nov 2023 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8A842083
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9B61BF955
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F7980C53
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F7980C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9WH_gvdoYHS for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD4C8133E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD4C8133E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBDA886B7B; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:12:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be5d04e91a6681f4d6d2460bf3321c57d163cdff
X-Git-Newrev: f61f52ade9e5c4b7bccca23b48cdefcb0da4f4c3
X-Patchwork-Hint: ignore
Message-Id: <20231106222016.EBDA886B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cycler: bump to version
 0.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f61f52ade9e5c4b7bccca23b48cdefcb0da4f4c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cycler/python-cycler.hash | 4 ++--
 package/python-cycler/python-cycler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cycler/python-cycler.hash b/package/python-cycler/python-cycler.hash
index cef416a86d..4c33c293a5 100644
--- a/package/python-cycler/python-cycler.hash
+++ b/package/python-cycler/python-cycler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cycler/json
-md5  4d0c25f418956e91c47163179682e0ef  cycler-0.11.0.tar.gz
-sha256  9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f  cycler-0.11.0.tar.gz
+md5  16905ad17e5724a6919f64d46c4e7143  cycler-0.12.1.tar.gz
+sha256  88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c  cycler-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index 03155d7241..df7abdf927 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYCLER_VERSION = 0.11.0
+PYTHON_CYCLER_VERSION = 0.12.1
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
-PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/34/45/a7caaacbfc2fa60bee42effc4bcc7d7c6dbe9c349500e04f65a861c15eb9
+PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8
 PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
