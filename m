Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1591C60B68;
	Sun,  9 Jan 2022 15:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCBPYrQwh6-U; Sun,  9 Jan 2022 15:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456AE6080B;
	Sun,  9 Jan 2022 15:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74A991BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8657A40198
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTrPcItcjstf for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D8040167
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC0FD82DC2; Sun,  9 Jan 2022 14:53:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:57:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed3288e44e12817d1ea8bd56956f1af0a209798
X-Git-Newrev: 6050df28b225a686d750b6f9d6825de977735ad1
X-Patchwork-Hint: ignore
Message-Id: <20220109145350.CC0FD82DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libolm: bump to version 3.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6050df28b225a686d750b6f9d6825de977735ad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libolm/libolm.hash | 2 +-
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index 80210a2e5f..044bb24f06 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9b61bd9182bb0ae0c5a800a8b0496b69600a0a22e3a21fce0aad119d2b1c99ae  olm-3.2.6.tar.gz
+sha256  614c0e4dc4721f57e56c3385bd8def2f71c6631f928a480efd0b4bd8e5435df9  olm-3.2.9.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 0049fb6001..607e50702f 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.2.6
+LIBOLM_VERSION = 3.2.9
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
