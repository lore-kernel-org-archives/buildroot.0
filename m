Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5344C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 899EC431D0;
	Wed,  1 Nov 2023 17:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 899EC431D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0Nx8zsZ7iXB; Wed,  1 Nov 2023 17:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DAE3431BC;
	Wed,  1 Nov 2023 17:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DAE3431BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2B01BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41AED41768
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41AED41768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJxqtwkwf4DV for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E5344172D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E5344172D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26E8A8639F; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:56:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc85e9dea5c1a66cbfec6224786ee04d110d5e29
X-Git-Newrev: ff240cba1b496247670741e2b5afe509804faf77
X-Patchwork-Hint: ignore
Message-Id: <20231101170149.26E8A8639F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvloop: bump version to
 0.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff240cba1b496247670741e2b5afe509804faf77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 69834d5243..481dbd0569 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
-sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
+md5  0107f6e04c23bdcd93a0a712a0e52ffb  uvloop-0.19.0.tar.gz
+sha256  0246f4fd1bf2bf702e06b0d45ee91677ee5c31242f39aab4ea6fe0c51aedd0fd  uvloop-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 147062cf7b..285884a2bb 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.17.0
+PYTHON_UVLOOP_VERSION = 0.19.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ba/86/6dda1760481abf244cbd3908b79a4520d757040ca9ec37a79fc0fd01e2a0
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e6eddb299c5aec4d10eaf25335a5af04e8c0abd68e2e9d32
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
