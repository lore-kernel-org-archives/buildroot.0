Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E0C4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CA7435DB;
	Fri, 29 Dec 2023 21:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94CA7435DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okOgepExodCg; Fri, 29 Dec 2023 21:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7061840540;
	Fri, 29 Dec 2023 21:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7061840540
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AEFB1BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A8C24003C
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8C24003C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4w1zN8vmkDX for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7C24006E
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7C24006E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BCC083911; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:14:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af5da8f1292bc9839df4ab52ce8d8a64bc8c5f2b
X-Git-Newrev: 5caa16bd70a3d0d50fddfd1c0e0d2fb00bdfcd3a
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.1BCC083911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: bump to version 0.49
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

commit: https://git.buildroot.net/buildroot/commit/?id=5caa16bd70a3d0d50fddfd1c0e0d2fb00bdfcd3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://raw.githubusercontent.com/MusicPlayerDaemon/ncmpc/v0.49/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 17bc6e3ace..1d288294d1 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  61da23b1bc6c7a593fdc28611932cd7a30fcf6803830e01764c29b8abed2249c  ncmpc-0.47.tar.xz
+sha256  65bbec0ede9e6bcf62ac647b0c706485beb2bdd5db70ca8d60103f32f162cf29  ncmpc-0.49.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 5d4702de78..bc8a62daea 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).47
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).49
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
