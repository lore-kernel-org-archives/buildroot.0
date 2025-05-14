Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACFAC3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33BB64082D;
	Fri, 16 May 2025 11:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLpiU-UqhOnP; Fri, 16 May 2025 11:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9780540B5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9780540B5A;
	Fri, 16 May 2025 11:22:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A0D13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E34C81184
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lNbxDpe6qYg for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3849E811B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3849E811B1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266D186A0C; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 20:58:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f01337e8b4bc56b375dfffdaabb7cd468f976a6f
X-Git-Newrev: f5297b9685e9a30819e79e097566836399b0be7c
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.266D186A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/waf: bump to
 v2.1.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5297b9685e9a30819e79e097566836399b0be7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For change log, see:
https://gitlab.com/ita1024/waf/-/blob/waf-2.1.5/ChangeLog

Tested with `./utils/test-pkg -p ntpsec` (ntpsec is a waf-package)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3d90ae79a8c2dbe2c1b525876bfdf7f285bb7b0d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 543bea5d7b..8255ed4f60 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  9ee587d802ffd15a2e7cae579560d00754db4fad  waf-2.1.1
-sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf-2.1.1
+sha1  523f645690747501b19e0d107a044de514ba80b4  waf-2.1.5
+sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf-2.1.5
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf
+sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index a12d15a228..88b8d9096e 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.1
+WAF_VERSION = 2.1.5
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
