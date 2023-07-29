Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF52C05052
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A77E408DB;
	Sat, 29 Jul 2023 20:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A77E408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yjgz6lUwCF1Y; Sat, 29 Jul 2023 20:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EEBF4085C;
	Sat, 29 Jul 2023 20:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEBF4085C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23C7C1BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB65381EA3
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB65381EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5knPe2FYlLbg for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:43:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C5C81E95
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C5C81E95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1493883B0D; Sat, 29 Jul 2023 20:43:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 22:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 172e07029857a8087a70596b3a75dcc45e6a1dd8
X-Git-Newrev: 9ddb1dfb40cad9bc00e68376d2f06cad28bbd296
X-Patchwork-Hint: ignore
Message-Id: <20230729204314.1493883B0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waylandpp: bump version to 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ddb1dfb40cad9bc00e68376d2f06cad28bbd296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/NilsBrause/waylandpp/releases

Update license hash due to copyright year bump:
https://github.com/NilsBrause/waylandpp/commit/1ea510aabd5ba8abdb5cd30c37481595f34c366c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/waylandpp/waylandpp.hash | 4 ++--
 package/waylandpp/waylandpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 1b806af9b0..a3eb5379af 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e7f486165d3568c3558b5c7099133aea4a285b82820eeafad329fc10271c654d  waylandpp-0.2.8.tar.gz
-sha256  8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
+sha256  b20b45917382c6b87e9380130c9a1a1c563da2f498de5830df12fbce326dd9f5  waylandpp-1.0.0.tar.gz
+sha256  3eee5022ce84ead344e1c51b9d00c7f450f53003fe096fe460d66c616fe56782  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 45d9ccd528..4a0d58ba50 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.8
+WAYLANDPP_VERSION = 1.0.0
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
