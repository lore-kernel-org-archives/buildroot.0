Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E148C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA615404C9;
	Sun, 11 Dec 2022 09:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA615404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMJ5JJDm7Lmg; Sun, 11 Dec 2022 09:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B58F403A7;
	Sun, 11 Dec 2022 09:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B58F403A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA2C31BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 466236060A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466236060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Wfnqf8--2JD for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E19C600CD
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E19C600CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C5F785FAC; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77871541bdeb7c84e0d54b4d4b3f13a83c5cdb6f
X-Git-Newrev: 1bf1b6f75b8b2e1f1cfaa99aa62f2818b81534d6
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.7C5F785FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 8.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bf1b6f75b8b2e1f1cfaa99aa62f2818b81534d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index e61727e045..aae34f6f9b 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  8c98f6def0622ea32975cb779247c3d7  ipython-8.6.0.tar.gz
-sha256  7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5  ipython-8.6.0.tar.gz
+md5  3adf9fca317512e5b3516a9ac25b3442  ipython-8.7.0.tar.gz
+sha256  882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738  ipython-8.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index f3aac75db1..1af1081741 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.6.0
+PYTHON_IPYTHON_VERSION = 8.7.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/7f/59/05e94e067afb61460f0d5229a1edb800e2f65b8436085fad9cd262d80d45
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/82/2b/026af47da09998404f51064d328f5f1f68c78829082d2945be489343fde6
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
