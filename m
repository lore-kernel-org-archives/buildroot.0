Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF5BE77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F9160AC2;
	Mon,  9 Dec 2024 22:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW6g1X-Tn5DB; Mon,  9 Dec 2024 22:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A35E60A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A35E60A65;
	Mon,  9 Dec 2024 22:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C16786F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB88140278
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYY72MYZ6Jqz for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C622B4028D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C622B4028D
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1CF886B5C; Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd1f401ecda59758a1a9dea5dbcea64c487d736c
X-Git-Newrev: ba08a37af572397aef2b38de8f45381d12f7f441
X-Patchwork-Hint: ignore
Message-Id: <20241209224227.C1CF886B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: fix 'necessary' and
 'dictionary' typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba08a37af572397aef2b38de8f45381d12f7f441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e8e508e334..a0dbeac18e 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -75,7 +75,7 @@ extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
 
 # extractor-system-dependency(filename): returns the name of the tool
 # needed to extract 'filename', and is meant to be used with
-# DL_TOOLS_DEPENDENCIES, in order to check that the necesary tool is
+# DL_TOOLS_DEPENDENCIES, in order to check that the necessary tool is
 # provided by the system Buildroot runs on.
 #
 # $(firstword) is used here because the extractor can have arguments,
@@ -99,7 +99,7 @@ define yesno-to-bool
 endef
 
 # json-info -- return package or filesystem metadata formatted as an entry
-#              of a JSON dictionnary
+#              of a JSON dictionary
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
