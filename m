Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21EEC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 13:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27F681CAF;
	Fri, 14 Oct 2022 13:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27F681CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1w2MuvMcLG7; Fri, 14 Oct 2022 13:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53CB8146A;
	Fri, 14 Oct 2022 13:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53CB8146A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6315C1C2744
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA55360BAC
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA55360BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wwpvbdp7j4_5 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C645060D68
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C645060D68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C1786CA9; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 15:49:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2940513298fdb5a6e582916128e914243c784f5
X-Git-Newrev: d5dc2bdf5895770a26617e58f1e61668ee564261
X-Patchwork-Hint: ignore
Message-Id: <20221014135306.B5C1786CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/checksec: bump to version 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5dc2bdf5895770a26617e58f1e61668ee564261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE.txt (update in year with
https://github.com/slimm609/checksec.sh/commit/24a81d33b9bc600c676ed96c183e87181e514844)

https://github.com/slimm609/checksec.sh/releases/tag/2.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/checksec/checksec.hash | 4 ++--
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 41aae8188c..a29866ba07 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1034459d7cd2b0ee515c2b6b003375fec566fb59c838fc5e1961e1fcf76b54fa  checksec-2.5.0.tar.gz
-sha256  7888fee828bf56d547fc1f634e40638984148b4fc41373b7626eb465060640de  LICENSE.txt
+sha256  39d4158f96bdc7533ad6595703375c0046951fe4f6367b831ef92d9c66c1a307  checksec-2.6.0.tar.gz
+sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index 61ef110f90..ed9846ac2d 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.5.0
+CHECKSEC_VERSION = 2.6.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
