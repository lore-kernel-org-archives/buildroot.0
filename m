Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4390DD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EBAC412E9;
	Thu, 10 Oct 2024 21:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t5CsyoreHpf; Thu, 10 Oct 2024 21:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46ED34130E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46ED34130E;
	Thu, 10 Oct 2024 21:31:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14CE31BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 054E84057A
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Id_Q3jGsyci for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 843C2404F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 843C2404F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F6B984553; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6992257cc8ae6ad203829f74903c66f7c5a9ee80
X-Git-Newrev: 563196258a7cfef14ac0ef732663f639b63aa9f2
X-Patchwork-Hint: ignore
Message-Id: <20241010213042.7F6B984553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump to version
 4.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=563196258a7cfef14ac0ef732663f639b63aa9f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 0a60fd7235..6eab790901 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  4bcb7f6f3d2c9b4edb4caa09912f1dfe  esptool-4.8.0.tar.gz
-sha256  f933150b5753e7501024e4d237fe078a77913a0cb7e2f08197ef8d70306b1b53  esptool-4.8.0.tar.gz
+md5  c7d41d4c89ffa0fa0a9d490439358b27  esptool-4.8.1.tar.gz
+sha256  dc4ef26b659e1a8dcb019147c0ea6d94980b34de99fbe09121c7941c8b254531  esptool-4.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index df19daf61e..a4922c1e5b 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.8.0
+PYTHON_ESPTOOL_VERSION = 4.8.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/d4/c7/b7e4b96a0e7d9b94fe953e1b55b3573bec498bac05f72e61e5a0e979e2c7
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5c/6b/3ce9bb7f36bdef3d6ae71646a1d3b7d59826a478f3ed8a783a93a2f8f537
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
