Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895EFC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 539BE4060D;
	Fri, 10 May 2024 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqAjBeyLJW0M; Fri, 10 May 2024 21:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCD142C27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECCD142C27;
	Fri, 10 May 2024 21:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 164271BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D4704251A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dK3pKTNvYGqY for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE78642500
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE78642500
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:27:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62F7E86F4D; Fri, 10 May 2024 21:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:27:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee2a9a5e4167dc86511568bd5b136f00d099481f
X-Git-Newrev: 8acc9e51012d7a1cd64c39859ac7f0b1bff632ee
X-Patchwork-Hint: ignore
Message-Id: <20240510212749.62F7E86F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8acc9e51012d7a1cd64c39859ac7f0b1bff632ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/ChangeLog?h=v0.5.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 1803bcdb2c..8ae8a77177 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz.sha512sum
-sha512  5387e213820eeb44d812bb4697543023fd4662b51a9ffd52a702810fed8b28d23fbe35a7f371e6686107de9f81902eff109458964b4622f4c5412d60190a66bf  dash-0.5.11.5.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz.sha512sum
+sha512  13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17  dash-0.5.12.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index aebfd28be8..f030e4ec91 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11.5
+DASH_VERSION = 0.5.12
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
