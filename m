Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C43C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5B0817E4;
	Sun, 27 Feb 2022 20:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7HObd5WPOjI; Sun, 27 Feb 2022 20:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B627A817C0;
	Sun, 27 Feb 2022 20:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16F881BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0412340867
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zA-lnEZ9SX7 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 506C94067C
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD6D0836B3; Sun, 27 Feb 2022 20:18:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:25:46 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b8caff2cf25d7c92785e7d50348eb9577cf63d20
X-Git-Newrev: 57fb6f520180cbe458fbf2c2b95efe2b7bec7d04
X-Patchwork-Hint: ignore
Message-Id: <20220227201849.CD6D0836B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-regex: fix
 license
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

commit: https://git.buildroot.net/buildroot/commit/?id=57fb6f520180cbe458fbf2c2b95efe2b7bec7d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

License is Apache-2.0 since bump to version 2021.4.4 in commit
d973fac7ca2e7c0c4864e8045e5205764e84c45b and
https://github.com/mrabarnett/mrab-regex/commit/b693a1fba731a9aa0dc6ae37b441267d4b7b0419

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 261bb9a17a21439e9688b07de1b8edf89f8eae31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index c46c4d1614..4019bcdd3e 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -9,6 +9,7 @@ PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON_REGEX_SETUP_TYPE = setuptools
-PYTHON_REGEX_LICENSE = CNRI-Python
+PYTHON_REGEX_LICENSE = Apache-2.0
+PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
