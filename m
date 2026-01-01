Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CBFEEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A8780C74;
	Thu,  1 Jan 2026 22:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyyN9T4xewBE; Thu,  1 Jan 2026 22:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393C680CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306696;
	bh=KikoPHkHZBIVbHPF2fvhgN4dY2qLQxozUiyHs1co+dA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h5FYIMPgjkOuGnA6rm4NIf5kdQSKsMLFxAzc42qdYBULKIlapxmzTrG7JfvwHGLIo
	 AV4rc0CQo26TfZQWwUcIneRhb+BH+iY+3jnOJEnjv8At8Asl4l3WGaJu1waTUzpWgr
	 QCAev7XR/zryvVZHtZpvxkgu9yXAYo9bIdYMKai4cr48PktgGFD8FoP78aXdKHQQgg
	 PWW/Daoxwe8D8l9MpA29Koz1nWaapVhrCFsze2YD3kh7s9/mzaKLt4cydPBdJJnJgl
	 xNXbv8M66lGYc59oR9O66Hn28hvsT2MObUhXKKP2l3dC8kjdpYip1avPXCfN5CAblb
	 Zp+miBTBPgK5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393C680CF8;
	Thu,  1 Jan 2026 22:31:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C733619D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C13084036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqeaxSm33U7y for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D143740387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D143740387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:31:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C03B285F71; Thu,  1 Jan 2026 22:31:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 23:31:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f319f8b312a31b998b8d087dbe20fdc476ddff5
X-Git-Newrev: f615dcb271aef7e7ca56ff83c8f88b78dcc7e906
X-Patchwork-Hint: ignore
Message-Id: <20260101223132.C03B285F71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdill: update project URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f615dcb271aef7e7ca56ff83c8f88b78dcc7e906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/sustrik/libdill/pull/228

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdill/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdill/Config.in b/package/libdill/Config.in
index 2376fc9698..ec649c6600 100644
--- a/package/libdill/Config.in
+++ b/package/libdill/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
 	  Libdill is a C library that makes writing structured
 	  concurrent programs easy.
 
-	  http://libdill.org
+	  https://sustrik.github.io/libdill/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
