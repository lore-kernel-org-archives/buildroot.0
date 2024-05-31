Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08988C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 17:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF74D423C2;
	Fri, 31 May 2024 17:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnJr3e_0GcH2; Fri, 31 May 2024 17:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F9F423E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F9F423E6;
	Fri, 31 May 2024 17:35:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2411D5597
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D6E81585
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PQ5bUspL1Cd for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 17:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BE681497
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9BE681497
 for <buildroot@buildroot.org>; Fri, 31 May 2024 17:35:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAEFC878FD; Fri, 31 May 2024 17:35:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 19:35:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 86b39fbe7ddfe716cfb67b624bf61e4e9ca1def1
X-Git-Newrev: cf9cd968a3a6a01fe72fae01bb6ea0dcccf9795f
X-Patchwork-Hint: ignore
Message-Id: <20240531173533.CAEFC878FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/timescaledb: bump
 version to 2.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf9cd968a3a6a01fe72fae01bb6ea0dcccf9795f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/timescale/timescaledb/blob/2.15.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f98098bdb8..ba81c74c7e 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c7768b267ea67914d0491b28da102faecd317060e429b2da7530517fbc94e73b  timescaledb-2.14.2.tar.gz
+sha256  ff2019f734566f73af0a8041db50f7f1d0ad6967f7e2e7d796d388cd38c0b5bb  timescaledb-2.15.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 59731270c5..d6c8164234 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.14.2
+TIMESCALEDB_VERSION = 2.15.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
