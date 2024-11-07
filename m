Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA87DD5AE71
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74209409F8;
	Thu,  7 Nov 2024 08:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh7Nvoa1iI40; Thu,  7 Nov 2024 08:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68B440CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68B440CF7;
	Thu,  7 Nov 2024 08:02:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA04C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C36820B2
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0d2Q1nh_G2v for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8968F820B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8968F820B8
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82AA085C5F; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:56:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7405281b19c71ae64c584e969c5f56f234114f8
X-Git-Newrev: 94b1286636e916c56b25f6b2c849480f4dac3544
X-Patchwork-Hint: ignore
Message-Id: <20241107080153.82AA085C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump to version
 6.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=94b1286636e916c56b25f6b2c849480f4dac3544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 2955b4eed8..ee6c422433 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  94849d46f8b789a813c2f5911bd6eef8  apispec-6.7.0.tar.gz
-sha256  fa2cf1063bb227ed6f7f66b019f320d7dc0a7cb02acdf166a160e2381f4b2c39  apispec-6.7.0.tar.gz
+md5  0ace01922cd42fc19da5e597df73b631  apispec-6.7.1.tar.gz
+sha256  c01b8b6ff40ffedf55b79a67f9dd920e9b2fc3909aae116facf6c8372a08b933  apispec-6.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index b464891aa0..168d3890ce 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.7.0
+PYTHON_APISPEC_VERSION = 6.7.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/7c/09/2d5b33f12feb18375c11c6ca518be49a8355e4be3a3581b27a7faf83983b
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/96/26/ef0e72400707469058a7536f64d4e00e1a1c07a179acd00fb7e424dc9330
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
