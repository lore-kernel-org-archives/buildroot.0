Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1548548A;
	Fri, 10 Dec 2021 19:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2AQ6_MV61oi; Fri, 10 Dec 2021 19:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA4B885439;
	Fri, 10 Dec 2021 19:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 213E61C1162
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98037426E4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dypKPV6stcVL for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B78426E6
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 43F228251C; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 19:34:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83bf1790c13a6a6ba4e4008f685d7b824ed15079
X-Git-Newrev: 158a04a0a9ca479146f13828516e77136b903095
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.43F228251C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: correct typo in help message
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

commit: https://git.buildroot.net/buildroot/commit/?id=158a04a0a9ca479146f13828516e77136b903095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5e49e69442..eb05f25a0b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -391,7 +391,7 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
