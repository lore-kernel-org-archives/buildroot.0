Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36883C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC73D41833;
	Tue, 14 Mar 2023 08:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC73D41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVXu8Ntg-8MT; Tue, 14 Mar 2023 08:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FC241868;
	Tue, 14 Mar 2023 08:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FC241868
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC3B1BF33F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00C1815CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00C1815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2dXqmTbiWzX for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:50:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA59E81589
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA59E81589
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B71F787141; Tue, 14 Mar 2023 08:50:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:49:22 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d464408908b534615ae3f1a867bc1a5288c174c1
X-Git-Newrev: 26f52b75e574d04c0c394562e7b5e811b3420ae4
X-Patchwork-Hint: ignore
Message-Id: <20230314085047.B71F787141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-werkzeug:
 bump to version 2.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=26f52b75e574d04c0c394562e7b5e811b3420ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bd447bb88c1012d80b6ce0a43539d442c9acc922)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 1d6de8a0c7..73fa6b5630 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
-sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c  Werkzeug-1.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
+md5  5835c8738b8081c53367cbcc5db8784c  Werkzeug-2.1.2.tar.gz
+sha256  1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6  Werkzeug-2.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index fe9b87af1d..9b32fdf097 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 1.0.1
+PYTHON_WERKZEUG_VERSION = 2.1.2
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/cf/97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
