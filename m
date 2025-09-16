Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B696CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577BC6117E;
	Tue, 16 Sep 2025 20:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUov1kEmZ4dH; Tue, 16 Sep 2025 20:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED19161174
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED19161174;
	Tue, 16 Sep 2025 20:26:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B89812D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E3261177
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or2NkWEuH71C for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D077561174
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D077561174
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:26:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC74B84BCD; Tue, 16 Sep 2025 20:26:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:23:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc44dbcca4c846944494189f14c897c81cf371ca
X-Git-Newrev: 3224b90bacbc6666c09afabbed1666d35e933454
X-Patchwork-Hint: ignore
Message-Id: <20250916202640.BC74B84BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 871db2c84ecefd70a850e03a6c340214a81739f0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3224b90bacbc6666c09afabbed1666d35e933454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index e14bcc9063..e147845e4c 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b4120332a4191db9c9da2d81f9f11f0d4504fc4cff2dea0f642d3d8f1fcebd0e  luajit-a4f56a459a588ae768801074b46ba0adcfb49eb1.tar.gz
+sha256  ab3f16d82df6946543565cfb0d2810d387d79a3a43e0431695b03466188e2680  luajit-871db2c84ecefd70a850e03a6c340214a81739f0.tar.gz
 
 # Locally calculated
 sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index f4836df91d..ed44e165c2 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = a4f56a459a588ae768801074b46ba0adcfb49eb1
+LUAJIT_VERSION = 871db2c84ecefd70a850e03a6c340214a81739f0
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
