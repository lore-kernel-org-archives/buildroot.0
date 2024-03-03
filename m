Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE3C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0786E81E1D;
	Sun,  3 Mar 2024 16:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thMwSizFw9Dx; Sun,  3 Mar 2024 16:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D9F81ED7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D9F81ED7;
	Sun,  3 Mar 2024 16:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1EE21BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED2AC6086A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uE4p4bPmFmIA for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DA5606B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39DA5606B1
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31BC687FBA; Sun,  3 Mar 2024 16:46:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:42:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e1f9c988080097de02762e53ad57a9376e68066c
X-Git-Newrev: 57008d384bc1f2e42d6add6cd73203e11a75d6c9
X-Patchwork-Hint: ignore
Message-Id: <20240303164615.31BC687FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iozone: bump to
 version 3.506
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

commit: https://git.buildroot.net/buildroot/commit/?id=57008d384bc1f2e42d6add6cd73203e11a75d6c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Upstream archive moved back to tar from tgz
- For change log, see end of file:
https://www.iozone.org/src/current/Changes.txt

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iozone/iozone.hash | 3 ++-
 package/iozone/iozone.mk   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 9ecf1d1af8..936ab5a646 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  iozone3_493.tgz
+sha256  114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  iozone3_506.tar
+sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  docs/License.txt
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 2df4a2aa84..b1b29d1098 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.493
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
+IOZONE_VERSION = 3.506
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-# IOzone license details can be found at:
-# http://www.iozone.org/docs/Iozone_License.txt
+IOZONE_LICENSE_FILES = docs/License.txt
 
 # AIO support not available on uClibc, use the linux (non-aio) target.
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
