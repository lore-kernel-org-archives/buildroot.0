Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E24C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 09:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C0861448;
	Mon, 14 Jul 2025 09:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMq_h_5pj4W8; Mon, 14 Jul 2025 09:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51BC61421
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51BC61421;
	Mon, 14 Jul 2025 09:46:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D21AF7
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3DE40B7A
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-8Xz8YfAawA for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B508940B4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B508940B4B
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5197864F1; Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 11:18:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9189e74ef87af5b26fe94cac8096b4883ace8f99
X-Git-Newrev: 8d1d851d78269383a548e9440146d4f9d16f5e29
X-Patchwork-Hint: ignore
Message-Id: <20250714094627.A5197864F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: update
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d1d851d78269383a548e9440146d4f9d16f5e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minimum python version is now 3.9, but also it's not really relevant to
mention this in the package description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
