Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86279C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37D4F8521F;
	Fri, 28 Feb 2025 17:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ozs7i67KUiEa; Fri, 28 Feb 2025 17:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A7E84946
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A7E84946;
	Fri, 28 Feb 2025 17:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12228711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1329F4268E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sY4c0Ml0VZlJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC9342E67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC9342E67
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A567183AB0; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Jan 2025 21:44:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ac832e20bd71c5168457d9cc3a774b3615c01f45
X-Git-Newrev: ba7b462b1d453df761750b91b55860dc970accc7
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.A567183AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-alembic: bump
 to version 1.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba7b462b1d453df761750b91b55860dc970accc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/sqlalchemy/alembic/commit/6bfca645563473da5b3212b827614d762e80feb0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 5f20b18be0..3795afa260 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  a12686c41704218fdb29f140be75cdfd  alembic-1.14.0.tar.gz
-sha256  b00892b53b3642d0b8dbedba234dbf1924b69be83a9a769d5a624b01094e304b  alembic-1.14.0.tar.gz
+md5  5fd5fe35fe820d03c0594cb3edd16829  alembic-1.14.1.tar.gz
+sha256  496e888245a53adf1498fcab31713a469c65836f8de76e01399aa1c3e90dd213  alembic-1.14.1.tar.gz
 # Locally computed sha256 checksums
-sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
+sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 5050765db1..c6dcce445c 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.14.0
+PYTHON_ALEMBIC_VERSION = 1.14.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/00/1e/8cb8900ba1b6360431e46fb7a89922916d3a1b017a8908a7c0499cc7e5f6
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/99/09/f844822e4e847a3f0bd41797f93c4674cd4d2462a3f6c459aa528cdf786e
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
