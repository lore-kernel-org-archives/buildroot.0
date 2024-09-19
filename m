Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20908CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D40AC433A2;
	Thu, 19 Sep 2024 09:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwT_ibgngt46; Thu, 19 Sep 2024 09:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D1E4172F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D1E4172F;
	Thu, 19 Sep 2024 09:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594571BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0489D849D6
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v_LGmLkE0v5 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18FA84A06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D18FA84A06
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF08283C66; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:05:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6c73461305321cdb75412c0ce1dc2103412ae615
X-Git-Newrev: cc56062e38c29def4c755c0f4e64296d9e8f9993
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.CF08283C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/gobject-introspection: fix altogether typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc56062e38c29def4c755c0f4e64296d9e8f9993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6d6d7bfe2333afdd4f34c2d54f27e34fc3c6b9ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/0001-disable-tests.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index 8de216c039..a39f51617b 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] disable tests
 
 If introspection data on the host is not built, meson throws the error:
 "Unknown variable "typelibs". Because tests are not required, removing
-the subdir tests alltogether fixes this issue.
+the subdir tests altogether fixes this issue.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
