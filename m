Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04911C5DF6D
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FCD60E05;
	Sat, 15 Aug 2026 09:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jniYWL0RJtmo; Sat, 15 Aug 2026 09:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C832E60DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785667;
	bh=zxmm7oc+fedGa5/k7Qp4KhvZpJU64861W5rS6wvFR8Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XPvqGfVeakDClxOjRO3iO8f4ZxK1CfTjNDzu4wUEMVGsbnPfpUlm0rCLKERLhzccK
	 kUO6e8N1aZKMGv2TIgSVfP9ztQ7JEQmyOBP19KLCgtrzMf8f7GJVdY4LdpO/DZuCos
	 5svQDwo9BVAGwvQ6ylwfrDP++Xb1MjSc3OZaarTEPA8c/+lSSsZsLGsdq5HWvWHG+z
	 QGhd9QB/pINXuVzwuJW+Qd3/DsyMzkDUe2ZrhEwXJho7VErTRXK6Kd2fHr++dDMTRy
	 2lWKd/rsUteXz5JkSv4f92BQeG7GF0iBE11nJfVA1R5FLkNgxJcgMyGP5CXrUY5HLF
	 WSCbEjwFnt6Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C832E60DE6;
	Sat, 15 Aug 2026 09:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA7A392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C18409CF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pM2vIIWhP1fy for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97EC8409A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EC8409A0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F94884E1; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15c4abfa524d236e3b2b65fdabdd7ff0050baaf2
X-Git-Newrev: 3eda260ff4141fdc536574309f5d867c3638d231
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.25F94884E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgee: update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3eda260ff4141fdc536574309f5d867c3638d231
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
