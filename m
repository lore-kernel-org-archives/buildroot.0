Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB4AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E115601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E115601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C93E41591;
	Tue,  3 Aug 2021 22:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkOSN6wMQHNB; Tue,  3 Aug 2021 22:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355264159F;
	Tue,  3 Aug 2021 22:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB58A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3718B60A5E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4P9LmaplK95q for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776AA608A1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C1C8383FBA; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:22:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4254520f0aff3e744de2d23ff64e0c24ff974a27
X-Git-Newrev: d6fd393d38889ea3fa20e0a95d93d21ad4b58db9
X-Patchwork-Hint: ignore
Message-Id: <20210803211015.C1C8383FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-passlib: bump
 to version 1.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6fd393d38889ea3fa20e0a95d93d21ad4b58db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update site URL
- Update indentation in hash file (two spaces)
- Update hash of LICENSE due to update in year with
  https://foss.heptapod.net/python-libs/passlib/-/commit/02ca63576ac7749c28ef48365218f291eac9b8e1

https://passlib.readthedocs.io/en/stable/history/1.7.html#whats-new

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-passlib/Config.in           | 2 +-
 package/python-passlib/python-passlib.hash | 6 +++---
 package/python-passlib/python-passlib.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-passlib/Config.in b/package/python-passlib/Config.in
index 23546a18a5..ed4097c562 100644
--- a/package/python-passlib/Config.in
+++ b/package/python-passlib/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PASSLIB
 	  comprehensive password hashing framework supporting over 30
 	  schemes.
 
-	  https://bitbucket.org/ecollins/passlib
+	  https://passlib.readthedocs.io
diff --git a/package/python-passlib/python-passlib.hash b/package/python-passlib/python-passlib.hash
index 867223e19a..c0652865aa 100644
--- a/package/python-passlib/python-passlib.hash
+++ b/package/python-passlib/python-passlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/passlib/json
-md5	b908529cfd4c33057c244324c692eae7  passlib-1.7.2.tar.gz
-sha256	8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8  passlib-1.7.2.tar.gz
+md5  3a229cbd00dfb33e99885b43325e0591  passlib-1.7.4.tar.gz
+sha256  defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04  passlib-1.7.4.tar.gz
 # Locally computed sha256 checksums
-sha256	49a74ad666f456493d6b9e2cda7c55e46ad512ce2c67db4accaddb27bb240bb9  LICENSE
+sha256  a95ba8f1af88ff8d5f0d0c33519f430b7f9d8992b69d4bc369ac0423a7a05a89  LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
index 6ab94fd66e..013fec74de 100644
--- a/package/python-passlib/python-passlib.mk
+++ b/package/python-passlib/python-passlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PASSLIB_VERSION = 1.7.2
+PYTHON_PASSLIB_VERSION = 1.7.4
 PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
-PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/6d/6b/4bfca0c13506535289b58f9c9761d20f56ed89439bfe6b8e07416ce58ee1
+PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/b6/06/9da9ee59a67fae7761aab3ccc84fa4f3f33f125b370f1ccdb915bf967c11
 PYTHON_PASSLIB_SETUP_TYPE = setuptools
 PYTHON_PASSLIB_LICENSE = BSD-3-Clause
 PYTHON_PASSLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
