Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9530C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2674168D;
	Sun, 15 Jan 2023 11:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E2674168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfPHpeSPH-4O; Sun, 15 Jan 2023 11:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD41415A9;
	Sun, 15 Jan 2023 11:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD41415A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7461BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEF681F3D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEF681F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jihFnCzQ9E5K for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ABED81F68
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABED81F68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ABEC870EF; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:15:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ffc7b4bb1241eb64272aa78448aac35d67ff4ba
X-Git-Newrev: cc64eb6d1238515b4c53b2b34d89fc3bd09fb59b
X-Patchwork-Hint: ignore
Message-Id: <20230115111943.2ABEC870EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump to version
 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc64eb6d1238515b4c53b2b34d89fc3bd09fb59b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 400e380b5d..0ae6cf1d4e 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  67114f5e59c6d5b45fe2b38c128c2140  pyspnego-0.6.3.tar.gz
-sha256  6060a0e683171090adcf92c9d319ddd334f15117fa199a703d8c9bd094d9f6c0  pyspnego-0.6.3.tar.gz
+md5  93ab1a088d65e6a7c97efdb567ba37b0  pyspnego-0.7.0.tar.gz
+sha256  da78096fd7c9f40e716f6fbe3e30d913103d75fd676f839f98fc3a6fee92fbe3  pyspnego-0.7.0.tar.gz
 
 # Locally computed
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 0910c57b7d..2fbb779d98 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.6.3
+PYTHON_PYSPNEGO_VERSION = 0.7.0
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/ba/13/7b4e7dcff1eb24a13e0a631a4b49eab361678e4490d691c03253ae736da4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/97/f3/bdf3cd5f4c5a1bf9e1d4bb771c133850ee08241c18cafd90a6d872937a9f
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
