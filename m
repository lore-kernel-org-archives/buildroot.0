Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7E1E743C2
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 216F761078;
	Thu, 28 Sep 2023 20:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 216F761078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_7viN1pw4N6; Thu, 28 Sep 2023 20:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638036108A;
	Thu, 28 Sep 2023 20:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638036108A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9631BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AD4682F80
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD4682F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mG6QjFpD7iim for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6809282F3D
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6809282F3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F9F82B51; Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 22:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9677f3a897c9c0ac125954b9a2d5d14a812bcaf4
X-Git-Newrev: d8cea23ce4c2462000a3dd01304ba613a39253d5
X-Patchwork-Hint: ignore
Message-Id: <20230928204400.53F9F82B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] unifdef: add missing license
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8cea23ce4c2462000a3dd01304ba613a39253d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
applies to "manual page unifdef.1 and the portability support code in
the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
