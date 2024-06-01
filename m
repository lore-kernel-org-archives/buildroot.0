Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC760C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D0F81858;
	Sat,  1 Jun 2024 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnrYgxavNJMw; Sat,  1 Jun 2024 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0EE8199D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0EE8199D;
	Sat,  1 Jun 2024 19:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 495021BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43BC581858
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZ5U9BOoniXE for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7776E8175A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7776E8175A
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63B3D87614; Sat,  1 Jun 2024 19:49:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 21:41:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 363a0fb1461aaeb6bb1185f231bee19f513a8c52
X-Git-Newrev: a0d47a69916e7e143059ee21d6b70a5a65abfefc
X-Patchwork-Hint: ignore
Message-Id: <20240601194902.63B3D87614@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfribidi: bump to
 version 1.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0d47a69916e7e143059ee21d6b70a5a65abfefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 9187112cee..b37fb92236 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2  fribidi-1.0.13.tar.xz
+sha256  76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a  fribidi-1.0.14.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ba0859c93d..7c6d32fb76 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.13
+LIBFRIBIDI_VERSION = 1.0.14
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
