Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D37CC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2BB435DF;
	Fri,  5 Jan 2024 12:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2BB435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms2pwnctV_n8; Fri,  5 Jan 2024 12:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E68D343707;
	Fri,  5 Jan 2024 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E68D343707
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD5541BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E064761497
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E064761497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7NUDtoskrry for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B365614C1
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B365614C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 283DD844C7; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:50:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65c8a9b6626de83365865dea6fff1749466a36aa
X-Git-Newrev: 6a65d3881099bd3408bce2f742a6972ec2a1d34f
X-Patchwork-Hint: ignore
Message-Id: <20240105125238.283DD844C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jszip: bump to version 3.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a65d3881099bd3408bce2f742a6972ec2a1d34f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Stuk/jszip/blob/v3.10.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jszip/jszip.hash | 2 +-
 package/jszip/jszip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
index d0c56a44ab..e90e9cc68b 100644
--- a/package/jszip/jszip.hash
+++ b/package/jszip/jszip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aa3033c6bb5357a0b0965c92fbdb6d6abe64676e70ffa7933b63c573ab79ee45  jszip-3.10.0.tar.gz
+sha256  e873e5d0d8549c78c0eafcab8fba40f4a1e27c5a9d48f4a6b2eb122470d0d88c  jszip-3.10.1.tar.gz
 sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index 3504368675..b282610a0d 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSZIP_VERSION = 3.10.0
+JSZIP_VERSION = 3.10.1
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
