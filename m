Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4BACF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 072EC41AA5;
	Sat, 12 Oct 2024 14:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoVwX-pXPMAN; Sat, 12 Oct 2024 14:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AA2C41A8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA2C41A8A;
	Sat, 12 Oct 2024 14:06:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD891BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE47820A4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CytQoaU9VNcv for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959FB820A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 959FB820A3
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91CE181255; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:13 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 480970866479a758500542eea8d92a8683396bff
X-Git-Newrev: 03824b9a6d62e6d62262ac6eaf79b20b49328e6e
X-Patchwork-Hint: ignore
Message-Id: <20241012140530.91CE181255@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 support/misc/Buildroot.cmake: fix 'after all' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=03824b9a6d62e6d62262ac6eaf79b20b49328e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8f0872fee36fd2370359946aa088509a88675955)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Buildroot.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
index 761b6d7ae2..3f8cd22f7d 100644
--- a/support/misc/Buildroot.cmake
+++ b/support/misc/Buildroot.cmake
@@ -1,4 +1,4 @@
-# Impersonate a Linux system. Afterall, that's what we are...
+# Impersonate a Linux system. After all, that's what we are...
 set(CMAKE_SYSTEM_NAME Linux)
 set(CMAKE_SYSTEM ${CMAKE_SYSTEM_NAME})
 include(Platform/Linux)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
