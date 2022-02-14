Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4040AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0415F606E7;
	Mon, 14 Feb 2022 20:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZC82GTXUC6I; Mon, 14 Feb 2022 20:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EC8605B3;
	Mon, 14 Feb 2022 20:43:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2917D1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8301C40368
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00UlLqwuCOti for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32BDA401B2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0043C82BDB; Mon, 14 Feb 2022 20:35:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:37:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b0d3b12438db46565824da437958e526a7c4d71
X-Git-Newrev: 261bb9a17a21439e9688b07de1b8edf89f8eae31
X-Patchwork-Hint: ignore
Message-Id: <20220214203507.0043C82BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=261bb9a17a21439e9688b07de1b8edf89f8eae31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is Apache-2.0 since bump to version 2021.4.4 in commit
d973fac7ca2e7c0c4864e8045e5205764e84c45b and
https://github.com/mrabarnett/mrab-regex/commit/b693a1fba731a9aa0dc6ae37b441267d4b7b0419

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-regex/python-regex.hash | 2 ++
 package/python-regex/python-regex.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 4749cd6167..b0f5bb05da 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
 md5  cd206281327b4c087bb20bf93cee4ab9  regex-2021.4.4.tar.gz
 sha256  52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb  regex-2021.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index b93607e40f..bb8fdf3e48 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -8,7 +8,8 @@ PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON_REGEX_SETUP_TYPE = setuptools
-PYTHON_REGEX_LICENSE = CNRI-Python
+PYTHON_REGEX_LICENSE = Apache-2.0
+PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
