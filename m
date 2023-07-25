Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627E3C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E0960A6B;
	Tue, 25 Jul 2023 20:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E0960A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAq2rJHpQnNF; Tue, 25 Jul 2023 20:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB50E6111D;
	Tue, 25 Jul 2023 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB50E6111D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 307831BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D63F8404D5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D63F8404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htDeBFHovy9S for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5F514014B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5F514014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C141F82B98; Tue, 25 Jul 2023 20:02:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:51:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6dec8df06a1ed8d1964e0ed5889d909ccdc2814
X-Git-Newrev: 14c3e8c19dc345af65c5f7f17b6954ba5112f5dc
X-Patchwork-Hint: ignore
Message-Id: <20230725200232.C141F82B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=14c3e8c19dc345af65c5f7f17b6954ba5112f5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting change:
https://github.com/vxgmichel/aioconsole/commit/2b7fbb2a73f94154d6b10cf695c681fa1fdcf263

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aioconsole/python-aioconsole.hash | 6 +++---
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 8770d55932..b8237ed76c 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  3e58234291434cb33cbb6396323918ad  aioconsole-0.6.1.tar.gz
-sha256  520313bc5d7ed6bea3baf072ce7e622479afd67c01b3fdcc076bc528da354f6f  aioconsole-0.6.1.tar.gz
+md5  0f7e4db85113d1ffdc5f0fa1dc0a37de  aioconsole-0.6.2.tar.gz
+sha256  bac11286f1062613d2523ceee1ba81c676cd269812b865b66b907448a7b5f63e  aioconsole-0.6.2.tar.gz
 # Locally computed sha256 checksums
-sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
+sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 5641254f5d..602564c290 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.6.1
+PYTHON_AIOCONSOLE_VERSION = 0.6.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/27/a2/4bbeecceb6786a058e92469686ae1b7d3a616b3f5b99e00b96c3064349e2
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5f/14/e5c634fad6a95ffd602fbbd1aa107f05a8ffb79d33ec0d0477f3b137f8a9
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
