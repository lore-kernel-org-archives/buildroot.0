Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1613C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D666162A;
	Mon, 19 May 2025 11:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDD57UtUKYMk; Mon, 19 May 2025 11:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41AFB710D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41AFB710D9;
	Mon, 19 May 2025 11:04:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27F8CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA0D41E4F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn3rq8Vn88hn for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49B141E7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B49B141E7A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B323E82A2E; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 21:57:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f212f3897f808f64003d7365b116850d2d263d9
X-Git-Newrev: 5c8e6bbe038c8c703665e5e64d577a0b829bd3bd
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.B323E82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dlib: update links in
 description
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c8e6bbe038c8c703665e5e64d577a0b829bd3bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dlib/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dlib/Config.in b/package/dlib/Config.in
index 7862f8d074..4054ed8bae 100644
--- a/package/dlib/Config.in
+++ b/package/dlib/Config.in
@@ -8,7 +8,8 @@ config BR2_PACKAGE_DLIB
 	  algorithms and tools for creating complex software in C++ to
 	  solve real world problems.
 
-	  http://dlib.net
+	  https://dlib.net
+	  https://github.com/davisking/dlib
 
 comment "dlib needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
