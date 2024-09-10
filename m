Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA476EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB885608E8;
	Tue, 10 Sep 2024 20:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHioq2B8SIrX; Tue, 10 Sep 2024 20:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4460A3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A4460A3A;
	Tue, 10 Sep 2024 20:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 885601BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74B17409F2
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsIcdKwplCb0 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80345408C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80345408C8
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B3E386F54; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fca562ee88b07472cdb68e166ebc7f576d1c6f1
X-Git-Newrev: c88a61759981562a85cb6a45b9db945ef6ccfa1e
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.6B3E386F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 docs/manual/adding-packages-linux-kernel-spec-infra.adoc: fix information
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c88a61759981562a85cb6a45b9db945ef6ccfa1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plural of information is also information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-linux-kernel-spec-infra.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
index 3b3daebf55..9fd3b566a5 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
@@ -107,7 +107,7 @@ Let's look at an example on how to add a new Linux extension +foo+.
 First, create the package +foo+ that provides the extension: this
 package is a standard package; see the previous chapters on how to
 create such a package. This package is in charge of downloading the
-sources archive, checking the hash, defining the licence informations
+sources archive, checking the hash, defining the licence information
 and building user space tools if any.
 
 Then create the 'Linux extension' proper: create a new menu entry in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
