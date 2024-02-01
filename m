Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833BEC47DDB
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 11:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 101254044A;
	Thu,  1 Feb 2024 11:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101254044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0noTd5PQ90p; Thu,  1 Feb 2024 11:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B9C40ACB;
	Thu,  1 Feb 2024 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B9C40ACB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34AC41BF2AB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD0E81A50
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDD0E81A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lspBJPEUzeC for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E4A81776
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E4A81776
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05719866FC; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Feb 2024 11:59:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75e7c7ba8cddb2644350a7f59c943f5c4e99b3b0
X-Git-Newrev: 3ffb716da34a4c2c87fe47f6cce7b718d5217354
X-Patchwork-Hint: ignore
Message-Id: <20240201110345.05719866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpsl: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ffb716da34a4c2c87fe47f6cce7b718d5217354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 863131cad9fec0a54a4b4281f5fa3cd5ed8ea462 forgot to update hash of
COPYING (update in year with:
https://github.com/rockdaboot/libpsl/commit/80c17cc237861318a680ae170995d44a11029dad)

Fixes:
 - http://autobuild.buildroot.org/results/2b09ca88a08fdba8ca75153688ed5dd9362c7520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpsl/libpsl.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index d800ba6a77..caf760c496 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -2,5 +2,5 @@
 sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
 
 # Hashes for license files:
-sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
+sha256  322392e6001b2b3b0fca705dc9f11f26e12441188ecde50eb1d22909980b2925  COPYING
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
