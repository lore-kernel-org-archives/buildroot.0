Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F27C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3553784EBE;
	Fri, 26 Jan 2024 08:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3553784EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDJCIVqpbacC; Fri, 26 Jan 2024 08:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60B268503E;
	Fri, 26 Jan 2024 08:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60B268503E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6061BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B7A843DD
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B7A843DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7o_GjRkSXRoc for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7527784041
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7527784041
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63F9F86531; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:48:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be267a227a9138f48b1ef93c68b93adae1870ff8
X-Git-Newrev: a933c807957df8c38216652437bb9a2d8bb1765c
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.63F9F86531@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump to version
 6.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a933c807957df8c38216652437bb9a2d8bb1765c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index f8a2350eaf..9c47a2c1a6 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  d6cc7586754cf1c653ffb7ee83955d3a  apispec-6.3.0.tar.gz
-sha256  6cb08d92ce73ff0b3bf46cb2ea5c00d57289b0f279fb0256a3df468182ba5344  apispec-6.3.0.tar.gz
+md5  1aa13f34a226fca977d72f061360e96e  apispec-6.3.1.tar.gz
+sha256  b38e4479916d43f2b1e88ce15fc2fae93adf2e8d55cb59ec74ac66a827941483  apispec-6.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 744fb76810..aee0e16840 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.3.0
+PYTHON_APISPEC_VERSION = 6.3.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/3f/1e/207c3e61c805eef214d7e5c58106312f9af4733b07f470224e4e309dc65e
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/ff/0c/e70aa981d8ebe2e8a500a85c923579ce3363feccd704268e6ff8053875dd
 PYTHON_APISPEC_SETUP_TYPE = setuptools
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
