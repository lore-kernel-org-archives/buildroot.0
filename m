Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33507C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F204030D;
	Sun, 30 Oct 2022 22:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F204030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv8ylTE28bNo; Sun, 30 Oct 2022 22:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A86402C3;
	Sun, 30 Oct 2022 22:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A86402C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5B8A1BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9156B8128A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9156B8128A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DMrRyxaIgIG for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77B8D81288
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B8D81288
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62BBA876EB; Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:29:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd506eb2c8e910f845f311a245eed7a85b7229da
X-Git-Newrev: 0773fad16c39b383312deec2f35f7fd626ac9cb4
X-Patchwork-Hint: ignore
Message-Id: <20221030223042.62BBA876EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-dns: bump to v2.3.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0773fad16c39b383312deec2f35f7fd626ac9cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-dns/s6-dns.hash | 4 ++--
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index c63e96e129..5083024520 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  0c1d50e5d7bc65cbf59b6f37fbd7f6f5645694224bb8c4dc1943d7921bc74f63  s6-dns-2.3.5.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  76af222472c4754f83cdc59ad354255ce1b1e6f6833a059328463f8e51f4db43  s6-dns-2.3.5.4.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index dfde2c29f1..1b7d65570f 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.5.1
+S6_DNS_VERSION = 2.3.5.4
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
