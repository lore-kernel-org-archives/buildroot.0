Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C10C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB63C6106D;
	Thu,  3 Nov 2022 21:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB63C6106D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeN-6_xvlM8z; Thu,  3 Nov 2022 21:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B165661068;
	Thu,  3 Nov 2022 21:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B165661068
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 382261BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4550040BF3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4550040BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxOozVGrHcLF for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32DAE40BF1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DAE40BF1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3129E87BCD; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24565bfe7941c9869b3398d315bf318ad03efa27
X-Git-Newrev: d9d881323e66d2a5c6243afb33e3d41b76356fe7
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.3129E87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cppy: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9d881323e66d2a5c6243afb33e3d41b76356fe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cppy/python-cppy.hash |  5 +++++
 package/python-cppy/python-cppy.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
new file mode 100644
index 0000000000..45b78eab8e
--- /dev/null
+++ b/package/python-cppy/python-cppy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cppy/json
+md5  7c1f825c43dd66454440932a35b9969c  cppy-1.2.1.tar.gz
+sha256  83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b  cppy-1.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
new file mode 100644
index 0000000000..adadc352d3
--- /dev/null
+++ b/package/python-cppy/python-cppy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cppy
+#
+################################################################################
+
+PYTHON_CPPY_VERSION = 1.2.1
+PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
+PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee52d2f0423046072a2ce3ae16dfcd44373b9fe2a0222204
+PYTHON_CPPY_LICENSE = BSD-3-Clause
+PYTHON_CPPY_LICENSE_FILES = LICENSE
+PYTHON_CPPY_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
