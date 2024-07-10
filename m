Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CEAC3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 08:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067EA40944;
	Thu, 11 Jul 2024 08:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9l5NN22PFGGs; Thu, 11 Jul 2024 08:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A443240959
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A443240959;
	Thu, 11 Jul 2024 08:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58BFF1BF471
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4644E40E03
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXK3y85NU0hE for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 08:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415CA4032A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 415CA4032A
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 08:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BC1184BBD; Thu, 11 Jul 2024 08:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:16:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 916f9bb1a3d1422c80bb37fa096f361fe1e75212
X-Git-Newrev: f0a024533f2caf74e705850429d07b8df3efae79
X-Patchwork-Hint: ignore
Message-Id: <20240711085422.2BC1184BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: bump to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0a024533f2caf74e705850429d07b8df3efae79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=a07d18953341a4eb65c9873e64c06bc7c642606d

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 9c54520da6..3f02eec737 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  28effa1722865786cb984f3099a32db40f96ea26  pinentry-1.3.0.tar.bz2
-sha256  9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de  pinentry-1.3.0.tar.bz2
+sha1  fb0bbb88211558c8f7e652b4b6a675b1972fba04  pinentry-1.3.1.tar.bz2
+sha256  bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04  pinentry-1.3.1.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index b49037c91b..7482a93d02 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.3.0
+PINENTRY_VERSION = 1.3.1
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
