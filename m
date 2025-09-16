Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52332CAC59D
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CB74120F;
	Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EcM-GQlui3s; Tue, 16 Sep 2025 20:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B5441207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63B5441207;
	Tue, 16 Sep 2025 20:17:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CDCE12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB35832FF
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOkgMVlgpTdM for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0ED832C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0ED832C6
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69D1684BC9; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:10:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7740031390353429796f21273ace4a34efce84d7
X-Git-Newrev: fc44dbcca4c846944494189f14c897c81cf371ca
X-Patchwork-Hint: ignore
Message-Id: <20250916201752.69D1684BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mxt-app: bump to version 1.45
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc44dbcca4c846944494189f14c897c81cf371ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.45

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mxt-app/mxt-app.hash | 2 +-
 package/mxt-app/mxt-app.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
index 2f5ea814d8..c808d0c35a 100644
--- a/package/mxt-app/mxt-app.hash
+++ b/package/mxt-app/mxt-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38fdf7954d2184d122f6f1b1493fba1955c0e3c7dfd5196dbc3d536afc9c672a  mxt-app-1.38.tar.gz
+sha256  6676e18c4837b4adc6c4ee2287fb6a3fc7631b7454158fa04201c701493f0a41  mxt-app-1.45.tar.gz
 sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
index 4921803e4c..db7e25793d 100644
--- a/package/mxt-app/mxt-app.mk
+++ b/package/mxt-app/mxt-app.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXT_APP_VERSION = 1.38
+MXT_APP_VERSION = 1.45
 MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
 MXT_APP_LICENSE = BSD-2-Clause
 MXT_APP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
