Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC5DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0656E60BC9;
	Mon,  5 Dec 2022 11:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0656E60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dCtsWA-cXnC; Mon,  5 Dec 2022 11:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038E660C28;
	Mon,  5 Dec 2022 11:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 038E660C28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8A31BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADCBD4168F
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCBD4168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLc8fxkywCEG for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7616C41684
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7616C41684
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70CA785BA2; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:17:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 892e1debdff900dc29af853f23746d01b118eeb0
X-Git-Newrev: 69ba1562d5bef8d58b430fd7d67d0f3e77acfefc
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.70CA785BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-unittest-xml-reporting:
 bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=69ba1562d5bef8d58b430fd7d67d0f3e77acfefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer needed missing license file workaround:
https://github.com/xmlrunner/unittest-xml-reporting/commit/c43427611390fba83ca13fbb5311bd8fece5048f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-unittest-xml-reporting.hash                      |  6 +++---
 .../python-unittest-xml-reporting.mk                        | 13 ++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
index 9db3a09d38..674a533e6a 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/unittest-xml-reporting/json
-md5  474cd89f9609828ef6039a0f00afd9db  unittest-xml-reporting-3.0.4.tar.gz
-sha256  984cebba69e889401bfe3adb9088ca376b3a1f923f0590d005126c1bffd1a695  unittest-xml-reporting-3.0.4.tar.gz
-# Locally calculated
+md5  f12aeab63ff44e295526e103313d66c8  unittest-xml-reporting-3.2.0.tar.gz
+sha256  edd8d3170b40c3a81b8cf910f46c6a304ae2847ec01036d02e9c0f9b85762d28  unittest-xml-reporting-3.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0596648105bee470f9cafd62753b931efe52392096439d88e2564cf7d7cf0e68  LICENSE
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
index 5744c50a7c..05bbed79a8 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.0.4
+PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.2.0
 PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest-xml-reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
-PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/bc/09/677086169c8e302b614de7d4a97c45c4446a382f31cc010fb31177258508
-# License file missing in Pypi tarball, download separately. Issue
-# reported at
-# https://github.com/xmlrunner/unittest-xml-reporting/issues/259
-PYTHON_UNITTEST_XML_REPORTING_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xmlrunner/unittest-xml-reporting/$(PYTHON_UNITTEST_XML_REPORTING_VERSION)/LICENSE
+PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/ed/40/3bf1afc96e93c7322520981ac4593cbb29daa21b48d32746f05ab5563dca
 PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
 PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
 PYTHON_UNITTEST_XML_REPORTING_LICENSE_FILES = LICENSE
 
-define PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
-	$(INSTALL) -D -m 0644 $(PYTHON_UNITTEST_XML_REPORTING_DL_DIR)/LICENSE $(@D)/LICENSE
-endef
-PYTHON_UNITTEST_XML_REPORTING_POST_EXTRACT_HOOKS += PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
