Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190AC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD120408AF;
	Thu, 13 Jul 2023 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD120408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seUvu7X9DQ5O; Thu, 13 Jul 2023 20:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC2041799;
	Thu, 13 Jul 2023 20:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBC2041799
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44B421BF980
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E63060BFB
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E63060BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZEWA41iiCEv for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E0E960D62
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E0E960D62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 394A386FCB; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 22:10:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66f91a79422dcdcaa8693bc3599d780f64f9e84d
X-Git-Newrev: b324c880426a3126767d43bd3018431eef5fe7e6
X-Patchwork-Hint: ignore
Message-Id: <20230713202406.394A386FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markupsafe: bump version to
 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b324c880426a3126767d43bd3018431eef5fe7e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 2d1d81c62e..ec357a83ce 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  9809f9fdd98bc835b0c21aa8f79cbf30  MarkupSafe-2.1.1.tar.gz
-sha256  7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b  MarkupSafe-2.1.1.tar.gz
+md5  ca33f119bd0551ce15837f58bb180214  MarkupSafe-2.1.3.tar.gz
+sha256  af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad  MarkupSafe-2.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 49bfc0b840..0dca997f87 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 2.1.1
+PYTHON_MARKUPSAFE_VERSION = 2.1.3
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/1d/97/2288fe498044284f39ab8950703e88abbac2abbdf65524d576157af70556
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
