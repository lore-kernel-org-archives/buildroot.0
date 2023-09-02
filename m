Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8150FCA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12A4D40297;
	Sat,  2 Sep 2023 07:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A4D40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2x_ayV2YhLsG; Sat,  2 Sep 2023 07:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4856340204;
	Sat,  2 Sep 2023 07:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4856340204
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 604311BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46A3840297
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46A3840297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cH_c-_odobJ for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B106401CA
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B106401CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58B33864F2; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:36:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ef29343aeebefa019d2fabc6e0f83d7639b9b01
X-Git-Newrev: 5b3388f1e2a23f9cfa922128304e6db803e1093c
X-Patchwork-Hint: ignore
Message-Id: <20230902073856.58B33864F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ed: bump to version
 1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b3388f1e2a23f9cfa922128304e6db803e1093c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See release announce:
https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 36f9b9c1e4..007f645f51 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
-sha256  aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f  ed-1.18.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html
+sha256  ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48  ed-1.19.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 645cfb7696..a90d1f005e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.18
+ED_VERSION = 1.19
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
