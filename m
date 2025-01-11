Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5C7E7719D
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A429A6119F;
	Sat, 11 Jan 2025 16:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj_GdjfMAUAr; Sat, 11 Jan 2025 16:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DEA611A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DEA611A8;
	Sat, 11 Jan 2025 16:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A51E9952
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B69611AD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouIzoKxp67Qt for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57C76119F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C57C76119F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:05:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC3AA844FF; Sat, 11 Jan 2025 16:05:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a7b4444db43dd70110d44bc63cd7c4387ab4604
X-Git-Newrev: 3eef6d14b55ae03e06952914d0d1204e47572319
X-Patchwork-Hint: ignore
Message-Id: <20250111160517.AC3AA844FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump to version
 6.8.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3eef6d14b55ae03e06952914d0d1204e47572319
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 7bfbb5a9b0..ecf9b56954 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  89f6b8186a8772dcfc54aade5e3495e1  apispec-6.8.0.tar.gz
-sha256  861cca82bbc0652ca9acea896921b254944580342fde849f86f6dac1acc6ca96  apispec-6.8.0.tar.gz
+md5  aaec05af7368f2e19f562a63f00e2e74  apispec-6.8.1.tar.gz
+sha256  f4916cbb7be156963b18f5929a0e42bd2349135834b680a81b12432bcfaa9a39  apispec-6.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index a02a1cb8a8..3b87ccdced 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.8.0
+PYTHON_APISPEC_VERSION = 6.8.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/12/66/81f6f31feafb0ee2f6c649ba33f4c768f837bbabef279f12053d00a7099d
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/74/38/62499ad75cf085f5268458c09ae97007082ed85aec1a9cd9e38f7685fbb0
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
