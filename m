Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E3FCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7F5615A5;
	Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpfS8ue2KLPT; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0BD6157D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851796;
	bh=glgKyUCEhafZey2tSkvoY6lAbHaf6UxosFFL7jCKx4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U8uxcWwsNYxkI80fSBm+tX/XW54NlYExaMG8WtlAGfRUTNQKcFV+ZUh63naLKKeNJ
	 ydo66BNjNr5knjS+7Ig/Z/ZMNAUkdq6Cf+hQAzLgf6IkTE4Gt/9mTW9iDJxc3S3Zcx
	 jOJDw2GZUzyHi4X3yojXUGujStYMaJbdzD50cyFMghZ4Tq+1vvYhERgknuG86UOh1x
	 I73LgvHjVzTDyPFYfOrQsR5IYplItEU08SZ6ziB8KoJg8l8JOu9S6JtkbczkDoELoZ
	 srT3lEymQ0HxO5GznJ6QjQhFZF1+/wwJXqDOTEJZLc+k3XIg0mI8aiKl9UvMs6ZIuq
	 t3u4jPY8pBsfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0BD6157D;
	Fri, 15 May 2026 13:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDBEF36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E036F61587
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5BZNkBdpYIL for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EBA96156C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EBA96156C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7623086354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:28:24 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c5a0a71d7c05feda417b146e8679d7e3a77d7e59
X-Git-Newrev: 292e1e65d7122559f2a1ac4f1ef07c51b32d0025
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.7623086354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: Update email
 for Eugen Hristev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/292e1e65d7122559f2a1ac4f1ef07c51b32d0025
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Replace old bouncing email address.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit bd9e30470f66fc491b7a4cef2b0c803e87095b71)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 482b0f3d68..76fbbe04ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -961,7 +961,7 @@ F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
 
-N:	Eugen Hristev <eugen.hristev@microchip.com>
+N:	Eugen Hristev <ehristev@kernel.org>
 F:	board/atmel/readme.txt
 F:	board/microchip/sama7g5ek/
 F:	configs/microchip_sama7g5ek*
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
