Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CAEC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12E241E56;
	Tue,  6 Feb 2024 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12E241E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itNR8lfAtfZU; Tue,  6 Feb 2024 10:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1F641E6A;
	Tue,  6 Feb 2024 10:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1F641E6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 020031BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 922F441E51
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922F441E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9-ySeHxM_tS for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB5F841E55
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB5F841E55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C9E86F41; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:17:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c2f84e70f592bb3986b5696d9a3e8c8d5268822
X-Git-Newrev: 9eb47ddad84fe099d2a57ffd428602b06e3bc5c3
X-Patchwork-Hint: ignore
Message-Id: <20240206102053.A5C9E86F41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-construct: bump to version
 2.10.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb47ddad84fe099d2a57ffd428602b06e3bc5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-construct/python-construct.hash | 4 ++--
 package/python-construct/python-construct.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-construct/python-construct.hash b/package/python-construct/python-construct.hash
index a72a79a5b3..395de7a18b 100644
--- a/package/python-construct/python-construct.hash
+++ b/package/python-construct/python-construct.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/construct/json
-md5  d881ab2198ec6597e603a2d985307353  construct-2.10.69.tar.gz
-sha256  08573d1573827a6fe6b846756d54270650e221a6cec6a72e06b582cde775599e  construct-2.10.69.tar.gz
+md5  e880b97796c16ae362600b7e32339a7e  construct-2.10.70.tar.gz
+sha256  4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29  construct-2.10.70.tar.gz
 # Locally computed sha256 checksums
 sha256  1552d70acfd0d3fe464ce13d30113ddc6fe4bac21e52212acc98509e3cc1a8f4  LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
index 1e30651129..46cae959ea 100644
--- a/package/python-construct/python-construct.mk
+++ b/package/python-construct/python-construct.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONSTRUCT_VERSION = 2.10.69
+PYTHON_CONSTRUCT_VERSION = 2.10.70
 PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
-PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/88/e34d7265863f3c96077aea24041b067d4646d77d596d979110eb94758b03
+PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f
 PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
 PYTHON_CONSTRUCT_LICENSE = MIT
 PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
