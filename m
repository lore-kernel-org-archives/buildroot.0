Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2066CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51F6616BC;
	Thu, 21 Aug 2025 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4XpJHUNSUoO; Thu, 21 Aug 2025 18:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B236171A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0B236171A;
	Thu, 21 Aug 2025 18:57:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E300D1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB92840CB1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bgKhJjGqt5I for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8A540D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F8A540D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1107787A0C; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:41:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d16495c1d2ab8d266e3270cbae781992b909e359
X-Git-Newrev: 41cfa2f45753e9abab37227d1f2a085f8b161615
X-Patchwork-Hint: ignore
Message-Id: <20250821185709.1107787A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rrdtool: mark CPE
 as valid
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41cfa2f45753e9abab37227d1f2a085f8b161615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

rrdtool_project is a valid CPE vendor, see
https://nvd.nist.gov/products/cpe/detail/744D7444-F505-4F38-BB2C-B1540A3966E4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e5ab63220713c369a749fe5c92b30e5774e9fc7d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rrdtool/rrdtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index be30013992..fd9883077c 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -8,6 +8,7 @@ RRDTOOL_VERSION = 1.9.0
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
+RRDTOOL_CPE_ID_VALID = YES
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 
 # 0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
