Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C5CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8994190E;
	Thu, 19 Sep 2024 09:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJnc1MLTnxr3; Thu, 19 Sep 2024 09:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 799FA41902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 799FA41902;
	Thu, 19 Sep 2024 09:17:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 189471BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFDA741524
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jt-yB4ovHQUx for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA1E641449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA1E641449
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A16537FC62; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 56e5bc2ca40b7e2037a6ac4595ddc0402b531e2e
X-Git-Newrev: 317e216a2f1486f034d9cadf6d2910c27d25ada9
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.A16537FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/genpart: fix
 typos and grammar in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=317e216a2f1486f034d9cadf6d2910c27d25ada9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: also fix grammar]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e009783505e80e80a49f57a0abd9aa2b417063bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genpart/0001-fix-return-code.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genpart/0001-fix-return-code.patch b/package/genpart/0001-fix-return-code.patch
index ec18c82f8c..6ecf0d9bc2 100644
--- a/package/genpart/0001-fix-return-code.patch
+++ b/package/genpart/0001-fix-return-code.patch
@@ -1,7 +1,7 @@
-genpart: return 0 if partition writen OK, with no do_magic
+genpart: return 0 if partition written OK, with no do_magic
 
-If do_magic is false, we don't won't write the 0xaa55 magic.
-However, if we succesfully wrote the partition entry, we still
+If do_magic is false, we won't write the 0xaa55 magic.
+However, if we successfully wrote the partition entry, we still
 want to return 0 to indicate success.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
