Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD72FC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D6570115;
	Tue, 21 Feb 2023 01:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D6570115
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPRuWWlGYRtt; Tue, 21 Feb 2023 01:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A528D70179;
	Tue, 21 Feb 2023 01:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A528D70179
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F06E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B718B70002
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B718B70002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqNDO7DA-_zu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25437000B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25437000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D016386495; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:28:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 672544148b3cafa1cda47cd6e4b88210fc693e14
X-Git-Newrev: 554d79f5cc01c20d886cbe9c676195159947f066
X-Patchwork-Hint: ignore
Message-Id: <20230220205256.D016386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] lksctp-tools: bump to version
 1.0.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=554d79f5cc01c20d886cbe9c676195159947f066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/sctp/lksctp-tools/blob/v1.0.19/ChangeLog

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Tested-by: Maksim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/lksctp-tools/lksctp-tools.hash | 4 ++--
 package/lksctp-tools/lksctp-tools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
index fb892fdc3b..b3a1f59d86 100644
--- a/package/lksctp-tools/lksctp-tools.hash
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
-md5  68e9b8fa4d4e331029b247b72d46d7a5  lksctp-tools-1.0.17.tar.gz
-sha1  941b0b5c39e364a971f514bba66120435660e518  lksctp-tools-1.0.17.tar.gz
+md5  0fbb288c9f9625b88d3ab21c9ed9f011  lksctp-tools-1.0.19.tar.gz
+sha1  d410a596485c38464177a38ae7c7081444e6589e  lksctp-tools-1.0.19.tar.gz
 # Locally computed
 sha256  dee5f35e583183abb9212938643ecb2d858fd89e2e286f4b1d903f65d49d6c76  COPYING.lib
 sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index 5ac794e842..af86a28516 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LKSCTP_TOOLS_VERSION = 1.0.17
-LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
+LKSCTP_TOOLS_VERSION = 1.0.19
+LKSCTP_TOOLS_SITE = $(call github,sctp,lksctp-tools,v$(LKSCTP_TOOLS_VERSION))
 LKSCTP_TOOLS_INSTALL_STAGING = YES
 # configure not shipped
 LKSCTP_TOOLS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
