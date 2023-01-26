Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70585C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202C06128B;
	Tue, 21 Feb 2023 01:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 202C06128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgiV0HROFy87; Tue, 21 Feb 2023 01:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C12A6F99C;
	Tue, 21 Feb 2023 01:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C12A6F99C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 932C61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 273256FBC5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273256FBC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeVNa_qEEqtk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46BC76FBA4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BC76FBA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 370038648F; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 17:10:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51eb81ddcf340457cff13286fd1aa04082c4903a
X-Git-Newrev: eb6ad853d67d3c3a83093924ae305f35213793bc
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.370038648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/c-icap: bump to
 version 0.5.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb6ad853d67d3c3a83093924ae305f35213793bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://sourceforge.net/p/c-icap/news/2021/10/the-c-icap-0510-is-released
https://sourceforge.net/p/c-icap/news/2021/09/the-c-icap-059-is-released
https://sourceforge.net/p/c-icap/news/2021/03/the-c-icap-058-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-icap/c-icap.hash | 6 +++---
 package/c-icap/c-icap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 6aa81c2641..9a596cf375 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,6 +1,6 @@
 # Retrieved from https://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/
-md5  82fd2fba1a08a8a0cf3567fe24aa035d  c_icap-0.5.7.tar.gz
-sha1  3b2470e00abd1418bec3a440d3073d7a6231c4c1  c_icap-0.5.7.tar.gz
+md5  c8329684588a906d10a687e84ba4a478  c_icap-0.5.10.tar.gz
+sha1  2901aa19c8c4b09b700164290942290c34132076  c_icap-0.5.10.tar.gz
 # Locally calculated
-sha256  01ef17d7999d3476fe705abc56d0da562c2f180aafe08fc1269f419cad8521a9  c_icap-0.5.7.tar.gz
+sha256  541d503354907f06d1d72fa90fffd031002f0f4346150fb7b2203ad5825ae49d  c_icap-0.5.10.tar.gz
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index fb66c75e61..707069870d 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.5.7
+C_ICAP_VERSION = 0.5.10
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
