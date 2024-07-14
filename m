Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F50C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7C640590;
	Sun, 14 Jul 2024 20:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWSiDvJG9L1h; Sun, 14 Jul 2024 20:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C37B4059D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C37B4059D;
	Sun, 14 Jul 2024 20:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291DA1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B93810EE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFmB9xPOaF2m for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B172810ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B172810ED
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2717584C4D; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:46:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07039e8174c65bea37ccc679a01610d5c335dc61
X-Git-Newrev: f7756e2e24362aafca460a24d72c1b160be80c10
X-Patchwork-Hint: ignore
Message-Id: <20240714202320.2717584C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] s6-rc: bump to version 0.5.4.3
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
Content-Type: multipart/mixed; boundary="===============1541947004951991196=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1541947004951991196==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f7756e2e24362aafca460a24d72c1b160be80c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING hash changed because the copyright year was updated.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index a09c08ba3c..72bd5d42be 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  00bdfa596fa7161512e972ec9282a2abd8fd0e31f09177bad7a2bc3d8f283982  s6-rc-0.5.4.2.tar.gz
-sha256  f68451e55e6686dc187df1ca427c574d9ac0d6f6926e1bdb909ad8b657668fe5  COPYING
+sha256  e3272796a947904de37ab34ec10430e26107b8ef05210d81059c8b36203e6a9f  s6-rc-0.5.4.3.tar.gz
+sha256  75b0b50d7bcb9b2fc174d01442536bce03333da1814df3e61cd6ef8f663548f1  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 61090c9a27..301c705910 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.4.2
+S6_RC_VERSION = 0.5.4.3
 S6_RC_SITE = https://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING

--===============1541947004951991196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1541947004951991196==--
