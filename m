Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29813C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 20:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C31BB85187;
	Sun, 11 Feb 2024 20:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fdfx1wsUfPQF; Sun, 11 Feb 2024 20:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA8F8516C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA8F8516C;
	Sun, 11 Feb 2024 20:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8109C1BF33F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 20:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8775416DB
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 20:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8X3hVK-hIqjp for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 20:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E07416D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E07416D3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 20:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA66E87768; Sun, 11 Feb 2024 20:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 21:34:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d381b8823b29534932b23ac800ef71eeb954ec7
X-Git-Newrev: cd011d097fa41cf9e449843e78439d43f66b87ee
X-Patchwork-Hint: ignore
Message-Id: <20240211203442.DA66E87768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ddrescue: bump to version 1.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd011d097fa41cf9e449843e78439d43f66b87ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release announce:
https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 3caec5667f..4103d4fd6f 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-01/msg00011.html
-sha256  38c80c98c5a44f15e53663e4510097fd68d6ec20758efdf3a925037c183232eb  ddrescue-1.27.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html
+sha256  6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1  ddrescue-1.28.tar.lz
 # Locally computed
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index f4376a9340..13798bb4bb 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.27
+DDRESCUE_VERSION = 1.28
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
