Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48333C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C7742B05;
	Mon, 20 Feb 2023 22:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C7742B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdoeAdh-qo8R; Mon, 20 Feb 2023 22:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B09E64ED4E;
	Mon, 20 Feb 2023 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B09E64ED4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB6A31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8726117A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8726117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Psj1xgoSv4nn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180916107C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180916107C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 145DB828C8; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9371a7994e1099a8681411ddb686a1c2ce53ef10
X-Git-Newrev: cfd2cb65f2345aa3cda8926c0ec64537f9e4f27b
X-Patchwork-Hint: ignore
Message-Id: <20230220205203.145DB828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pudb: bump to
 version 2022.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfd2cb65f2345aa3cda8926c0ec64537f9e4f27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index d9943a3601..1ae15ad8a6 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  c2b4275b76068f18d630f7bae889345b  pudb-2022.1.2.tar.gz
-sha256  6b83ab805bddb53710109690a2237e98bf83c0b3a00033c517cdf5f6a8fa470d  pudb-2022.1.2.tar.gz
+md5  cda1c28dc52318162e2b131280f09960  pudb-2022.1.3.tar.gz
+sha256  58e83ada9e19ffe92c1fdc78ae5458ef91aeb892a5b8f0e7379e6fa61e0e664a  pudb-2022.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 7df38f0f02..a357c34c44 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2022.1.2
+PYTHON_PUDB_VERSION = 2022.1.3
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/8b/ef/6dea7c63fdddd7753e2a2930e59799ef32247f2499c0d9bcd233439e7483
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/85/a5/f1fd378f56bd8168b5921fd09d4b84fd8101a90e81402a509796caea2094
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
