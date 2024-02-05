Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3B9C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 877C640B42;
	Mon,  5 Feb 2024 11:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877C640B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbVmrY4C3Dxs; Mon,  5 Feb 2024 11:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3806440B55;
	Mon,  5 Feb 2024 11:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3806440B55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2B51BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF794189A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF794189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cH8ChPNPB3YL for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B18D4189D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B18D4189D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A27C86B6E; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 585b0bab9e263f57b0aef60502eb34b73214e8c8
X-Git-Newrev: 7d1fc26f04698517afa225968cdfcd4c615870fa
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.7A27C86B6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: bump to version
 2023.12.25
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d1fc26f04698517afa225968cdfcd4c615870fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-regex/Config.in         | 2 +-
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-regex/Config.in b/package/python-regex/Config.in
index 5f582d085a..89ead69c04 100644
--- a/package/python-regex/Config.in
+++ b/package/python-regex/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_REGEX
 	help
 	  Alternative regular expression module, to replace re.
 
-	  https://bitbucket.org/mrabarnett/mrab-regex
+	  https://github.com/mrabarnett/mrab-regex
diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 11a5765e41..7454db99bb 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  a85ced10be8bfe76fed4f30c42d32d5c  regex-2022.10.31.tar.gz
-sha256  a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83  regex-2022.10.31.tar.gz
+md5  3f97f0aef9bf334fe50ae5980b183e68  regex-2023.12.25.tar.gz
+sha256  29171aa128da69afdf4bde412d5bedc335f2ca8fcfe4489038577d05f16181e5  regex-2023.12.25.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 81bd460ecc..6b1938bc0c 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2022.10.31
+PYTHON_REGEX_VERSION = 2023.12.25
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/27/b5/92d404279fd5f4f0a17235211bb0f5ae7a0d9afb7f439086ec247441ed28
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b5/39/31626e7e75b187fae7f121af3c538a991e725c744ac893cc2cfd70ce2853
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
