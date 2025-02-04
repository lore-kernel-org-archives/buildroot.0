Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC82C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7339B85090;
	Fri, 28 Feb 2025 17:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5c8LUGEcr_N; Fri, 28 Feb 2025 17:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71BD9856F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71BD9856F5;
	Fri, 28 Feb 2025 17:10:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04FF468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C94FE4073C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJnqr2htjUdo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB40442F4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB40442F4F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C02A680042; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 11:43:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe409a5cbdd84df29530fd812f00af97d490e453
X-Git-Newrev: eb3d7ce06e978e438b69bcbcd8af86897c8433db
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.C02A680042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-google-api-core: bump to version 2.24.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb3d7ce06e978e438b69bcbcd8af86897c8433db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 43bf50a5f2..0e85aaba63 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  5e5fbe5e5e6b14b9243b74055b8a50b4  google_api_core-2.24.0.tar.gz
-sha256  e255640547a597a4da010876d333208ddac417d60add22b6851a0c66a831fcaf  google_api_core-2.24.0.tar.gz
+md5  f7cd117d2933fb5874fd5162f60cd720  google_api_core-2.24.1.tar.gz
+sha256  f8b36f5456ab0dd99a1b693a40a31d1e7757beea380ad1b38faaf8941eae9d8a  google_api_core-2.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index d79d0eb749..f772dbf46d 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.24.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.24.1
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/81/56/d70d66ed1b5ab5f6c27bf80ec889585ad8f865ff32acbafd3b2ef0bfb5d0
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/b8/b7/481c83223d7b4f02c7651713fceca648fa3336e1571b9804713f66bca2d8
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
