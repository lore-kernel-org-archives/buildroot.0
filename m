Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98CC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 13:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C0F4606D3;
	Fri, 14 Mar 2025 13:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOULyv0cYbUp; Fri, 14 Mar 2025 13:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFABE60725
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFABE60725;
	Fri, 14 Mar 2025 13:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C315BEA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 13:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C5F260725
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 13:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsoDjYrWq-g0 for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 13:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB73F6058B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB73F6058B
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 13:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59FE187FBC; Fri, 14 Mar 2025 13:09:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 11:23:32 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b3a1b9f2ec4677ae5dc2f53ad4f3b2c24c9db1b8
X-Git-Newrev: 9af16eaf164836039da1105d47618cd54e8a6fd4
X-Patchwork-Hint: ignore
Message-Id: <20250314130934.59FE187FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/python-typing-extensions: update homepage link in help
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af16eaf164836039da1105d47618cd54e8a6fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Typing-extensions has moved to a separate repository, the previous
link now leads to a 404 page. The top level README in the previous
repository points at the new one, see:
https://github.com/python/typing/blob/fafcdeb724ac22ace877bee4485ed3b4c3edbbd8/README.md#repository-content

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a40ea829ab45d56434d0b53016a8c51f4c98d04a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-typing-extensions/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
index b59693282f..35b88f34f1 100644
--- a/package/python-typing-extensions/Config.in
+++ b/package/python-typing-extensions/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
 	help
 	  Backported and Experimental Type Hints for Python 3.5+.
 
-	  https://github.com/python/typing/blob/master/typing_extensions/README.rst
+	  https://github.com/python/typing_extensions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
