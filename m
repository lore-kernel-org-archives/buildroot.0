Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81C5C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A8D4ED55;
	Tue, 21 Feb 2023 00:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A8D4ED55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7oqog8WBGQy; Tue, 21 Feb 2023 00:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0244EEF9;
	Tue, 21 Feb 2023 00:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0244EEF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6154D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 762D241817
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 762D241817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyxMR7UCMydX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0D50417DA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D50417DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD4158648F; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:03:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99024eca8f154062ea88af985ff10e12ae7016b6
X-Git-Newrev: 1bb77eb8f14585bc79307fd672cab79b7e4e476d
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.BD4158648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/log4cplus: bump to
 version 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bb77eb8f14585bc79307fd672cab79b7e4e476d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/log4cplus/log4cplus/blob/REL_2_1_0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index c4540c9d56..1779b30949 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f5949e713cf8635fc554384ab99b04716e3430f28eed6dd7d71ad03d959b91a0  log4cplus-2.0.8.tar.xz
+sha256  d84ac8b1c46645122fbf72691f8eacef68c71b587403ee833bd9a252e06d46cc  log4cplus-2.1.0.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 2dab661654..28eb4ed8f4 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.8
+LOG4CPLUS_VERSION = 2.1.0
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
