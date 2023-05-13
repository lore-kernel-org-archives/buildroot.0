Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3312C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37E5441FDC;
	Sat, 13 May 2023 08:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E5441FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQbqTm75DHuH; Sat, 13 May 2023 08:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE62641EA2;
	Sat, 13 May 2023 08:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE62641EA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 046941BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE93641EF7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE93641EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHOgQV5eGjqp for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CCF441DF6
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CCF441DF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCE385D5A; Sat, 13 May 2023 08:28:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:28:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72945e5a5b96c970fa08557eeed1e2e031c46413
X-Git-Newrev: 172e6aaa5ae1643ddfcac210994caa00e12090de
X-Patchwork-Hint: ignore
Message-Id: <20230513082851.EBCE385D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cni-plugins: bump version to 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=172e6aaa5ae1643ddfcac210994caa00e12090de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/containernetworking/plugins/releases/tag/v1.3.0

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index 0c3e07c91c..90cb184604 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f3496ddda9c7770a0b695b67ae7ee80a4ee331ac2745af4830054b81627f79b7  cni-plugins-1.2.0.tar.gz
+sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index be02c2ff45..27a31b445a 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CNI_PLUGINS_VERSION = 1.2.0
+CNI_PLUGINS_VERSION = 1.3.0
 CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
 CNI_PLUGINS_LICENSE = Apache-2.0
 CNI_PLUGINS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
