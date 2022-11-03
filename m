Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C5C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE5D81398;
	Thu,  3 Nov 2022 21:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE5D81398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uCozumO3Tngx; Thu,  3 Nov 2022 21:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A7BE81062;
	Thu,  3 Nov 2022 21:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A7BE81062
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3CC1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5BA640BDF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5BA640BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gt6BNlDS03Ft for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2FC40C21
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2FC40C21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BBE987BCC; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 30b3823ce4a47e93e347b64e06ad0f1ccf7f4b82
X-Git-Newrev: e556af6f20d8fdf12ee83427e95a9698a4d6ddfa
X-Patchwork-Hint: ignore
Message-Id: <20221103205514.4BBE987BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-rsa: bump to
 version 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e556af6f20d8fdf12ee83427e95a9698a4d6ddfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rsa/python-rsa.hash | 8 ++++----
 package/python-rsa/python-rsa.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
index 2ea1245667..0e2b3a9119 100644
--- a/package/python-rsa/python-rsa.hash
+++ b/package/python-rsa/python-rsa.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/project/rsa/
-sha256  5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17  rsa-4.8.tar.gz
-
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/rsa/json
+md5  26a1efb79164a95c363e550c3eefe683  rsa-4.9.tar.gz
+sha256  e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21  rsa-4.9.tar.gz
+# Locally computed sha256 checksums
 sha256  073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index 0de35fe43e..01b5c49b50 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RSA_VERSION = 4.8
+PYTHON_RSA_VERSION = 4.9
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/8c/ee/4022542e0fed77dd6ddade38e1e4dea3299f873b7fd4e6d78319953b0f83
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
