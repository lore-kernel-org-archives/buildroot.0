Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48311CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1605781452;
	Sun, 22 Sep 2024 10:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3h3m6WmKll4J; Sun, 22 Sep 2024 10:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFDA814BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCFDA814BB;
	Sun, 22 Sep 2024 10:35:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6A11BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57DAA402A7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoEHQeN1Ycbq for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09161400FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09161400FC
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 061DF81446; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:38:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4605393b2313b74f310866a5cb4c9026e045335
X-Git-Newrev: 651606bca0e1dd0e594840a75b204da1abdd5988
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.061DF81446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-thrift: bump to version
 0.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=651606bca0e1dd0e594840a75b204da1abdd5988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-thrift/python-thrift.hash | 4 ++--
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 0907a6e88f..042c801b88 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  486887192acd558636a1528dfddf918c  thrift-0.16.0.tar.gz
-sha256  2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408  thrift-0.16.0.tar.gz
+md5  1e7f196bad9e3ce3f9092a38f5287d9f  thrift-0.21.0.tar.gz
+sha256  5e6f7c50f936ebfa23e924229afc95eb219f8c8e5a83202dd4a391244803e402  thrift-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 23a2ad0476..ebfcff0e3c 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.16.0
+PYTHON_THRIFT_VERSION = 0.21.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/e4/23/dd951c9883cb49a73b750bdfe91e39d78e8a3f1f7175608634f381a197d5
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/33/1c/418058b4750176b638ab60b4d5a554a2969dcd2363ae458519d0f747adff
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
