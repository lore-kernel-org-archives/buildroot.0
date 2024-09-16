Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C4BC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C023C60A8A;
	Mon, 16 Sep 2024 10:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFS4XVDcKL5O; Mon, 16 Sep 2024 10:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3FC60AC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3FC60AC0;
	Mon, 16 Sep 2024 10:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6610D1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C65780B9A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiKhRXuSfaBm for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9E680BAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E9E680BAC
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59F418266F; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a3cb57f4683ba1f18440b7d5f8d0865e197a91f
X-Git-Newrev: b7839f4737a59c20296c46f7bca4829a2374c758
X-Patchwork-Hint: ignore
Message-Id: <20240916100147.59F418266F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 6.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7839f4737a59c20296c46f7bca4829a2374c758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index d23a3de3eb..3230ac9b56 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  abcf9bf19365d06aa784de07da02115d  multidict-6.0.5.tar.gz
-sha256  f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da  multidict-6.0.5.tar.gz
+md5  2c8cf03b6e92e1b9c335de56b606c2fc  multidict-6.1.0.tar.gz
+sha256  22ae2ebf9b0c69d206c003e2f6a914ea33f0a932d4aa16f236afc049d9958f4a  multidict-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 3c9a21f1dc..6b952244bc 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.0.5
+PYTHON_MULTIDICT_VERSION = 6.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/d6/be/504b89a5e9ca731cd47487e91c469064f8ae5af93b7259758dcfc2b9c848
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
