Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A09CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDBAF41282;
	Thu, 19 Sep 2024 09:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOm4ReR9_wUX; Thu, 19 Sep 2024 09:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF4CB4129C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF4CB4129C;
	Thu, 19 Sep 2024 09:15:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E49351BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29A94056D
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE8eNONRmaaX for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB6A40328
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB6A40328
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8AFB83C6C; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:10 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 7fab58374d0349769d01ab174bf00e01cf11115d
X-Git-Newrev: f0027556593aacb12136ff572b9b54d2a4af9d02
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.A8AFB83C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 docs/manual/migrating.adoc: fix accommodate typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0027556593aacb12136ff572b9b54d2a4af9d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Accommodate is with double-m.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eba958eb5dcb5065e932fb8740299390ba3bff28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/migrating.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index d99c779799..69bf0dc221 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -143,7 +143,7 @@ The download backends have been extended in various ways.
   fields (`devmajor` and `devminor`), which has an impact in the metadata
   stored in the archives (but the content of files is not affected).
 
-To accomodate those changes, the archive suffix has been updated or
+To accommodate those changes, the archive suffix has been updated or
 added:
 
 * for git: +-git4+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
