Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206FBC5321D
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E242F41378;
	Fri, 23 Aug 2024 16:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNa-urLVU1Q1; Fri, 23 Aug 2024 16:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5E6241370
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E6241370;
	Fri, 23 Aug 2024 16:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB3B61BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E324026F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glsOM66A8Wec for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF3AA40173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3AA40173
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD738863F6; Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:39:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5fe7088e842aaaed1730f2d50d60e514e052105
X-Git-Newrev: 90c386d1ec4d9ac7aca2f7127543f4cc74ed1f8a
X-Patchwork-Hint: ignore
Message-Id: <20240823164536.BD738863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpcbind: bump version
 to 1.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=90c386d1ec4d9ac7aca2f7127543f4cc74ed1f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.7/1.2.7-ChangeLog/download

Switch _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/rpcbind.hash | 2 +-
 package/rpcbind/rpcbind.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index b5f117db54..45bd394199 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
+sha256  f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e  rpcbind-1.2.7.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 2c158213ad..e553f54066 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.6
-RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
+RPCBIND_VERSION = 1.2.7
+RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
