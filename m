Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B354CC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 642BC40A5D;
	Tue,  2 Jan 2024 20:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 642BC40A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKxrDSopMYZH; Tue,  2 Jan 2024 20:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93CB740A5E;
	Tue,  2 Jan 2024 20:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93CB740A5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8858F1BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B47FA41725
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47FA41725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xie6XXTIYbWz for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6935E4171C
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6935E4171C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA6C83CBF; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:05:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c81cee61a5d6d477b1081cab7dfba7157c18155
X-Git-Newrev: 01ad11343172ea698e4dcc1c64cb02ce26671e49
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.4FA6C83CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glm: bump to version 0.9.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=01ad11343172ea698e4dcc1c64cb02ce26671e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is in a separate file since
https://github.com/g-truc/glm/commit/347f422b9fda328a4eecfdc0e5bf5b19bc5c37e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glm/glm.hash | 4 ++--
 package/glm/glm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index b0c1d92c74..c4e2101604 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5e33b6131cea6a904339734b015110d4342b7dc02d995164fdb86332d28a5aa4  glm-0.9.9.5.tar.gz
-sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
+sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
+sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index 3ef106a943..ef549931f6 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.9.5
+GLM_VERSION = 0.9.9.8
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
-GLM_LICENSE_FILES = manual.md
+GLM_LICENSE_FILES = copying.txt
 
 # GLM is a header-only library, it only makes sense
 # to have it installed into the staging directory.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
