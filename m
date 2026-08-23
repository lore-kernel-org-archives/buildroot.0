Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC4BC5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10BA880AA3;
	Sun, 23 Aug 2026 19:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3Qr9KHHS7Ry; Sun, 23 Aug 2026 19:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787514152;
	bh=v7yWKg9BrHXX1HS2sI8vUKh+xsTJpj4l8onwh8XsrJU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q5xShtCZ5rf7KhT3fzr+x8iBGq1o5Fdx/C3I4ehQvodxNimPzNhNXjIco+rR1yrx2
	 6VmmT9yUQ+ZhGHVcuWd4/ZPxtjvUjmbBNsXV12nO4SzacGDLb/3kizzSY7+B+1QQn2
	 o6MMSlOVKBsXZzy63h1YkeKtmuGpkH6CDrumG3t3VAlwmIgLJANmHKWt1Pfas1zNOL
	 mU3jURZ4btIgWj3tFxja4swKp7dDr+4u3dbPtaa0Tsrm+ZYoJngxSPaTh2ZR1vybLv
	 gqUb7c9MsjPWp91a+9y1ePP/u4uiyP508oOFzrR52kEvx9qfh4vE9FTf/KylHJBje8
	 362+Ll8ockQKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E21809EB;
	Sun, 23 Aug 2026 19:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C36E6336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA28D60622
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXUJl-AefLpM for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D9666061B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 774198ED9B; Sun, 23 Aug 2026 19:41:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 21:18:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 667335cd187150c5afebac2a278f92d5b6ef744d
X-Git-Newrev: 88351e5f9ba3508a99e858ee3bd117c8420b385c
X-Patchwork-Hint: ignore
Message-Id: <20260823194135.774198ED9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email for Christopher
 Obbard
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88351e5f9ba3508a99e858ee3bd117c8420b385c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update my email address.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4e296abc2..5eb438906f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -712,7 +712,7 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
-N:	Christopher Obbard <obbardc@gmail.com>
+N:	Christopher Obbard <chris.obbard@oss.qualcomm.com>
 F:	package/dtui/
 
 N:	Colin Foster <colin.foster@in-advantage.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
