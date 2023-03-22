Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA098C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6725483F84;
	Wed, 22 Mar 2023 22:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6725483F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpleLpAgH-Uh; Wed, 22 Mar 2023 22:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F63B8137A;
	Wed, 22 Mar 2023 22:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F63B8137A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 606401BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E536041C76
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E536041C76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9P7ebfxNdXNc for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BDAD41C79
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDAD41C79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5743587589; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:40:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1e7679a38edc3d4e4e71e6aed1ffd0f4b5fe312
X-Git-Newrev: 42d45a4267d5ff92d85b9b5faeba21e4c46eb357
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.5743587589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=42d45a4267d5ff92d85b9b5faeba21e4c46eb357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/sqlalchemy/alembic/commit/e3055cd5baad328641366026af66639f333c520c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index f94f5ab10a..c84c46c84c 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  999392ffc900da18afbf10d2ac31bdc6  alembic-1.9.1.tar.gz
-sha256  f9f76e41061f5ebe27d4fe92600df9dd612521a7683f904dab328ba02cffa5a2  alembic-1.9.1.tar.gz
+md5  de9d9f92a49a5e3ae5a978018927f474  alembic-1.10.2.tar.gz
+sha256  457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d  alembic-1.10.2.tar.gz
 # Locally computed sha256 checksums
-sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
+sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 64ce85bead..4f605b8f60 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.9.1
+PYTHON_ALEMBIC_VERSION = 1.10.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/81/87/5c531d2923c61e7ae68b23c8660df289ae4241a0d38f3fbcbd8dba64ca6b
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/d6/02/66ed327f944f3f85423096c438d7d290da5af21a7aecf9e5b9f09d9e34b2
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
