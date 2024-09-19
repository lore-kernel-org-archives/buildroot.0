Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A16CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E78412A0;
	Thu, 19 Sep 2024 09:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P45sC1ooxZcF; Thu, 19 Sep 2024 09:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A4EA412C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A4EA412C2;
	Thu, 19 Sep 2024 09:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35FC61BF980
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AED960614
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu4eUvTTtfNr for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EEF61228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5EEF61228
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BACC83C6A; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:06 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 4124af66264ec5057ec359851c711bc69aa7469a
X-Git-Newrev: 8d22410d933a03bf071e96604cce4cdc0bec05f7
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.7BACC83C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d22410d933a03bf071e96604cce4cdc0bec05f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Plural of information is also information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c88a61759981562a85cb6a45b9db945ef6ccfa1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
