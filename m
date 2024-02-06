Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F09C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9AC41E6A;
	Tue,  6 Feb 2024 10:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9AC41E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDhyaatCy_oC; Tue,  6 Feb 2024 10:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9940E41E56;
	Tue,  6 Feb 2024 10:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9940E41E56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26C4E1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD11741E55
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD11741E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVAlm78SbJUF for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC73941E56
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC73941E56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7B6A86F40; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:17:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bea49c2cd3168e11ecf6e858b7e0004f963b4069
X-Git-Newrev: 7c83d1e930c23d0e62de4eedb99716bc5c0f6a29
X-Patchwork-Hint: ignore
Message-Id: <20240206102053.C7B6A86F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distro: bump to version
 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c83d1e930c23d0e62de4eedb99716bc5c0f6a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-distro/python-distro.hash | 8 ++++----
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index 3d3e4258de..7f8277896d 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/pypi/distro/json
-md5  a1e81972bbcfc0dc77dd0cde590c22a6  distro-1.8.0.tar.gz
-sha256  02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8  distro-1.8.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/distro/json
+md5  c4eee99e1d05691230f223c37b895027  distro-1.9.0.tar.gz
+sha256  2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed  distro-1.9.0.tar.gz
+# Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index e079d8e265..05faab3888 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.8.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398
+PYTHON_DISTRO_VERSION = 1.9.0
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
 PYTHON_DISTRO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
