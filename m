Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB8C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD9383777;
	Mon, 20 Feb 2023 23:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD9383777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnDauDKH2B4P; Mon, 20 Feb 2023 23:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD45F837AD;
	Mon, 20 Feb 2023 23:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD45F837AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECAF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 848A241746
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 848A241746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1cFlNVQ21jl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C948741749
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C948741749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4C6E86495; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:16:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9779ba9cc603df2b75156fcc8979175d8b2ff665
X-Git-Newrev: c60f09bf11cd465caa51c7f099508c44d6359a01
X-Patchwork-Hint: ignore
Message-Id: <20230220205235.C4C6E86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tempora: bump
 to version 5.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c60f09bf11cd465caa51c7f099508c44d6359a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 39249eb4fa..ac6483b77f 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  f9954a8c3b091f9769eb7bbe0faddccf  tempora-5.1.0.tar.gz
-sha256  3e7c4a5369a1788c88a99b6be3a4c74c0c7728d3b62fd768a7e81bd0be0e88df  tempora-5.1.0.tar.gz
+md5  87fc0d99edd557323e61a16017707a8b  tempora-5.2.0.tar.gz
+sha256  af82eb016decda8daf566d1e4836f94f7f8ba8c7153637460156e081aadc64df  tempora-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 68516a8388..3074ad0de2 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.1.0
+PYTHON_TEMPORA_VERSION = 5.2.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/a9/4e/41863232e77742b3a5b30a81e1398abd102aa0a67657bc86a53800966b8e
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/97/70/5cf5031a83ca6d0431a53459b2a98aa387ba23d06710a5e48d681ff3956f
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
