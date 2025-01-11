Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81768C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A232A5015A;
	Fri, 28 Feb 2025 16:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD25o25mTr1w; Fri, 28 Feb 2025 16:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0D04F428
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0D04F428;
	Fri, 28 Feb 2025 16:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1170A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2A5844262
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvggbNlBkD_L for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF25642D34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF25642D34
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C166687A8B; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 18:03:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2ae73dec68c437c2acb32bb76cdeb8cb17f5476a
X-Git-Newrev: 02bcbe6384cc7d7c54b56a995a861125be47352c
X-Patchwork-Hint: ignore
Message-Id: <20250228163004.C166687A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-poetry-dynamic-versioning: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=02bcbe6384cc7d7c54b56a995a861125be47352c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-poetry-dynamic-versioning.hash                             | 4 ++--
 .../python-poetry-dynamic-versioning.mk                               | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
index abe063096d..7e0675cabb 100644
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
-md5  91032d27f9da010d8a9b7e76bfd09d24  poetry_dynamic_versioning-1.4.1.tar.gz
-sha256  21584d21ca405aa7d83d23d38372e3c11da664a8742995bdd517577e8676d0e1  poetry_dynamic_versioning-1.4.1.tar.gz
+md5  d3d35766974dc0e040d73f7dcc15cc5f  poetry_dynamic_versioning-1.6.0.tar.gz
+sha256  568b728eeb7b2c4a3b818565bbaffc2128bde68ad037152d464b92975f45ce70  poetry_dynamic_versioning-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
index e159e80324..6ff596bca2 100644
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
+PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.6.0
 PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
-PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/dd/70/1138211a6e5051d28596922ed39acf20b42819db5ae1f93e465b9a903c28
+PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/d3/f9/97b14cae52513ee028f1e81aad8a44e3a8f5a5d47570b48219431e131989
 PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
