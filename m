Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF7CAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 20:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19D983D96;
	Sat, 20 Sep 2025 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-R2G0gP_E96; Sat, 20 Sep 2025 20:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072BC83D9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 072BC83D9A;
	Sat, 20 Sep 2025 20:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D324D3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C35C41774
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siAAIO6GD8ae for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF7B4175D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDF7B4175D
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDE4A86017; Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 22:01:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 308735139901237bef012150f39ad815275f107a
X-Git-Newrev: 190c4823353db294e60773d3e4be6d51b1f08425
X-Patchwork-Hint: ignore
Message-Id: <20250920200259.BDE4A86017@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Dario Binacchi for cmocka
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

commit: https://git.buildroot.net/buildroot/commit/?id=190c4823353db294e60773d3e4be6d51b1f08425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f2a76334d..4c6ff40886 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -807,6 +807,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
+F:	package/cmocka/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
