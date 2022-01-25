Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7203C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D69441592;
	Tue, 25 Jan 2022 18:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LV-W1Ed_XgVj; Tue, 25 Jan 2022 18:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229DD4148D;
	Tue, 25 Jan 2022 18:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86C271BF995
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8261960B3A
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8I0q7FRyIZ4Z for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5C460759
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EFF3D827E3; Tue, 25 Jan 2022 18:27:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:20:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bd2ae3b4fc0fd16300861a55c04ad6d72389d49
X-Git-Newrev: ea135ccb7a2e00e3e0572430a2ecf5cd6a879370
X-Patchwork-Hint: ignore
Message-Id: <20220125182726.EFF3D827E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiorwlock: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea135ccb7a2e00e3e0572430a2ecf5cd6a879370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index fad7079789..15584a8a41 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  f0fac247fd884f59d53f6deeb866a52d  aiorwlock-1.2.0.tar.gz
-sha256  3626ed72f92a57e71c685d7fc0329578e5d2dee2ab80805beec8b5119053146d  aiorwlock-1.2.0.tar.gz
+md5  28e4812a1d1d67a2be4370209ece5528  aiorwlock-1.3.0.tar.gz
+sha256  83f12d87df4b9728a0b8fda1756585ab0d652b107bab59c6084e1b1ad692ab45  aiorwlock-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index 4ba4965eb5..a5e7eeae83 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.2.0
+PYTHON_AIORWLOCK_VERSION = 1.3.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/22/84/98ef7b69764b0ceee7afe2139f45f9cbba21c849b0bd8a6eeecb11ee650d
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/fe/7027595f5e635ac1f597f7160a420e1f642a474576efb697001efea16bdc
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
