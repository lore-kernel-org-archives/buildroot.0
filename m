Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28DBC71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01E7407C7;
	Fri, 13 Jun 2025 21:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N96g7hSdU07G; Fri, 13 Jun 2025 21:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D9B40814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7D9B40814;
	Fri, 13 Jun 2025 21:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C47C151
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 790B740814
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9xgfcfnHsZR for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD041407C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD041407C7
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB677838A3; Fri, 13 Jun 2025 21:36:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 23:33:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7f3ea0e1a6f0598f04abbd30284bbab3a47cd47
X-Git-Newrev: 36b0bf1f29c392b8afb8479d31c8ec8bbfc08a15
X-Patchwork-Hint: ignore
Message-Id: <20250613213645.CB677838A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amazon-ecr-credential-helper: add
 LICENSE hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=36b0bf1f29c392b8afb8479d31c8ec8bbfc08a15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash has for the license file been missing since the package was
introduced in commit 9a9580622545 (package/amazon-ecr-credential-helper:
new package).

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index 6ebcd4e204..eaac8efe35 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,2 +1,3 @@
 # Localy computed
 sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
+sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
