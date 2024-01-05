Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBAC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29755436EE;
	Fri,  5 Jan 2024 12:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29755436EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jN5NsfJ-VyDw; Fri,  5 Jan 2024 12:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E09436D8;
	Fri,  5 Jan 2024 12:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E09436D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D68D1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EABFD435DF
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABFD435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ud96hLHIcmVt for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7FB436BD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7FB436BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C33844CA; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:50:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b08f686ec17238712022de11ee1df90c3710eac3
X-Git-Newrev: eb74b6054988e51b40dcb0b4b672fd540b37345c
X-Patchwork-Hint: ignore
Message-Id: <20240105125238.59C33844CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: bump to version 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb74b6054988e51b40dcb0b4b672fd540b37345c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE.md (year updated with
https://github.com/zeux/pugixml/commit/1a9a41b0f455fd94fd9e66bb8a987e807419cd3b)

https://github.com/zeux/pugixml/releases/tag/v1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pugixml/pugixml.hash | 4 ++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index b828e03561..2446788d89 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe  pugixml-1.13.tar.gz
-sha256  206f671b6d342557adcc973088c2c638df0ec0b1dabbcd24e65aadd2191778d2  LICENSE.md
+sha256  2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015  pugixml-1.14.tar.gz
+sha256  01e13f39d058cca09968f18d423912a18f8bf61b9161c65f8e5bcc418a8aba28  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 415227a40a..9772788d2d 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.13
+PUGIXML_VERSION = 1.14
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
