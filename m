Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B1E78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929FD820F8;
	Sun,  1 Oct 2023 18:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929FD820F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccoqOa7fsbP9; Sun,  1 Oct 2023 18:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8968820E4;
	Sun,  1 Oct 2023 18:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8968820E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4EFD1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD6E14026A
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD6E14026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqD_WxY8qkWE for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6498400AF
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6498400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE5E783E70; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:24:25 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: c35b052d9703ee1f3bd5ad97b6de14cc1b8b6a19
X-Git-Newrev: df2180cd89c96572a34de01c107a2cc60ed287a3
X-Patchwork-Hint: ignore
Message-Id: <20231001184642.AE5E783E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] unifdef: add missing
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

commit: https://git.buildroot.net/buildroot/commit/?id=df2180cd89c96572a34de01c107a2cc60ed287a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
