Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B55CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F47260716;
	Sat, 21 Sep 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1E9gRFG178rg; Sat, 21 Sep 2024 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC2FB608BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC2FB608BB;
	Sat, 21 Sep 2024 21:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04BBE1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2652060708
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZD_ZxkSEbquq for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F431606E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F431606E5
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 136DD84150; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51ffa15aa23f30a90f196be07c7d17b99095ce44
X-Git-Newrev: d7e62b11db5e2ade5116ca9ffd16ef015aaf698d
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.136DD84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pure-eval: bump to version
 0.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7e62b11db5e2ade5116ca9ffd16ef015aaf698d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pure-eval/python-pure-eval.hash | 4 ++--
 package/python-pure-eval/python-pure-eval.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
index 5bf5dcb749..24c6d15ad6 100644
--- a/package/python-pure-eval/python-pure-eval.hash
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pure_eval/json
-md5  212fd27ca2c58d9effddec69748d738a  pure_eval-0.2.2.tar.gz
-sha256  2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3  pure_eval-0.2.2.tar.gz
+md5  d545186f2c899d9dd273c03d71b7ffb7  pure_eval-0.2.3.tar.gz
+sha256  5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42  pure_eval-0.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
index f139ea270f..721640eabd 100644
--- a/package/python-pure-eval/python-pure-eval.mk
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PURE_EVAL_VERSION = 0.2.2
+PYTHON_PURE_EVAL_VERSION = 0.2.3
 PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
-PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/97/5a/0bc937c25d3ce4e0a74335222aee05455d6afa2888032185f8ab50cdf6fd
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b
 PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 PYTHON_PURE_EVAL_LICENSE = MIT
 PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
