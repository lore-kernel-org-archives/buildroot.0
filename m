Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E7C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C9B81C11;
	Tue,  1 Nov 2022 22:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C9B81C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HolBZPyocj9u; Tue,  1 Nov 2022 22:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42EF481453;
	Tue,  1 Nov 2022 22:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42EF481453
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEA0C1BF95C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C77B680C2A
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C77B680C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAvkkSepAJAG for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96BC80C24
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E96BC80C24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D45F987886; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:22:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53716828cfad5b9fe51d9edc6e4a351601f0f152
X-Git-Newrev: 4d6ae054196aa19c235d180e8168c21fe05aca47
X-Patchwork-Hint: ignore
Message-Id: <20221101222354.D45F987886@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: bump version to 6.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d6ae054196aa19c235d180e8168c21fe05aca47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 5b9d4402b5..3c50faf23f 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4531a31c0c095fcae18fdef0157f1e2a6694408abbcff6789c8f3cd6ab2c3ca0  xmrig-6.18.0.tar.gz
+sha256  f97fe20248e0eb452f77e9b69f2fb1510b852152b3af4f9a8b20680c854888d1  xmrig-6.18.1.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 40db428b56..ca5bcecfbe 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.18.0
+XMRIG_VERSION = 6.18.1
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
