Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FA2C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC544087C;
	Wed, 28 May 2025 19:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erPtY2lv7BAa; Wed, 28 May 2025 19:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFD46404BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFD46404BB;
	Wed, 28 May 2025 19:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F9F3B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25DEB60EE6
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFePIjCK4whJ for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D5260EE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D5260EE5
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:51:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CACF876F1; Wed, 28 May 2025 19:51:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:47:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fb527fcf91b5ba9ff7221d24c5844648f82da8c
X-Git-Newrev: d93448fe25c622380494b1645f655795bda3279c
X-Patchwork-Hint: ignore
Message-Id: <20250528195110.3CACF876F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmrender-resurrect: bump to
 version 0.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d93448fe25c622380494b1645f655795bda3279c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.3 (and 0.2) of gmrender-resurrect bring some bugfixes.
For release notes since v0.1, see:
https://github.com/hzeller/gmrender-resurrect/releases/tag/v0.3
https://github.com/hzeller/gmrender-resurrect/releases/tag/v0.2

Fixes:
    https://autobuild.buildroot.org/results/1e1/1e1e5a494bf1ca5ba920c4e06a1affff4ad61033//

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index f14abffc3b..91b9a6c9a1 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  550b07bc6a073176ad7de0efd603663c9875311dfb81ae1075263e3fd6974335  gmrender-resurrect-0.1.tar.gz
+sha256  dbe0d41b01339a4805fdd0edf914fbc4870dba2eb9c54ad5bf9446ccfd3fa482  gmrender-resurrect-0.3.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 77ac83ca41..d5b411f46a 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 0.1
+GMRENDER_RESURRECT_VERSION = 0.3
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
