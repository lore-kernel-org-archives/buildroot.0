Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB7BC5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7146860E3C;
	Sat, 15 Aug 2026 09:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4u1R5ZjFxD8B; Sat, 15 Aug 2026 09:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9112C60E34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785674;
	bh=r7ZqD33fR/oLAxAhWr1UjDATiCiz+fpdjTx42FBF3NU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U7vGbsbLKm5BvtzETSAFlE2iEyboRkRBTGs6ssLrjX7xP7KZhhAH2XYI5EH8iJWQV
	 4KT+aYohVCWt0o05lAng8TQZZfjiQa19LSNFnbmoP3SXVi0OyfsMboaqnk2Wbv+HOz
	 3qmTldlyU9vhs2Hrne0MvVeX6vXH6oo4SYM0czLqjeCTP/ig8L5PSYUJiavxjjyNzT
	 xkUKis4v5mL7/as/uoBGPxLebglegll8K94JMEZA4B2PL01fd7BMqbarnhL0kvEye5
	 cRi3Mw59WBllY1VfKt6dfQEj+WCph1fdQPyxwe7pTS7LWqimmiVzIcEzEEbZZ44cw4
	 OILAfufaxhDnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9112C60E34;
	Sat, 15 Aug 2026 09:21:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7FD392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9302D409A0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tT-fp97n_-TL for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE74F409C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE74F409C6
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BE5D883DC; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16c5253138499b083f7fa7b918e3fa18ff1720d5
X-Git-Newrev: 47464cfbe1370cfe0717ea002edc9fa60a889dea
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.6BE5D883DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: update project URL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47464cfbe1370cfe0717ea002edc9fa60a889dea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
