Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B60C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C174100C;
	Thu,  6 Oct 2022 20:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C174100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0Vljj7oaKET; Thu,  6 Oct 2022 20:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB5F840FEB;
	Thu,  6 Oct 2022 20:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB5F840FEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F28D1BF310
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AFD960BBD
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AFD960BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-0-g6aaIaoy for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:14:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0D3C60B1D
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D3C60B1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E22D86ADE; Thu,  6 Oct 2022 20:14:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 22:13:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d52814f60d5ed6b981dabf0cf6d439a203560e2
X-Git-Newrev: 66d29ddf531059aa0ae9e1f2c528e905d3f7168b
X-Patchwork-Hint: ignore
Message-Id: <20221006201401.8E22D86ADE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-remi: add license file and
 license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=66d29ddf531059aa0ae9e1f2c528e905d3f7168b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the release 2021.3.2, a LICENSE file is shipped with the archive from
pypi.org.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-remi/python-remi.hash | 2 ++
 package/python-remi/python-remi.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 82234bbe98..e7937c3914 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,4 @@
 # sha256 from https://pypi.org/pypi/remi/json
 sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
+# Locally computed sha256
+sha256  3df7d3ad8904d7e99fc0810366483a7cbe5a43c13f7f913f1d7e5023f2ff7657  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 7e43c09b00..419a3441a7 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -9,6 +9,7 @@ PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
 PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
 
 PYTHON_REMI_LICENSE = Apache-2.0
+PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
