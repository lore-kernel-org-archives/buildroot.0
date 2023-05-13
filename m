Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5DDC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 09:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD23041731;
	Sat, 13 May 2023 09:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD23041731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlY2ySGZFJAf; Sat, 13 May 2023 09:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC6F415A4;
	Sat, 13 May 2023 09:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAC6F415A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 359DF1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04A1F60FB8
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A1F60FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAi9PfJMYzsd for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 09:03:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4033060F98
 for <buildroot@buildroot.org>; Sat, 13 May 2023 09:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4033060F98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 288C38642F; Sat, 13 May 2023 09:03:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:55:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e16d342c42431d9c7ac6d3cc19d0a6212d9d1f8a
X-Git-Newrev: 25916a733c4387bc00be62587a5cc5845636cf08
X-Patchwork-Hint: ignore
Message-Id: <20230513090320.288C38642F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/can-utils: bump to version 2023.03
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

commit: https://git.buildroot.net/buildroot/commit/?id=25916a733c4387bc00be62587a5cc5845636cf08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/linux-can/can-utils/releases/tag/v2023.03

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 4e47143f31..e539e05b45 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c9b8f29515ad34af7f78450ec55c983abc5393e86b1f128a92ac0dfd141baaf7  can-utils-2021.08.0.tar.gz
+sha256  2790dfb57fe3ec22b6fd512838c6480c39f7c9ae193e59f1ae01221216505a7e  can-utils-2023.03.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 5b8a2aeea3..462e123c6d 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2021.08.0
+CAN_UTILS_VERSION = 2023.03
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
