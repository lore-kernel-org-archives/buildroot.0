Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9499AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4114460D91;
	Tue, 25 Jan 2022 18:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywY6oOnQ9Tfa; Tue, 25 Jan 2022 18:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F21960E22;
	Tue, 25 Jan 2022 18:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFAF1BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 536DC60B03
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYckq36Sfk9F for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3505A60AEF
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 458E4827E1; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:23:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24ea41cfa2759eeac043690eb6b1b428249ef968
X-Git-Newrev: 952867c45247b43d51e80d2f294622ab3c108b60
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.458E4827E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: bump to version 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=952867c45247b43d51e80d2f294622ab3c108b60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 08a7be9d56..27c42c8b59 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  08ea8e2ce09e522424e872409c221138  idna-3.2.tar.gz
-sha256  467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3  idna-3.2.tar.gz
+md5  5856306eac5f25db8249e37a4c6ee3e7  idna-3.3.tar.gz
+sha256  9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d  idna-3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index a2c842f1e7..2a1ec8314b 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.2
+PYTHON_IDNA_VERSION = 3.3
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe616d7e572e02a04273603db446975ab46bbcd36552005
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
