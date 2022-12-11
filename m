Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F215C4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E0E84052E;
	Sun, 11 Dec 2022 13:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E0E84052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAgF9NiQxjxK; Sun, 11 Dec 2022 13:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D634052F;
	Sun, 11 Dec 2022 13:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D634052F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95DE61BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66E8840543
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E8840543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDjs4W8KJGkF for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE344052C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE344052C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8FBD863F0; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:33:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4634a22cf70ec957ceabbb0dcd9611c824bc7a60
X-Git-Newrev: fc47afdc57cb7bdff3c4481607b2887f8a9cae94
X-Patchwork-Hint: ignore
Message-Id: <20221211133400.B8FBD863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: bump to version 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc47afdc57cb7bdff3c4481607b2887f8a9cae94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pugixml.org/docs/manual.html#v1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pugixml/pugixml.hash | 2 +-
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 190dfb6a6e..b828e03561 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dcf671a919cc4051210f08ffd3edf9e4247f79ad583c61577a13ee93af33afc7  pugixml-1.12.1.tar.gz
+sha256  40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe  pugixml-1.13.tar.gz
 sha256  206f671b6d342557adcc973088c2c638df0ec0b1dabbcd24e65aadd2191778d2  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 9137f04630..c796186827 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.12.1
+PUGIXML_VERSION = 1.13
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
