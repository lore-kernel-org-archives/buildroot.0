Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82A0CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8202081754;
	Sun, 22 Sep 2024 10:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ri_nx3cot21E; Sun, 22 Sep 2024 10:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E49548174A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E49548174A;
	Sun, 22 Sep 2024 10:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21C6E1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEACA4063E
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzOMUkZEd1x0 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A1A40630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A1A40630
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A47DA81446; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06a708ed26381b07299db93524894f02eb8d899e
X-Git-Newrev: 57ee6b143e8d1b4ccda272e3b41260c58ad1fc67
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.A47DA81446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=57ee6b143e8d1b4ccda272e3b41260c58ad1fc67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/facelessuser/soupsieve/commit/c811bdff9f5c6d1c54888d5af5c257709e957c6e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 278c7d1b0c..d220c8c772 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  88ae72bd970b425692235d17224204e6  soupsieve-2.5.tar.gz
-sha256  5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690  soupsieve-2.5.tar.gz
+md5  19126989f90d775ebe752b7fcacf1fc5  soupsieve-2.6.tar.gz
+sha256  e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb  soupsieve-2.6.tar.gz
 # Locally computed sha256 checksums
-sha256  ceb7b9053b88addffa3102a457302bd840d123925ee9ed9c2ac90cf6548b33bf  LICENSE.md
+sha256  7e1f14c81e9939ef23b472176cda08410cc238752d180abaa0151d8a1c48f594  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 581df7e787..9546a6b8c4 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.5
+PYTHON_SOUPSIEVE_VERSION = 2.6
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/ce/21/952a240de1c196c7e3fbcd4e559681f0419b1280c617db21157a0390717b
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/d7/ce/fbaeed4f9fb8b2daa961f90591662df6a86c1abf25c548329a86920aedfb
 PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
