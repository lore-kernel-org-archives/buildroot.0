Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327B7C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D365F812C5;
	Fri, 21 Aug 2026 15:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W9vHcT6K6kY; Fri, 21 Aug 2026 15:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324870;
	bh=zd2HfwxsDvFpQBqiqXvDLrAeDKVKRFWvCUThKOLgz3w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QlZtgHrxZY0gqhj478RtRLTk37FsFkIFag11IbT7tKs7zXIFiDYDsLKrPP85HcI3x
	 HbwFFtQSKY5Vk2xfPIEO6OjtktHO1/WyL+ipIjOJ03S87Lcs2dzL2FoiAHN4Ej8Bd3
	 oQumQYXcZEthpfVXERsDvOLI41MRwvQ/H3fL6M70E4JngYxpc3hUsoTy7uMkrYY7Qa
	 xuOs6yCWFiqbeDAAuvw+xOZBK018HVCS/9wHqQShwRuVnfia09eucP1qWHp1INRgzX
	 CT4BMWhbmX5hsdp7cWvNUsHSC8AY82Am4CtYLoOjkVci/lWtLnl1bIec3mwd592iAS
	 kh5OJzM+1DXaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1951812D2;
	Fri, 21 Aug 2026 15:07:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE0F029B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D21F402A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyWSHLlAEfVi for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D020F403F1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 503748E150; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 619ddb7812893fdcb9179be760bb18f3cf57212b
X-Git-Newrev: 141a225c03da4ae0fe0f2aa2e0ace1545789b200
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.503748E150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dracut: update
 URLs
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/141a225c03da4ae0fe0f2aa2e0ace1545789b200
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Github repository has been renamed from dracut-ng to dracut. The
wiki still exists, but the actual documentation has been moved to
dracut-ng.github.io.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ec8c6e44874e4eefaf8b6f7c92464cec6db8c6ef)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/dracut/Config.in.host | 2 +-
 package/dracut/dracut.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 88dec969c3..af68728457 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -8,4 +8,4 @@ config BR2_PACKAGE_HOST_DRACUT
 	  dracut-ng is a drop-in replacement for the legacy
 	  dracut project.
 
-	  https://github.com/dracut-ng/dracut-ng/wiki
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bd24d49f4..0bf755319e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DRACUT_VERSION = 112
-DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
+DRACUT_SITE = $(call github,dracut-ng,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
