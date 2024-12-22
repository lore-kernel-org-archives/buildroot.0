Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CCBC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686EE4F868;
	Fri, 28 Feb 2025 16:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJKn3TZopgT0; Fri, 28 Feb 2025 16:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED414F85C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED414F85C;
	Fri, 28 Feb 2025 16:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0300A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD752424E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOlUio1yQ0H3 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F59424FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F59424FB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D082820F8; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 13:56:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f04bde045ad167ba605b6e78545e79dff153a58
X-Git-Newrev: 354fa0985430b3b30107ba3f6f9d926d4fa8b3c3
X-Patchwork-Hint: ignore
Message-Id: <20250228162944.5D082820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tortoise-orm:
 bump to version 0.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=354fa0985430b3b30107ba3f6f9d926d4fa8b3c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 5e97c6302f..2297290616 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  328373e7e6112eab38984d6c1c7caf41  tortoise_orm-0.21.7.tar.gz
-sha256  8a790a931828aa37ac364b344c561e603422aced2af5e403f6790575da0f19c5  tortoise_orm-0.21.7.tar.gz
+md5  21f9f3624ef82b3b9c23ed1fb7d70766  tortoise_orm-0.22.2.tar.gz
+sha256  f1e808bc27265b3e4682dae89b725a66d8311cc20c206d512c57dd8a1c78096b  tortoise_orm-0.22.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 0a8f173c86..6bd1276bd1 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.21.7
+PYTHON_TORTOISE_ORM_VERSION = 0.22.2
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/e8/0e/ad8e7554b0259072887d602617a67ef21055e1d8aa061936e381ecc1a9a5
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/5c/19/c32752a3042580b40300aeffa48859e087a023114f50a2846ba95c26c87d
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
