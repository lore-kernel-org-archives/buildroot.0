Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC5FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CF684C08;
	Sat,  8 Jun 2024 19:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QE7Y-mgqcsl; Sat,  8 Jun 2024 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E06F84C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E06F84C15;
	Sat,  8 Jun 2024 19:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17E6F1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 329FF4099C
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSM04aeWl8bs for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37970413B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37970413B5
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E93087C6F; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:07:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b7a7f87bc4537547a591217032b9ab5ee5fc1d4f
X-Git-Newrev: 76528f05b59d0c9cfdcbd490b6925cab08d12d1e
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.2E93087C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libnetfilter_log:
 use https:// reference for .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=76528f05b59d0c9cfdcbd490b6925cab08d12d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 07a44a24248cfee4b44296c2634ef8e218590d37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_log/libnetfilter_log.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_log/libnetfilter_log.hash b/package/libnetfilter_log/libnetfilter_log.hash
index 7589284f40..1e3cea0a80 100644
--- a/package/libnetfilter_log/libnetfilter_log.hash
+++ b/package/libnetfilter_log/libnetfilter_log.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_log/libnetfilter_log-1.0.2.tar.bz2.sha256sum
+# From https://www.netfilter.org/projects/libnetfilter_log/files/libnetfilter_log-1.0.2.tar.bz2.sha256sum
 sha256  e3f408575614d849e4726b45e90c7ebb0e6744b04859555a9ce6ec40744ffeea  libnetfilter_log-1.0.2.tar.bz2
 
 # Hash for license file:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
