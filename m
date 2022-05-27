Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F2AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E0C41302;
	Fri, 27 May 2022 08:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dt9dNDuTb8vb; Fri, 27 May 2022 08:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E003412F7;
	Fri, 27 May 2022 08:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 173601C116E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 064956161B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gP85VMPwzoh for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:17:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5330861613
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:17:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FFE5865E9; Fri, 27 May 2022 08:06:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:17:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 01161d80967754dd12bb1ba169c869e3d5110ead
X-Git-Newrev: 49da8f9c44a694f476284a64db89036f2ee2313e
X-Patchwork-Hint: ignore
Message-Id: <20220527080631.6FFE5865E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/suricata:
 security bump to version 6.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=49da8f9c44a694f476284a64db89036f2ee2313e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Various security, performance, accuracy and stability issues have been
fixed.

https://forum.suricata.io/t/suricata-6-0-5-and-5-0-9-released/2415

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit deb2f747a6e54e47fed00f1deab5efa0e5d2aede)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 098740e769..032546fd92 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  a8f197e33d1678689ebbf7bc1abe84934c465d22c504c47c2c7e9b74aa042d0d  suricata-6.0.4.tar.gz
+sha256  0d4197047c84ba070dfc6b1d9f9ee92f52a71403bfac0e29b2554bb21fe00754  suricata-6.0.5.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 86d8970178..36e641bf90 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.4
+SURICATA_VERSION = 6.0.5
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
