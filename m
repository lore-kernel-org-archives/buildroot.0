Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74ACC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F6E48143D;
	Sun, 11 Dec 2022 13:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6E48143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lEoIdx6n8Ug; Sun, 11 Dec 2022 13:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D349780C7A;
	Sun, 11 Dec 2022 13:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D349780C7A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2D11BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F244052D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0F244052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEiJVNsMclo1 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB17A4052F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB17A4052F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8877863F0; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:33:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3046605251d1f946c610faaa5f337d0b3ee7406a
X-Git-Newrev: de7850f9464a686fc7f37a8c1f8880f47ebffb00
X-Patchwork-Hint: ignore
Message-Id: <20221211133400.E8877863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: bump to version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=de7850f9464a686fc7f37a8c1f8880f47ebffb00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/fail2ban/fail2ban/blob/1.0.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fail2ban/fail2ban.hash | 2 +-
 package/fail2ban/fail2ban.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 4073efe4c7..b40922e70a 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  62b54679ebae81ac57f32c5e27aba9f2494ec5bafd45a0fd68e7a27fd448e5ac  fail2ban-1.0.1.tar.gz
+sha256  ae8b0b41f27a7be12d40488789d6c258029b23a01168e3c0d347ee80b325ac23  fail2ban-1.0.2.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 288266c2c7..7ad22d02d1 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 1.0.1
+FAIL2BAN_VERSION = 1.0.2
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
