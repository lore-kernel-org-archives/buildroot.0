Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE982C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EEC260D53;
	Tue,  7 Nov 2023 21:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EEC260D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNHAoJ2oiRtL; Tue,  7 Nov 2023 21:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9680760D6D;
	Tue,  7 Nov 2023 21:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9680760D6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5851BF95D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C3E84168F
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C3E84168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjeolC-HCA93 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D57541686
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D57541686
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FFDD86BBE; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 11:50:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 243cfc70c88b90d4f3cdf7df3eec9df8d0b24938
X-Git-Newrev: 7972b0394d9a32cac9c4fff1dc5f817b8897cdfe
X-Patchwork-Hint: ignore
Message-Id: <20231107213549.3FFDD86BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-editables: bump to version
 0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=7972b0394d9a32cac9c4fff1dc5f817b8897cdfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-editables/python-editables.hash | 4 ++--
 package/python-editables/python-editables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
index 3c28c44cc3..a34c7ad20e 100644
--- a/package/python-editables/python-editables.hash
+++ b/package/python-editables/python-editables.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/editables/json
-md5  e91709fbb0ef586cb7b785042068ab67  editables-0.3.tar.gz
-sha256  167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a  editables-0.3.tar.gz
+md5  520de8c3a9dc5dfb2b365d104541c9de  editables-0.5.tar.gz
+sha256  309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2  editables-0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
index db67e7a16d..e60d50f9d6 100644
--- a/package/python-editables/python-editables.mk
+++ b/package/python-editables/python-editables.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EDITABLES_VERSION = 0.3
+PYTHON_EDITABLES_VERSION = 0.5
 PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
-PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/01/b0/a2a87db4b6cb8e7d57004b6836faa634e0747e3e39ded126cdbe5a33ba36
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/37/4a/986d35164e2033ddfb44515168a281a7986e260d344cf369c3f52d4c3275
 PYTHON_EDITABLES_LICENSE = MIT
 PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
 PYTHON_EDITABLES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
