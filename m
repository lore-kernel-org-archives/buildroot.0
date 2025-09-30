Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9F7CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42619614BF;
	Wed,  1 Oct 2025 20:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNOp4Zlf2CGA; Wed,  1 Oct 2025 20:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58A6614B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D58A6614B9;
	Wed,  1 Oct 2025 20:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B83ED72
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 797AE411F9
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgAcEUgMSs5g for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14762411EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14762411EE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04B24866FC; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:19:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c44ab86026012c12207d2aef0fc8149d03654a09
X-Git-Newrev: 3072f0ae883a5bd879ed99d173a9bbbac9a178d9
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.04B24866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual/getting: fix
 dead link
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3548376170623329398=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3548376170623329398==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3072f0ae883a5bd879ed99d173a9bbbac9a178d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When searching for the official git repository in the documentation,
readers are forwarded to the buildroot website Download page with a link
pointing to buildroot.org/download, which returns a 404.

Fix the dead link by adding the missing .html suffix.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8845586fc6b33937d996e3300bdbfa558d053af2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/getting.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
index 51c97d5793..1437a3ccef 100644
--- a/docs/manual/getting.adoc
+++ b/docs/manual/getting.adoc
@@ -32,5 +32,5 @@ vagrant up
 
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
-http://buildroot.org/download[Download page] of the Buildroot website
+http://buildroot.org/download.html[Download page] of the Buildroot website
 for more details.

--===============3548376170623329398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3548376170623329398==--
