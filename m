Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78351C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D0B8134C;
	Wed, 22 Mar 2023 22:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D0B8134C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wKWFuBtLnlF; Wed, 22 Mar 2023 22:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 655428126E;
	Wed, 22 Mar 2023 22:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 655428126E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26BAE1BF95F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD44F41C75
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD44F41C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWftnspXaDWy for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B0441C7C
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B0441C7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E0E87581; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:40:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d45a4267d5ff92d85b9b5faeba21e4c46eb357
X-Git-Newrev: 6911934ebe0ce12f67914c5d6b6ae84033f43abc
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.60E0E87581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argh: bump to version 0.28.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6911934ebe0ce12f67914c5d6b6ae84033f43abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to flit build backend.

Use license file instead of readme hashes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-argh/python-argh.hash | 7 ++++---
 package/python-argh/python-argh.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 15f72eb015..abfcec98f3 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,5 +1,6 @@
 # md5 from https://pypi.python.org/pypi/argh/json
-md5  edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
+md5  d51d4ed7d82ce24a981169074f3e64e1  argh-0.28.1.tar.gz
+sha256  b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d  argh-0.28.1.tar.gz
 # Locally computed
-sha256  e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
-sha256  9c318783389a2e78735dc3d633e745e5648b826744521857045e84ed2e79ce2e  README.rst
+sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index ac514174c8..82cef822e9 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.26.2
+PYTHON_ARGH_VERSION = 0.28.1
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://pypi.python.org/packages/e3/75/1183b5d1663a66aebb2c184e0398724b624cecd4f4b679cb6e25de97ed15
-PYTHON_ARGH_SETUP_TYPE = setuptools
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/bf/77/6758074453c83c7ac0456d397e95aaa91b33fbd2ec977dcf38be736ea177
+PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
-PYTHON_ARGH_LICENSE_FILES = README.rst
+PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
