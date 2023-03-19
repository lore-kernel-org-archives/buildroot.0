Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D43C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D1E81A6A;
	Sun, 19 Mar 2023 16:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D1E81A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMS1e6OcP1zV; Sun, 19 Mar 2023 16:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF08781A64;
	Sun, 19 Mar 2023 16:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF08781A64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5E6C1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F17A81A65
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F17A81A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WraNQfWAA7XC for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F1281A5F
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F1281A5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3DD5873E6; Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 17:20:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48781ec9604834a8e5f0acbe2d71a0c469b54fed
X-Git-Newrev: c5b453f47892fbb3f7c505e98cb24939161d37eb
X-Patchwork-Hint: ignore
Message-Id: <20230319162034.A3DD5873E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump to 6.3.0
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
Content-Type: multipart/mixed; boundary="===============5291627211107775476=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5291627211107775476==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c5b453f47892fbb3f7c505e98cb24939161d37eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index f2861f920a..f8a2350eaf 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  b4e90006a26215e2e0a6fe2629d12c10  apispec-6.0.2.tar.gz
-sha256  e76d80b739edef4be213092a6384ad7fd933ba7d64f6d5a0aff8d4da1bef7887  apispec-6.0.2.tar.gz
+md5  d6cc7586754cf1c653ffb7ee83955d3a  apispec-6.3.0.tar.gz
+sha256  6cb08d92ce73ff0b3bf46cb2ea5c00d57289b0f279fb0256a3df468182ba5344  apispec-6.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 4674ce0c3d..744fb76810 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.0.2
+PYTHON_APISPEC_VERSION = 6.3.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/a7/2a/b42c17e0d653341b8f5916999892cd2d8489de127dac6118ae44531674f5
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/3f/1e/207c3e61c805eef214d7e5c58106312f9af4733b07f470224e4e309dc65e
 PYTHON_APISPEC_SETUP_TYPE = setuptools
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE

--===============5291627211107775476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5291627211107775476==--
