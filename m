Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F86EC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56755419D3;
	Mon,  6 Nov 2023 13:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56755419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oinmHzid11AS; Mon,  6 Nov 2023 13:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF9D41F94;
	Mon,  6 Nov 2023 13:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF9D41F94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 523001BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CAE44000B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAE44000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcLzPIpPabHF for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA2D44012D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2D44012D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D767186910; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:39:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f10cd7f8fda3f67d24520575dda3eb19c468b1f
X-Git-Newrev: 509e05f7af9e69248b1e8f1f4efe1d553ef34ea2
X-Patchwork-Hint: ignore
Message-Id: <20231106131913.D767186910@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-timeout: bump to
 version 4.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=509e05f7af9e69248b1e8f1f4efe1d553ef34ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 0ecf1ef5ae..d46489396f 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  10571272b2e0fab839ec23f8293bf482  async-timeout-4.0.2.tar.gz
-sha256  2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15  async-timeout-4.0.2.tar.gz
+md5  9bf7b764a7310cb063c1c261c21342e4  async-timeout-4.0.3.tar.gz
+sha256  4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f  async-timeout-4.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index b3c5f79e45..9760b8ae25 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.2
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.3
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/87/d6/21b30a550dafea84b1b8eee21b5e23fa16d010ae006011221f33dcd8d7f8
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
