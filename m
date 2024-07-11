Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98473C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B485409C1;
	Thu, 11 Jul 2024 19:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5a1Y4y-oI6T; Thu, 11 Jul 2024 19:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7E941113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F7E941113;
	Thu, 11 Jul 2024 19:09:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD2141BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99E4041113
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIOCTnqDE05K for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D708409C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D708409C1
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1585B84F4B; Thu, 11 Jul 2024 19:09:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:09:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 609856858dba1aac850eab0bc768abbc3db48cfc
X-Git-Newrev: b57f48e131e94a2fafc31e3ca6cb3c11553a5930
X-Patchwork-Hint: ignore
Message-Id: <20240711190946.1585B84F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: update site url
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b57f48e131e94a2fafc31e3ca6cb3c11553a5930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Download URLs changed after hosting of the c-ares website changed
ownership:
https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/

This cannot be fixed upstream as github pages does not support .htaccess
files according to:
https://github.com/c-ares/c-ares.github.io/issues/2

Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-ares/c-ares.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c4441255a2..c2403b9c4c 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 C_ARES_VERSION = 1.27.0
-C_ARES_SITE = http://c-ares.haxx.se/download
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
