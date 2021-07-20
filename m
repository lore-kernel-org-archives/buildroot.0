Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E384DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7CFD60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7CFD60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80820423C2;
	Wed,  4 Aug 2021 00:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTquT3F79yWR; Wed,  4 Aug 2021 00:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F50423B9;
	Wed,  4 Aug 2021 00:18:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79E311BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309DE40FA8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXq0AyfmDpF9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A0740F0F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB99081469; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:41:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8b28ba976e4032684c0e30984d246fb12a25f238
X-Git-Newrev: 18bad642132fda6f423c202e20df31932787885d
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.BB99081469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ubjson: bump to
 version 0.16.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=18bad642132fda6f423c202e20df31932787885d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation in hash file (two spaces)

https://github.com/Iotic-Labs/py-ubjson/blob/v0.16.1/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ubjson/python-ubjson.hash | 6 +++---
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index a7e954ce5d..baf3ce7bdc 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py-ubjson/json
-md5	26c07be8e4c9f2b0ee7c42a9aca118ed  py-ubjson-0.14.0.tar.gz
-sha256	f742c87bccc8653329d3f79b8b3f40d44d11d17cce7f6d7025a73c52ebf91c66  py-ubjson-0.14.0.tar.gz
+md5  0f9f2b4d68ae8e70c6f624b1cdaca161  py-ubjson-0.16.1.tar.gz
+sha256  b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482  py-ubjson-0.16.1.tar.gz
 # Locally computed sha256 checksums
-sha256	ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
+sha256  ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index 58bba2ac74..93ab9dc139 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.14.0
+PYTHON_UBJSON_VERSION = 0.16.1
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/10/31/0d8297c33d681aafa3fe900ca072a96d5acb97e79082fbb593e835376c93
+PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/1d/c7/28220d37e041fe1df03e857fe48f768dcd30cd151480bf6f00da8713214a
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
