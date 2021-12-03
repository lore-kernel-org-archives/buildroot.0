Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B10C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B33D831CB;
	Fri,  3 Dec 2021 16:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ol4L_MeWp9dg; Fri,  3 Dec 2021 16:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A49830FB;
	Fri,  3 Dec 2021 16:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFB61C1148
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40341830FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXvEw13-0rAX for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF2283103
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F157892404; Fri,  3 Dec 2021 16:40:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 17:42:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9bd2b8685ee9cbc6b00e0aa684978fe5f6ca2eb
X-Git-Newrev: 87d13f679ab47fa795d42ad1da74b333b595f1d0
X-Patchwork-Hint: ignore
Message-Id: <20211203164018.F157892404@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=87d13f679ab47fa795d42ad1da74b333b595f1d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
ea62ff85b59aa1ff7757787061eb451b4b4780df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 6dce641f7f..723060931f 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -38,7 +38,7 @@ define LIBFUSE_INSTALL_TARGET_CMDS
 endef
 
 define LIBFUSE_DEVICES
-	/dev/fuse  c  666  0  0  10  229  0  0  -
+	/dev/fuse c 666 0 0 10 229 0 0 -
 endef
 
 define LIBFUSE_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
