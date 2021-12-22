Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3EFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1201D40232;
	Wed, 22 Dec 2021 17:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qT1ubYTL2S1U; Wed, 22 Dec 2021 17:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C18564023D;
	Wed, 22 Dec 2021 17:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32A321BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215C460FB3
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7IgDMFlmMIJ for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AB6C60F7F
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 413BD82A39; Wed, 22 Dec 2021 17:46:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:51:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fd3c2cf43a189430cb53cb1434d37d7a3a78b47
X-Git-Newrev: 1055ae6c6b307331ff50d9e3dfaa82a37c8f9038
X-Patchwork-Hint: ignore
Message-Id: <20211222174620.413BD82A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyalsa: bump to version
 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=1055ae6c6b307331ff50d9e3dfaa82a37c8f9038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.1.6, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.6

Also update spaces in hash file (using 2 spaces)

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyalsa/python-pyalsa.hash | 2 +-
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index c484313b96..655150a649 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2771291a5d2cf700f0abbe6629ea37468d1463a01b2330d84ef976e1e918676c  pyalsa-1.1.6.tar.bz2
+sha256  327b29bad57b049571e3d1f63281fdd21df27447cb5e2eadf46b737fbcff6e69  pyalsa-1.2.6.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 74f0347d86..10d5293c2c 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.1.6
+PYTHON_PYALSA_VERSION = 1.2.6
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = distutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
