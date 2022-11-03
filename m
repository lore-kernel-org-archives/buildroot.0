Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A675EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552FB60BC9;
	Mon,  5 Dec 2022 11:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552FB60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXqFrP98PetA; Mon,  5 Dec 2022 11:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D59F607CA;
	Mon,  5 Dec 2022 11:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D59F607CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 557D71BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2692440600
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2692440600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzH2gzUjxZuH for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18192405BA
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18192405BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F8A585B9B; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:02:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22bfd5d15915a9e913233a5ee15df2540b165079
X-Git-Newrev: e85049dc29affffebff18c4ed87b4780fe2df77e
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.0F8A585B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-thrift: bump to version
 0.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e85049dc29affffebff18c4ed87b4780fe2df77e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License details moved to readme.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-thrift/python-thrift.hash | 6 +++---
 package/python-thrift/python-thrift.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 1d1d628908..0907a6e88f 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  c3bc8d9a910d2c9ce26f2ad1f7c96762  thrift-0.13.0.tar.gz
-sha256  9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89  thrift-0.13.0.tar.gz
+md5  486887192acd558636a1528dfddf918c  thrift-0.16.0.tar.gz
+sha256  2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408  thrift-0.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c13578ae9d0529d0252e1c7375b917bacf58723dce1fcd40c7ed59183401b468  LICENSE
+sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 3a908ca91c..23a2ad0476 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.13.0
+PYTHON_THRIFT_VERSION = 0.16.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/97/1e/3284d19d7be99305eda145b8aa46b0c33244e4a496ec66440dac19f8274d
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/e4/23/dd951c9883cb49a73b750bdfe91e39d78e8a3f1f7175608634f381a197d5
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = LICENSE
+PYTHON_THRIFT_LICENSE_FILES = README.md
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
