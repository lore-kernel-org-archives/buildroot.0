Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D6DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32C2A823CB;
	Sun, 19 Jun 2022 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C2A823CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D44SFpnnECLf; Sun, 19 Jun 2022 13:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C4D81D7D;
	Sun, 19 Jun 2022 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C4D81D7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADE11BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CD281D7D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CD281D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWQQrSQzLvbT for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:21:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8282B81D7C
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8282B81D7C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 85E9D872E7; Sun, 19 Jun 2022 13:08:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:19:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4f2657a5581b35d28a5d9762430d43519619bd58
X-Git-Newrev: 678ba41080689b63dcc6ab590b54d12d586a8569
X-Patchwork-Hint: ignore
Message-Id: <20220619130843.85E9D872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lcms2: bump to
 version 2.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=678ba41080689b63dcc6ab590b54d12d586a8569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

https://littlecms.com/blog/2022/01/28/lcms2-2.13/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da28867e875b165d83163ac7a618bd0f1c23345e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcms2/lcms2.hash | 4 ++--
 package/lcms2/lcms2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index d3ae1d934f..d20cf601fb 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/lcms/files/lcms/2.13
-sha1  1676097fb18fce83c9c876d56828c83a6ad829dd  lcms2-2.13.tar.gz
+sha1  72d0a0b7fbaeca12eb0186ab5728eb0f26806b22  lcms2-2.13.1.tar.gz
 # Locally computed:
-sha256  0c67a5cc144029cfa34647a52809ec399aae488db4258a6a66fba318474a070f  lcms2-2.13.tar.gz
+sha256  d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88  lcms2-2.13.1.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5a253d044b..63750c43f2 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.13
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
+LCMS2_VERSION_MAJOR = 2.13
+LCMS2_VERSION = $(LCMS2_VERSION_MAJOR).1
+LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION_MAJOR)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
