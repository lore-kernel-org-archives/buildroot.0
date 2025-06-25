Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDA4C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB83E41EFD;
	Wed, 25 Jun 2025 17:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjSFYErRvM8A; Wed, 25 Jun 2025 17:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D96CE41EF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96CE41EF8;
	Wed, 25 Jun 2025 17:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7021B154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62249417CB
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkhDOmqlv0fj for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A389740111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A389740111
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92357843B2; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:11:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72a47cd3a2f1cb8af0acc76e17b35076cd39abac
X-Git-Newrev: d1ea9a64e68960be7737e641c98c6990a06e72c0
X-Patchwork-Hint: ignore
Message-Id: <20250625171254.92357843B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: update homepage URL
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
Content-Type: multipart/mixed; boundary="===============3411849273305157701=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3411849273305157701==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d1ea9a64e68960be7737e641c98c6990a06e72c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current homepage URL leads to an HTTP 404 error.

Fix it by using the homepage URL currently mentioned in mupdf's git
repository.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mupdf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index 34c5e7d538..5c0a127a90 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_MUPDF
 	help
 	  MuPDF is a lightweight PDF, XPS, and E-book viewer.
 
-	  https://www.mupdf.com/index.html
+	  https://www.mupdf.com/
 
 comment "mupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4

--===============3411849273305157701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3411849273305157701==--
