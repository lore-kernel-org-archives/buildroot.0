Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562CC83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A056085C;
	Thu, 17 Jul 2025 20:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xkbkCj1WlgX; Thu, 17 Jul 2025 20:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1F260AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1F260AC9;
	Thu, 17 Jul 2025 20:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0B21A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485B360B10
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnjwjOLtrO4x for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BE560ACA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44BE560ACA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4015B8670B; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 21:50:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 42902f741a25c171efb98530d6ef3247544d00dd
X-Git-Newrev: c244ef8fc7c34f0f27cf634382884b3a90b65451
X-Patchwork-Hint: ignore
Message-Id: <20250717202237.4015B8670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-typing-extensions: update description
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c244ef8fc7c34f0f27cf634382884b3a90b65451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Minimum python version is now 3.9, but also it's not really relevant to
mention this in the package description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8d1d851d78269383a548e9440146d4f9d16f5e29)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-typing-extensions/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
index 35b88f34f1..e1d46b60c0 100644
--- a/package/python-typing-extensions/Config.in
+++ b/package/python-typing-extensions/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
 	bool "python-typing-extensions"
 	help
-	  Backported and Experimental Type Hints for Python 3.5+.
+	  Backported and experimental type hints for Python.
 
 	  https://github.com/python/typing_extensions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
