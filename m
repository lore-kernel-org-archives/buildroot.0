Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB32E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A8F84942;
	Thu, 12 Dec 2024 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-QpP6hbz59y; Thu, 12 Dec 2024 21:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0BB8489B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0BB8489B;
	Thu, 12 Dec 2024 21:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4464D115C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9331241981
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvn_PGKXIxMY for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2F241983
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C2F241983
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 698F586ED2; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:07:18 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 50a362afac9b2c2c3db691b4309c28faefef03fe
X-Git-Newrev: e61b83c61bbcbea74c37ff7aae990fefdc64ec86
X-Patchwork-Hint: ignore
Message-Id: <20241212213337.698F586ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/open2300: fix
 'locally' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=e61b83c61bbcbea74c37ff7aae990fefdc64ec86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f76956eac4ad711640993e7a3e1f1e7bc33de014)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open2300/open2300.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
index f8b1150694..94be6a47ea 100644
--- a/package/open2300/open2300.hash
+++ b/package/open2300/open2300.hash
@@ -1,4 +1,4 @@
-# Localy computed
+# Locally computed
 sha256  ffa7f8d35b16abfbf5e52285cb21f2a7fc6afb901abb40c0c80eef9d23d08aab  open2300-f21982e0b1f8321561e5ad1668307fde97700e1b.tar.gz
 
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
