Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FE4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 09:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AECB40181;
	Mon, 19 Dec 2022 09:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AECB40181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XV_C_ugPNI2f; Mon, 19 Dec 2022 09:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6AB94012E;
	Mon, 19 Dec 2022 09:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6AB94012E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7721C1BF855
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52CA54012E
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52CA54012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSskddE7Au5N for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7825640147
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7825640147
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65F908699E; Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 09:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d923d5f7e61b36f7deee32e1e09b279efd5dcd3
X-Git-Newrev: 163f933692f616c1b73d060aa03bd8323956692f
X-Patchwork-Hint: ignore
Message-Id: <20221219090054.65F908699E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: bump to version 4.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=163f933692f616c1b73d060aa03bd8323956692f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (update in year:
https://github.com/obgm/libcoap/commit/43bfbea924e0f5220c4121487df980afe7159346)

https://github.com/obgm/libcoap/blob/v4.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/libcoap.hash | 4 ++--
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 4a5bcaa7ff..e0006b62af 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1a195adacd6188d3b71c476e7b21706fef7f3663ab1fb138652e8da49a9ec556  libcoap-4.3.0.tar.gz
+sha256  074a71deca01e06d3acb00a1416d0fbeb87d130f40a3c0f6fda3a5c711855dca  libcoap-4.3.1.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  c5625e704d52deade1c9b2d7931ac8593be147ba63af62b53b8c7e309b7eaeb9  LICENSE
+sha256  5711e8bf7e94b59fcf0681d0f73752111bc196563b60f8568f19dacd0213192b  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index edcc1bbef8..c0a941a0c8 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.0
+LIBCOAP_VERSION = 4.3.1
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
