Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BDDCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD4681E96;
	Sun, 22 Sep 2024 10:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k45wBZYYhZIw; Sun, 22 Sep 2024 10:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7753C820EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7753C820EA;
	Sun, 22 Sep 2024 10:37:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B35ED1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A33E840252
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-EXrvWYPO2G for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72B84025B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C72B84025B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4A7781446; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:31:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0613d45fb412a44a80a1af97731e901be3b9a75
X-Git-Newrev: 19be003a010f809cc411e426c17568bddf829e5b
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.C4A7781446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zlmdb: bump to version
 23.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=19be003a010f809cc411e426c17568bddf829e5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-zlmdb/python-zlmdb.hash | 4 ++--
 package/python-zlmdb/python-zlmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index 1ae5d72efa..ed1b6db8c2 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  1e217f3228cb4c2303f06461b79e593e  zlmdb-22.6.1.tar.gz
-sha256  aff353121c2eed3c18e53c82358c41932a21bf882995ee3a79c6eb1ae4c95397  zlmdb-22.6.1.tar.gz
+md5  4d96b46d1724b9d4cb6961874e5b4a9a  zlmdb-23.1.1.tar.gz
+sha256  ddcf680bf49352cabe35bfb5bfe3acbd5d6b8d481cafa508c423e0b18d654d05  zlmdb-23.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index d20ac9e016..70538ce63c 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 22.6.1
+PYTHON_ZLMDB_VERSION = 23.1.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/97/15/992e61a18cb64b573814c9d92676b22d522f2cc2ea79ff78b834bd392b80
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/56/b2/abaeb5419435a6224a0beb2b5edad621ec975fe4802297963ecf1728b883
 PYTHON_ZLMDB_SETUP_TYPE = setuptools
 PYTHON_ZLMDB_LICENSE = MIT
 PYTHON_ZLMDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
