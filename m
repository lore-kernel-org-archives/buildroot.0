Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7252FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245CA84BCB;
	Mon,  6 Dec 2021 22:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_FE8htroCkx; Mon,  6 Dec 2021 22:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7608D8317B;
	Mon,  6 Dec 2021 22:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13BAE1BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02699404BF
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mueuCZID4mhp for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:06:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E740404BD
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:06:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42411817C8; Mon,  6 Dec 2021 22:01:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 23:04:05 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 60d66526ddbc4dc0ebe196350b70b4d9124409cf
X-Git-Newrev: ad6d3676790b1a220881082a95e90e18a3bfecc8
X-Patchwork-Hint: ignore
Message-Id: <20211206220122.42411817C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/suricata:
 security bump to version 6.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad6d3676790b1a220881082a95e90e18a3bfecc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Various security, performance, accuracy and stability issues have been
fixed, including two TCP evasion issues. CVE 2021-37592 was assigned.

https://forum.suricata.io/t/suricata-6-0-4-and-5-0-8-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 33edb17410ffbaff7ff2f68eec12dfd14a58db7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 74cc7435cb..098740e769 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  daf134bb2d7c980035e9ae60f7aaf313323a809340009f26e48110ccde81f602  suricata-6.0.3.tar.gz
+sha256  a8f197e33d1678689ebbf7bc1abe84934c465d22c504c47c2c7e9b74aa042d0d  suricata-6.0.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e7067acdc1..3255fd35a1 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.3
+SURICATA_VERSION = 6.0.4
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
