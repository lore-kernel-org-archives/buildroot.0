Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B656C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB0C4183C;
	Fri, 16 May 2025 11:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lgih_ugStK2L; Fri, 16 May 2025 11:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB8DB41A08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8DB41A08;
	Fri, 16 May 2025 11:22:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1547F13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ADAD61254
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 230YAEQ_CoRV for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB3D6103E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFB3D6103E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACE8286A00; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 21:03:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 591a7634d6b26e199a5a51fb972d556e20c70194
X-Git-Newrev: 561dd7fa079c074cd0a84576f06193cb2b7c46eb
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.ACE8286A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hwdata: bump
 version to 0.394
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=561dd7fa079c074cd0a84576f06193cb2b7c46eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.394

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.392...v0.394

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b18f95c1557e64e11f66ceedaff9d44059b86d70)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 9c8d37323d..eb4ecc191d 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1f472d8f2ec824d4efe6a75480767c4ce240fa5d91b6428d9f8775035da3ba1f  hwdata-0.392.tar.gz
+sha256  b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298  hwdata-0.394.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index eb9166dc72..f47df2ebb8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.392
+HWDATA_VERSION = 0.394
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
