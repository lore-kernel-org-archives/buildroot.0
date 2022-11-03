Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725A4C43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D01A40BE9;
	Thu,  3 Nov 2022 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D01A40BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmNPFPRZfdSi; Thu,  3 Nov 2022 21:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 412D240BFF;
	Thu,  3 Nov 2022 21:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412D240BFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752701BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1A9640BF7
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A9640BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2uQrzxyWTwP for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D12AB40C00
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12AB40C00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE78487BCF; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 303b98a1991e2bc1b7b416f180d0e5e291655290
X-Git-Newrev: 253d358532a5edb04ae09649998d4883faa24116
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.CE78487BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-oauthlib: bump
 to version 3.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=253d358532a5edb04ae09649998d4883faa24116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index e55f0c861d..6a2ad003e1 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  9201e30a4eacf3ecfa15503b241ad5e3  oauthlib-3.1.1.tar.gz
-sha256  8f0215fcc533dd8dd1bee6f4c412d4f0cd7297307d43ac61666389e3bc3198a3  oauthlib-3.1.1.tar.gz
+md5  2f7b898cc1af8c1409cc329e8843ea8f  oauthlib-3.2.2.tar.gz
+sha256  9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918  oauthlib-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 7369768b35..1e49487d6a 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.1.1
+PYTHON_OAUTHLIB_VERSION = 3.2.2
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/9e/84/001a3f8d9680f3b26d5e7711e13d5ff92e4b511766a72ac6b4a4e5f06796
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
