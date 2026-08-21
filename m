Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E40C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8334B81315;
	Fri, 21 Aug 2026 15:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRlZ6ZKfY1yw; Fri, 21 Aug 2026 15:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324882;
	bh=eq7FeQRzsdN2pbARfAzdqYAdxEp8i90Y4tG2YxN2xUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fS1Na5ExptrIsfHB9v3hj1GIxYPxDR2zLB0IK7XVS//36ADT4a5vwpfp9YBCACxnG
	 b/WKJGY0iTLK9jEOwhv8ZlobhZVE7A6Lm+h/afUrUIuVAnTxyXghSyhUe/qHcGf0fM
	 b6oQN8haG2QMYyq3gsYW3IGvCpxfcjSiP8oQD3tvUTIOmwXLHJpuQQPHnhGl6VTqKh
	 /sRiFrRJZgqUtzGrrwYwt0oM6j9Z/jnh1dKi6YLF7ujIz10IG5SLs5ZNOeZpbZXzu6
	 IKIh02nNCu5WJbyGM/SzrP1OrDwN+E2GJFsvBN0IddDetRalcdXhlInTDwPT3xYWGw
	 nX+rIN88TXCCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3134781231;
	Fri, 21 Aug 2026 15:08:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F06612017
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF730403F1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L_FohY93s38 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ACA240415
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEE6D8E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d1614f91bd82fbd463b9ad72bdbf3f016ccdc119
X-Git-Newrev: 29799095b02617ce79a56b0998285504705f21d5
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.AEE6D8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsoup3: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29799095b02617ce79a56b0998285504705f21d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47464cfbe1370cfe0717ea002edc9fa60a889dea)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libsoup3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup3/Config.in b/package/libsoup3/Config.in
index 504cc3bd2b..d3a18ff06c 100644
--- a/package/libsoup3/Config.in
+++ b/package/libsoup3/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSOUP3
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  https://wiki.gnome.org/Projects/libsoup
+	  https://gitlab.gnome.org/GNOME/libsoup
 
 if BR2_PACKAGE_LIBSOUP3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
