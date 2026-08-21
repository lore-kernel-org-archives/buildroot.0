Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C9BC5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F21281368;
	Fri, 21 Aug 2026 15:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0foqE37u97lW; Fri, 21 Aug 2026 15:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324886;
	bh=uDOYFLA8a05AiAcZCWVnVzTi08ugDXM9kE7S6K4Na5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aSOJ3UBsT3k9L2iRkhTd/8rdVYnMVhSnoQjADCFpNF/8x0VlQU8WAYdd3TmNtPwk1
	 CCULBpGb3hngfXpP4+ySpkBJoR3m7VP0ypD3f8DGfCtMueW6N5UmPyq9Mj6uzOyBM0
	 3bcWw1/ggdlES62FDjSIyr9rvRtMpFL23D2hqSS6FHYn6pcO2q/WIOC0hZwD54Xxpg
	 ulBSy7nAIJCWIMuwQsJaH5dkwQD8lHmvs3vyJjQEIgxzzqV8ykO7nIsa//vvst0m6u
	 o7g9Md82OD8NF431wh7dvvaxfPOU2b8ek12XoYx5GItL8/n/uf/jZAY/ZLq7w53o7e
	 FY+Ray+fGQGkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22327811F5;
	Fri, 21 Aug 2026 15:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 065582BAA
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB2A3402A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ1KhgW6zc6Q for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFC74040D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 822868E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 770debff092fac44addcbe0efd7abda6bec454f8
X-Git-Newrev: 957d94aee51acc26b58eee903cbcf77e4b2562eb
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.822868E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgee: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/957d94aee51acc26b58eee903cbcf77e4b2562eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
