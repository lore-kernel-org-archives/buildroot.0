Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B70EC7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 22:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC99842BC;
	Thu, 26 Jun 2025 22:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2et0Fbq7gWm; Thu, 26 Jun 2025 22:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB8C680C37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8C680C37;
	Thu, 26 Jun 2025 22:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4F2154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4475C417D4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYUtFL2A1RG2 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 22:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E13417E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E13417E7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6721A846A9; Thu, 26 Jun 2025 22:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 23:00:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cddb30959b74234a081f8dd53d82d6461d4a510d
X-Git-Newrev: f01f7e50e607e07fc0e18362f0b46bd50def3723
X-Patchwork-Hint: ignore
Message-Id: <20250626224845.6721A846A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.115.14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f01f7e50e607e07fc0e18362f0b46bd50def3723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/fastapi/fastapi/releases/tag/0.115.14

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index ae5b5f84f1..3d0cead179 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5d2c702b69f11b6ba4cc9add2419b348  fastapi-0.115.13.tar.gz
-sha256  55d1d25c2e1e0a0a50aceb1c8705cd932def273c102bff0b1c1da88b3c6eb307  fastapi-0.115.13.tar.gz
+md5  bdb2a56a2a464ff29736d4b1c55d547c  fastapi-0.115.14.tar.gz
+sha256  b1de15cdc1c499a4da47914db35d0e4ef8f1ce62b624e94e0e5824421df99739  fastapi-0.115.14.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 8a605531f7..ab39fa29ab 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.13
+PYTHON_FASTAPI_VERSION = 0.115.14
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/20/64/ec0788201b5554e2a87c49af26b77a4d132f807a0fa9675257ac92c6aa0e
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ca/53/8c38a874844a8b0fa10dd8adf3836ac154082cf88d3f22b544e9ceea0a15
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
