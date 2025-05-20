Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FBC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E654282D45;
	Thu, 12 Jun 2025 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8Ji9S0m2PDF; Thu, 12 Jun 2025 08:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060E981EDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060E981EDA;
	Thu, 12 Jun 2025 08:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69FC61E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA08F42148
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkikD0BTvDWD for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A99A405C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A99A405C6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4821682D97; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7402bf2396115c95559d4f1cd8ffd485e2e060a1
X-Git-Newrev: 11818cd07d1ba2794619552788327136b24df9da
X-Patchwork-Hint: ignore
Message-Id: <20250612083828.4821682D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oniguruma: bump version to 6.9.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11818cd07d1ba2794619552788327136b24df9da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/kkos/oniguruma/releases/tag/v6.9.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index ac1d375b7a..be49a4d4e7 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.9/onig-6.9.9.tar.gz.sha256
-sha256  60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf  onig-6.9.9.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.10/onig-6.9.10.tar.gz.sha256
+sha256  2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05  onig-6.9.10.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index e056048cb5..32eff4cc75 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.9
+ONIGURUMA_VERSION = 6.9.10
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
