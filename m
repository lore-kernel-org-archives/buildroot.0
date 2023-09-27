Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2AE82CBD
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 17:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EDEA403EA;
	Wed, 27 Sep 2023 17:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EDEA403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBrC3hEtOlgY; Wed, 27 Sep 2023 17:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AD474149C;
	Wed, 27 Sep 2023 17:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD474149C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52C4A1BF354
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB8C419AB
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB8C419AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Akr7Ioau9Btk for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66CCA41B37
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66CCA41B37
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5540C8258A; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 19:49:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35dcf9ee56695023ace9b2505fa169d262f8ff38
X-Git-Newrev: da8bd82e3b0cdba0d3cbf73a85913a9b567c840e
X-Patchwork-Hint: ignore
Message-Id: <20230927175642.5540C8258A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndisc6: bump to version 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=da8bd82e3b0cdba0d3cbf73a85913a9b567c840e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=34d9a653087a8e89f595156a4ec69969e5ca3013

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index e258382c53..550b9fffac 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a713210e9be1f15cfa0809f4c2728b00cd5f25881d7585126986982055453cfb  ndisc6-1.0.6.tar.bz2
+sha256  edc431d70510d7321a5a39d243de0d0f63846dc9145b3b549c7348cc2bc96609  ndisc6-1.0.7.tar.bz2
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 23734ca7d7..d797b82e65 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.6
+NDISC6_VERSION = 1.0.7
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
