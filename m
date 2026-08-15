Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CCAC5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E50760640;
	Sat, 15 Aug 2026 09:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoqWIRR9Eofc; Sat, 15 Aug 2026 09:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513826064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785663;
	bh=wm7e8KOUgkIzT2BCeWK3FkBMENS4bMOc+7ToZZ6vaUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8lMZkeSwrN6nHlpEhKHpjbbO27p0r4j0Y2kCHv78beTIfzsDosPvvKxytxoQlVNR
	 F5PpJ/dWtYZ/NCFiYXYxKx63+6tYbHo+vGJlwfC9YHpPt1j8QO+jaFMmbEdsgBpZRn
	 T2BRJc97+4Th74emGpY6UV33hgW1hWQn+LCgqBsqDjJ5UfF8NtlpPhr7popB0K077d
	 dV22G49BfDKUvv1b3CITRYvypnOT3N185Z7wRx0nEf+Lib8/prXSDoQ620oRtjg6s+
	 FT2duc2PsJWgT+9zRDrkqG5ubsczImy6DIfbzyu/iwWT878CXmWL/aeWiHXsbEcGis
	 8pdz1uO2SITKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513826064F;
	Sat, 15 Aug 2026 09:21:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 649FD139A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 543F160640
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLDNTRRzjD_n for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6F16064F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A6F16064F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34BC288454; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eda260ff4141fdc536574309f5d867c3638d231
X-Git-Newrev: d7f835a4cb96c8e1f084ad0950e28df6bf11bce5
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.34BC288454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgudev: update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7f835a4cb96c8e1f084ad0950e28df6bf11bce5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
