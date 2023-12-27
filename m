Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C23C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C68398267F;
	Wed, 27 Dec 2023 19:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68398267F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY7bruD2KL8I; Wed, 27 Dec 2023 19:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A1482675;
	Wed, 27 Dec 2023 19:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A1482675
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6744E1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40BE64015A
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BE64015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6naTt65Hv6Pj for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63D6C40118
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D6C40118
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD42836E0; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 20:17:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0c4bd703a424f69451d7774727680fae2b4daa3
X-Git-Newrev: 53779570e50307482d095ff6ef95582cac2a0165
X-Patchwork-Hint: ignore
Message-Id: <20231227192259.4FD42836E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlog: bump to version 1.2.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=53779570e50307482d095ff6ef95582cac2a0165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License changed to Apache-2.0:
https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f30da21f34ca063

https://github.com/HardySimpson/zlog/compare/1.2.16...1.2.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlog/zlog.hash | 4 ++--
 package/zlog/zlog.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 3b7c6aa78c..19881183e9 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  742401902f2134eb272c49631fe5c38d7aeb9a2ad56fa3ec3d15219b371ba655  zlog-1.2.16.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  7fe412130abbb75a0779df89ae407db5d8f594435cc4ff6b068d924e13fd5c68  zlog-1.2.17.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 329f2cfe2c..ccf2576529 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.16
+ZLOG_VERSION = 1.2.17
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
-ZLOG_LICENSE = LGPL-2.1
-ZLOG_LICENSE_FILES = COPYING
+ZLOG_LICENSE = Apache-2.0
+ZLOG_LICENSE_FILES = LICENSE
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
