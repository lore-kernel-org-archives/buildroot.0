Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A858DC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD7E405AD;
	Sun, 14 Jul 2024 20:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKfw0YuMowEb; Sun, 14 Jul 2024 20:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 129A8405F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129A8405F5;
	Sun, 14 Jul 2024 20:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C21691BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 501A260631
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhrJ05sR5IjS for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F23D60635
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F23D60635
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B17185DB8; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:46:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7756e2e24362aafca460a24d72c1b160be80c10
X-Git-Newrev: 31e6a80198fd22aacd57905ac8060a041de9ef04
X-Patchwork-Hint: ignore
Message-Id: <20240714202320.3B17185DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] mdevd: bump to version 0.1.6.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6081493781785865332=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6081493781785865332==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=31e6a80198fd22aacd57905ac8060a041de9ef04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING hash changed because the copyright year was updated.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mdevd/mdevd.hash | 4 ++--
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 9436ed8b01..0151b03bd5 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  f6ecf0ef7cd48d04efc75acb2dad967d850bc8815bdb0098f1c9ef043394d430  mdevd-0.1.6.3.tar.gz
-sha256  b2edd59a202a710440522f05dcbf418b0493540120efcb407876772ee42d2c7c  COPYING
+sha256  7358ce530b6b9befb715e48190981e9b69a12cca858519e6d2e4b46eab7e2470  mdevd-0.1.6.4.tar.gz
+sha256  701e0e7d93a5da6421f69bed2136d4c64fd4bc17f35221297838a3ad9ba6050e  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index c92659d961..a1d9e17cef 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.6.3
+MDEVD_VERSION = 0.1.6.4
 MDEVD_SITE = https://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING

--===============6081493781785865332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6081493781785865332==--
