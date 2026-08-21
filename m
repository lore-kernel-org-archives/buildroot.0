Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9425C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94612812D5;
	Fri, 21 Aug 2026 15:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV8yeujt27X1; Fri, 21 Aug 2026 15:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324874;
	bh=d5orwN1r52zsDfjoIPXo8CEbJouiOIgUxcPckndkWg0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZBufe9j6qwN6o4HUh6/13pMNmp10cf6t373OTgVagsgqO5gX/JuKfBb7jZ0avvW9l
	 r6AI6fJFLIHsqOyNvXV93kqAP/AltboOzN7t39Tc7UB3YQwKE6jOKShA05d7s0w6rG
	 6O/Xpo1r6R1iV9NnZn6uGoN/wBh1+hYIdH392MXK2OVOK88yO0v+0wEjdNKIhKNVMm
	 l2+Mb5sxx5fjn+T8BVExH1a+f6VzxtvkTU2m8LYb02T1VMa0fjqfv8A9uHMqyftJQb
	 VIHOBphlMHBg6RgKCDDNvQY2DiXItjxn61/zJhCqll1CQmw55SvSnx/66U6knJmnyF
	 as1U1gU2YCGYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9510681304;
	Fri, 21 Aug 2026 15:07:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C6529B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B735B402A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk3dwK41ODSG for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F7F4040E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B3BC8E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 957d94aee51acc26b58eee903cbcf77e4b2562eb
X-Git-Newrev: ce99719fb3c2b764b44d9e70f539c73cda483495
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.8B3BC8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgudev: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce99719fb3c2b764b44d9e70f539c73cda483495
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d7f835a4cb96c8e1f084ad0950e28df6bf11bce5)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgudev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index 21606ac4cc..46fe0bad97 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBGUDEV
 	  It's now a project on its own. Required for building some
 	  programs that use udev, when using systemd.
 
-	  https://wiki.gnome.org/Projects/libgudev
+	  https://gitlab.gnome.org/GNOME/libgudev
 
 comment "libgudev needs udev /dev handling and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
