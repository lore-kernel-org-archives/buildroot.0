Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36F0C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D05340920;
	Sun, 11 Dec 2022 16:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D05340920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuwrZeTqwpt2; Sun, 11 Dec 2022 16:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2FE4091E;
	Sun, 11 Dec 2022 16:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2FE4091E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 903151BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BA2A60B49
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA2A60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wU3BKLrvV7fZ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 902D560A93
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902D560A93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8072B8649F; Sun, 11 Dec 2022 16:52:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:51:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4fc5e48521082d1b3cd9d96efc34979969d745b
X-Git-Newrev: 8f8592b686e4aa1085ace7c7f25c7c777a3fd2ec
X-Patchwork-Hint: ignore
Message-Id: <20221211165230.8072B8649F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f8592b686e4aa1085ace7c7f25c7c777a3fd2ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.postgresql.org/docs/release/14.6/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 8fdaadde99..26bb626943 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v14.5/postgresql-14.5.tar.bz2.sha256
-sha256  d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30  postgresql-14.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.6/postgresql-14.6.tar.bz2.sha256
+sha256  508840fc1809d39ab72274d5f137dabb9fd7fb4f933da4168aeebb20069edf22  postgresql-14.6.tar.bz2
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 631a959122..502860bc99 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.5
+POSTGRESQL_VERSION = 14.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
