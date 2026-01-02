Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B196AFA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBB881096;
	Fri,  2 Jan 2026 15:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKNbN4Jy2csO; Fri,  2 Jan 2026 15:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E97681046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367457;
	bh=v2wvRMRare3YLV22Kg83WC+K/7wbUUOmcjE4kbQHo+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nfNlpAUZyXZNCv4qImDhdw3sjsHIFC6hEY2XmAVwEOJ80xMSiSKC3s5YwyYJUKonV
	 8fYQvJLLG9LHuPEGumd41ZeIMl/OAp6TEG+gQEA74Q/mae2a2N2jEzz7b7O7zrUQK1
	 GqmkD2CV6vEitCAFIWlLmnhvLk3SIwfS6Vfo50f8CvPaxRDNwyALrcEyvEZp0ITghr
	 Vwo6EusOFuhIVT5p+vlZa6hvX/YT9zzOC0P2Ljilg2U4iCROzdiu9c7GNUiavm5FY9
	 Jvnh1ge3FIRiOfwAki4Bl/pQkszZHcJJ51ws3dsKvqme9ERUosICxeo9wkHbHabU6g
	 uwx/tLdMK1ipA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E97681046;
	Fri,  2 Jan 2026 15:24:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BBF19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8903400C2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIdXq2cAtIWi for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0397A400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0397A400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7B9387F15; Fri,  2 Jan 2026 15:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:24:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b30d95335172b6873f8695bc69b40bd1f6e55c4c
X-Git-Newrev: 9d334c4abf4dadfab73d6bc7cdc171bca1ad5dcc
X-Patchwork-Hint: ignore
Message-Id: <20260102152414.E7B9387F15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atf: update project URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d334c4abf4dadfab73d6bc7cdc171bca1ad5dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old URL redirects to the new URL.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atf/Config.in | 2 +-
 package/atf/atf.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/Config.in b/package/atf/Config.in
index 43a5d4f2c9..800b488945 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ATF
 	  ATF, or Automated Testing Framework, is a collection of
 	  libraries to write test programs in C, C++ and POSIX shell.
 
-	  https://github.com/jmmv/atf
+	  https://github.com/freebsd/atf
 
 comment "atf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 27c25c8b27..91d2fb5567 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATF_VERSION = 0.23
-ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
