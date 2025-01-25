Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EA7C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67BA08566B;
	Fri, 28 Feb 2025 17:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VI7dFgJeOn7d; Fri, 28 Feb 2025 17:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC9285670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC9285670;
	Fri, 28 Feb 2025 17:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0854B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AD149C90
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NX-iAp9NJDsj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C474842E76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C474842E76
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB18982581; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:19:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 85a79bdbfd1707820f3f769173076ffc7f46109e
X-Git-Newrev: 37e3db83292dfe3f233b16e2cc743cb94cd865b6
X-Patchwork-Hint: ignore
Message-Id: <20250228163018.BB18982581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cachetools:
 bump to version 5.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=37e3db83292dfe3f233b16e2cc743cb94cd865b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index fb16cb492b..aee9548b9e 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  d589387a314eed031e97348a73b8cf91  cachetools-5.5.0.tar.gz
-sha256  2cc24fb4cbe39633fb7badd9db9ca6295d766d9c2995f245725a46715d050f2a  cachetools-5.5.0.tar.gz
+md5  a9855be6d00255c175529d91f1c4003f  cachetools-5.5.1.tar.gz
+sha256  70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95  cachetools-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f4d2ff05f05c5da3879f40292b7600332d775dc7ed320d43dd42f3cd7d92c9b  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 38a2313d59..e1b27cf362 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 5.5.0
+PYTHON_CACHETOOLS_VERSION = 5.5.1
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/c3/38/a0f315319737ecf45b4319a8cd1f3a908e29d9277b46942263292115eee7
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/d9/74/57df1ab0ce6bc5f6fa868e08de20df8ac58f9c44330c7671ad922d2bbeae
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
