Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2196C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71925605C3;
	Fri, 28 Feb 2025 16:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKQdJW91gj2D; Fri, 28 Feb 2025 16:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708C16FC8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708C16FC8A;
	Fri, 28 Feb 2025 16:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 110C068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC6342499
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYB3qjTedCSy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FEA419B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39FEA419B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E6027FD77; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd1f401ecda59758a1a9dea5dbcea64c487d736c
X-Git-Newrev: ba08a37af572397aef2b38de8f45381d12f7f441
X-Patchwork-Hint: ignore
Message-Id: <20250228162935.2E6027FD77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-utils: fix
 'necessary' and 'dictionary' typos
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
