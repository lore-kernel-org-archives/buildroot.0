Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364BC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2F441819;
	Tue, 14 Mar 2023 08:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2F441819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DvA8j9BER5O; Tue, 14 Mar 2023 08:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21AD41680;
	Tue, 14 Mar 2023 08:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21AD41680
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA4D1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4819841680
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4819841680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXFTzXM2DwPH for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:14:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4009E41606
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4009E41606
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 273FF870F4; Tue, 14 Mar 2023 08:14:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:14:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c28688054e06bb84906ae309da1f64d45ced0d3
X-Git-Newrev: 27ea8958e1595a92b92f7057bcf005db0fa363f1
X-Patchwork-Hint: ignore
Message-Id: <20230314081431.273FF870F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ptm2human: bump to latest commit
 d0b8b6b
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

commit: https://git.buildroot.net/buildroot/commit/?id=27ea8958e1595a92b92f7057bcf005db0fa363f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since commit d0b8b6b, see project commit log:
https://github.com/hwangcc23/ptm2human/commits/c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ptm2human/ptm2human.hash | 2 +-
 package/ptm2human/ptm2human.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ptm2human/ptm2human.hash b/package/ptm2human/ptm2human.hash
index 0346019667..d581491bde 100644
--- a/package/ptm2human/ptm2human.hash
+++ b/package/ptm2human/ptm2human.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  28947eeb458d8b6a362cbeb8c5cb6098006274af04ebb4f5da70eac89f927d95  ptm2human-d0b8b6be9897ea5b04fd6460038a4773cec078bc.tar.gz
+sha256  4c66e9429dfb92b5f4332b08050db0436511581102d1ec56555eb8229d9c2c74  ptm2human-c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/ptm2human/ptm2human.mk b/package/ptm2human/ptm2human.mk
index 28a7b7ab48..edba21d401 100644
--- a/package/ptm2human/ptm2human.mk
+++ b/package/ptm2human/ptm2human.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PTM2HUMAN_VERSION = d0b8b6be9897ea5b04fd6460038a4773cec078bc
+PTM2HUMAN_VERSION = c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a
 PTM2HUMAN_SITE = $(call github,hwangcc23,ptm2human,$(PTM2HUMAN_VERSION))
 PTM2HUMAN_LICENSE = GPL-2.0
 PTM2HUMAN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
