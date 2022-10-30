Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F74C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4CFF40347;
	Sun, 30 Oct 2022 11:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4CFF40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNHHwWGEZoQX; Sun, 30 Oct 2022 11:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8DCC40390;
	Sun, 30 Oct 2022 11:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8DCC40390
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25B0C1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A05984035A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A05984035A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNmSUJ-oqi6O for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92DB74035E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92DB74035E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 904B087470; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 860b1b958797bd16bfe7666bb308a5ea026b1b46
X-Git-Newrev: d86c46b83bcbebc40e40718796ef9033667c9d27
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.904B087470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: bump to version
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d86c46b83bcbebc40e40718796ef9033667c9d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index c0856c2abf..4c02ee1dce 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  307632355e32c3769c99da66f92fe020  build-0.8.0.tar.gz
-sha256  887a6d471c901b1a6e6574ebaeeebb45e5269a79d095fe9a8f88d6614ed2e5f0  build-0.8.0.tar.gz
+md5  f2dc1823b0eff7037e19be18e354b2f1  build-0.9.0.tar.gz
+sha256  1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c  build-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index de4894dc3a..b78aefe855 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.8.0
+PYTHON_PYPA_BUILD_VERSION = 0.9.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/52/fa/931038182be739955cf83179d9b9a6ce9832bc5f9a917a006f765cb53a1f
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
