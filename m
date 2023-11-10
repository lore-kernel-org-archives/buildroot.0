Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE92C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9E242858;
	Fri, 10 Nov 2023 21:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9E242858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8vHT5OnZ54f; Fri, 10 Nov 2023 21:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F79042863;
	Fri, 10 Nov 2023 21:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F79042863
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5411D1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A7D240281
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7D240281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTcDYsNlY_wp for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E949942696
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E949942696
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0CB486FCC; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 257c88b75e129c28c15a7b60519e342856e36bcb
X-Git-Newrev: 10e7866f396a5f32739d269d2bf110bb1e6d71f8
X-Patchwork-Hint: ignore
Message-Id: <20231110210507.C0CB486FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trove-classifiers: new host
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10e7866f396a5f32739d269d2bf110bb1e6d71f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../python-trove-classifiers.hash                         |  5 +++++
 .../python-trove-classifiers/python-trove-classifiers.mk  | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
new file mode 100644
index 0000000000..26b813eded
--- /dev/null
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
+md5  2afa6925489403b8025a1b66d990e760  trove-classifiers-2023.10.18.tar.gz
+sha256  2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939  trove-classifiers-2023.10.18.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
new file mode 100644
index 0000000000..d0d79d297c
--- /dev/null
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-trove-classifiers
+#
+################################################################################
+
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2023.10.18
+PYTHON_TROVE_CLASSIFIERS_SOURCE = trove-classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/5b/fa/49b6a09e4f389d4d9406d2947a685de1462ffb676ea6e61c50905e27b0f4
+PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
+PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
+PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
+HOST_PYTHON_TROVE_CLASSIFIERS_DEPENDENCIES = host-python-calver
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
