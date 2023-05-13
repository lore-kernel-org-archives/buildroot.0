Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA9AC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 17:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD3842EA5;
	Sat, 13 May 2023 17:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD3842EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlga4iJ2r0_k; Sat, 13 May 2023 17:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A576042E9B;
	Sat, 13 May 2023 17:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A576042E9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBF001BF5DA
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EEDE61477
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EEDE61477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1b6taw3WdJR for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 17:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B790961473
 for <buildroot@buildroot.org>; Sat, 13 May 2023 17:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B790961473
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DA2864EE; Sat, 13 May 2023 17:56:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 19:56:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe7723afd0cad7d7475883e54aa37c727dfa0b45
X-Git-Newrev: e98b07dedee7fc80c58b10b4a0b2a6ad57f3bb62
X-Patchwork-Hint: ignore
Message-Id: <20230513175638.A1DA2864EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: bump to version 1.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=e98b07dedee7fc80c58b10b4a0b2a6ad57f3bb62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.25

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 5610b252a3..9dc676d9f4 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eeb88a62c3aaa1f4c389117b7e7cc08a49acc8a0e7f165f76dd9c5ab9af2c266  pahole-1.24.tar.gz
+sha256  db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631  pahole-1.25.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 82bba2f777..1a3e156ebb 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.24
+PAHOLE_VERSION = 1.25
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
