Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A1C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FF8404D8;
	Sun, 11 Dec 2022 09:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FF8404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ir4ZjwDvlokn; Sun, 11 Dec 2022 09:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D880B404FC;
	Sun, 11 Dec 2022 09:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D880B404FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEF511BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A245605DB
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A245605DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjENdv-8yNkO for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D151060AE2
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D151060AE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF7DA85FAC; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 225e8745c62c75b20867af928d459abfbb53da94
X-Git-Newrev: 55113b2e487b69d6f6c3e703ea9ef9cce1cc0075
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.CF7DA85FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tempora: bump to version
 5.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=55113b2e487b69d6f6c3e703ea9ef9cce1cc0075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index d802a63d87..39249eb4fa 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  24b77c173a7e89084004a38fe44e3ce3  tempora-5.0.2.tar.gz
-sha256  31fa5bb33b2641026211f23e808eb8bd351901988b167d45f323c8f450ecf211  tempora-5.0.2.tar.gz
+md5  f9954a8c3b091f9769eb7bbe0faddccf  tempora-5.1.0.tar.gz
+sha256  3e7c4a5369a1788c88a99b6be3a4c74c0c7728d3b62fd768a7e81bd0be0e88df  tempora-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index e22ac52472..68516a8388 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.0.2
+PYTHON_TEMPORA_VERSION = 5.1.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/72/2c/9aff4204a4ea5172b0cb3508f8a504ab6562ba539825ea2e33a5b4cb629b
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/a9/4e/41863232e77742b3a5b30a81e1398abd102aa0a67657bc86a53800966b8e
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
