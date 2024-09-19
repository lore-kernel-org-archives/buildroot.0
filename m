Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B428CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4632E432C5;
	Thu, 19 Sep 2024 09:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-ilEP4UnoOo; Thu, 19 Sep 2024 09:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81AB7432BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81AB7432BD;
	Thu, 19 Sep 2024 09:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5041BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2523B615BE
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EAhtbEKHs95 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CEC761228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEC761228
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A53483C6C; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6791f8c9ff5c6faf587e6cf36a12997a8b57f650
X-Git-Newrev: 034b4230e06ac11c5158d28a0190ea0c6f32820c
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.6A53483C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/flex: fix typo in
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=034b4230e06ac11c5158d28a0190ea0c6f32820c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 892d7d784ea9033e4109195a1985dbcc03a0000c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-build-make-it-possible-to-disable-the-build-of-the-d.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
index ffe30d367f..30a782ee9b 100644
--- a/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
+++ b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
@@ -4,7 +4,7 @@ Date: Fri, 29 Sep 2017 18:03:51 +0200
 Subject: [PATCH] build: make it possible to disable the build of the
  documentation
 
-When targetting embedded evices, the documentation is not needed.
+When targeting embedded devices, the documentation is not needed.
 
 Building the documentation default to whether the program is built.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
