Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0472BC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6DB40347;
	Tue,  8 Aug 2023 20:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6DB40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e769_GdJWd55; Tue,  8 Aug 2023 20:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626C4402BD;
	Tue,  8 Aug 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626C4402BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D34911BF5E0
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACEC240BF9
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACEC240BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSkVLa5nZo-w for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 20:53:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD9240494
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD9240494
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9FD084AD3; Tue,  8 Aug 2023 20:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 21:54:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f47b5e39fb1347ecf7d60ca76cd525f00f11624a
X-Git-Newrev: d4d7761fc0107e286eb080084e5a149378809448
X-Patchwork-Hint: ignore
Message-Id: <20230808205330.C9FD084AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pylibfdt: bump
 version to 1.7.0.post1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4d7761fc0107e286eb080084e5a149378809448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christian Stewart <christian@aperture.us>
Tested-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 056fd3a62e..82527e727e 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
-md5  5765c20ac6cde517d5b7218503ab707b  pylibfdt-1.6.1.tar.gz
-sha256  90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778  pylibfdt-1.6.1.tar.gz
+md5  353ee3063d0b10e94d165e032897d34e  pylibfdt-1.7.0.post1.tar.gz
+sha256  2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1  pylibfdt-1.7.0.post1.tar.gz
 # Locally computed
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index dc68de83b3..5511bd12b3 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.6.1
+PYTHON_PYLIBFDT_VERSION = 1.7.0.post1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
-PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/96/5c/77ef0f0459e0b13f39ecc22e21ad4ac9fbe741e8a7cd70702ac8165f80e2
+PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
