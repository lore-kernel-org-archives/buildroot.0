Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B0ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACDAA41143;
	Sat, 17 Sep 2022 14:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACDAA41143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3tDj85lfTdJ; Sat, 17 Sep 2022 14:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B776B4049C;
	Sat, 17 Sep 2022 14:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B776B4049C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7CC1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 254B0418B1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254B0418B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnT2dM9HKoAq for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DCE5418BC
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCE5418BC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 83FEC8444E; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:27:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d86ea12a5c9f37f99ea6543c3074f2745fc3202
X-Git-Newrev: f797baba2b09262fb113bf41067a5f24ea49b3fd
X-Patchwork-Hint: ignore
Message-Id: <20220917144059.83FEC8444E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 65.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f797baba2b09262fb113bf41067a5f24ea49b3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index e01350124c..3f68084068 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  d72acb93671bde8e4ca0971866f9cdda  setuptools-63.2.0.tar.gz
-sha256  c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450  setuptools-63.2.0.tar.gz
+md5  66c6b8819c5306c12c38d7fad41b7f99  setuptools-65.3.0.tar.gz
+sha256  7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57  setuptools-65.3.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 082b293eef..b7483c6347 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 63.2.0
+PYTHON_SETUPTOOLS_VERSION = 65.3.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/0a/ba/52611dc8278828eb9ec339e6914a0f865f9e2af967214905927835dfac0a
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/cc/83/7ea9d9b3a6ff3225aca2fce5e4df373bee7e0a74c539711a4fbfda53374f
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
