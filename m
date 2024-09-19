Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1B3CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 107FB412A2;
	Thu, 19 Sep 2024 09:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-iV4UeCp8jD; Thu, 19 Sep 2024 09:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD13141471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD13141471;
	Thu, 19 Sep 2024 09:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E93FB1BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF7F84987
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vwo2a3KLXteu for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F26384709
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F26384709
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A5817FF33; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:14 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 04d64ab6d563a30cee48318c4a070f6aaab5f72c
X-Git-Newrev: 0d56cfabf462b7d90a8aa15549d9e196da3741b5
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.0A5817FF33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/avahi: fix
 appropriate typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d56cfabf462b7d90a8aa15549d9e196da3741b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fcb823ffdcfc3d89503f859a1042a56ad5d47f46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/0002-remove-imp-from-py-compile.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avahi/0002-remove-imp-from-py-compile.patch b/package/avahi/0002-remove-imp-from-py-compile.patch
index 37534a3f7a..ba92275206 100644
--- a/package/avahi/0002-remove-imp-from-py-compile.patch
+++ b/package/avahi/0002-remove-imp-from-py-compile.patch
@@ -1,10 +1,10 @@
 Remove optional imp python module dependency.
 
 Upstream already removed py-compile entirely in their git repository,
-so the patch is not appropiate for upstream.
+so the patch is not appropriate for upstream.
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: not appropiate
+Upstream: not appropriate
 
 diff -Nur avahi-0.8.orig/py-compile avahi-0.8/py-compile
 --- avahi-0.8.orig/py-compile	2020-02-18 07:58:21.192417644 +0100
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
