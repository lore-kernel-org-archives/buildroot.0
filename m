Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC6ACE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ABAE41821;
	Thu, 19 Sep 2024 09:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsgcpoj6sq0V; Thu, 19 Sep 2024 09:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B270B41885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B270B41885;
	Thu, 19 Sep 2024 09:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926B11BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D26460606
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EHuCjD16XVd for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48250615CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48250615CD
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4439383C6C; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:04 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 460200bbe2d3759061b262028dacb6f8c1d29dec
X-Git-Newrev: 2113de53938a83d151bc9c119303920c8f027e7e
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.4439383C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 docs/manual/adding-packages-asciidoc.adoc: fix resources typo in example
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

commit: https://git.buildroot.net/buildroot/commit/?id=2113de53938a83d151bc9c119303920c8f027e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

As FOO_RESOURCES hints, the correct spelling is resources so use that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5fca562ee88b07472cdb68e166ebc7f576d1c6f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-asciidoc.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-asciidoc.adoc b/docs/manual/adding-packages-asciidoc.adoc
index d68978b1cb..c34b9ffc2a 100644
--- a/docs/manual/adding-packages-asciidoc.adoc
+++ b/docs/manual/adding-packages-asciidoc.adoc
@@ -112,7 +112,7 @@ Here is a complete example that uses all variables and all hooks:
 05: ################################################################################
 06:
 07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
-08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
+08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/resources))
 09:
 10: FOO_TOC_DEPTH = 2
 11: FOO_TOC_DEPTH_HTML = 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
