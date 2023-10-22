Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F785CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3995741687;
	Sun, 22 Oct 2023 18:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3995741687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LFMasOgv0OU; Sun, 22 Oct 2023 18:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B1DA41684;
	Sun, 22 Oct 2023 18:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1DA41684
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF8BC1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 892B081E26
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892B081E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ktl2i37BVbS7 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C116681E25
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 18:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C116681E25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE22785E08; Sun, 22 Oct 2023 18:36:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 20:36:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ccfb25dde3d9941a2fd8b0cff03c15d36406430
X-Git-Newrev: 5ef8369d987062247e8ba4f6e8b68ebf5b698af5
X-Patchwork-Hint: ignore
Message-Id: <20231022183636.AE22785E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: security bump to version
 6.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ef8369d987062247e8ba4f6e8b68ebf5b698af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a security release, fixing a number of important issues.

https://forum.suricata.io/t/suricata-6-0-15-released/4068/2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 49341984a2..41befa61b9 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  cfa93de900d0fd8ba67c79fddec58fb7afb8f6c45b0773040035a15407b796ce  suricata-6.0.14.tar.gz
+sha256  1bd546149ac6671c2476d520a38eab7755e10c3080fd2ec2dc8624b0cf89ee75  suricata-6.0.15.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 2aa5a0c5ed..5b52635328 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.14
+SURICATA_VERSION = 6.0.15
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
