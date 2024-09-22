Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA36CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7463817AC;
	Sun, 22 Sep 2024 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmmyXxtcMNTB; Sun, 22 Sep 2024 10:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7266F8179C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7266F8179C;
	Sun, 22 Sep 2024 10:35:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7291BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76D2781440
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMQ3-WhWg5Kg for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC9F813F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC9F813F5
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 707428230F; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce1c9bf64629a515ee02bdd047583d011c9f33fa
X-Git-Newrev: 078a99ff8faf459b6c27b7ad6a8b1baa2337e336
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.707428230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbprotocol: bump to
 version 1.14.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=078a99ff8faf459b6c27b7ad6a8b1baa2337e336
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index b9d5f74999..e3de9e87d3 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  ccbb42bdd58a0070f56e966d8562451b  smbprotocol-1.12.0.tar.gz
-sha256  5916a4b6c948bb70f82c246bdbfc86cf152226b71dac9f33b3d731d91e86274f  smbprotocol-1.12.0.tar.gz
+md5  ca5c38cbe82d7995ed2147021a7d2950  smbprotocol-1.14.0.tar.gz
+sha256  4918ba10a0b0b344308e7a043c1c6741bf7282c3937059a5852de702d3b684da  smbprotocol-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index ece0744252..fc464fcbd3 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.12.0
+PYTHON_SMBPROTOCOL_VERSION = 1.14.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/57/72/d95216a9fd5da1b2fa225130741f50d4949c8f76d46669d30921c06d69ff
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/41/0d/d178f651591de45607d6dfc5637e7dcd8c5190b137275303cda005d9a13a
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
