Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D28C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC005813E2;
	Sat,  8 Jan 2022 15:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ka3Hpx0qOXr9; Sat,  8 Jan 2022 15:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A888138E;
	Sat,  8 Jan 2022 15:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 015191BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE7254093F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIUp-O3Rf7jY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0810540946
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 927BB82AB6; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:49:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6afe7b1da38df60792302af82cd1069972c8613f
X-Git-Newrev: 027f172c8a8ef5784bd0e0650b3e9778a4040671
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.927BB82AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waf: bump version to 2.0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=027f172c8a8ef5784bd0e0650b3e9778a4040671
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://gitlab.com/ita1024/waf/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index e9d387e7d0..21f47f76d8 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  494ada411468129ed229f946ecec3048400e320b  waf-2.0.22
-sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf-2.0.22
+sha1  89b24f9c19328339c2c8103796755474b66f3a8d  waf-2.0.23
+sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf-2.0.23
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf
+sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 5cc0dc3714..2b1808ace4 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.22
+WAF_VERSION = 2.0.23
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
