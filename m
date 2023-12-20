Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA763C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC39436D8;
	Wed, 20 Dec 2023 20:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC39436D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IXsAMLlf4Cy; Wed, 20 Dec 2023 20:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B916403EA;
	Wed, 20 Dec 2023 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B916403EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55AD91BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D147403EA
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D147403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkYYNnIh-xcs for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:31:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2630640253
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2630640253
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FCD687C34; Wed, 20 Dec 2023 20:31:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:25:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7150660668b343c22f44554553fbaf0931acdce1
X-Git-Newrev: 08b6c78e6a853831b95c7cbc49d26655d6c2e853
X-Patchwork-Hint: ignore
Message-Id: <20231220203159.0FCD687C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/criu: bump to version 3.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=08b6c78e6a853831b95c7cbc49d26655d6c2e853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/criu/criu.hash | 2 +-
 package/criu/criu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/criu/criu.hash b/package/criu/criu.hash
index 2c4a07252b..c3fcdbc03f 100644
--- a/package/criu/criu.hash
+++ b/package/criu/criu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  990cdd147cb670a5d5d14216c2b5c2fc2b9a53ef19396569a6413807ba2a6aa2  criu-3.19.tar.gz
 sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
index 7f70c89068..3b72a1131e 100644
--- a/package/criu/criu.mk
+++ b/package/criu/criu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRIU_VERSION = 3.18
+CRIU_VERSION = 3.19
 CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
 
 CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
