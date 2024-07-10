Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B0CC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64498408C1;
	Wed, 10 Jul 2024 22:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_-Z-fZzTjTc; Wed, 10 Jul 2024 22:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16CB4413B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16CB4413B2;
	Wed, 10 Jul 2024 22:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFE711BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD8640126
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWPLipFyOR4t for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A591F400FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A591F400FE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97E4984A1A; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:03:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2f6d71e55e8924f0ae17c5f5050ed3b87ffaec0
X-Git-Newrev: 74ebd50ccc6681ef2e07896b8f16afb122db099d
X-Patchwork-Hint: ignore
Message-Id: <20240710221545.97E4984A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyalsa: bump to version
 1.2.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74ebd50ccc6681ef2e07896b8f16afb122db099d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.2.7, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.12

This commit also adds a comment about the pgp signature check in the
hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyalsa/python-pyalsa.hash | 6 ++++--
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index d4cfe0d61f..206107d29a 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,4 @@
-# Locally computed
-sha256  67d8f99f1ccf23e7ebdfa2c3be0b09f147949fd9511d1e6748b7f412ef046e1f  pyalsa-1.2.7.tar.bz2
+# Locally computed, after checking pgp signature from:
+# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.12.tar.bz2.sig
+# with key F04DF50737AC1A884C4B3D718380596DA6E59C91
+sha256  8abeaf41e5f48f617a52d1078932da89ab303d4a1d8f9919f947bdb1b7d03f50  pyalsa-1.2.12.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 1661fe47b4..19d2c91d23 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.7
+PYTHON_PYALSA_VERSION = 1.2.12
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
