Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F206DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD1484140;
	Mon, 21 Mar 2022 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eqv0ngHuV4V; Mon, 21 Mar 2022 16:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE70683E83;
	Mon, 21 Mar 2022 16:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF6421BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC0660F30
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cS22O0gEiIIQ for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 169FC60EF1
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2417A84BCB; Mon, 21 Mar 2022 16:46:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:34:52 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: afbdc9e32cc62a20bbb26d49b88e852c3011a35e
X-Git-Newrev: 943299ecf5671958f62d67914084d911cb5a128f
X-Patchwork-Hint: ignore
Message-Id: <20220321164613.2417A84BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql: bump
 version to 14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=943299ecf5671958f62d67914084d911cb5a128f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes: https://www.postgresql.org/docs/release/14.2/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=61c8da50cb39ab41c3a7a0122d6943f72bb0798e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3e8c436902bfac25074677858853f23d40bca8c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index c2017a1226..2ba3b07563 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v14.1/postgresql-14.1.tar.bz2.sha256
-sha256  4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f  postgresql-14.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.2/postgresql-14.2.tar.bz2.sha256
+sha256  2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a  postgresql-14.2.tar.bz2
 
 # License file, Locally calculated
-sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
+sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 32aef0c68c..c389246f80 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.1
+POSTGRESQL_VERSION = 14.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
