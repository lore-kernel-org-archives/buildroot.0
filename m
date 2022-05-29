Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24964C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4C7415A1;
	Sun, 29 May 2022 21:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1o7qU0ghx8WM; Sun, 29 May 2022 21:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E27A41550;
	Sun, 29 May 2022 21:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B168C1BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC98740644
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PossvjxvtrN1 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:39:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0323B40291
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:39:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 480778672C; Sun, 29 May 2022 21:27:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 23:38:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd40451b9746c0dd317c2037070fc2f93ffcc712
X-Git-Newrev: 3f9bcc5134a694336a9930510f2764784901c868
X-Patchwork-Hint: ignore
Message-Id: <20220529212743.480778672C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask: bump to version 2.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f9bcc5134a694336a9930510f2764784901c868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to license title syntax change:
https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06dd83a189

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-flask/python-flask.hash | 13 ++++++-------
 package/python-flask/python-flask.mk   |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index c6ccd633f8..5f19a450a1 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,7 +1,6 @@
-# From https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980
-md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
-sha256	4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060  Flask-1.1.2.tar.gz
-
-# License files
-sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
-sha256	0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150  docs/license.rst
+# md5, sha256 from https://pypi.org/pypi/flask/json
+md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
+sha256  315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477  Flask-2.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 077aa600b8..b684aff480 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 1.1.2
+PYTHON_FLASK_VERSION = 2.1.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
