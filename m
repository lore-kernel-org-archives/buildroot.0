Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF96C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBEE43032;
	Sun, 29 Oct 2023 11:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBEE43032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yufH6zI9Idf; Sun, 29 Oct 2023 11:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D39BA431D0;
	Sun, 29 Oct 2023 11:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39BA431D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4B0E1BF38B
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA91184D9B
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA91184D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDsZGpUB1dCE for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1256B84D90
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1256B84D90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12C5860F7; Sun, 29 Oct 2023 11:14:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 12:13:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 477b39a1e08452a3210a71c4f83b6f910a062566
X-Git-Newrev: ffe48fac1d0144fb591241103a5c8d6a75df8610
X-Patchwork-Hint: ignore
Message-Id: <20231029111406.F12C5860F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rabbitmq-c: bump to version 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffe48fac1d0144fb591241103a5c8d6a75df8610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file renamed and slightly updated without any change in
applicable terms:
    https://github.com/alanxz/rabbitmq-c/commit/83a75b3943fd4d374e98f4eb758f0a170d8c8ffc
    https://github.com/alanxz/rabbitmq-c/commit/fd51cf8fdc41c3d4f4a1e8cc7ea9aea5bfbe0a0d

Detailed changelog:
    https://github.com/alanxz/rabbitmq-c/blob/v0.13.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rabbitmq-c/rabbitmq-c.hash | 5 +++--
 package/rabbitmq-c/rabbitmq-c.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index dc1406d3d5..66768ef34f 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  437d45e0e35c18cf3e59bcfe5dfe37566547eb121e69fca64b98f5d2c1c2d424  rabbitmq-c-0.11.0.tar.gz
-sha256  94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422  LICENSE-MIT
+sha256  8b224e41bba504fc52b02f918d8df7e4bf5359d493cbbff36c06078655c676e6  rabbitmq-c-0.13.0.tar.gz
+sha256  3111fdaa26e86dd844d7c6cbb2723d0ed31702a840978ef116c86963c2429b0f  LICENSE
+sha256  defee723621ff1c556539af42780f449f258e47e3dcc8254bcbc095863f02b7c  README.md
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index fad6655e4e..cac0f67ddc 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = 0.11.0
+RABBITMQ_C_VERSION = 0.13.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
-RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
+RABBITMQ_C_LICENSE_FILES = LICENSE README.md
 RABBITMQ_C_CPE_ID_VENDOR = rabbitmq-c_project
 RABBITMQ_C_INSTALL_STAGING = YES
 RABBITMQ_C_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
