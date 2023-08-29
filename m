Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A71C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 10:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2136660AE1;
	Tue, 29 Aug 2023 10:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2136660AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Thr0MH_tIG86; Tue, 29 Aug 2023 10:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674A7607E1;
	Tue, 29 Aug 2023 10:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674A7607E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8C8F1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A24607E1
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A24607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sXrtBLy6Pwy for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 10:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62B08607C0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 10:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B08607C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F89B861CD; Tue, 29 Aug 2023 10:38:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 12:37:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b02ca842d5361253fe502747cdd380b67d94e47
X-Git-Newrev: e5e9f5d78bf808e2ba8b97fd7a3f4b74e968b1a1
X-Patchwork-Hint: ignore
Message-Id: <20230829103807.4F89B861CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unrar: bump version to
 6.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5e9f5d78bf808e2ba8b97fd7a3f4b74e968b1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

According to https://www.rarlab.com/vuln_rev3_names.html this package
is not affected by CVE-2023-40477.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index bc8f986875..f0600af771 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318  unrarsrc-6.2.6.tar.gz
+sha256  55fe6ebd5e48d6655bfda3fd19b55438ca05e13c7e69772420caad9fdb68ef42  unrarsrc-6.2.10.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index f59d199558..ac19225937 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.6
+UNRAR_VERSION = 6.2.10
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
