Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CDAE78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F238382101;
	Sun,  1 Oct 2023 18:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F238382101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UG5vqfEAM0x; Sun,  1 Oct 2023 18:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF48282150;
	Sun,  1 Oct 2023 18:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF48282150
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 959661BF8A8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F9B482148
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F9B482148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIqf_adXhnbD for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E70C820F9
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E70C820F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E61B83F32; Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:24:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7c3e9fbe121fb80863f4d3ca0b137e2d6818fff0
X-Git-Newrev: 057beeb6afa46fdbe72368254bd5b2a97d611362
X-Patchwork-Hint: ignore
Message-Id: <20231001184812.8E61B83F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] unifdef: add missing
 license
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

commit: https://git.buildroot.net/buildroot/commit/?id=057beeb6afa46fdbe72368254bd5b2a97d611362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
applies to "manual page unifdef.1 and the portability support code in
the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8cea23ce4c2462000a3dd01304ba613a39253d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unifdef/unifdef.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index 7d10595d1b..fd74455894 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -6,7 +6,7 @@
 
 UNIFDEF_VERSION = 2.12
 UNIFDEF_SITE = https://dotat.at/prog/unifdef
-UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
 define HOST_UNIFDEF_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
