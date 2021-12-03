Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60792C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2F240363;
	Fri,  3 Dec 2021 16:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlRb0J2cQqwp; Fri,  3 Dec 2021 16:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1782240263;
	Fri,  3 Dec 2021 16:45:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 419771BF589
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55BF4092D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPqswKfDRwhu for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B28D40913
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 08DA692406; Fri,  3 Dec 2021 16:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 17:42:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87d13f679ab47fa795d42ad1da74b333b595f1d0
X-Git-Newrev: 8d6b8f592c9662b77c4b10adbfd4af1f87e805ba
X-Patchwork-Hint: ignore
Message-Id: <20211203164019.08DA692406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d6b8f592c9662b77c4b10adbfd4af1f87e805ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
45bce2575d8dd3f08fbf0870f7cfc2fbd3c7a3e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse3/libfuse3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 767382271e..1dbe918c5b 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -19,7 +19,7 @@ LIBFUSE3_CONF_OPTS = \
 	-Dtests=false
 
 define LIBFUSE3_DEVICES
-	/dev/fuse  c  666  0  0  10  229  0  0  -
+	/dev/fuse c 666 0 0 10 229 0 0 -
 endef
 
 define LIBFUSE3_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
