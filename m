Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A99E77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5126083C;
	Mon,  9 Dec 2024 22:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rXw-2Eozncs; Mon,  9 Dec 2024 22:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FB560853
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43FB560853;
	Mon,  9 Dec 2024 22:42:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3456F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD20B80586
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thZ4seyUf72Z for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 076488058C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 076488058C
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 046AB86B5F; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10c218ea7805c0384cf28ab95350dcc2dd821f79
X-Git-Newrev: ee93f20f96b2f27ef4c512bf591f55ed4518b82a
X-Patchwork-Hint: ignore
Message-Id: <20241209224228.046AB86B5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-sgx-demos: fix 'available' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee93f20f96b2f27ef4c512bf591f55ed4518b82a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ti-sgx-demos/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-demos/Config.in b/package/ti-sgx-demos/Config.in
index ec7b8e6038..f45ccd8d01 100644
--- a/package/ti-sgx-demos/Config.in
+++ b/package/ti-sgx-demos/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TI_SGX_DEMOS
 	depends on BR2_PACKAGE_TI_SGX_UM
 	help
 	  These SGX powervr demo applications from Imagination
-	  Technologies are availabe as binaries only.  The binaries
+	  Technologies are available as binaries only.  The binaries
 	  are compiled for the TI SGX implementation.
 
 	  https://git.ti.com/cgit/graphics/img-pvr-sdk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
