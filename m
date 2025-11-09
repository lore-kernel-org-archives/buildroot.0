Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDACCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 22:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF982404B1;
	Sun,  9 Nov 2025 22:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go3amN8w17qC; Sun,  9 Nov 2025 22:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D7240644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D7240644;
	Sun,  9 Nov 2025 22:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEBE0FA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 22:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C57BB404B1
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 22:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t673NrG-Eu91 for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 22:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A29140644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A29140644
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 22:37:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00D148427B; Sun,  9 Nov 2025 22:37:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 23:33:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 860dd9610d12ef85e8df8786d1c800d2b84d67f8
X-Git-Newrev: d8b0fdb71ebfc9f2bdf843b3c1f19e305f24b20d
X-Patchwork-Hint: ignore
Message-Id: <20251109223717.00D148427B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: bump version to 1.7.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8b0fdb71ebfc9f2bdf843b3c1f19e305f24b20d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.infradead.org/pipermail/kexec/2025-October/034120.html
https://lists.infradead.org/pipermail/kexec/2025-April/032607.html
https://lists.infradead.org/pipermail/kexec/2024-October/030984.html

Switched to github helper due to upstream not providing tarballs anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 9083ced423..99a92c2dec 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c53f1e5e11e75e4896197df795bee63b3d46b8821fbc3368f7a240861b543b5  makedumpfile-1.7.5.tar.gz
+sha256  b54e88bef256c589eb4adce17bc856da898a762626fe54f76a77a7f22ad9a844  makedumpfile-1.7.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 5fa1331910..af510598ad 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.5
-MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
+MAKEDUMPFILE_VERSION = 1.7.8
+MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
 MAKEDUMPFILE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
