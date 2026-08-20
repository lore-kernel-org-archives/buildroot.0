Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B3C5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13FB181934;
	Fri, 21 Aug 2026 15:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LahVf3Cp4zfL; Fri, 21 Aug 2026 15:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325108;
	bh=hy5YP6V91MBK2vnkg9FX7MbnTpRcYW40zt4AfVfqUq8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p9TaVt+U9lcnf5/QeJbmzolFX2f5TlpDcbZvnegKcVRyNsV1uRIo9Wp+L7igVDIPw
	 j1Iz19ENtzKsdzAvfBerrhdX1PIR6Y7PkpKn6AMuKIBz9ITg0irNeHQf98hSAP13W/
	 bXPfzCEkfHZCNnmXAh7N8NmXPqjJDVWyA/nibrc0VD82KH69fziBq972Z9VnZA/L4J
	 tBca/76aeKlWldi+/KX20rQTWkq+LuNqc5wO2NmWdswn31t7IlbYx4jqqZ5bru8xAY
	 5LnSH8EAnz4HWk7jqbvarl2/XoulBRt3Pyd1xb4icKBWekJVoEIcjksP+/ndA+MRiJ
	 JmmjGaKrEuMGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283338195D;
	Fri, 21 Aug 2026 15:11:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 401E31F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206D560884
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxS4sH7YqbUQ for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F826063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C804B8E132; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:54:27 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 177f5fbb29106b7611e389a030f9bcb5030e36a6
X-Git-Newrev: f8255ba5a3a77c3bc593bd4a78a0e68e374c4493
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.C804B8E132@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgee: update
 project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8255ba5a3a77c3bc593bd4a78a0e68e374c4493
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3eda260ff4141fdc536574309f5d867c3638d231)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgee/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgee/Config.in b/package/libgee/Config.in
index cb33ec9ec2..b86a07d0fb 100644
--- a/package/libgee/Config.in
+++ b/package/libgee/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBGEE
 	  Libgee is an utility library providing GObject-based
 	  interfaces and classes for commonly used data structures.
 
-	  https://wiki.gnome.org/Projects/Libgee
+	  https://gitlab.gnome.org/GNOME/libgee
 
 comment "libgee needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
