Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB101C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 22:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609DA40C72;
	Mon, 16 Jun 2025 22:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hk0WFD84osBo; Mon, 16 Jun 2025 22:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E3C40C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E3C40C8D;
	Mon, 16 Jun 2025 22:26:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AE9151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 687D760AE1
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7iQ8tIrDlYm for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 22:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F7A60ADC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F7A60ADC
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:25:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD27083B93; Mon, 16 Jun 2025 22:25:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 23:56:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a97e463f331744090310449e5ba7d2b39080d259
X-Git-Newrev: 949122bdf06e4449f933b441d1aab72ae7e05de4
X-Patchwork-Hint: ignore
Message-Id: <20250616222558.AD27083B93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.12.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=949122bdf06e4449f933b441d1aab72ae7e05de4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/luarocks/luarocks/blob/v3.12.0/CHANGELOG.md

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 15a44f9dbe..02474d0364 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3fb3d960dffb2b2fe9de7e3cb004dc4d0b34bb3d342578af84f84325c669102  luarocks-3.11.1.tar.gz
+sha256  3d4c8acddf9b975e77da68cbf748d5baf483d0b6e9d703a844882db25dd61cdf  luarocks-3.12.0.tar.gz
 sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cf5f966cd5..37d48a9474 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.11.1
+LUAROCKS_VERSION = 3.12.0
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
