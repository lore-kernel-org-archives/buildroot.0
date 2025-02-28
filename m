Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F16DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A781402AC;
	Fri, 28 Feb 2025 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDkDGMr1rc7O; Fri, 28 Feb 2025 20:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D29408C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D29408C6;
	Fri, 28 Feb 2025 20:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C88EA1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA5C4459E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqVnCkFGSW8I for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 20:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9887493B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9887493B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:06:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C51E9814AE; Fri, 28 Feb 2025 20:06:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 20:47:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a031b51637622570609807418d47d8441fdf2501
X-Git-Newrev: 29af0f1b0c623d18e29bddd836b18d7a2badaffb
X-Patchwork-Hint: ignore
Message-Id: <20250228200640.C51E9814AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/shadow: bump to
 version 4.17.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29af0f1b0c623d18e29bddd836b18d7a2badaffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: [1] [2] [3] [4].

[1]: https://github.com/shadow-maint/shadow/releases/tag/4.17.3
[2]: https://github.com/shadow-maint/shadow/releases/tag/4.17.2
[3]: https://github.com/shadow-maint/shadow/releases/tag/4.17.1
[4]: https://github.com/shadow-maint/shadow/releases/tag/4.17.0

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 7155baff07..6e7fdb4603 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.3/shadow-4.17.3.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b  shadow-4.16.0.tar.xz
+sha256  09e896c7b01c97ba4be2d6be332c55a3e478b4893cd3c3466d8224e622bd4943  shadow-4.17.3.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index f0a2b57b4d..cea984012d 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.16.0
+SHADOW_VERSION = 4.17.3
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
