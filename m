Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB68C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A6160F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A6160F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8563560753;
	Sun, 26 Sep 2021 21:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIPHexmlHEMb; Sun, 26 Sep 2021 21:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB18D60725;
	Sun, 26 Sep 2021 21:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3121BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D7ED81A18
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT_I5DcBFAY7 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9475B81A39
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0E4F98D2AD; Sun, 26 Sep 2021 20:57:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:17:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dae40a87b13f12c23b4e3b788b3b1d5af1796da
X-Git-Newrev: a47f332a20bf3f79ef4903c8ddd2b7917217e354
X-Patchwork-Hint: ignore
Message-Id: <20210926205757.0E4F98D2AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a47f332a20bf3f79ef4903c8ddd2b7917217e354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Add new host-python-setuptools-scm dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-ujson/python-ujson.hash | 8 +++++---
 package/python-ujson/python-ujson.mk   | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 21320346a1..8dd52fd6fa 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=42f77b0cce686dfa4da2e68480b1dd24,sha256 locally computed.
-md5	42f77b0cce686dfa4da2e68480b1dd24  ujson-1.35.tar.gz
-sha256	f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86  ujson-1.35.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ujson/json
+md5  f8223127259c6a1f7d0e750fc88d19fd  ujson-4.1.0.tar.gz
+sha256  22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c  ujson-4.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 60a4ecf841..88e220b1a7 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 1.35
+PYTHON_UJSON_VERSION = 4.1.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://pypi.python.org/packages/source/u/ujson
-PYTHON_UJSON_LICENSE = BSD-3-Clause
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/2c/8d/63b4afe82d646a606cef838855a6110c7a3a012622e656bd29fb2d15f1d1
 PYTHON_UJSON_SETUP_TYPE = setuptools
+PYTHON_UJSON_LICENSE = BSD-3-Clause
+PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
+PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
