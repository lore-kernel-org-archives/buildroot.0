Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376F7C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AB981DE9;
	Mon, 25 Mar 2024 08:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DC4SJC3D4USz; Mon, 25 Mar 2024 08:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CA1181E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA1181E3B;
	Mon, 25 Mar 2024 08:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDEC1BF909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ABC840328
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_YcXxlogPhN for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE0B4011F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CE0B4011F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9AE83D2E; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:48:40 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d69bdfc1baa29eb8f99d082813459286247a5041
X-Git-Newrev: b6ae0782027e946034a4868b929115b95538249b
X-Patchwork-Hint: ignore
Message-Id: <20240325075958.2E9AE83D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/{tzdata,
 zic}: bump version to 2024a
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6ae0782027e946034a4868b929115b95538249b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes - https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 66d11f8942fd48887bc19a1c07d036ab7eca2007)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 4 ++--
 package/zic/zic.mk         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 5488625ddd..d353bc4410 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
-sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
+sha512  1f09f1b2327cc9e1afc7e9045e83ee3377918dafe1bee2f282b6991828d03b3c70a4d3a17f9207dfb1361bb25bc214a8922a756e84fa114e9ba476226db57236  tzdata2024a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 33e296d7d7..e367205277 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2023c
+TZDATA_VERSION = 2024a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index a2720a27ba..80c96ed793 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
-sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
+sha512  46da8bfa762c7d109db93e5c060789097fc0e1e38bdad5bb8fec886ef47f138bd03b913a743cd5f7e23dc359a72bfd63e7ffc0de199d2b51e6a174361dbdc43c  tzcode2024a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a915f6d256..95fa1eaa96 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2023c
+ZIC_VERSION = 2024a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
